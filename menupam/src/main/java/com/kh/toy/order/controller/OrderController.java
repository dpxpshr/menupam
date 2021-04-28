package com.kh.toy.order.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.toy.common.code.ErrorCode;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.order.model.service.OrderService;
import com.kh.toy.order.model.vo.Order;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("order")
public class OrderController {
	
	private final OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	//매장 검색기능(비동기)
	@PostMapping("find")
	@ResponseBody
	public List<Shop> findShop(String keyword, @RequestParam(defaultValue = "") String location,
					@RequestParam(defaultValue = "name") String type) {
		List<Shop> result = orderService.searchShopbyName(keyword, location);
		return result;
	}
	
	//매장목록(검색 창)
	@GetMapping("shoplist")
	public String shopList() {
		return "order/shopList";
	}
	
	//매장 화면(메뉴뷰) 요청시 메뉴 정보를 넣어서 출력
	//테이블번호를 입력받을 수 있다.
	@GetMapping("menuview")
	public String menuView(String shopIdx,@RequestParam(required= false) String tableNum, Model model) {	
		Shop shopInfo = orderService.selectShopbyIdx(shopIdx);
		model.addAttribute(shopInfo);
		Map<String,List<Menu>> menulist = orderService.getMenulistByShopIdx(shopIdx);
		model.addAttribute("menulist",menulist);
		model.addAttribute("tableNum",tableNum); //테이블 번호를 넣어주고 세션에 장바구니를 만들기 시작하면 테이블 번호를 세션에 기록한다.
		return "order/menuView";
	}
	
	//장바구니 화면
	@GetMapping("menucart")
	public String menuCart(String shopIdx,
							@RequestParam(required = false) String add,
							@RequestParam(required = false) String tableNum,
							HttpSession session,Model model) {
		String cartIdx = (String)session.getAttribute("cartIdx");
		
		//세션에 카트를 등록한 적이 없다면 접근한 매장의 번호 저장, 테이블 번호를 입력받았다면 테이블 번호도 세션에 기록
		if(cartIdx == null) {
			session.setAttribute("cartIdx", shopIdx);
			if(tableNum != null) { session.setAttribute("tableNum", tableNum); }
		}
		//세션에 다른 매장의 카트 데이터가 남아있다면, 데이터를 삭제한다.
		else if(!cartIdx.equals(shopIdx)) {
			session.removeAttribute("cart");
			session.removeAttribute("tableNum");
			session.setAttribute("cartIdx", shopIdx);
			if(tableNum != null) { session.setAttribute("tableNum", tableNum); }
		}
		
		//카트 속성 생성
		if(session.getAttribute("cart") == null) {
			session.setAttribute("cart", new ArrayList<Map>());
		}
		
		//add 파라미터에 menuIdx가 넘어왔다면 메뉴마다 menuIdx, menuName, menuPrice, count를 맵에 담아서 저장
		if(add != null) {
			Menu addMenu = orderService.getMenuInShopIdx(shopIdx,add); //해당 shopIdx에서 menuIdx를 검색
			if(addMenu != null) { //해당 매장에 add한 메뉴가 있다면 메뉴의 정보를 세션에 추가한다.
				
				List<Map> cart = (List)session.getAttribute("cart");
				
				boolean isIn = false; //만약 세션에 이미 동일한 Idx의 메뉴가 들어있다면 추가하지 않는다.
				for(Map sessionData : cart) { 
					if(sessionData.get("menuIdx").equals(add)) {
						isIn = true;
					}
				}
				
				if(!isIn) { //카트 리스트에 찾은 메뉴 데이터를 등록한다.
					Map<String,String> menuData = new HashMap<>();
					menuData.put("menuIdx", addMenu.getMenuIdx());
					menuData.put("menuName",addMenu.getMenuName());
					menuData.put("menuPrice", addMenu.getMenuPrice());
					menuData.put("count", "1");
					cart.add(menuData);
					session.setAttribute("cart", cart);
				}
				
			}
		}
		model.addAttribute(orderService.selectShopbyIdx(shopIdx)); //매장정보를 Model에 입력하고 화면 출력
		return "order/menuCart";
	}
	//세션 cart 수정(카트 메뉴 제거/수량 변경)
	@GetMapping("modifycart")
	public String modifyCart(@RequestParam(required = false) String menuIdx,
								@RequestParam(required = false) String remove,
								@RequestParam(required = false) String countTo,
								HttpSession session) {
		List<Map<String,String>> cart = (List)session.getAttribute("cart"); //세션에서 카트 정보를 읽음
		if(cart == null) { //세션에 카트정보가 없으면 탈출
			return "order/menuCart";
		}

		if(remove != null && remove.equals("all")) { //remove 파라미터에 all이 입력되었다면, 카트 데이터를 제거하고 탈출
			session.removeAttribute("cart");
			return "order/menuCart";
		}
		
		if(menuIdx == null) { // remove all이 아니고 menuIdx에 값이 없으면 탈출
			return "order/menuCart";
		}

		for(int i = 0; i < cart.size(); i++) { //카트정보에서 입력한 menuIdx와 같은 메뉴정보를 찾음
			if(cart.get(i).get("menuIdx").equals(menuIdx)) { //찾으면 remove나 count에 따라 작업 수행
				if(remove != null) {
					cart.remove(i); //remove 파라미터가 null이 아니라면 menuIdx에 해당하는 메뉴정보를 제거
				}
				if(countTo != null) { //count 파라미터가 null이 아니라면 해당 메뉴에 변경할 수량을 입력
					Map<String,String> menu = cart.get(i);
					int menucount = Integer.parseInt(menu.get("count"));
					if(countTo.equals("plus")) {
						menucount++;
					}
					if(countTo.equals("minus") && menucount > 1) {
						menucount--;
					}
					menu.replace("count", ""+menucount);
					cart.set(i, menu);
				}
				session.setAttribute("cart", cart); //수정이 끝난 뒤 세션에 데이터를 덮어쓴다.
				return "order/menuCart"; //해당 menuIdx에서 작업이 끝나면 탈출
			}
		}
		return "order/menuCart";
	}
	
	//결제 화면
	@GetMapping("payment")
	public String payment(String shopIdx,Model model,HttpSession session) {
		//로그인한 사용자의 정보 읽기
		Member userInfo = (Member)session.getAttribute("userInfo");

		//payment에 파라미터 없이 접근하면 shoplist로 보낸다.
		if(shopIdx == null) {
			return "redirect:/order/menuview?shopIdx="+shopIdx;
		}
		
		//만약 사용자가 결제하지 않은 주문이 남아있다면, 세션 장바구니를 제거하고 바로 남은 주문 정보를 불러온다.
		
		if(orderService.selectOrderByMemberIdAndShopIdx(userInfo.getMemberId(),shopIdx) == null) {
			//장바구니 내역이 없거나, 장바구니 idx와 입력한 shopIdx가 다르다면 shoplist로 보낸다.
			if(session.getAttribute("cartIdx") == null ||!session.getAttribute("cartIdx").equals(shopIdx) ) {
				return "redirect:/order/shoplist";
			}
			
			//결제하지 않은 주문이 없고 세션에 장바구니 정보가 있다면 세션 정보로 DB에 Order 데이터를 등록한다.
			//장바구니의 menuidx + count를 service에 넘겨주어 order + menu ordering 등록
			List<Map> cart = (List)session.getAttribute("cart");
			List<Map> ordering = new ArrayList<>();
			for(Map<String,String> menu : cart) {
				ordering.add(Map.of("menuIdx",menu.get("menuIdx"),"count",menu.get("count")));
			}
			
			
			orderService.registOrder(ordering,shopIdx,userInfo.getMemberId(),"N",(String)session.getAttribute("tableNum")); //포장여부는 default N으로 보내고 payment할때 수정, 세션의 값을 통해 DB에 Order, Menu_ordering 데이터 등록
		}else {
			//사용자가 결제하지 않은 주문이 있어 장바구니에 담았던 내용을 제거함을 사용자에게 알리기 위한 속성
			model.addAttribute("changed","change");
		}
		session.removeAttribute("cartIdx");
		session.removeAttribute("cart"); //DB에 모두 등록되었으므로 세션 데이터 제거
		
		//사용자가 가진 주문을 찾고 해당 데이터들을 model로 넘겨준다. 
		Order order = orderService.selectOrderByMemberIdAndShopIdx(userInfo.getMemberId(),shopIdx);
		model.addAttribute(order);
		model.addAttribute("orderMenu",orderService.selectMenuOrderingByOrderIdx(order.getOrderIdx()));
		model.addAttribute(orderService.selectShopbyIdx(shopIdx));
		return "order/payment";
	}
	
	//DB에 저장된 주문정보를 결제하지 않고 취소요청
	@GetMapping("discard")
	public String discard(String shopIdx,String orderIdx,HttpSession session,Model model) {
		if(orderIdx == null) {
			model.addAttribute("msg",ErrorCode.AUTH01);
			return "/common/result";
		}
		Member userInfo = (Member)session.getAttribute("userInfo");
		
		if(orderService.discardOrder(orderIdx,userInfo.getMemberId())) {
			model.addAttribute("msg","주문을 취소하였습니다.");
			model.addAttribute("url","/order/menuview?shopIdx="+shopIdx);
			return "/common/result";
		};
		model.addAttribute("msg","취소할 주문이 없습니다.");
		return "/common/result";
	}
	
	//payment 화면에서 결제하기를 눌렀을때 동작
	@GetMapping("pay")
	public String pay(String payType, String shopIdx, String orderIdx, HttpSession session, Model model) {
		//사용자가 등록된 order의 데이터를 확인하고 결제/결제확인 버튼을 클릭, 결제 데이터를 등록하는 절차
		Member userInfo = (Member)session.getAttribute("userInfo");
		//세션의 사용자 정보와 orderIdx, shopIdx 정보가 일치하는지 체크하고 진행
		Order order = orderService.checkOrderInfo(orderIdx,shopIdx,userInfo.getMemberId());
		if(order == null) {
			model.addAttribute("msg","잘못된 결제정보입니다.");
			model.addAttribute("url","/order/menuview?shopIdx="+shopIdx);
			return "/common/result";
		}
		boolean res = false;
		if(payType.equals("일반")) {
			//매장 직접결제 동작 ?? 바로승인 또는 매장에서 승인받는 동작 필요할듯?
			res = true;
		}else if(payType.equals("카카오")) {
			//카카오페이 결제 동작시 redirect->approve에서 받기
			Map<String,String> kakaoReady = kakaoPayReady(shopIdx,orderIdx,userInfo.getMemberId(),order.getOrderTitle(),order.getOrderPrice(),model);
			session.setAttribute("payOrder", order);
			session.setAttribute("payId", kakaoReady.get("tid"));
			return "redirect:"+kakaoReady.get("clientUrl");
		}
		

		if(res && orderService.insertPayment(order,payType,shopIdx)) { //일반결제 성공시 결제데이터 등록 진행
			model.addAttribute("msg","결제가 완료되었습니다.");
			model.addAttribute("url","/order/myorders");
			return "/common/result";
		}
		
		//결제 실패시
		model.addAttribute("msg","결제에 실패하였습니다.");
		model.addAttribute("url","/order/payment?shopIdx="+shopIdx);
		return "/common/result";
	}
	
	//결제내역 화면
	@GetMapping("myorders")
	public String myOrders(HttpSession session,Model model) {
		Member userInfo = (Member)session.getAttribute("userInfo");
		List<Map<String,Object>> orderlist = orderService.selectOrderByMemberId(userInfo.getMemberId());
		for(int i=0; i < orderlist.size(); i++) {
			Map<String,Object> order = orderlist.get(i);
			String date = order.get("ORDER_DATE").toString();
			order.put("ORDER_DATE", date.substring(0,16));
			orderlist.set(i, order);
		}
		System.out.println(orderlist);
		model.addAttribute("orderlist",orderlist);
		return "order/myOrders";
	}
	
	//카카오페이 결제완료 후 승인처리받는 과정
	@GetMapping("approve")
	public String kakaoApprove(String pg_token,HttpSession session,Model model) {
		//카카오 결제 완료 후 접근
		Order payOrder = (Order)session.getAttribute("payOrder");
		String tid = (String)session.getAttribute("payId");
		Member userInfo = (Member)session.getAttribute("userInfo");
		System.out.println(pg_token);
		if(kakaoPayApprove(pg_token,payOrder,tid,userInfo)) {
			orderService.insertPayment(payOrder,"카카오",payOrder.getShopIdx());
			session.removeAttribute("payOrder");
			session.removeAttribute("payId");
			model.addAttribute("msg","결제가 완료되었습니다.");
			model.addAttribute("url","/order/myorders");
			return "common/result";
		};
		model.addAttribute("msg","결제 중 오류가 발생했습니다.");
		model.addAttribute("url","/order/shoplist");		
		return "common/result";
		
	}
	
	//카카오 결제준비 통신을 진행
	private Map<String,String> kakaoPayReady(String shopIdx,String orderIdx,String memberId,String orderTitle,String orderPrice,Model model) {
		Map<String,String> result = new HashMap<>();
		try {
			String body = "cid=TC0ONETIME&partner_order_id="+orderIdx+"&partner_user_id="+memberId+"&item_name="+orderTitle+"&quantity=1&total_amount="+orderPrice+"&tax_free_amount=0"
					+ "&approval_url=http://localhost:9090/order/approve&cancel_url=http://localhost:9090/result&fail_url=http://localhost:9090/result";
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestProperty("Authorization", "KakaoAK 391cbc9b669382620463a8b72d1632c0");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			DataOutputStream output = new DataOutputStream(conn.getOutputStream());
			output.writeBytes(body);
			output.flush();
			output.close();
			conn.connect();
			if(conn.getResponseCode() == 200) {
				BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				StringBuffer stringBuffer = new StringBuffer();
				String newLine;
				while((newLine = reader.readLine()) != null) {
					stringBuffer.append(newLine);
				}
				reader.close();
				JSONParser parser = new JSONParser();
				JSONObject response = (JSONObject)parser.parse(stringBuffer.toString());
				result.put("tid", (String)response.get("tid"));
				result.put("clientUrl", (String)response.get("next_redirect_pc_url"));
			}else {
				model.addAttribute("msg","카카오 결제준비에 실패하였습니다.");
			}
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		return result;
	}
	//카카오 결제승인 통신을 진행
	private boolean kakaoPayApprove(String pgToken,Order payOrder,String tid,Member userInfo) {
		boolean res = false;
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/approve");
			String body = "cid=TC0ONETIME&tid="+tid+"&partner_order_id="+payOrder.getOrderIdx()
							+"&partner_user_id="+userInfo.getMemberId()+"&pg_token="+pgToken;
			HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setConnectTimeout(5000);
			conn.setReadTimeout(5000);
			conn.setRequestProperty("Authorization", "KakaoAK 391cbc9b669382620463a8b72d1632c0");
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			conn.setDoOutput(true);
			DataOutputStream output = new DataOutputStream(conn.getOutputStream());
			output.writeBytes(body);
			output.flush();
			output.close();
			conn.connect();
			System.out.println(pgToken);
			System.out.println("결제승인 응답중");
			if(conn.getResponseCode() == 200) {
				System.out.println("모듈 : 결제 성공");
				res = true;
			}else {
				System.out.println("코드 : " + conn.getResponseCode());
				System.out.println("메시지 : " + conn.getResponseMessage());
				BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				StringBuffer stringBuffer = new StringBuffer();
				String newLine;
				while((newLine = reader.readLine()) != null) {
					stringBuffer.append(newLine);
				}
				System.out.println(stringBuffer.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
}

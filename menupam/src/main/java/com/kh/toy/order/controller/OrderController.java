package com.kh.toy.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.IntegerComparisonTerm;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.toy.order.model.service.OrderService;
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
	@GetMapping("menuview")
	public String menuView(String shopIdx,Model model) {	
		Shop shopInfo = orderService.selectShopbyIdx(shopIdx);
		model.addAttribute(shopInfo);
		Map<String,List<Menu>> menulist = orderService.getMenulistByShopIdx(shopIdx);
		model.addAttribute("menulist",menulist);
		return "order/menuView";
	}
	
	//장바구니 화면
	@GetMapping("menucart")
	public String menuCart(String shopIdx,
							@RequestParam(required = false) String add,
							HttpSession session,Model model) {
		String cartIdx = (String)session.getAttribute("cartIdx");
		//세션에 카트를 등록한 적이 없다면 접근한 매장의 번호 저장
		if(cartIdx == null) {
			session.setAttribute("cartIdx", shopIdx);
		}
		//세션에 다른 매장의 카트 데이터가 남아있다면, 데이터를 삭제한다.
		else if(!cartIdx.equals(shopIdx)) {
			session.removeAttribute("cart");
			session.setAttribute("cartIdx", shopIdx);
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
	public String payment() {
		return "order/payment";
	}
	
	//결제내역 화면
	@GetMapping("myorders")
	public String myOrders() {
		return "order/myOrders";
	}
}

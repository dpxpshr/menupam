package com.kh.toy.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.service.ReservationService;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	private final ReservationService resService;
	
	public ReservationController(ReservationService resService) {
		this.resService = resService;
	}
	
	@GetMapping("form")
	public String reservationForm(String shopIdx, Model model) { 

		//shopIdx를 가지고 해당 매장의 이름을 TB_SHOP 에서 가져온다
		model.addAttribute("shop", resService.selectShopByShopIdx(shopIdx));
		return "reservation/reservationForm";	
	} 
	
	// 예약하기
	@PostMapping("reserve") // [알림기능 해야함!]
	@ResponseBody
	public String reservationInsert(@SessionAttribute(name = "userInfo", required = false) Member member,
			@RequestBody Reservation res, Model model) {
		
		if(member != null) { 
			res.setMemberId(member.getMemberId()); 
		}else {
			res.setMemberId("notMember"); 
		} 
		//2. 예약 신청 해주자 
		if(resService.insertRes(res)==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//예약리스트(사장) -> 사장님이 승인한 예약들을 보는곳 
	@GetMapping("list")
	public String ReservationList(String shopIdx, Model model, 
						@SessionAttribute(name="userInfo", required = false) Member member) {

		Shop shop = resService.selectShopByShopIdx(shopIdx);
		if(shop.getMemberId().equals(member.getMemberId())) {
			model.addAttribute("shop", resService.selectShopByShopIdx(shopIdx));
			return "reservation/reservationList";	
		}else {
			model.addAttribute("msg", "접근 권한이 없습니다.");
			model.addAttribute("url", "/index");
			return "common/result";
		}
	}
	
	@PostMapping("getList")
	@ResponseBody
	public Map<Integer, Reservation> getReservationList(String shopIdx, String reserDate) {
		Map<Integer, Reservation> resMap = resService.getResMap(shopIdx, reserDate);
		return resMap;
	}
	
	//예약승인 화면(사장)
	@GetMapping("reque")
	public String reservationReque(Model model, HttpServletRequest request,
			@SessionAttribute(name="userInfo", required = false) Member member, String shopIdx) {
		
		Shop shop = resService.selectShopByShopIdx(shopIdx);
		if(shop.getMemberId().equals(member.getMemberId())) {
			model.addAttribute("shop", resService.selectShopByShopIdx(shopIdx));
			List<Reservation> resRequeList = resService.selectResRequeList(shopIdx);
			model.addAttribute("resRequeList",resRequeList);	
			return "reservation/reservationReque";	
		}else {
			model.addAttribute("msg", "접근 권한이 없습니다.");
			model.addAttribute("url", "/index");
			return "common/result";
		}
	} 
	
	//예약 승인(사장) [알림기능 해야함!]
	@PostMapping("approveRes")
	@ResponseBody
	public String approveRes(String reserIdx) throws Exception {
		
		int res = resService.updateStateApprove(reserIdx);
		if(res==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//예약 거부(사장) [알림기능 해야함!]
	@PostMapping("rejectRes")
	@ResponseBody
	public String rejectRes(String reserIdx) throws Exception {
		
		int res = resService.updateStateReject(reserIdx);
		if(res==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	//예약 취소(사장) -> 손님한테 알림
	@PostMapping("cancelRes")
	@ResponseBody
	public String cancelRes(String reserIdx) throws Exception {
		//System.out.println(reserIdx);
		int res = resService.cancelRes(reserIdx);
		if(res==1) {
			return "success";
		}else {
			return "fail";
		}
	}
		
	
	
}

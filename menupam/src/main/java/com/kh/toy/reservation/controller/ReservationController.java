package com.kh.toy.reservation.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.service.ReservationService;
import com.kh.toy.reservation.model.vo.Reservation;

@Controller
@RequestMapping("reservation")
public class ReservationController {

	private final ReservationService resService;
	
	public ReservationController(ReservationService resService) {
		this.resService = resService;
	}
	//예약하기버튼 -> 예약리스트테이블등록 + 사장한테 알려줘 shopMange 예약승인요청알림 -> 사장승인 
		//-> 예약테이블 reser_state 승인?으로변경-> 손님핸드폰(?)메일?로알림 아마 메일
		
	
	@GetMapping("form")
	public String reservationForm(String shopIdx, Model model) { 

		//shopIdx를 가지고 해당 매장의 이름을 TB_SHOP 에서 가져온다
		model.addAttribute("shop", resService.selectShopByShopIdx(shopIdx));
		System.out.println(resService.selectShopByShopIdx(shopIdx));
		return "reservation/reservationForm";	
	} 
	
	//예약하기
	@PostMapping("reserve") //[알림기능 해야함!]
	public String reservationInsert(@SessionAttribute(name="userInfo", required = false) Member member, Reservation res, Model model) {

		
		//1. 여기서 만약에 session에 userInfo가 있는놈이다 하면 res객체에 ID넣어주자		
		if(member != null) {
			res.setMemberId(member.getMemberId());
		}else {
			res.setMemberId("notMember");
		}
		//2. 예약 신청 해주자  
		resService.insertRes(res);
		
		//3. 어디로 갈지 지정해주자
		model.addAttribute("msg", "예약이 요청되었습니다.");
		model.addAttribute("url", "/index"); //-> [임시] 수정 해야함 원래 보던 매장 페이지로 이동해야 함
		
		return "common/result";	
	} 
	
	//예약리스트(사장)
	@GetMapping("list")
	public String ReservationList(String reserDate, Model model, HttpServletRequest request) {
		//session 사장이어야하고 그 해당매장이어야하고
		//reserDate = "2021-05-19";
		List<Reservation> resList = resService.selectResListByDate(reserDate);
		System.out.println("reserDate" + reserDate);
		//달력으로 날짜 받아와
		
		//승인인데 리스트 안떠
		model.addAllAttributes(resList);
		
		request.setAttribute("resList", resList);
		return "reservation/reservationList";
	}
	
	//예약승인 화면(사장)
	@GetMapping("reque")
	public String reservationReque(Model model, HttpServletRequest request, Member member, String shopIdx) {
		
		
		//[1. seession에서 ID꺼내서 shop의 사장님의 아이디랑 일치하는지 확인해야함]
		//일단 AuthInterceptor에서 로그인 안했으면 접근불가.
		
		model.addAttribute("shop", resService.selectShopByShopIdx(shopIdx));
		
		List<Reservation> resRequeList = resService.selectResRequeList(shopIdx);
		
		model.addAttribute("resRequeList",resRequeList);		
		//view에 주어야되는건 shopIdx가 같으면서 '승인대기'인 TB_RESERVATION  
		return "reservation/reservationReque";	
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
	
	//예약 검색(사장)
	@PostMapping("searchByName")
	public String searchByName(Reservation res, Member member) {
		res.setReserName(member.getMemberName());
		resService.searchByName(res, member);
		
		return null;
	}
		
	
	//예약 취소(사장) - 손님도 필요?
	public String cancelRes(String reserIdx){
		resService.deleteRes(reserIdx);
		return "redirect:index";
	}
		
	
	
	//(사장)usertype이 사장이고, 취소버튼 누르면 delete ->리스트에서 삭제 -> 손님 문자

	
}

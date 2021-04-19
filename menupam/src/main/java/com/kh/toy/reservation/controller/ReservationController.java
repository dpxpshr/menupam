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
	public String reservationForm() {
		return "reservation/reservationForm";	
	} 		
	
	//예약하기
	@PostMapping("reserve")
	public String reservationInsert( @SessionAttribute(name="userInfo", required = false) Member member,
			HttpServletRequest request, Reservation res, Model model) {
		/*
		 * //로그인 여부에 따른 예외처리 
		 * String memberName = member == null?"guest":member.getMemberName();
		 */
		res.setMemberId(member.getMemberId());

		//세션에서 유저의 이름을 가져와서 Reservation VO에 저장하기
		res.setReserName(member.getMemberName());
		resService.insertRes(res);
		
		model.addAttribute("msg", "예약이 요청되었습니다.");
		model.addAttribute("url", "/index");
		
		return "redirect:/index";	
	} 
	
	//예약리스트(사장)
	@GetMapping("list")
	public String ReservationList(String reserDate, Model model, HttpServletRequest request) {
		//session 사장이어야하고 그 해당매장이어야하고
		reserDate = "2021-05-19";
		List<Reservation> resList = resService.selectResListByDate(reserDate);
		
		//달력으로 날짜 받아와
		
		model.addAllAttributes(resList);
		
		request.setAttribute("resList", resList);
		return "reservation/reservationList";
	}
	
	//예약승인 화면(사장)
	@GetMapping("reque")
	public String reservationReque(Model model, HttpServletRequest request, Member member) {
		//사장이어야하고 그 해당매장이어야하고
		//전화번호
		List<Map<String, Object>> resRequeList = resService.selectResRequeList();
		System.out.println(resRequeList.get(0).get("memberPhone").toString());
		String memberPhone = null;
		for (Map<String, Object> map : resRequeList) {
			memberPhone = resRequeList.get(0).get("memberPhone").toString();
		}
		System.out.println(memberPhone);
		request.setAttribute("memberPhone", memberPhone);
		model.addAllAttributes(resRequeList);
		request.setAttribute("resRequeList", resRequeList);
		
		return "reservation/reservationReque";	
	} 
	
	//예약 승인(사장)
	@PostMapping("approveRes")
	public String approveRes(@RequestParam String reserIdx) throws Exception {
		
		resService.updateStateApprove(reserIdx);
		
		return "redirect:reservation/reservationList";
		
		//메일 날려야하는데?
	}
	
	//예약 거부(사장)
	@PostMapping("rejectRes")
	public String rejectRes(@RequestParam String reserIdx) throws Exception {
		resService.updateStateReject(reserIdx);
		return "redirect:reservation/reservationList";
		//메일 날려야하는데?
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

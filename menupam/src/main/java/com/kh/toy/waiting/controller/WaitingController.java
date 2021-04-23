package com.kh.toy.waiting.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.waiting.model.service.WaitingService;
import com.kh.toy.waiting.model.vo.Waiting;

@Controller
@RequestMapping("waiting")
public class WaitingController {

	private final WaitingService waitingService;
	
	public WaitingController(WaitingService waitingService) {
			this.waitingService = waitingService;
	}
	
	@GetMapping("form")
	public String waitingForm() {
		return "waiting/waitingForm";
	}
	
	//대기열 등록
	@PostMapping("registerWait")
	public String registeWait(HttpServletRequest request, Waiting waiting, Model model) {
		
		waitingService.insertWaiting(waiting);
		model.addAttribute("msg", "대기에 등록되었습니다.");
		model.addAttribute("url", "/index");
		return "redirect:/index";	
	} 
	
	@GetMapping("list")
	public String waitingList(Date waitRegDate, Model model, HttpServletRequest request) {
		//session 사장 & 해당 매장
		//날짜 그날 날짜로 자동 설정어떻게..
		//waitRegDate = "21/04/20";
		List<Waiting> waitList = waitingService.selectWaitingListByDate(waitRegDate);
		model.addAllAttributes(waitList);
		request.setAttribute("waitList", waitList);
		return "waiting/waitingList";
	}
	
	
	
	
	
	//문자 전송
	@PostMapping("sendMsg")
	public String sendMsg() {
		return null;
	}
	
	//손님 도착
	@PostMapping("arrived")
	public String arrived(@RequestParam String waitIdx) throws Exception {
		waitingService.updateArrived(waitIdx);
		return "redirect:waiting/waitingList";
	}
	
	// 문자전송 후 10분?15분? 지나면 대기 취소를 해야하는데 흠..
	//대기 취소
	@PostMapping("cancelWait")
	public String cancelWait(@RequestParam String waitIdx) throws Exception {
		waitingService.updateCancel(waitIdx);
		return "redirect:waiting/waitingList";
	}
}

package com.kh.toy.waiting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.toy.review.model.service.ReviewService;
import com.kh.toy.waiting.model.service.WaitingService;
import com.kh.toy.waiting.model.vo.Waiting;

@Controller
@RequestMapping("waiting")
public class WaitingController {

	private final WaitingService waitingService;
	private final ReviewService reviewService; 
	
	public WaitingController(WaitingService waitingService, ReviewService reviewService) {
			this.waitingService = waitingService;
			this.reviewService = reviewService;
	}
	
	@GetMapping("form")
	public String waitingForm(String shopIdx, Model model) throws IOException {
		

		
//		한테이블 평균 식사 시간 : 50분
//		   
//		테이블 개수 : 10개
//
//		1번 
//		5분
//
//		2번
//		10분
//
//		3번
//		15분
		
		
		
		
		//일단 reviewService꺼 가져옴
		//model.addAttribute("savePath", reviewService.getSavePath(fileIdx)); //매장 사진
		
		model.addAttribute("shop", waitingService.selectShopByShopIdx(shopIdx)); //매장 이름 등등
		model.addAttribute("waitCount", waitingService.waitCount(shopIdx)); //대기중인 팀
		return "waiting/waitingForm";
	}
	
	
	//대기열 등록
	@PostMapping("registerWait")//(가게 사장한테)알림 해주어야함
	public String registeWait(Waiting waiting, Model model) {
		
		waitingService.insertWaiting(waiting); 
		model.addAttribute("msg","대기에 등록되었습니다."); 
		model.addAttribute("url", "/index");
		 
		return "common/result";	
		
	} 
	
	
	
	
	
	
	//사장님이 보는 대기리스트 (날짜는 상관없이 리스트 쭉 뽑고, 뭐 12시되면 or 마감하면 남은 대기자들 waitState를 대기취소 or 도착 or 삭제 일괄적으로)
	@GetMapping("list")
	public String waitingList(Model model, HttpServletRequest request, String shopIdx) {
		//session 사장 & 해당 매장
		//박스 waitIdx 못찾아오넴
		model.addAttribute("shop", waitingService.selectShopByShopIdx(shopIdx));
		List<Waiting> waitList = waitingService.selectWaitingList(shopIdx);
		model.addAttribute("waitList", waitList);
		System.out.println(waitList);
		return "waiting/waitingList";
	}
	
	
	
	
	
	//문자 전송
	@PostMapping("sendMsg")
	public String sendMsg() {
		return null;
	}
	
	//손님 도착
	@PostMapping("arrived")
	@ResponseBody
	public String arrived(String waitIdx) throws Exception {
		int res = waitingService.updateArrived(waitIdx);
		if(res==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	// 문자전송 후 10분?15분? 지나면 대기 취소를 해야하는데 흠..
	//대기 취소
	@PostMapping("cancelWait")
	@ResponseBody
	public String cancelWait(String waitIdx) throws Exception {
		int res = waitingService.updateCancel(waitIdx);
		if(res==1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
}

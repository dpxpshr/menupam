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

import com.kh.toy.common.sms.SMS;
import com.kh.toy.review.model.service.ReviewService;
import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.service.WaitingService;
import com.kh.toy.waiting.model.vo.Waiting;

@Controller
@RequestMapping("waiting")
public class WaitingController {

	private final WaitingService waitingService;
	private final ReviewService reviewService; 
	SMS sms = new SMS();
	
	public WaitingController(WaitingService waitingService, ReviewService reviewService) {
			this.waitingService = waitingService;
			this.reviewService = reviewService;
	}
	
	@GetMapping("form")
	public String waitingForm(String shopIdx, Model model) throws IOException {
		
		Shop shop = waitingService.selectShopByShopIdx(shopIdx);
		int waitCount = waitingService.waitCount(shopIdx);
		int mealTime = 50;
		int tableCnt = shop.getShopTableCount();
		int estimatedTime = mealTime / tableCnt * waitCount;
		
		model.addAttribute("shop", shop); //매장 이름 등등
		model.addAttribute("waitCount", waitCount ); //대기중인 팀
		model.addAttribute("estimatedTime", estimatedTime);
		
		return "waiting/waitingForm";
	}
	
	
	//대기열 등록
	@PostMapping("registerWait")
	public String registeWait(Waiting waiting, Model model, String waitCount, String estimatedTime) {
		
		Shop shop = waitingService.selectShopByShopIdx(waiting.getShopIdx());
		if(waitingService.insertWaiting(waiting)==1) {
			//문자 보내주자
			String content = "[메뉴팜] "+shop.getShopName()+" 대기 등록 완료\n예상 대기 시간 : "+estimatedTime+"분\n"
					+ "내 앞 대기팀 : "+waitCount+"팀"; ;
			//sms.sendSMS(waiting.getWaitPhone(), content);
		}; 
		model.addAttribute("msg","대기에 등록되었습니다."); 
		model.addAttribute("url", "/index");
		
		return "common/result";	
	} 
	
	
	
	
	
	
	//사장님이 보는 대기리스트 (날짜는 상관없이 리스트 쭉 뽑고, 뭐 12시되면 or 마감하면 남은 대기자들 waitState를 대기취소 or 도착 or 삭제 일괄적으로)
	@GetMapping("list")
	public String waitingList(Model model, HttpServletRequest request, String shopIdx) {
		
		//[할일]사장인지 아닌지 확인하기
		List<Waiting> waitList = waitingService.selectWaitingList(shopIdx);
		Shop shop = waitingService.selectShopByShopIdx(shopIdx);
		
		model.addAttribute("shop", shop);
		model.addAttribute("waitList", waitList);
		
		return "waiting/waitingList";
	}
	
	
	
	
	
	//문자 전송
	@PostMapping("sendMsg")
	@ResponseBody
	public String sendMsg(String waitIdx) {
		if(waitingService.updateWaitSmsTime(waitIdx)==1) {
			Waiting waiting = waitingService.getWaiting(waitIdx);
			Shop shop = waitingService.selectShopByShopIdx(waiting.getShopIdx());
			String content = "[메뉴팜] "+shop.getShopName()+" 입장 알림\n고객님 입장하실 순서 입니다.\n"
					+ "매장 앞에서 대기해주세요"; ;		
			sms.sendSMS(waiting.getWaitPhone(), content);
			return "success";
		}else {
			return "fail";
		}
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

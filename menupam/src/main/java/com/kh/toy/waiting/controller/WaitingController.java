package com.kh.toy.waiting.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.common.sms.SMS;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.review.model.service.ReviewService;
import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.service.WaitingService;
import com.kh.toy.waiting.model.vo.Waiting;

@Controller
@RequestMapping("waiting")
public class WaitingController {

	private final WaitingService waitingService;
	SMS sms = new SMS();
	
	public WaitingController(WaitingService waitingService) {
			this.waitingService = waitingService;
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
	@ResponseBody
	public String registeWait(@RequestBody Waiting waiting, Model model, String waitCount, String estimatedTime) {
		
		Shop shop = waitingService.selectShopByShopIdx(waiting.getShopIdx());
		if(waitingService.insertWaiting(waiting)==1) {
			//문자 보내주자
			String content = "[메뉴팜] "+shop.getShopName()+" 대기 등록 완료\n예상 대기 시간 : "+estimatedTime+"분\n"
					+ "내 앞 대기팀 : "+waitCount+"팀";
			//sms.sendSMS(waiting.getWaitPhone(), content);
			//javascript.jsp sendNotification이 안됨
			
			return "success";		
		}else {
			return "fail";
		}
								
			
		
	} 
	
	
	
	//사장님이 보는 대기리스트 
	@GetMapping("list")
	public String waitingList(Model model, HttpServletRequest request, String shopIdx,
						@SessionAttribute(name="userInfo", required = false) Member member) {
		
		Shop shop = waitingService.selectShopByShopIdx(shopIdx);
		if(shop.getMemberId().equals(member.getMemberId())) { //사장인지 아닌지 확인
			List<Waiting> waitList = waitingService.selectWaitingList(shopIdx);
			
			model.addAttribute("shop", shop);
			model.addAttribute("waitList", waitList);
			
			return "waiting/waitingList";
		}else {
			model.addAttribute("msg", "접근 권한이 없습니다.");
			model.addAttribute("url", "/index");
			return "common/result";
		}
		
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
			//sms.sendSMS(waiting.getWaitPhone(), content);
			
			
			waitingService.waitTenMinutes(waitIdx);
			// -----------@Async waitTenMinute() -------->-------->---------->-------->-------->-------->-------->------>
			//            -------->-------->-------->-------->-------->-------->
		
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

package com.kh.toy.notification.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.toy.common.sms.SMS;
import com.kh.toy.member.model.vo.Member;
import com.kh.toy.notification.model.service.NotificationService;
import com.kh.toy.notification.model.vo.Notification;
import com.kh.toy.review.model.vo.Review;

@Controller
@RequestMapping("notification")
public class NotificationController {

	private final NotificationService notificationService;
	SMS sms = new SMS();
	
	public NotificationController(NotificationService notificationService) {
		this.notificationService = notificationService;
	}
	
	@PostMapping("notifications")
	@ResponseBody
	public Map<Integer, Notification> getNotifications(String memberId) {
		
		Map<Integer, Notification> notificationMap = notificationService.getNotifications(memberId);	
		return notificationMap;
	}
	
	@PostMapping("allRead")
	@ResponseBody
	public String allReadNotifications(String memberId, HttpSession session) {
		
		Member userInfo = (Member) session.getAttribute("userInfo");
		if(userInfo.getMemberId().equals(memberId)) {
			notificationService.allReadNotifications(memberId);
			return "success";
		}else {
			return "fail";
		}
	}
	
	@PostMapping("sms")
	@ResponseBody
	public String sendSMS(String phone, String content) {
		
		System.out.println(phone);
		System.out.println(content);
		//sms.sendSMS(phone, content);
		
		return "success";
	}
	
}

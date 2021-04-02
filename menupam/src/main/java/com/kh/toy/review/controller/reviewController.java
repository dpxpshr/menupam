package com.kh.toy.review.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.review.model.service.ReviewService;
import com.kh.toy.review.model.vo.Review;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("review")
public class reviewController {
	
	private final ReviewService reviewService; 
	
	public reviewController(ReviewService reviewService) {
		this.reviewService = reviewService;
	}
	
	@GetMapping("form")
	public String reviewForm() {
		return "review/reviewForm";		
	}
	
	@GetMapping("view")
	public String reviewView(String shopIdx) {
		
		//1. shopIdx를 가져왔으니 가장 최근 5개의 리뷰를 가져오자
		
		
		
		
		return "review/reviewView";		
	}
	
	@PostMapping("write")
	public String writeReview(@RequestParam MultipartFile file, 
			Review review, 
			@SessionAttribute(name="userInfo", required = false) Member member) {
		
		review.setMemberId("lee5031207"); //임시 
		review.setShopIdx("test"); //임시
	
		reviewService.writeReview(file, review);
		
		return "review/reviewForm";
	}
	
	
	
	
	
	
}

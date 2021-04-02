package com.kh.toy.review.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.code.Code;
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

		//List<Review> reviewList = reviewService.getReview(shopIdx);
//		for (Review review : reviewList) {
//			System.out.println(review);
//		}
		
		return "review/reviewView";		
	}
	
	@PostMapping("views")
	@ResponseBody
	public Map<Integer, Review> getReviews(String cnt) {
		
		int page = Integer.parseInt(cnt);
		Map<Integer, Review> reviewMap = reviewService.getReview("test", page);
		
		return reviewMap;
	}
	
	@PostMapping("photo")
	@ResponseBody
	public File getPhoto(String fileIdx) throws IOException {
		File file = reviewService.getfileVo(fileIdx);
		return file;
	}
	
	@PostMapping("write")
	public String writeReview(@RequestParam MultipartFile file, 
			Review review, 
			@SessionAttribute(name="userInfo", required = false) Member member,
			HttpServletRequest request) {

		review.setMemberId("lee5031207"); //임시 
		review.setShopIdx("test"); //임시
		String path = request.getSession().getServletContext().getRealPath("/").concat("resources");
		String imgUploadPath = path + File.separator + "imgUpload" + File.separator;
		

		reviewService.writeReview(file, review, imgUploadPath);
		
		return "review/reviewForm";
	}
	
	
}

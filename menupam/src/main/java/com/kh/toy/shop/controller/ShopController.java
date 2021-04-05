package com.kh.toy.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.shop.model.service.ShopSerivce;
import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.shop.validator.ShopValidator;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	private final ShopSerivce shopService;
	ShopValidator shopValidator;
	
	public ShopController(ShopSerivce shopService, ShopValidator shopValidator) {
		this.shopService = shopService;
		this.shopValidator = shopValidator;
	}
	
	@InitBinder(value = "shop")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(shopValidator);
	}
	
	
	@GetMapping("shopRegister")
	public void shopRegister() {}
	
	
	@PostMapping("shopInfo")
	public String shopInfo(@RequestParam(name = "shopPackAble", defaultValue = "N") String shopPackAble
						,@Valid Shop shop
						,Errors error
						,@RequestParam(name="detailedAddress") String detailedAddress
						,@SessionAttribute("userInfo") Member userInfo
						,Model model) {
		
		if(error.hasErrors()) {
			return "shop/shopRegister";
		}
		
		//포장 기능 체크가 안됬을때 강제로 N 삽입.
		if(shop.getShopPackAble() == "") {
			shop.setShopPackAble(shopPackAble);
		}
		
		shop.setMemberId(userInfo.getMemberId());
		shopService.insertShop(shop); // kakaomap 데이터 DB저장
		
		shop.setShopAddress(shop.getShopAddress() + "," + detailedAddress);
		shopService.insertShop(shop); // kakaomap 데이터 + 입력 데이터 DB저장
		
		model.addAttribute("msg", "매장등록이 완료 되었습니다.");
		model.addAttribute("url", "/shop/shopRegister");
		
		return "common/result";
	}
	
	@GetMapping("shopModify")
	public void shopModify() {}
	
	@PostMapping("Modify")
	public String modify(@RequestParam(name = "shopPackAble", defaultValue = "N") String shopPackAble
						,@SessionAttribute("userInfo") Member userInfo
						,Shop shop
						,Model model) {
		
		//포장 기능 체크하지 않을 경우
		if(shop.getShopPackAble() == "") {
			shop.setShopPackAble(shopPackAble);
		}
		
		// ------------ 여기 부터 수정 하시오 ---------------
		//System.out.println("회원정보 가져오니 : " + userInfo.getMemberId());
		//shop.setMemberId(userInfo.getMemberId());
		//shop.setShopPackAble(shop.getShopPackAble()); // 포장 가능 여부
		//shop.setShopTell(shop.getShopTell()); // 매장 번호
		//shop.setShopTableCount(shop.getShopTableCount()); // 테이블수
		//shop.setShopName(shop.getShopName());
		//shopService.updateShop(shop);
		//System.out.println("shop : " + shop);
		List<Shop> shopList = shopService.selectMemberShopList(userInfo.getMemberId());

		for (Shop shop2 : shopList) {
			System.out.println("shop : " + shop2);
		}
		
		model.addAttribute("msg", "매장 정보 수정 완료 되었습니다.");
		model.addAttribute("url", "/shop/shopModify"); //어디로 이동시킬지 말지 추후 예정
		
		return "common/result";
	}
	
}

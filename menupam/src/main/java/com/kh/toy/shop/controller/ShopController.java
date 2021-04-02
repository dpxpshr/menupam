package com.kh.toy.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.toy.shop.model.service.ShopSerivce;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	private final ShopSerivce shopService;
	
	public ShopController(ShopSerivce shopService) {
		this.shopService = shopService;
	}
	
	@GetMapping("shopRegister")
	public void shopRegister() {}
	
	
	@PostMapping("shopInfo")
	public String shopInfo(@RequestParam(name="shopPackAble", defaultValue = "N") String shopPackAble
						,Shop shop
						,HttpSession sessionn
						,Model model) {
		
		//checkBox 체크가 안됬을때 강제로 N 삽입.
		if(shop.getShopPackAble() == "") {
			shop.setShopPackAble(shopPackAble);
		}
		
		System.out.println(shop);
		//shopService.insertShop(shop); // 전체 완료떄 까지 주석모드
		
		model.addAttribute("msg", "매장등록이 완료 되었습니다.");
		model.addAttribute("url", "/shop/shopRegister");
		
		return "common/result";
	}
}

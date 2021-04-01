package com.kh.toy.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.toy.shop.model.service.ShopSerivce;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	private final ShopSerivce shopService;
	
	public ShopController(ShopSerivce shopService) {
		this.shopService = shopService;
	}
	
	@GetMapping("shopRegister")
	public void shopRegister() {}
	
}

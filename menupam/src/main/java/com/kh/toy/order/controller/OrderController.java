package com.kh.toy.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order")
public class OrderController {

	@GetMapping("search")
	public String searchForm() {
		return "order/search";
	}
	
	@GetMapping("shoplist")
	public String shopList(String keyword, String location, Model model) {
		
		return "order/shopList";
	}
	@GetMapping("menuview")
	public String menuView() {
		return "order/menuView";
	}
	
	
	@GetMapping("menucart")
	public String menuCart() {
		return "order/menuCart";
	}
	@GetMapping("payment")
	public String payment() {
		return "order/payment";
	}
	
	@GetMapping("myorders")
	public String myOrders() {
		return "order/myOrders";
	}
}

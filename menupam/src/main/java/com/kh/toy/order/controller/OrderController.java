package com.kh.toy.order.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.toy.order.model.service.OrderService;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("order")
public class OrderController {
	
	private final OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}
	
	@GetMapping("search")
	public String searchForm() {
		return "order/search";
	}
	
	@GetMapping("shoplist")
	public String shopList(String keyword, String location,
					@RequestParam(defaultValue = "name") String type, Model model) {
		if(keyword != null) {
			System.out.println("입력값 : " + keyword +" / " + location + " / " + type);
			Map commnadMap = Map.of("keyword",keyword,"location",location);
			if(type.equals("category")) {
				model.addAttribute("list",orderService.searchShopbyCategory(commnadMap));
			}else {
				List<Shop> slist = orderService.searchShopbyName(commnadMap);
				System.out.println(slist);
				model.addAttribute("list",slist);
			}
		}
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

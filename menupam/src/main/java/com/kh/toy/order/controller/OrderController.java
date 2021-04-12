package com.kh.toy.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	//search.jsp에서 keyword와 location을 받아서 넘어오면, 쿼리를 통해 리스트를 받고 slist attribute에 리스트를 넘긴다.
	@PostMapping("find")
	@ResponseBody
	public List<Shop> findShop(String keyword, String location,
					@RequestParam(defaultValue = "name") String type, HttpSession session) {
		List<Shop> result = orderService.searchShopbyName(keyword, location);
		System.out.println(result);
		return result;
	}
	@GetMapping("shoplist")
	public String shopList() {
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

package com.kh.toy.order.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.toy.order.model.service.OrderService;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.Shop;

@Controller
@RequestMapping("order")
public class OrderController {
	
	private final OrderService orderService;
	
	public OrderController(OrderService orderService) {
		this.orderService = orderService;
	}

	@PostMapping("find")
	@ResponseBody
	public List<Shop> findShop(String keyword, @RequestParam(defaultValue = "") String location,
					@RequestParam(defaultValue = "name") String type) {
		List<Shop> result = orderService.searchShopbyName(keyword, location);
		return result;
	}
	@GetMapping("shoplist")
	public String shopList() {
		return "order/shopList";
	}
	
	@GetMapping("menuview")
	public String menuView(String shopIdx,Model model) {
		Shop shopInfo = orderService.selectShopbyIdx(shopIdx);
		model.addAttribute(shopInfo);
		Map<String,List<Menu>> menulist = orderService.getMenulistByShopIdx(shopIdx);
		model.addAttribute("menulist",menulist);
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

package com.kh.toy.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.order.model.repository.OrderRepository;
import com.kh.toy.shop.model.vo.Shop;

@Service
public class OrderServiceImpl implements OrderService{

	private final OrderRepository orderRepository;

	public OrderServiceImpl(OrderRepository orderRepository) {
		this.orderRepository = orderRepository;
	}

	@Override
	public List<Shop> searchShopbyName(String keyword, String location) {
		List<Shop> shoplist = orderRepository.searchShopbyName(Map.of("keyword",keyword,"location",location));
		return shoplist;
	}

	@Override
	public List<Shop> searchShopbyCategory(Map<String,String> commandMap) {
		return orderRepository.searchShopbyCategory(commandMap);
	}

	@Override
	public Shop selectShopbyIdx(String shopIdx) {
		return orderRepository.selectShopbyIdx(shopIdx);
	}

}

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
	public List<Shop> searchShopbyName(Map commandMap) {
		return orderRepository.searchShopbyName(commandMap);
	}

	@Override
	public List<Shop> searchShopbyCategory(Map commandMap) {
		return orderRepository.searchShopbyCategory(commandMap);
	}

}

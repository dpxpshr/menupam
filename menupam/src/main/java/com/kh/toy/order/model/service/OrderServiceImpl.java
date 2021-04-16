package com.kh.toy.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.order.model.repository.OrderRepository;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
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

	@Override
	public Map<String, List<Menu>> getMenulistByShopIdx(String shopIdx) {
		List<MenuCategory> menuCategories = orderRepository.searchMenuCategoryByShopIdx(shopIdx);
		List<Menu> allMenu = orderRepository.searchMenuByShopIdx(shopIdx);
		Map<String,List<Menu>> result = new HashMap<>();
		
		for(MenuCategory category : menuCategories) { //선택한 매장의 각 카테고리마다 수행
			List<Menu> cateMenu = new ArrayList<>();
			for(Menu menu : allMenu) { //선택한 매장의 각 카테고리마다, 해당 매장의 모든 메뉴를 조회하며
				if(menu.getMenuCategoryName().equals(category.getMenuCategoryName())) { //현재 루프의 카테고리 = 메뉴의 카테고리라면
					cateMenu.add(menu); //리스트에 해당 메뉴를 넣는다.
				}
			}
			result.put(category.getMenuCategoryName(), cateMenu);//리스트에 카테고리의 메뉴를 모두 더한 후, 결과 맵에 카테고리명과 메뉴 리스트를 넣는다.
		}
		return result;
	}

}

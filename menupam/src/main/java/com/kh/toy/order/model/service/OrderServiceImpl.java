package com.kh.toy.order.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.toy.order.model.repository.OrderRepository;
import com.kh.toy.order.model.vo.Order;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.MenuOrdering;
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
	public List<Shop> searchShopbyCategory(String keyword, String location) {
		List<Shop> shoplist = orderRepository.searchShopbyCategory(Map.of("keyword",keyword,"location",location));
		return shoplist;
	}

	@Override
	public Shop selectShopbyIdx(String shopIdx) {
		return orderRepository.selectShopbyIdx(shopIdx);
	}

	@Override
	public Map<String, List<Map<String,String>>> getMenulistByShopIdx(String shopIdx) {
		List<MenuCategory> menuCategories = orderRepository.searchMenuCategoryByShopIdx(shopIdx);
		List<Map<String,String>> allMenu = orderRepository.searchMenuByShopIdx(shopIdx);
		System.out.println(allMenu);
		Map<String,List<Map<String,String>>> result = new HashMap<>();
		
		for(MenuCategory category : menuCategories) { //선택한 매장의 각 카테고리마다 수행
			List<Map<String,String>> cateMenu = new ArrayList<>();
			for(Map<String,String> menu : allMenu) { //선택한 매장의 각 카테고리마다, 해당 매장의 모든 메뉴를 조회하며
				if(menu.get("MENU_CATEGORY_NAME").equals(category.getMenuCategoryName())) { //현재 루프의 카테고리 = 메뉴의 카테고리라면
					cateMenu.add(menu); //리스트에 해당 메뉴를 넣는다.
				}
			}
			result.put(category.getMenuCategoryName(), cateMenu);//리스트에 카테고리의 메뉴를 모두 더한 후, 결과 맵에 카테고리명과 메뉴 리스트를 넣는다.
		}
		return result;
	}

	@Override
	public Menu getMenuInShopIdx(String shopIdx, String menuIdx) {
		return orderRepository.menuExistInShopIdx(Map.of("shopIdx",shopIdx,"menuIdx",menuIdx));
	}

	@Override
	@Transactional
	public void registOrder(List<Map> ordering,String shopIdx,String memberId, String packState,String tableNum) {
		//menuIdx + count를 받고, menuIdx를 통해 menu데이터를 가져온다.
		Map<Menu,Integer> menus = new HashMap<>(); //메뉴와 주문수량을 기록한 맵
		int totalPrice = 0;
		for(Map<String,String> menu : ordering) {
			int count = Integer.parseInt(menu.get("count"));
			Menu menuData = orderRepository.searchMenuByMenuIdx(menu.get("menuIdx"));
			menus.put(menuData,count);
			totalPrice += Integer.parseInt(menuData.getMenuPrice()) * count; //메뉴 가격 * 주문 수량을 메뉴마다 더하여 주문 총 가격 계산
		}
		//Order 제목 생성
		String orderTitle = 
				orderRepository.searchMenuByMenuIdx((String)ordering.get(0).get("menuIdx")).getMenuName();
		if(ordering.size() != 1) {
			orderTitle = orderTitle + " 외 " + (ordering.size()-1) + "개 메뉴";
		}
		
		//Order 생성하고
		{
			Map<String,String> commandMap = new HashMap<>();
			commandMap.put("shopIdx", shopIdx);
			commandMap.put("memberId", memberId);
			commandMap.put("packState", packState);
			commandMap.put("orderPrice", ""+totalPrice);
			commandMap.put("tableNum", tableNum);
			commandMap.put("orderTitle", orderTitle);
			orderRepository.createNewOrder(commandMap);
		}
		//Order에 종속되는 menu-ordering을 각각 생성한다.
		//#{count},#{menuIdx},#{menuName},#{menuPrice}
		for(Menu menu : menus.keySet()) {
			Map<String,String> commandMap = new HashMap<>();
			commandMap.put("menuIdx", menu.getMenuIdx());
			commandMap.put("menuName", menu.getMenuName());
			commandMap.put("menuPrice", menu.getMenuPrice());
			commandMap.put("count",""+menus.get(menu));
			orderRepository.createMenuOrdering(commandMap);
		}
	}

	@Override
	public Order selectOrderByMemberIdAndShopIdx(String memberId, String shopIdx) {
		Map<String,String> commandMap = Map.of("memberId",memberId,"shopIdx",shopIdx);
		return orderRepository.selectOrderByMemberIdAndShopIdx(commandMap);
	}

	@Override
	public List<MenuOrdering> selectMenuOrderingByOrderIdx(String orderIdx) {
		return orderRepository.selectMenuOrderingByOrderIdx(orderIdx);
	}

	@Override
	public boolean discardOrder(String orderIdx, String memberId) {
		Map<String,String> commandMap = Map.of("orderIdx",orderIdx,"memberId",memberId);
		return orderRepository.updateOrderStateByOrderIdx(commandMap);
	}

	@Override
	public Order checkOrderInfo(String orderIdx, String shopIdx, String memberId) {
		Map<String,String> commandMap = Map.of("orderIdx",orderIdx,"memberId",memberId,"shopIdx",shopIdx);
		return orderRepository.checkOrderInfo(commandMap);
	}

	@Override
	@Transactional
	public boolean insertPayment(Order order, String payType, String shopIdx) {
		Map<String,String> commandMap = new HashMap<>();
		commandMap.put("paymentAmount", order.getOrderPrice());
		commandMap.put("paymentType", payType);
		commandMap.put("shopIdx", shopIdx);
		commandMap.put("orderIdx", order.getOrderIdx());
		return orderRepository.insertPayment(commandMap) && orderRepository.updateOrderPayState(order.getOrderIdx());
	}

	@Override
	public List<Map<String,Object>> selectOrderByMemberId(String memberId) {
		return orderRepository.selectOrderByMemberId(memberId);
	}

}

package com.kh.toy.order.model.service;

import java.util.List;
import java.util.Map;

import com.kh.toy.order.model.vo.Order;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuOrdering;
import com.kh.toy.shop.model.vo.Shop;

public interface OrderService {
	
	List<Shop> searchShopbyName(String keyword, String location);
	List<Shop> searchShopbyCategory(Map<String,String> commandMap);
	Shop selectShopbyIdx(String shopIdx);
	Map<String, List<Map<String,String>>> getMenulistByShopIdx(String shopIdx);
	Menu getMenuInShopIdx(String shopIdx, String menuIdx);
	void registOrder(List<Map> ordering, String shopIdx, String memberId, String packState, String tableNum);
	Order selectOrderByMemberIdAndShopIdx(String memberId, String shopIdx);
	List<MenuOrdering> selectMenuOrderingByOrderIdx(String orderIdx);
	boolean discardOrder(String orderIdx, String memberId);
	Order checkOrderInfo(String orderIdx, String shopIdx, String memberId);
	boolean insertPayment(Order order, String payType, String shopIdx);
	List<Map<String,Object>> selectOrderByMemberId(String memberId);
}

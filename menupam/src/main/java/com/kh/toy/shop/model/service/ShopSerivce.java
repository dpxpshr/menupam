package com.kh.toy.shop.model.service;

import java.util.List;
import java.util.Map;

import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.Shop;

public interface ShopSerivce {

	int insertShop(Shop shop);
	int updateShop(Shop shop);
	List<Shop> selectMemberShopList(Shop shop, String userId);
	Map<String,Object> selectCategoryList(String userId);
}

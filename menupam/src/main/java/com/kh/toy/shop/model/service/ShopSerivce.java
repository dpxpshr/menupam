package com.kh.toy.shop.model.service;


import java.util.Map;

import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.Shop;

public interface ShopSerivce {

	int insertShop(Shop shop);
	int updateShop(Shop shop);
	Shop selectShopInfo(String userId);
	void ShopInfoModify(Shop shop, String userId);
	
	Map<String,Object> selectCategoryList(String shopIdx);
	void updateCategoryName(MenuCategory menuCategory);
	int insertCategory(MenuCategory menuCategory, String shopIdx);
	int deleteCategory(MenuCategory menuCategory);

}

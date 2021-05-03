package com.kh.toy.shop.model.service;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.order.model.vo.Order;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.MenuOrdering;
import com.kh.toy.shop.model.vo.Shop;

public interface ShopSerivce {
	
	//////매장 테이블 //////
	int updateShop(Shop shop);
	Shop selectShopInfo(String userId);
	void ShopInfoModify(Shop shop, String userId);
	
	///////// 카테고리 테이블 /////////
	Map<String,Object> selectCategoryList(String shopIdx);
	void updateCategoryName(MenuCategory menuCategory);
	int insertCategory(MenuCategory menuCategory, String shopIdx);
	int deleteCategory(MenuCategory menuCategory);
	/////// 메뉴 테이블 ///////
	void menuRegister(MultipartFile file, Menu menu, String uploadPath);
	Map<String,Object> selectMenuList(String shopIdx);
	
	//////메뉴 오더 //////
	List<Map<String,Object>> selectMenuOrderList(String orderTableNum,String shopIdx);
	int deleteSelectionMenuOrder(MenuOrdering menuOrdering);
	List<Order> selectOrderList();
	Order selectOrderAndTableNum(String orderTableNum);
	void updateOrderTableNum(Order order);
	void shopLogoUpload(MultipartFile file, Shop shop, String uploadPath);
	
	//////예약 현황 ////////
	Map<String,Object> selectReservationList();
}

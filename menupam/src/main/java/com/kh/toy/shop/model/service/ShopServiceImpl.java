package com.kh.toy.shop.model.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.toy.common.util.file.MenupamFile;
import com.kh.toy.common.util.photo.PhotoUtil;
import com.kh.toy.order.model.vo.Order;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.repository.ShopRepository;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.MenuOrdering;
import com.kh.toy.shop.model.vo.Shop;


@Service 
public class ShopServiceImpl implements ShopSerivce{
	
	private final ShopRepository shopRepository;
	
	public ShopServiceImpl(ShopRepository shopRepository) { 
		this.shopRepository = shopRepository; 
	}
	
	@Override
	public int updateShop(Shop shop) {
		return shopRepository.updateShop(shop);
	}
	
	@Override
	public Shop selectShopInfo(String userId) {
		return shopRepository.selectShopInfo(userId);
	}


	@Override
	public void ShopInfoModify(Shop shop, String userId) {
			
			shop.setMemberId(userId); // 회원아이디로 조회시 필요
			
			//html에서 체크하지 않을경우 null로 받아오기 떄문에 강제로 N을 넣어준다.
			if(shop.getShopPackAble() == null) {
				shop.setShopPackAble("N");
			}else {
				shop.setShopPackAble(shop.getShopPackAble());
			}
			
			shop.setShopTell(shop.getShopTell()); // 매장 번호
			shop.setShopTableCount(shop.getShopTableCount()); // 테이블 개수
			
			shopRepository.updateShop(shop);
		
	}

	@Override
	public Map<String, Object> selectCategoryList(String shopIdx) {
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("categorys", shopRepository.selectCategoryList(shopIdx));
		
		return commandMap;
	}

	@Override
	public void updateCategoryName(MenuCategory menuCategory) {
		
		menuCategory.setMenuCategoryName(menuCategory.getMenuCategoryName());
		menuCategory.setMenuCategoryIdx(menuCategory.getMenuCategoryIdx());
		
		shopRepository.updateCategoryName(menuCategory);
	}

	@Override
	public int insertCategory(MenuCategory menuCategory, String shopIdx) {
		menuCategory.setMenuCategoryName(menuCategory.getMenuCategoryName());
		menuCategory.setShopIdx(shopIdx);
		
		return shopRepository.insertCategory(menuCategory);
	}

	@Override
	public int deleteCategory(MenuCategory menuCategory) {
		menuCategory.setMenuCategoryIdx(menuCategory.getMenuCategoryIdx());
		return shopRepository.deleteCategory(menuCategory);
	}

	@Override
	public void menuRegister(MultipartFile file, Menu menu, String uploadPath) {
		
		PhotoUtil photoUtil = new PhotoUtil();
		String type = FilenameUtils.getExtension(file.getOriginalFilename());
		String route = "/resources/menuImages/";
		
		menu.setMenuName(menu.getMenuName());
		menu.setMenuPrice(menu.getMenuPrice());
		menu.setMenuCategoryName(menu.getMenuCategoryName());
		menu.setMenuVegan(menu.getMenuVegan());
		
		try {
			
			MenupamFile fileInfo = photoUtil.photoUpload(file, uploadPath, type, route);
			
			if(fileInfo.getFileOriginName() == null) {
				menu.setMenuPhoto("noImage");
				menu.setFileIdx("");
				shopRepository.insertMenu(menu);
			}else {
				fileInfo.setFileType(type);
				shopRepository.insertFile(fileInfo);
				
				String fileIdx = shopRepository.selectFileIdx(fileInfo.getFileRename());
				menu.setFileIdx(fileIdx);
				menu.setMenuPhoto(file.getOriginalFilename());
				shopRepository.insertMenu(menu);
				
			}
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Map<String, Object> selectMenuList(String shopIdx) {
		
		Map<String, Object> commandMap = new HashMap<String,Object>();
		commandMap.put("menuList", shopRepository.selectMenuList(shopIdx));
	
		return commandMap;
	}

	@Override
	public List<Map<String,Object>> selectMenuOrderList(String orderTableNum,String shopIdx) {
		
		Order order = new Order();
		order.setOrderTableNum(orderTableNum);
		order.setShopIdx(shopIdx);
		
		return shopRepository.selectMenuOrderList(order);
	}

	@Override
	public int deleteSelectionMenuOrder(MenuOrdering menuOrdering) {
		return shopRepository.deleteSelectionMenuOrder(menuOrdering);
	}

	@Override
	public List<Order> selectOrderList() {
		return shopRepository.selectOrderList();
	}

	@Override
	public Order selectOrderAndTableNum(String orderTableNum) {
		return shopRepository.selectOrderAndTableNum(orderTableNum);
	}

	@Override
	public void updateOrderTableNum(Order order) {
		order.setOrderIdx(order.getOrderIdx());
		order.setOrderTableNum("0");
		
		shopRepository.updateOrderTableNum(order);
	}

	@Override
	public void shopLogoUpload(MultipartFile file, Shop shop, String uploadPath) {
		PhotoUtil photoUtil = new PhotoUtil();
		String type = FilenameUtils.getExtension(file.getOriginalFilename());
		String route = "/resources/shoplogo/";
		
		try {

			MenupamFile fileInfo = photoUtil.photoUpload(file, uploadPath, type, route);
			
			if(fileInfo.getFileOriginName() == null) {
				shop.setFileIdx("");
				shopRepository.insertShop(shop);
			}else {
				fileInfo.setFileType(type);
				shopRepository.insertFile(fileInfo);
				String fileIdx = shopRepository.selectFileIdx(fileInfo.getFileRename());
				shop.setFileIdx(fileIdx);
				shopRepository.insertShop(shop);
				
			}
		
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Map<String,Object> selectReservationList() {
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		List<Reservation> reserList = shopRepository.selectReservationList();
		int count = 0;
		
		for (Reservation rv : reserList) {
			
			if(rv.getReserState().equals("승인대기")) {
				count++;
			}
		}
		
		commandMap.put("reserCount", count);
		
		return commandMap;
	}	

}
 
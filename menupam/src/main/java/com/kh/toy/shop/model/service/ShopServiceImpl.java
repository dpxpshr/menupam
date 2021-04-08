package com.kh.toy.shop.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.shop.model.repository.ShopRepository;
import com.kh.toy.shop.model.vo.Shop;


@Service 
public class ShopServiceImpl implements ShopSerivce{
	
	private final ShopRepository shopRepository;
	
	public ShopServiceImpl(ShopRepository shopRepository) { 
		this.shopRepository = shopRepository; 
	}
	
	@Override 
	public int insertShop(Shop shop) {
		return shopRepository.insertShop(shop); 
	}

	@Override
	public int updateShop(Shop shop) {
		return shopRepository.updateShop(shop);
	}

	@Override
	public List<Shop> selectMemberShopList(Shop shop, String userId) {
			
		List<Shop> shopList = shopRepository.selectMemberShopList(userId);

		for (Shop shopInfo : shopList) {
			
			shop.setMemberId(shopInfo.getMemberId()); // 회원아이디로 조회시 필요
			
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
		
		return shopList;
	}

	@Override
	public Map<String, Object> selectCategoryList(String userId) {
		
		Map<String,Object> commandMap = new HashMap<String,Object>();
		commandMap.put("categorys", shopRepository.selectCategoryList(userId));
		
		
		return commandMap;
	}

	
}
 
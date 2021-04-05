package com.kh.toy.shop.model.service;

import java.util.List;

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
	public List<Shop> selectMemberShopList(String userId) {
		
		return shopRepository.selectMemberShopList(userId);
	}
	
}
 
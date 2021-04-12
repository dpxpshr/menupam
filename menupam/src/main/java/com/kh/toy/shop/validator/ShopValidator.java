package com.kh.toy.shop.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.toy.shop.model.repository.ShopRepository;
import com.kh.toy.shop.model.vo.Shop;

@Component
public class ShopValidator implements Validator{
	
	private final ShopRepository shopRepository;
	
	public ShopValidator(ShopRepository shopRepository) {
		this.shopRepository = shopRepository;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Shop.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Shop shop = (Shop) target;
		
		if(shopRepository.selectShopbyTell(shop.getShopTell()) > 0) {
			errors.rejectValue("shopTell", "error.shopTell","이미 존재하는 매장 번호 입니다.");
		}
		
		//사업자 등록증 정확한 입력인지 
		Pattern pattern = Pattern.compile("^\\d{3}-\\d{4}-\\d{4}$");
		if(!pattern.matcher(shop.getShopBln()).find()) {
			errors.rejectValue("shopBln", "error.shopBln", "등록증을 잘못 입력 하셨습니다.");
		} 
		
		if(shopRepository.selectShopbyBin(shop.getShopBln()) > 0) {
			errors.rejectValue("shopBln", "error.shopBln","존재하는 사업자 등록증 입니다.");
		}
	}
	
}

package com.kh.toy.shop.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.toy.shop.model.vo.Shop;


@Mapper
public interface ShopRepository {
	
	@Insert("insert into tb_shop(shop_idx, shop_name,shop_address,shop_type,shop_bln,shop_pack_able,shop_rating,shop_tell, member_id)"
			+ " values('s'||sc_shop_idx.nextval,#{shopName},#{shopAddress},#{shopType},#{shopBln},#{shopPackAble},#{shopRating},#{shopTell}, 'aabb')")
	int insertShop(Shop shop);
		
}	

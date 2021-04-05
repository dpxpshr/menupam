package com.kh.toy.shop.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.shop.model.vo.Shop;


@Mapper
public interface ShopRepository {
	
	@Select("select count(*) from tb_shop where shop_tell = #{shopTell}")
	int selectShopbyTell(String shopTell);
	
	@Select("select count(*) from tb_shop where shop_bln = #{shopBln}")
	int selectShopbyBin(String shopBln);
	
	@Insert("insert into tb_shop(shop_idx,shop_name,shop_address,shop_type,shop_bln,shop_pack_able,shop_rating,"
			+ "shop_table_count,shop_tell, member_id)"
			+ " values('s'||sc_shop_idx.nextval,#{shopName},#{shopAddress},#{shopType},#{shopBln},#{shopPackAble},#{shopRating},"
			+ "#{shopTableCount},#{shopTell}, 'aabb')")
	int insertShop(Shop shop);
	
	
		
}	

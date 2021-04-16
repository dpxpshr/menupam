package com.kh.toy.order.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.Shop;

@Mapper
public interface OrderRepository {
	
	@Select("select * from tb_shop where shop_name like '%'||#{keyword}||'%' and shop_address like '%'||#{location}||'%'")
	List<Shop> searchShopbyName(Map<String,String> commandMap);
	
	@Select("select * from tb_shop "
			+ "where shop_type = #{keyword} and shop_address like '%#{location}%'")
	List<Shop> searchShopbyCategory(Map<String,String> commandMap);

	@Select("select * from tb_shop where shop_idx = #{shopIdx}")
	Shop selectShopbyIdx(String shopIdx);

	@Select("select * from tb_menu_category where shop_idx = #{shopIdx}")
	List<MenuCategory> searchMenuCategoryByShopIdx(String shopIdx);

	@Select("select * from tb_menu where shop_idx = #{shopIdx}")
	List<Menu> searchMenuByShopIdx(String shopIdx);
}

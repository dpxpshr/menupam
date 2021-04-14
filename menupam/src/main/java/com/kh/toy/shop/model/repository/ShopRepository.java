package com.kh.toy.shop.model.repository;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.common.util.file.MenupamFile;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.Shop;

@Mapper
public interface ShopRepository {
	
	// 매장 테이블
	@Select("select count(*) from tb_shop where shop_tell = #{shopTell}")
	int selectShopbyTell(String shopTell);
	
	@Select("select count(*) from tb_shop where shop_bln = #{shopBln}")
	int selectShopbyBin(String shopBln);
	
	@Insert("insert into tb_shop(shop_idx,shop_name,shop_address,shop_type,shop_bln,shop_pack_able,shop_rating,"
			+ "shop_table_count,shop_tell, member_id)"
			+ " values('S'||sc_shop_idx.nextval,#{shopName},#{shopAddress},#{shopType},#{shopBln},#{shopPackAble},#{shopRating},"
			+ "#{shopTableCount},#{shopTell},#{memberId})")
	int insertShop(Shop shop);
	
	int updateShop(Shop shop);
	
	@Select("select * from tb_shop where member_id = #{memberId}")
	Shop selectShopInfo(String userId);
	
	// 카테고리 테이블
	@Select("select * from tb_menu_category where shop_idx = #{shopIdx}")
	List<MenuCategory> selectCategoryList(String shopIdx);
	
	@Insert("insert into tb_menu_category(menu_category_idx, menu_category_name, shop_idx)"
			+ " values('MC'||sc_menucategory_idx.nextval, #{menuCategoryName}, #{shopIdx})")
	int insertCategory(MenuCategory menuCategory);
	
	int updateCategoryName(MenuCategory menuCategory);
	
	@Delete("delete from tb_menu_category where menu_category_idx = #{menuCategoryIdx}")
	int deleteCategory(MenuCategory menuCategory);
	
	//메뉴 테이블
	@Insert("insert into tb_file(file_idx, file_origin_name, file_rename, file_type, file_save_path)"
			+ " values('F'||sc_file_idx.nextval, #{fileOriginName}, #{fileRename}, #{fileType}, #{fileSavePath})")
	int insertFile(MenupamFile menupamFile);
	
}	

package com.kh.toy.shop.model.repository;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.common.util.file.MenupamFile;
import com.kh.toy.order.model.vo.Order;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.MenuOrdering;
import com.kh.toy.shop.model.vo.Shop;

@Mapper
public interface ShopRepository {
	
	////// 매장 테이블 //////
	@Select("select count(*) from tb_shop where shop_tell = #{shopTell}")
	int selectShopbyTell(String shopTell);
	
	@Select("select count(*) from tb_shop where shop_bln = #{shopBln}")
	int selectShopbyBin(String shopBln);
	
	@Insert("insert into tb_shop(shop_idx,shop_name,shop_address,shop_type,shop_bln,shop_pack_able,shop_rating,"
			+ "shop_table_count,shop_tell,shop_longitude_x,shop_latitude_y, file_idx,member_id)"
			+ " values('S'||sc_shop_idx.nextval,#{shopName},#{shopAddress},#{shopType},#{shopBln},#{shopPackAble},#{shopRating},"
			+ "#{shopTableCount},#{shopTell},#{shopLongitudeX},#{shopLatitudeY},#{fileIdx},#{memberId})")
	int insertShop(Shop shop);
	
	int updateShop(Shop shop);
	
	@Select("select * from tb_shop where member_id = #{memberId}")
	Shop selectShopInfo(String userId);
	
	///////// 카테고리 테이블 /////////
	@Select("select * from tb_menu_category where shop_idx = #{shopIdx}")
	List<MenuCategory> selectCategoryList(String shopIdx);
	
	@Insert("insert into tb_menu_category(menu_category_idx, menu_category_name, shop_idx)"
			+ " values('MC'||sc_menucategory_idx.nextval, #{menuCategoryName}, #{shopIdx})")
	int insertCategory(MenuCategory menuCategory);
	
	int updateCategoryName(MenuCategory menuCategory);
	
	@Delete("delete from tb_menu_category where menu_category_idx = #{menuCategoryIdx}")
	int deleteCategory(MenuCategory menuCategory);
	
	/////// 메뉴 테이블 ///////
	@Insert("insert into tb_file(file_idx, file_origin_name, file_rename, file_type, file_save_path)"
			+ " values('F'||sc_file_idx.nextval, #{fileOriginName}, #{fileRename}, #{fileType}, #{fileSavePath})")
	int insertFile(MenupamFile menupamFile);
	
	@Insert("insert into tb_menu(menu_idx, menu_name, menu_photo, menu_price, menu_vegan, menu_category_name, shop_idx, file_idx)"
			+ "values('M'||sc_menu_idx.nextval, #{menuName},#{menuPhoto},#{menuPrice},#{menuVegan},#{menuCategoryName},#{shopIdx},#{fileIdx})")
	int insertMenu(Menu menu);
	
	@Select("select file_idx from tb_file where file_rename = #{fileRename}")
	String selectFileIdx(String fileRename);
	
	List<Menu> selectMenuList(String shopIdx);
	
	////// 메뉴 오더 //////
	List<Map<String,Object>> selectMenuOrderList(Order order);
	
	int deleteSelectionMenuOrder(MenuOrdering menuOrdering);
	
	@Select("select * from tb_order")
	List<Order> selectOrderList();
	
	@Select("select * from tb_order where order_table_num = #{orderTableNum}")
	Order selectOrderAndTableNum(String orderTableNum);
	void updateOrderTableNum(Order order);
	
	//////// 예약 현황 확인 //////////
	@Select("select * from tb_reservation")
	List<Reservation> selectReservationList();
}	

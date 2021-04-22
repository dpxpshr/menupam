package com.kh.toy.order.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.order.model.vo.Order;
import com.kh.toy.shop.model.vo.Menu;
import com.kh.toy.shop.model.vo.MenuCategory;
import com.kh.toy.shop.model.vo.MenuOrdering;
import com.kh.toy.shop.model.vo.Shop;

@Mapper
public interface OrderRepository {
	
	//지역 정보 + 매장명을 통한 검색
	@Select("select * from tb_shop where shop_name like '%'||#{keyword}||'%' and shop_address like '%'||#{location}||'%'")
	List<Shop> searchShopbyName(Map<String,String> commandMap);
	
	//지역정보 + 카테고리를 통한 검색
	@Select("select * from tb_shop "
			+ "where shop_type = #{keyword} and shop_address like '%#{location}%'")
	List<Shop> searchShopbyCategory(Map<String,String> commandMap);

	//ShopIdx로 shop 데이터 가져오기
	@Select("select * from tb_shop where shop_idx = #{shopIdx}")
	Shop selectShopbyIdx(String shopIdx);

	//한 매장에 등록되어 있는 모든 메뉴 카테고리 읽어오기
	@Select("select * from tb_menu_category where shop_idx = #{shopIdx}")
	List<MenuCategory> searchMenuCategoryByShopIdx(String shopIdx);

	//한 매장에 등록된 모든 메뉴 정보 읽어오기
	@Select("select * from tb_menu where shop_idx = #{shopIdx}")
	List<Menu> searchMenuByShopIdx(String shopIdx);

	//메뉴가 지정한 매장에 있는지 확인하고 있으면 메뉴정보를 반환
	@Select("select * from tb_menu where shop_idx = #{shopIdx} and menu_idx = #{menuIdx}")
	Menu menuExistInShopIdx(Map<String,String> commandMap);

	//메뉴 인덱스를 통해 메뉴 정보 읽어오기
	@Select("select * from tb_menu where menu_idx = #{menuIdx}")
	Menu searchMenuByMenuIdx(String menuIdx);

	//새로운 Order(주문) 등록
	@Insert("insert into tb_order(order_idx,order_price,order_pack_state,order_pay_state,member_id,shop_idx,order_table_num)"
			+ " values(sc_order_idx.nextval,#{orderPrice},#{packState},'N',#{memberId},#{shopIdx},#{tableNum,jdbcType=VARCHAR})")
	void createNewOrder(Map<String,String> commandMap);

	//Order에 종속되는 menu_ordering 데이터 등록
	@Insert("insert into tb_menu_ordering(mo_idx,order_menu_cnt,order_idx,menu_idx,order_menu_name,order_menu_price)"
			+ " values(sc_menu_order_idx.nextval,#{count},sc_order_idx.currval,#{menuIdx},#{menuName},#{menuPrice})")
	void createMenuOrdering(Map<String,String> commandMap);

	//사용자가 매장에 주문한, 결제되지 않은 주문을 반환
	@Select("select * from tb_order where member_id = #{memberId} and shop_idx = #{shopIdx} and order_pay_state = 'N'")
	Order selectOrderByMemberIdAndShopIdx(Map<String, String> commandMap);
	
	//주문에 걸린 메뉴 목록 반환
	@Select("select * from tb_menu_ordering where order_idx = #{orderIdx}")
	List<MenuOrdering> selectMenuOrderingByOrderIdx(String orderIdx);
	
	//등록되어 있는 주문을 결제하지 않고 취소 (주문의 결제상태를 'D(Discard)'로 변경
	@Update("update tb_order set order_pay_state = 'D' where order_idx = #{orderIdx} and member_id = #{memberId}")
	boolean updateOrderStateByOrderIdx(Map<String, String> commandMap);
	
	//결제 데이터가 정확한지 체크하고 결제할 주문을 반환
	@Select("select * from tb_order where order_idx = #{orderIdx} and member_id = #{memberId} and shop_idx = #{shopIdx} and order_pay_state = 'N'")
	Order checkOrderInfo(Map<String, String> commandMap);

	//결제가 완료되면 결제내역 데이터를 DB에 저장
	@Insert("insert into tb_payment(payment_idx,payment_amount,payment_type,shop_idx,order_idx)"
			+ " values(sc_payment_idx.nextval,#{paymentAmount},#{paymentType},#{shopIdx},#{orderIdx})")
	boolean insertPayment(Map<String, String> commandMap);

	//결제한 주문의 결제상태를 'Y'로 변경
	@Update("update tb_order set order_pay_state = 'Y' where order_idx = #{orderIdx}")
	boolean updateOrderPayState(String orderIdx);
}

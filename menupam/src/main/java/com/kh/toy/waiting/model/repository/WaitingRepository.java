package com.kh.toy.waiting.model.repository;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.vo.Waiting;

@Mapper
public interface WaitingRepository {

	//대기리스트 대기등록먼저한 순서대로 잘나오나?
	@Select("select * from tb_waiting where wait_reg_date = #{waitRegDate} and wait_state = 'wait' orderby wait_reg_date")
	List<Waiting> selectWaitingListByDate(Date waitRegDate);
	
	//insert 
	//@Insert("insert into tb_waiting(wait_idx, shop_idx, wait_phone, wait_party, wait_time) "
	//		+ " values('b'||sc_wait_idx.nextval, #{shopIdx}, #{waitPhone}, #{waitParty}, #{waitTime})")
	@Insert("insert into tb_waiting(wait_idx, shop_idx, wait_phone, wait_party) "
			+ " values('b'||sc_wait_idx.nextval, #{shopIdx}, #{waitPhone}, #{waitParty})")
	int insertWaiting(Waiting waiting);
	
	@Update("update tb_waiting set wait_state = 'arrived' where wait_idx = #{waitIdx}")
	int updateArrived(String waitIdx);
	
	@Update("update tb_waiting set wait_state = 'cancel' where wait_idx = #{waitIdx}")
	int updateCancel(String waitIdx);
	
	@Select("select * from tb_shop where shop_idx = #{shopIdx}")
	Shop selectShopByShopIdx(String shopIdx);
}

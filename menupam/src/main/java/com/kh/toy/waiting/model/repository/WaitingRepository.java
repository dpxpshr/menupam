package com.kh.toy.waiting.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.vo.Waiting;

@Mapper
public interface WaitingRepository {

	//대기리스트
	@Select("select * from tb_waiting where shop_idx = #{shopIdx} and wait_state = '대기중' order by wait_reg_date")
	List<Waiting> selectWaitingList(String shopIdx);
	
	//대기 등록
	@Insert("insert into tb_waiting(wait_idx, shop_idx, wait_phone, wait_party) "
			+ " values('W'||sc_wait_idx.nextval, #{shopIdx}, #{waitPhone}, #{waitParty})")
	int insertWaiting(Waiting waiting);
	
	//도착 버튼
	@Update("update tb_waiting set wait_state = '도착' where wait_idx = #{waitIdx}")
	int updateArrived(String waitIdx);
	
	// 대기 취소 버튼
	@Update("update tb_waiting set wait_state = '대기취소' where wait_idx = #{waitIdx}")
	int updateCancel(String waitIdx);
	
	//문자 전송 버튼
	@Update("UPDATE TB_WAITING SET WAIT_SMS_TIME = SYSDATE WHERE WAIT_IDX = #{waitIdx}")
	int updateWaitSmsTime(String waitIdx);
	
	//idx로 shopName
	@Select("select * from tb_shop where shop_idx = #{shopIdx}")
	Shop selectShopByShopIdx(String shopIdx);
	
	//대기 인원수
	@Select("select count(*) from tb_waiting where shop_idx = #{shopIdx} and wait_state ='대기중'")
	int waitCount(String shopIdx);
	
	//waitIdx로 waiting을 가져오는 메서드
	@Select("SELECT * FROM TB_WAITING WHERE WAIT_IDX = #{waitIdx}")
	Waiting selectWaitingByWaitIdx(String waitIdx);
	
	
	
	
	
}

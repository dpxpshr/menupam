package com.kh.toy.reservation.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;



@Mapper
public interface ReservationRepository {
	
	//사장이 보는 예약 리스트
	@Select("SELECT * FROM TB_RESERVATION WHERE SHOP_IDX = #{shopIdx} AND RESER_DATE LIKE CONCAT(#{reserDate},'%') AND RESER_STATE = '승인완료'")
	List<Reservation> selectResListByDate(@Param(value = "shopIdx") String shopIdx, @Param(value = "reserDate") String reserDate);
	
	@Insert("insert into tb_reservation(reser_idx, shop_idx, reser_name, reser_date, reser_comment, reser_party, member_id, reser_phone)"
			+ " values('R'||sc_reser_idx.nextval, #{shopIdx}, #{reserName}, #{reserDate}, #{reserComment}, #{reserParty}, #{memberId}, #{reserPhone})")
	int insertRes(Reservation res);
	
	//예약요청리스트
	@Select("SELECT * FROM TB_RESERVATION WHERE SHOP_IDX = #{shopIdx} AND RESER_STATE = '승인대기' ORDER BY RESER_REG_DATE")
	List<Reservation> selectResRequeList(String shopIdx);
	
	@Update("update tb_reservation set reser_state = '승인완료' where reser_idx = #{reserIdx}")
	int updateStateApprove(String reserIdx);
	
	@Update("update tb_reservation set reser_state = '승인거부' where reser_idx = #{reserIdx}")
	int updateStateReject(String reserIdx);
	
	@Update("update tb_reservation set reser_state = '예약취소' where reser_idx = #{reserIdx}")
	int cancelRes(String reserIdx);
	
	//예약리스트에서 예약손님 검색
	@Select("select * tb_reservation where reser_date = #{reserDate} and reser_name = #{reserName}")
	List<Reservation> searchByName(Reservation res, Member member);
	
	
	@Select("select * from tb_shop where shop_idx = #{shopIdx}")
	Shop selectShopByShopIdx(String shopIdx);
	
	@Select("SELECT * FROM TB_RESERVATION WHERE RESER_IDX = #{reserIdx}")
	Reservation selectReservationByReserIdx(String reserIdx);

	
}

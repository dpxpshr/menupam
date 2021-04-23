package com.kh.toy.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;

public interface ReservationService {

	//사장이 보는 예약 리스트
	List<Reservation> selectResListByDate(String reserDate);
	
	int insertRes(Reservation res);
	void deleteRes(String reserIdx);
	List<Reservation> selectResRequeList(String shopIdx);
	int updateStateApprove(String reserIdx);
	int updateStateReject(String reserIdx);
	int cancelRes(String reserIdx);
	List<Reservation> searchByName(Reservation res, Member member);
	Shop selectShopByShopIdx(String shopIdx);
	Map<Integer, Reservation> getResMap(String shopIdx, String reserDate);
}

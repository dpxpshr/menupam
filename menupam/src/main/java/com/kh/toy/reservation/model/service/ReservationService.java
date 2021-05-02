package com.kh.toy.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;

public interface ReservationService {

	//사장이 보는 예약 리스트
	List<Reservation> selectResListByDate(String reserDate);
	Map<Integer, Reservation> getResMap(String shopIdx, String reserDate);
	
	int insertRes(Reservation res); //예약신청
	List<Reservation> selectResRequeList(String shopIdx); //예약승인리스트
	int updateStateApprove(String reserIdx); //승인
	int updateStateReject(String reserIdx); //거부
	int cancelRes(String reserIdx); //취소
	Shop selectShopByShopIdx(String shopIdx);
	
}

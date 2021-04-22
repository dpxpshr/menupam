package com.kh.toy.reservation.model.service;

import java.util.List;
import java.util.Map;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.vo.Reservation;

public interface ReservationService {

	//사장이 보는 예약 리스트
	List<Reservation> selectResListByDate(String reserDate);
	
	int insertRes(Reservation res);
	void deleteRes(String reserIdx);
	List<Map<String, Object>> selectResRequeList();
	int updateStateApprove(String reserIdx);
	int updateStateReject(String reserIdx);
	List<Reservation> searchByName(Reservation res, Member member);
}

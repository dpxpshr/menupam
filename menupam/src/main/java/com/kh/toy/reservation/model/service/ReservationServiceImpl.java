package com.kh.toy.reservation.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.repository.ReservationRepository;
import com.kh.toy.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	private final ReservationRepository resRepository;
	
	public ReservationServiceImpl(ReservationRepository resRepository) {
		this.resRepository = resRepository;
	}

	//날짜별예약리스트 
	@Override
	public List<Reservation> selectResListByDate(String reserDate) {
		return resRepository.selectResListByDate(reserDate);
	}
	
	//예약 등록
	@Override
	public int insertRes(Reservation res) {
		return resRepository.insertRes(res);
	}

	//예약 취소
	@Override
	public void deleteRes(String reserIdx) {
		resRepository.deleteRes(reserIdx);
	}

	//예약 요청 리스트
	@Override
	public List<Map<String, Object>> selectResRequeList() {
		return resRepository.selectResRequeList();
	}

	//예약 승인
	@Override
	public int updateStateApprove(String reserIdx) {
		
		return resRepository.updateStateApprove(reserIdx);
	}

	//예약 거부
	@Override
	public int updateStateReject(String reserIdx) {
		return resRepository.updateStateReject(reserIdx);
	}

	@Override
	public List<Reservation> searchByName(Reservation res, Member member) {
		
		return resRepository.searchByName(res, member);
	}

	
	
}
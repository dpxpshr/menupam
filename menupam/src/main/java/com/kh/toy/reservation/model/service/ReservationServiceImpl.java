package com.kh.toy.reservation.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.reservation.model.repository.ReservationRepository;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	private final ReservationRepository resRepository;
	
	public ReservationServiceImpl(ReservationRepository resRepository) {
		this.resRepository = resRepository;
	}

	//날짜별예약리스트 
	@Override
	public List<Reservation> selectResListByDate(String reserDate) {
		return null;
		//return resRepository.selectResListByDate(reserDate);
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
	public List<Reservation> selectResRequeList(String shopIdx) {
		return resRepository.selectResRequeList(shopIdx);
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

	@Override
	public Shop selectShopByShopIdx(String shopIdx) {
		return resRepository.selectShopByShopIdx(shopIdx);
	}

	@Override
	public Map<Integer, Reservation> getResMap(String shopIdx, String reserDate) {
		//여기서 date를 DB형식에 맞게 들어갈 수 있게 만들어주고
		Map<Integer, Reservation> resMap = new HashMap<Integer, Reservation>();
		List<Reservation> resList = resRepository.selectResListByDate(shopIdx,reserDate);
		
		for(int i=0; i<resList.size(); i++) {
			resMap.put(i, resList.get(i));
		}
		
		return resMap;
	}

	
	
}
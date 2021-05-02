package com.kh.toy.reservation.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.member.model.vo.Member;
import com.kh.toy.notification.model.repository.NotificationRepository;
import com.kh.toy.reservation.model.repository.ReservationRepository;
import com.kh.toy.reservation.model.vo.Reservation;
import com.kh.toy.shop.model.vo.Shop;

@Service
public class ReservationServiceImpl implements ReservationService{
	
	private final ReservationRepository resRepository;
	private final NotificationRepository notificationRepository;
	
	public ReservationServiceImpl(ReservationRepository resRepository, NotificationRepository notificationRepository) {
		this.resRepository = resRepository;
		this.notificationRepository = notificationRepository;
	}

	//날짜별예약리스트 -- 이거 필요없는거 아님?
	@Override
	public List<Reservation> selectResListByDate(String reserDate) {
		return null;
		//return resRepository.selectResListByDate(reserDate);
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
	
	//예약 등록
	@Override
	public int insertRes(Reservation res) {
		int result = resRepository.insertRes(res);
		if(result==1) {
			//성공적으로 예약 정보 DB에 저장했으면 알림 정보도 넣어주어야함
			Shop shop = resRepository.selectShopByShopIdx(res.getShopIdx());
			notificationRepository.insertNotification(shop.getMemberId(),
													  shop.getShopName()+" 예약이 있습니다!", 
													  "/reservation/reque?shopIdx="+shop.getShopIdx());
		}
		return result;
	}
	
	//예약 취소
	@Override
	public int cancelRes(String reserIdx) {
		
		Reservation reservation = resRepository.selectReservationByReserIdx(reserIdx);
		Shop shop = resRepository.selectShopByShopIdx(reservation.getShopIdx());
		
		notificationRepository.insertNotification(reservation.getMemberId(),
													shop.getShopName()+" 예약 취소 되었습니다.",
													"/member/mypage");
		
		return resRepository.cancelRes(reserIdx);
	}
	
	

	//예약 요청 리스트
	@Override
	public List<Reservation> selectResRequeList(String shopIdx) {
		return resRepository.selectResRequeList(shopIdx);
	}

	//예약 승인
	@Override
	public int updateStateApprove(String reserIdx) {
		
		//예약 승인 알림 저장 (준비물 : 예약자 아이디, 예약 가게 이름)
		Reservation reservation = resRepository.selectReservationByReserIdx(reserIdx);
		Shop shop = resRepository.selectShopByShopIdx(reservation.getShopIdx());
		
		notificationRepository.insertNotification(reservation.getMemberId(),
				  					shop.getShopName()+" 예약이 완료 되었습니다!", 
				  					"/member/mypage");
		
		return resRepository.updateStateApprove(reserIdx);
	}

	//예약 거부
	@Override
	public int updateStateReject(String reserIdx) {
		
		//예약 거부 알림 저장 (준비물 : 예약자 아이디, 예약 가게 이름)
		Reservation reservation = resRepository.selectReservationByReserIdx(reserIdx);
		Shop shop = resRepository.selectShopByShopIdx(reservation.getShopIdx());
		
		notificationRepository.insertNotification(reservation.getMemberId(),
				  					shop.getShopName()+" 예약이 거부 되었습니다!", 
				  					"/member/mypage");
		
		return resRepository.updateStateReject(reserIdx);
	}

	@Override
	public Shop selectShopByShopIdx(String shopIdx) {
		return resRepository.selectShopByShopIdx(shopIdx);
	}

	

	
	
}
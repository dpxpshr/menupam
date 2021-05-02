package com.kh.toy.waiting.model.service;

import java.util.List;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.vo.Waiting;

public interface WaitingService {

	List<Waiting> selectWaitingList(String shopIdx); //대기 리스트
	int insertWaiting(Waiting waiting); //대기 등록
	Shop selectShopByShopIdx(String shopIdx);
	int waitCount(String shopIdx);	// 대기인원수
	Waiting getWaiting(String waitIdx);
	int updateArrived(String waitIdx); // 도착
	int updateCancel(String waitIdx); // 취소
	int updateWaitSmsTime(String waitIdx); // 문자
	void waitTenMinutes(String waitIdx);
}

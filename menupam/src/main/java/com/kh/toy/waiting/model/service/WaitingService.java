package com.kh.toy.waiting.model.service;

import java.util.Date;
import java.util.List;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.vo.Waiting;

public interface WaitingService {

	List<Waiting> selectWaitingListByDate(Date waitRegDate);
	int insertWaiting(Waiting waiting);
	boolean deleteWaiting(String waitIdx);
	int updateArrived(String waitIdx);
	int updateCancel(String waitIdx);
	Shop selectShopByShopIdx(String shopIdx);
		
}

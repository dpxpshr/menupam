package com.kh.toy.waiting.model.service;

import java.util.Date;
import java.util.List;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.vo.Waiting;

public interface WaitingService {

	List<Waiting> selectWaitingList(String shopIdx);
	int insertWaiting(Waiting waiting);
	int updateArrived(String waitIdx);
	int updateCancel(String waitIdx);
	Shop selectShopByShopIdx(String shopIdx);
	int waitCount(String shopIdx);	
}

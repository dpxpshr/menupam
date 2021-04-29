package com.kh.toy.waiting.model.service;

import java.util.Date;
import java.util.List;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import com.kh.toy.shop.model.vo.Shop;
import com.kh.toy.waiting.model.repository.WaitingRepository;
import com.kh.toy.waiting.model.vo.Waiting;

@Service
@EnableAsync
public class WaitingServiceImpl implements WaitingService {

	private final WaitingRepository waitingRepository;
	
	public WaitingServiceImpl(WaitingRepository waitingRepository) {
		this.waitingRepository = waitingRepository;
	}

	@Override
	public List<Waiting> selectWaitingList(String shopIdx) {
		return waitingRepository.selectWaitingList(shopIdx);
	}

	@Override
	public int insertWaiting(Waiting waiting) {
		return waitingRepository.insertWaiting(waiting);
	}

	@Override
	public int updateArrived(String waitIdx) {
		return waitingRepository.updateArrived(waitIdx);
	}

	@Override
	public int updateCancel(String waitIdx) {
		return waitingRepository.updateCancel(waitIdx);
	}

	@Override
	public Shop selectShopByShopIdx(String shopIdx) {
		return waitingRepository.selectShopByShopIdx(shopIdx);
	}

	@Override
	public int waitCount(String shopIdx) {
		return waitingRepository.waitCount(shopIdx);
	}

	@Override
	public Waiting getWaiting(String waitIdx) {
		return waitingRepository.selectWaitingByWaitIdx(waitIdx);
	}

	@Override
	public int updateWaitSmsTime(String waitIdx) {
		return waitingRepository.updateWaitSmsTime(waitIdx);
	}

	@Override
	@Async
	public void waitTenMinutes(String waitIdx) {
		try {
			//Thread.sleep(600000);
			Thread.sleep(10000); //10초
			Waiting waiting = waitingRepository.selectWaitingByWaitIdx(waitIdx);
			
			if((waiting.getWaitState().equals("대기중")) && (waiting.getWaitSmsTime() != null)) {
				//-> 10분도 지났고, 문자도 보냈도, 아직 오지도 않았다 
				waitingRepository.updateCancel(waitIdx);
				//문자도 보내주어야함
				System.out.println("문자보냈음");
				
				//저 브라우저를 찾아내서 리로드시켜주는건데
				
				//JS에서 알림을 보냈지 [JAVA -> 할수 있으면 좋을거 같고] 
				
				
			}else {
				System.out.println("문자 안보냄");
			}
			
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

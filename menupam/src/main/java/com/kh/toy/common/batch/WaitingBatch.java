package com.kh.toy.common.batch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class WaitingBatch {

	@Autowired
	BatchRepository batchRepository;
	
	@Scheduled(cron = "0 0 3 * * ?") //
	public void updateWaitList() {
		System.out.println("test");
	}
}

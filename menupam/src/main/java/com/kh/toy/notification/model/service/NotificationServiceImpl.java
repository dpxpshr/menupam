package com.kh.toy.notification.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.toy.notification.model.repository.NotificationRepository;
import com.kh.toy.notification.model.vo.Notification;

@Service 
public class NotificationServiceImpl implements NotificationService{

	
	private final NotificationRepository notificationRepository;
	
	public NotificationServiceImpl(NotificationRepository notificationRepository) {
		this.notificationRepository = notificationRepository;
	}

	@Override
	public Map<Integer, Notification> getNotifications(String memberId) {
		
		Map<Integer, Notification> notificationMap = new HashMap<Integer, Notification>();
		List<Notification> notificationList = notificationRepository.getNotifications(memberId);
		for (int i=1; i<=notificationList.size(); i++) {
			notificationMap.put(i, notificationList.get(i-1));
		}
		return notificationMap;
	}

	
}

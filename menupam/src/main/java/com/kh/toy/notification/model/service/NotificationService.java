package com.kh.toy.notification.model.service;

import java.util.Map;

import com.kh.toy.notification.model.vo.Notification;

public interface NotificationService {

	Map<Integer, Notification> getNotifications(String memberId);
}

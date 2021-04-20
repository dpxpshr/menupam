package com.kh.toy.notification.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.toy.notification.model.vo.Notification;

@Mapper
public interface NotificationRepository {
	
	@Select("SELECT * FROM TB_NOTIFICATION WHERE MEMBER_ID = #{memberId} AND NOTIFICATION_CHECK = '0'")
	List<Notification> getNotifications(String memberId);
}

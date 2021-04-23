package com.kh.toy.notification.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.toy.notification.model.vo.Notification;

@Mapper
public interface NotificationRepository {
	
	@Select("SELECT * FROM TB_NOTIFICATION WHERE MEMBER_ID = #{memberId} AND NOTIFICATION_CHECK = '0'"
			+ "ORDER BY NOTIFICATION_REG_DATE DESC")
	List<Notification> getNotifications(String memberId);
	
	
	@Update("UPDATE TB_NOTIFICATION SET NOTIFICATION_CHECK = '1' WHERE MEMBER_ID = #{memberId}")
	void updateNotification(String memberId);
	
	@Insert("INSERT INTO TB_NOTIFICATION (MEMBER_ID, NOTIFICATION_CONTENT, NOTIFICATION_LINK, NOTIFICATION_IDX) "
			+ "VALUES (#{memberId}, #{content}, #{link}, 'N'||SC_NOTIFICATION_IDX.NEXTVAL)")
	int insertNotification(@Param(value="memberId") String memberId,
							@Param(value="content") String content,
							@Param(value="link") String link);
	
}

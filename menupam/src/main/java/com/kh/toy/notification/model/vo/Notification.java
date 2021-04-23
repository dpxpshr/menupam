package com.kh.toy.notification.model.vo;

public class Notification {

	private String memberId;
	private String notificationContent;
	private String notificationLink;
	private String notificationCheck;
	private String notificationRegDate;
	private String notificationIdx;
	
	public Notification() {

	}

	public Notification(String memberId, String notificationContent, String notificationLink, String notificationCheck,
			String notificationRegDate, String notificationIdx) {

		this.memberId = memberId;
		this.notificationContent = notificationContent;
		this.notificationLink = notificationLink;
		this.notificationCheck = notificationCheck;
		this.notificationRegDate = notificationRegDate;
		this.notificationIdx = notificationIdx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNotificationContent() {
		return notificationContent;
	}

	public void setNotificationContent(String notificationContent) {
		this.notificationContent = notificationContent;
	}

	public String getNotificationLink() {
		return notificationLink;
	}

	public void setNotificationLink(String notificationLink) {
		this.notificationLink = notificationLink;
	}

	public String getNotificationCheck() {
		return notificationCheck;
	}

	public void setNotificationCheck(String notificationCheck) {
		this.notificationCheck = notificationCheck;
	}

	public String getNotificationRegDate() {
		return notificationRegDate;
	}

	public void setNotificationRegDate(String notificationRegDate) {
		this.notificationRegDate = notificationRegDate;
	}

	public String getNotificationIdx() {
		return notificationIdx;
	}

	public void setNotificationIdx(String notificationIdx) {
		this.notificationIdx = notificationIdx;
	}

	@Override
	public String toString() {
		return "Notification [memberId=" + memberId + ", notificationContent=" + notificationContent
				+ ", notificationLink=" + notificationLink + ", notificationCheck=" + notificationCheck
				+ ", notificationRegDate=" + notificationRegDate + ", notificationIdx=" + notificationIdx + "]";
	}

}

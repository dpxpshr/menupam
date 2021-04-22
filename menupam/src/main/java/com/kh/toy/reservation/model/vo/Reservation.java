package com.kh.toy.reservation.model.vo;

import java.sql.Date;

public class Reservation {
	
	private String reserIdx;
	private String shopIdx;
	private String reserName;
	private String reserDate;
	private Date reserRegDate;
	private String reserState;
	private String reserComment;
	private int reserParty;
	private String memberId;
	private String reserPhone;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(String reserIdx, String shopIdx, String reserName, String reserDate, Date reserRegDate,
			String reserState, String reserComment, int reserParty, String memberId, String reserPhone) {
		super();
		this.reserIdx = reserIdx;
		this.shopIdx = shopIdx;
		this.reserName = reserName;
		this.reserDate = reserDate;
		this.reserRegDate = reserRegDate;
		this.reserState = reserState;
		this.reserComment = reserComment;
		this.reserParty = reserParty;
		this.memberId = memberId;
		this.reserPhone = reserPhone;
	}

	public String getReserIdx() {
		return reserIdx;
	}

	public void setReserIdx(String reserIdx) {
		this.reserIdx = reserIdx;
	}

	public String getShopIdx() {
		return shopIdx;
	}

	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}

	public String getReserName() {
		return reserName;
	}

	public void setReserName(String reserName) {
		this.reserName = reserName;
	}

	public String getReserDate() {
		return reserDate;
	}

	public void setReserDate(String reserDate) {
		this.reserDate = reserDate;
	}

	public Date getReserRegDate() {
		return reserRegDate;
	}

	public void setReserRegDate(Date reserRegDate) {
		this.reserRegDate = reserRegDate;
	}

	public String getReserState() {
		return reserState;
	}

	public void setReserState(String reserState) {
		this.reserState = reserState;
	}

	public String getReserComment() {
		return reserComment;
	}

	public void setReserComment(String reserComment) {
		this.reserComment = reserComment;
	}

	public int getReserParty() {
		return reserParty;
	}

	public void setReserParty(int reserParty) {
		this.reserParty = reserParty;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getReserPhone() {
		return reserPhone;
	}

	public void setReserPhone(String reserPhone) {
		this.reserPhone = reserPhone;
	}

	@Override
	public String toString() {
		return "Reservation [reserIdx=" + reserIdx + ", shopIdx=" + shopIdx + ", reserName=" + reserName
				+ ", reserDate=" + reserDate + ", reserRegDate=" + reserRegDate + ", reserState=" + reserState
				+ ", reserComment=" + reserComment + ", reserParty=" + reserParty + ", memberId=" + memberId
				+ ", reserPhone=" + reserPhone + "]";
	}

}

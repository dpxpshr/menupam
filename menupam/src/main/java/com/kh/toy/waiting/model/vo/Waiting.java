package com.kh.toy.waiting.model.vo;

import java.sql.Date;

public class Waiting {
	
	private String waitIdx;
	private String shopIdx;
	private String waitPhone;
	private int waitParty;
	private String waitState;
	private Date waitSmsTime;
	private Date waitRegDate;
	
	public Waiting() {
		// TODO Auto-generated constructor stub
	}

	public Waiting(String waitIdx, String shopIdx, String waitPhone, int waitParty, String waitState, Date waitSmsTime,
			Date waitRegDate) {

		this.waitIdx = waitIdx;
		this.shopIdx = shopIdx;
		this.waitPhone = waitPhone;
		this.waitParty = waitParty;
		this.waitState = waitState;
		this.waitSmsTime = waitSmsTime;
		this.waitRegDate = waitRegDate;
		
	}

	public String getWaitIdx() {
		return waitIdx;
	}

	public void setWaitIdx(String waitIdx) {
		this.waitIdx = waitIdx;
	}

	public String getShopIdx() {
		return shopIdx;
	}

	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}

	public String getWaitPhone() {
		return waitPhone;
	}

	public void setWaitPhone(String waitPhone) {
		this.waitPhone = waitPhone;
	}

	public int getWaitParty() {
		return waitParty;
	}

	public void setWaitParty(int waitParty) {
		this.waitParty = waitParty;
	}

	public String getWaitState() {
		return waitState;
	}

	public void setWaitState(String waitState) {
		this.waitState = waitState;
	}

	public Date getWaitSmsTime() {
		return waitSmsTime;
	}

	public void setWaitSmsTime(Date waitSmsTime) {
		this.waitSmsTime = waitSmsTime;
	}

	public Date getWaitRegDate() {
		return waitRegDate;
	}

	public void setWaitRegDate(Date waitRegDate) {
		this.waitRegDate = waitRegDate;
	}

	@Override
	public String toString() {
		return "Waiting [waitIdx=" + waitIdx + ", shopIdx=" + shopIdx + ", waitPhone=" + waitPhone + ", waitParty="
				+ waitParty + ", waitState=" + waitState + ", waitSmsTime=" + waitSmsTime + ", waitRegDate="
				+ waitRegDate + "]";
	}
	
	
}

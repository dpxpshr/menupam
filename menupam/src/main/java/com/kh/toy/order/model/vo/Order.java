package com.kh.toy.order.model.vo;

import java.sql.Date;

public class Order {
	private String orderIdx;
	private String orderPrice;
	private Date orderDate;
	private String orderPackState;
	private String orderPayState;
	private String memberId;
	private String shopIdx;
	private String orderTableNum;
	public String getOrderIdx() {
		return orderIdx;
	}
	public void setOrderIdx(String orderIdx) {
		this.orderIdx = orderIdx;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderPackState() {
		return orderPackState;
	}
	public void setOrderPackState(String orderPackState) {
		this.orderPackState = orderPackState;
	}
	public String getOrderPayState() {
		return orderPayState;
	}
	public void setOrderPayState(String orderPayState) {
		this.orderPayState = orderPayState;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getShopIdx() {
		return shopIdx;
	}
	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}
	public String getOrderTableNum() {
		return orderTableNum;
	}
	public void setOrderTableNum(String orderTableNum) {
		this.orderTableNum = orderTableNum;
	}
	
	@Override
	public String toString() {
		return "Order [orderIdx=" + orderIdx + ", orderPrice=" + orderPrice + ", orderDate=" + orderDate
				+ ", orderPackState=" + orderPackState + ", orderPayState=" + orderPayState + ", memberId=" + memberId
				+ ", shopIdx=" + shopIdx + ", orderTableNum=" + orderTableNum + "]";
	}
	
	
	
}

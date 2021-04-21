package com.kh.toy.shop.model.vo;

public class MenuOrdering {
	
	private String moIdx;
	private String orderMenuCnt;
	private String orderIdx;
	private String menuIdx;
	private String orderMenuName;
	private String orderMenuPrice;
	
	
	public String getMoIdx() {
		return moIdx;
	}
	public void setMoIdx(String moIdx) {
		this.moIdx = moIdx;
	}
	
	public String getOrderMenuCnt() {
		return orderMenuCnt;
	}
	
	public void setOrderMenuCnt(String orderMenuCnt) {
		this.orderMenuCnt = orderMenuCnt;
	}
	
	public String getOrderIdx() {
		return orderIdx;
	}
	
	public void setOrderIdx(String orderIdx) {
		this.orderIdx = orderIdx;
	}
	
	public String getMenuIdx() {
		return menuIdx;
	}
	
	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}
	
	public String getOrderMenuName() {
		return orderMenuName;
	}
	
	public void setOrderMenuName(String orderMenuName) {
		this.orderMenuName = orderMenuName;
	}
	
	public String getOrderMenuPrice() {
		return orderMenuPrice;
	}
	public void setOrderMenuPrice(String orderMenuPrice) {
		this.orderMenuPrice = orderMenuPrice;
	}
	
	@Override
	public String toString() {
		return "MenuOrdering [moIdx=" + moIdx + ", orderMenuCnt=" + orderMenuCnt + ", orderIdx=" + orderIdx
				+ ", menuIdx=" + menuIdx + ", orderMenuName=" + orderMenuName + ", orderMenuPrice=" + orderMenuPrice
				+ "]";
	}
	
	
}

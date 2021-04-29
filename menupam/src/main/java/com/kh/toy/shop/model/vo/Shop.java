package com.kh.toy.shop.model.vo;

import java.sql.Date;

public class Shop {
	
	private String shopIdx; //매장 아이디
	private String shopName; //매장 이름
	private String shopAddress; //매장 주소
	private String shopType; //매장 분류
	private String shopBln; //사업자 등록 번호
	private String shopPackAble; //포장가능 여부
	private int shopRating; //매장 평점
	private int shopTableCount; // 테이블 개수
	private Date shopRegDate; //매장 등록일
	private Date shopLeaveDate; //매장 해지일
	private String shopTell; //매장 전화번호
	private String memberId; //회원 아이디
	private String shopLongitudeX; // 위도
	private String shopLatitudeY; // 경도
	private String fileIdx; //파일 인덱스
	

	public String getShopIdx() {
		return shopIdx;
	}

	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopAddress() {
		return shopAddress;
	}

	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public String getShopBln() {
		return shopBln;
	}

	public void setShopBln(String shopBln) {
		this.shopBln = shopBln;
	}

	public String getShopPackAble() {
		return shopPackAble;
	}

	public void setShopPackAble(String shopPackAble) {
		this.shopPackAble = shopPackAble;
	}

	public int getShopRating() {
		return shopRating;
	}

	public void setShopRating(int shopRating) {
		this.shopRating = shopRating;
	}

	public int getShopTableCount() {
		return shopTableCount;
	}

	public void setShopTableCount(int shopTableCount) {
		this.shopTableCount = shopTableCount;
	}

	public Date getShopRegDate() {
		return shopRegDate;
	}

	public void setShopRegDate(Date shopRegDate) {
		this.shopRegDate = shopRegDate;
	}

	public Date getShopLeaveDate() {
		return shopLeaveDate;
	}

	public void setShopLeaveDate(Date shopLeaveDate) {
		this.shopLeaveDate = shopLeaveDate;
	}

	public String getShopTell() {
		return shopTell;
	}

	public void setShopTell(String shopTell) {
		this.shopTell = shopTell;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getShopLongitudeX() {
		return shopLongitudeX;
	}

	public void setShopLongitudeX(String shopLongitudeX) {
		this.shopLongitudeX = shopLongitudeX;
	}

	public String getShopLatitudeY() {
		return shopLatitudeY;
	}

	public void setShopLatitudeY(String shopLatitudeY) {
		this.shopLatitudeY = shopLatitudeY;
	}
	
	public String getFileIdx() {
		return fileIdx;
	}

	public void setFileIdx(String fileIdx) {
		this.fileIdx = fileIdx;
	}

	@Override
	public String toString() {
		return "Shop [shopIdx=" + shopIdx + ", shopName=" + shopName + ", shopAddress=" + shopAddress + ", shopType="
				+ shopType + ", shopBln=" + shopBln + ", shopPackAble=" + shopPackAble + ", shopRating=" + shopRating
				+ ", shopTableCount=" + shopTableCount + ", shopRegDate=" + shopRegDate + ", shopLeaveDate="
				+ shopLeaveDate + ", shopTell=" + shopTell + ", memberId=" + memberId + ", shopLongitudeX="
				+ shopLongitudeX + ", shopLatitudeY=" + shopLatitudeY + ", fileIdx=" + fileIdx + "]";
	}



	
	
}

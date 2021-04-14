package com.kh.toy.shop.model.vo;

public class Menu {
	
	private String menuIdx; //메뉴 아이디
	private String menuName; //메뉴 이름
	private String menuPhoto; //메뉴 사진
	private String menuPrice; //메뉴 가격
	private String menuVegan; //비건 식사 가능 여부
	private String shopIdx; //매장 아이디
	private String menuCategoryName; //메뉴 카테고리 이름
	
	public String getMenuIdx() {
		return menuIdx;
	}
	public void setMenuIdx(String menuIdx) {
		this.menuIdx = menuIdx;
	}
	
	public String getMenuName() {
		return menuName;
	}
	
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getMenuPhoto() {
		return menuPhoto;
	}
	
	public void setMenuPhoto(String menuPhoto) {
		this.menuPhoto = menuPhoto;
	}
	
	public String getMenuPrice() {
		return menuPrice;
	}
	
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	
	public String getMenuVegan() {
		return menuVegan;
	}
	
	public void setMenuVegan(String menuVegan) {
		this.menuVegan = menuVegan;
	}
	
	public String getShopIdx() {
		return shopIdx;
	}
	
	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}
	
	public String getMenuCategoryName() {
		return menuCategoryName;
	}
	
	public void setMenuCategoryName(String menuCategoryName) {
		this.menuCategoryName = menuCategoryName;
	}
	
	@Override
	public String toString() {
		return "Menu [menuIdx=" + menuIdx + ", menuName=" + menuName + ", menuPhoto=" + menuPhoto + ", menuPrice="
				+ menuPrice + ", menuVegan=" + menuVegan + ", shopIdx=" + shopIdx + ", menuCategoryName="
				+ menuCategoryName + "]";
	}
	

	
	
}

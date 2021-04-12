package com.kh.toy.shop.model.vo;

public class MenuCategory {

	private String menuCategoryIdx;
	private String menuCategoryName;
	private String shopIdx;
	
	public String getMenuCategoryIdx() {
		return menuCategoryIdx;
	}
	
	public void setMenuCategoryIdx(String menuCategoryIdx) {
		this.menuCategoryIdx = menuCategoryIdx;
	}
	
	public String getMenuCategoryName() {
		return menuCategoryName;
	}
	
	public void setMenuCategoryName(String menuCategoryName) {
		this.menuCategoryName = menuCategoryName;
	}
	
	public String getShopIdx() {
		return shopIdx;
	}
	
	public void setShopIdx(String shopIdx) {
		this.shopIdx = shopIdx;
	}

	@Override
	public String toString() {
		return "MenuCategory [menuCategoryIdx=" + menuCategoryIdx + ", menuCategoryName=" + menuCategoryName
				+ ", shopIdx=" + shopIdx + "]";
	}
	
	
}

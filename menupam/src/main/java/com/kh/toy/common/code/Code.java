package com.kh.toy.common.code;

public enum Code {
	
	//DOMAIN("http://www.pclass.com"),
	DOMAIN("http://localhost:9090"),
	SUNGUKIPDOMAIN("http://61.74.127.111:9090"),
	EMAIL("tlfpehd@naver.com"),
	UPLOAD("C:\\CODE\\afternoon\\G_SPRING\\resources\\upload\\"),
	PROJECTUPLOAD("resources/images/reviewImage/");
	
	public String desc;
	
	Code(String desc){
		this.desc = desc;
	}
	
	public String toString() {
		return desc;
	}
}

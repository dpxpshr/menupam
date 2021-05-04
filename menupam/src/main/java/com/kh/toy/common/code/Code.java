package com.kh.toy.common.code;

public enum Code {
	
	//DOMAIN("http://www.pclass.com"),
	DOMAIN("http://localhost:9090"),
	SUNGUKIPDOMAIN("http://61.74.126.211:9090"),
	EMAIL("tlfpehd2@naver.com"),
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

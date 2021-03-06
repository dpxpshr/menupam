package com.kh.toy.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.toy.common.code.ErrorCode;
import com.kh.toy.common.exception.ToAlertException;

public class AuthInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String[] uriArr = request.getRequestURI().split("/");
		
		if(uriArr.length > 0) {
			switch (uriArr[1]) {
			case "member":
				switch (uriArr[2]) {
				case "mypage": if(session.getAttribute("userInfo") == null)
								throw new ToAlertException(ErrorCode.AUTH01);
					  break;
				case "joinimpl": if(session.getAttribute("persistInfo") == null) 
								throw new ToAlertException(ErrorCode.AUTH02);
					  break;
				}
				break;
			
			case "reservation":
				switch (uriArr[2]) {
				case "reque" : if(session.getAttribute("userInfo") == null)
								throw new ToAlertException(ErrorCode.AUTH01);
				  	break;
				case "list" : if(session.getAttribute("userInfo") == null)
								throw new ToAlertException(ErrorCode.AUTH01);
					break;
				}
				break;
			case "waiting":
				switch (uriArr[2]) {
				case "list" : if(session.getAttribute("userInfo") == null)
								throw new ToAlertException(ErrorCode.AUTH01);
				  	break;
				}
				break;
			case "order" :
				switch(uriArr[2]) {
				case "payment" : if(session.getAttribute("userInfo") == null)
					throw new ToAlertException(ErrorCode.ORDER_TO_LOGIN);
				break;
				case "pay" : if(session.getAttribute("userInfo") == null)
					throw new ToAlertException(ErrorCode.AUTH01);
				break;
				case "myorders" : if(session.getAttribute("userInfo") == null)
					throw new ToAlertException(ErrorCode.MYORDER_TO_LOGIN);
				break;
				case "approve" : if(session.getAttribute("userInfo") == null)
					throw new ToAlertException(ErrorCode.AUTH01);
				break;
				case "discard" : if(session.getAttribute("userInfo") == null)
					throw new ToAlertException(ErrorCode.AUTH01);
				break;
				}
				break;
			}
		}
		return true;
	}
}
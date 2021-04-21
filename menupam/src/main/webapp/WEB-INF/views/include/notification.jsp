<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
    <div class="wrapper">
        <div class="header">
        	<c:if test="${sessionScope.userInfo != null}">
	        	<div class=bell>
	                <i class="far fa-bell" style="color: #CDC7D5;" ></i>
	                <div class="notificationCnt"></div>
	            </div>
        	</c:if>            
        </div>
        <!--알림이 있는것 1. 예약, 주문,  -->
        <div class="notifications">
        	<div class="nHeader">
                <p class="fontXSmall">알림 확인</p>
                <a class="fontXXSmall" href="">전체 읽음</a>
            </div>
<!-- 	    <div class="notification">
                <div class="notificationMsg">
                    <a href="" class="fontXSmall">예약 신청이 들어왔습니다!</a>
                </div>
                <div class="notificationTime">
                    <p class="fontXXSmall">21.04.13</p>
                </div>
            </div> -->
        </div>
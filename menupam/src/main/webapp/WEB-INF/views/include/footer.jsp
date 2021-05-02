<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="footer">
    <div onclick="location.href='/order/shoplist'"><i class="fas fa-search"></i></div>
    <div onclick="location.href='/index'"><i class="fas fa-qrcode"></i></div>
    <div onclick="location.href='/index'"><i class="fas fa-home"></i></div>
    <div onclick="location.href='/index'"><i class="far fa-clipboard"></i></div>
    <c:choose>
   		<c:when test="${sessionScope.userInfo != null}">
			<div onclick="location.href='/member/mypage'"><i class="far fa-user"></i></div>
   		</c:when>
   		<c:otherwise>
    		<div onclick="location.href='/member/login'"><i class="far fa-user"></i></div>
   		</c:otherwise>
   	</c:choose> 
   	
   	
</div>
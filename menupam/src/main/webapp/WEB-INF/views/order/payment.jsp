<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/payment.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="search">
                <i class="fas fa-search"></i>
            </div>
            <div class="notice">
                <i class="far fa-clipboard"></i>
            </div>
        </header>
        <section class="main">
        	<!-- 작성라인 -->
            <div class="paymentTop">주문 정보</div>
            <div class="paymentInfo">
            	<p>김치볶음밥 외 3개</p>
            	<p>핸드폰 번호</p>
            	<input type="text" placeholder="01011112222">
            	
            	<p>주문 요청 사항</p>
            	<input type="text" placeholder="ex) 조금 매콤하게 부탁드립니다^_^">
            	
            	<p>주문 유형</p>
            	<input type="text" placeholder="테이블 번호(QR코드 스켄시 자동 입력)">
            	
            	<div id="checkBox"><input  type="checkbox"> 포장 주문</div>
            	
            	<div class="pointPayment">
            		<p>포인트 사용</p>
            		<a>300 포인트 사용 가능</a>
            	</div>
            	<input type="text" placeholder="300">
            	
            	<p>결제 정보</p>
            	<div  id="paymentBox" ><input type="radio"> 매장 직접 결제</div>
            	<a id="paymentBox" ><img src="resources/images/카카오페이.png"> 카카오 페이 결제</a>
            	<div class="paymentList">
            		<div class="money">
            			<p>주문 금액</p>
            			<div>12,000원</div>
            		</div>
            		<div class="pointMoney">
            			<p>사용 포인트</p>
            			<div>300원</div>
            		</div>
            		<div class="sum">
            			<p>총 결제 금액</p>
            			<div>11,700원</div>
            		</div>
            	</div>
            </div>
            
        </section>
        <button class="payments">결제하기</button>
        <footer class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div> 
</body>
</html>
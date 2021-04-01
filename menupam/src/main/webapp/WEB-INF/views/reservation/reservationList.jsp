<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reservation.css'>
    <script src='main.js'></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>

</head>
<body>
    <div class="wrapper">
        <div class="header">
            <div class="search">
                <i class="fas fa-search"></i>
            </div>
            <div class="notice">
                <i class="far fa-clipboard"></i>
            </div>
        </div>
        <div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="body">
                <div class="content">
                    <p class="fontMedium" id="title">예약 리스트</p><br>
                    <div class="line"></div>
                    
                    <div>
	                    <div class="wrap_shop">
							<i class="fas fa-store store"></i>
	                    	<div class="shop">
								<span id="shop_info">abcdef123</span><br> <!--매장 인덱스 -->
								<span id="shop_info">나이스 닭다리</span> <!-- 매장 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    
	                    <div class="date_box">
	                    	<div class="year">
	                    		<i class="fas fa-chevron-left"></i>
	                    		<p> 2021.04 </p>
	                    		<i class="fas fa-chevron-right"></i>
	                    	</div>
	                    	<div class="date">
	                    		<i class="fas fa-chevron-left"></i>
	                    		<p> 30 | 화 </p>
	                    		<i class="fas fa-chevron-right"></i>
	                    	</div>
	                    </div>
	                    
	                    <div class="search_box">
	                    	<div class="wrap_input">
	                    		<span class="fas fa-ghost"></span>
	                    		<input type="text" id="search_input" value="" placeholder="예약자 이름">
	                    	</div>
	                    		<input type="button" id="search_btn" value="검색" onclick='searchReserve()'>
	                    </div>
	                    
	                    <div class="wrap_box">
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
	                    	</div>
	                    	
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
	                    	</div>
	                    	
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
	                    	</div>
	                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
    </div> 

</body>
</html>
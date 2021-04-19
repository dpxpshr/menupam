<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationList.css'>
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
								<span id="shop_info">매장 인덱스</span><br> <!-- {sessionScope.shop.shopIdx}-->
								<span id="shop_info">매장 이름</span> <!-- sessionScope.shop.shopName} -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    
	                    <div class="date_box">
	                    	
	                    	<div class="date">
	                    		<input type="date" name="reserDate">
	                    	</div>
	                    </div>
	                    
	                    <div class="search_box">
	                    	<div class="wrap_input">
	                    		<span class="fas fa-ghost"></span>
	                    		<input type="text" id="search_input" value="${reservation.reserName}" placeholder="예약자 이름">
	                    	</div>
	                    		<button id="search_btn">검색</button>
	                    </div>
	                    
	                    <c:if test="${empty requestScope.resList}">
				            <p class="fontSmall"> 예약이 없습니다.</p> 
				        </c:if>   
	                    
	                    <div class="wrap_box">
	                    	<c:forEach var="reservation" items="${resList}" varStatus="status">
	                    	<form name="form" method="POST">
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">${reservation.reserName} ${reservation.reserParty}인 날짜</span>
	                    		<button class="btn" id="cancel_reserv">예약 취소</button>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>
	                    	</div>
	                    	</form>
	                    	</c:forEach>
	                    	
	                    
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
    
  <script type="text/javascript">
    $(document).ready(function(){
    	$("#search_btn").click(function(){
    		document.requeForm.action = "${context}/reservation/searchByName";
    	});
    	
    	$("#cancel_reserv").click(function(){
    		document.requeForm.action = "${context}/reservation/cancelRes";
    	});
    	
    	
    	
    });
    
    
    </script>
    
    

</body>
</html>
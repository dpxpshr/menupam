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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopModify.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationReque.css'>
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
                    <p class="fontMedium" id="title">예약 승인 요청</p><br>
                    <div class="line"></div>
                    
                    <div>
	                    <div class="wrap_shop">
							<i class="fas fa-store store"></i>
	                    	<div class="shop">
								<span id="shop_info">${sessionScope.shop.shopIdx}</span><br> <!--매장 인덱스 -->
								<span id="shop_info">${sessionScope.shop.shopName}</span> <!-- 매장 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    
	                    <div class="time"> <!-- 시간 어떻게 띄우지? -->
	                    	<p class="fontXSmall">현재시간 : 2021.04.11 16:25 </p>
	                    </div>
	                    <br>
	                    <c:if test="${empty requestScope.resRequeList}">
				            <p class="fontSmall"> 요청된 예약이 없습니다.</p> 
				        </c:if>  
	                    
	                    
	                   <div class="wrap_box">
	                   <c:forEach var="reservation" items="${resRequeList}" varStatus="status">
	                    	<form name="requeForm" method="POST" >
		                    	<div class="reserv_box">
		                    		<div class="box">
		                    		<span class="reserv_info">${reservation.reserDate} ${reservation.reserParty}인</span>
		                    		<button class="btn" id="reserv_ok">예약 승인</button>
		                    		</div>
		                    		<div class="box">
		                    		<span class="reserv_info">${reservation.reserName} ${requestScope.memberPhone}</span>
		                    		<button class="btn" id="reserv_not">예약 거부</button>
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
    	$("#reserv_ok").click(function(){
    		document.requeForm.action = "${context}/reservation/approveRes";
    	});
    	
    	$("#reserv_not").click(function(){
    		document.requeForm.action = "${context}/reservation/rejectRes";
    	});
    	
    });
    
    
    </script>
</body>
</html>
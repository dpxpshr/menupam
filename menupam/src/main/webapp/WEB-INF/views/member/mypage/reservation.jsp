<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
    
   
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopModify.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservation.css'>
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
                    <p class="fontMedium" id="title">마이페이지</p><br>
                    <div class="line"></div>
                    <br>
                    <div class="buttonBox">
                        <div class="manageBtn">
                        <a href="${context}/member/mypage">
                            <div class="manageBtnIcon"><i class="fas fa-id-card"></i></div>
                            <div class="manageBtnText">계정 정보</a></div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-hand-holding-usd"></i></div>
                            <div class="manageBtnText">이용 내역</div>
                        </div>
                        <div class="manageBtn border">
                        	<a href="${context}/member/mypage/reservation">
                            <div class="manageBtnIcon"><i class="far fa-calendar-check"></i></div>
                            <div class="manageBtnText">예약 현황</a></div>
                        </div>
                        <div class="manageBtn">
                       		 <a href="${context}/member/mypage/waiting">
                            <div class="manageBtnIcon"><i class="fas fa-user-friends"></i></div>
                            <div class="manageBtnText">대기 현황</a></div>
                        </div>
                        <div class="manageBtn"></div>
                        <div class="manageBtn"></div>
                    </div>
                    <br>
                    <!-- SHOP_ID  : (매장 ID)
						RESER_IDX( INDEX )  : 예약 순번(해당 매장에서)
						USER_ID : 유저 ID
						RESER_DATE  : 예약 일시 (방문할 시각)
						RESER_REG_DATE  : 예약 요청한 일자
						RESER_STATE  : 매장 확인 여부/결과 (승인대기/승인됨/완료)
						RESER_COMMENT  : 예약시 요청사항
						RESER_PARTY : 예약인원수 -->
                    
                    <div>
	                    <div class="wrap_user">
							<i class="fas fa-user-circle"></i>
	                    	<div class="user">
								<span id="user_info">${sessionScope.userInfo.memberId}</span><br> <!-- 아이디 -->
								<span id="user_info">${sessionScope.userInfo.memberName}님</span> <!-- 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                      <c:if test="${not empty shopst}">
	                    <div class="wrap_info">
	                    	<div class="info">
		                    	<div class="icon"><i class="fas fa-store"></i></div>
		                    	<span id="reserv_info">가게 이름 : ${shopst.SHOP_NAME}</span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-phone-volume"></i></div>
		                    	<span id="reserv_info">매장 전화번호 : ${shopst.SHOP_TELL}</span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-list-ol"></i></div>
		                    	<span id="reserv_info">예약 번호 :${shopst.RESER_IDX}  </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="far fa-clock"></i></div>
		                    	<span id="reserv_info">예약 일시 : ${shopst.RESER_DATE} </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-users"></i></div>
		                    	<span id="reserv_info">예약 인원 수 : ${shopst.RESER_PARTY} </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-comment-dots"></i></div>
		                    	<span id="reserv_info">예약시 요청 사항 :${shopst.RESER_COMMENT} </span>
		                    </div>
		                   <div class="info">
		                    	<div class="icon"><i class="fas fa-clipboard-check"></i></div>
		                    	<span id="reserv_info">예약 상태 :${shopst.RESER_STATE} </span>
		                    </div>
		                   
	                    </div>
	                    </c:if>
	                     <c:if test="${empty shopst}">
		                    	<h2>예약중인 주문이 없습니다.</h2>
		                    </c:if>
                    
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
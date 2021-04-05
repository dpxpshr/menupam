<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/waiting.css'>
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
                        <a href="${context}/member/mypage/mypage">
                            <div class="manageBtnIcon"><i class="fas fa-id-card"></i></div>
                            <div class="manageBtnText">계정 정보</a></div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-hand-holding-usd"></i></div>
                            <div class="manageBtnText">이용 내역</div>
                        </div>
                        <div class="manageBtn">
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
                    <!--           WAIT_ID : 대기열 아이디 (매장번호+W+시퀀스)
SHOP_ID : 매장 아이디
WAIT_PHONE : 대기자 휴대폰 번호
WAIT_NO : 대기 번호 (1,2,3 이런식으로...)
WAIT_PARTY : 일행수
WAIT_STATE : 결과?(식사하고갔는지, 취소했는지, 아직 대기중인지)
WAIT_TIME : 예상 대기 시간
WAIT_REG_DATE : 대기열 등록 일자(시간?) -->
                    
                    <div>
	                    <div class="wrap_user">
							<i class="fas fa-user-circle"></i>
	                    	<div class="user">
								<span id="user_info">${sessionScope.userInfo.memberId}</span><br> <!-- 아이디 -->
								<span id="user_info">${sessionScope.userInfo.memberName}님</span> <!-- 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    <div class="wrap_info">
	                    	<div class="info">
		                    	<div class="icon"><i class="fas fa-store"></i></div>
		                    	<span id="waiting_info">가게 이름 : </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-phone-volume"></i></div>
		                    	<span id="waiting_info">매장 전화번호 : </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-users"></i></div>
		                    	<span id="waiting_info">일행 수 : </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-list-ol"></i></div>
		                    	<span id="waiting_info">대기 번호 : </span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-hourglass-half"></i></div>
		                    	<span id="waiting_info">예상 대기 시간 : </span>
		                    </div>
		                    <div class="info btn_cancel">
		                    	<input type="button" id="cancel_waiting" value="대기 취소" onclick='cancel_waiting()'>
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
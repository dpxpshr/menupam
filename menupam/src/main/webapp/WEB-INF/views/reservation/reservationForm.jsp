<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
	<meta charset='utf-8'>
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<title>메뉴팜</title>
	<meta name='viewport' content='width=device-width, initial-scale=1'>
	<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
	<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationForm.css'>
	<script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
		<div class="main">
			<!--여기서 부터 코드 작성 "-->
			<div class="body">
				<div class="content">
                    <p class="fontSmall">${shop.shopName} 예약</p><br>
                    <div class="line"></div><br>
                    <form action="">
                        <div>방문일자</div><br><br>
                        <input type="datetime-local" class="inputLarge" id="calendar" step="1800" name="reserDate"><br><br><br>
                        <div>예약자 성함</div><br><br>
                        <input type="text" class="inputLarge" name="reserName" id="name" placeholder="성함을 입력하세요" value="${sessionScope.userInfo.memberName}"><br><br><br>
                        <div>예약자 전화 번호</div><br><br>
                        <input type="tel" class="inputLarge" name="reserPhone" id="phone" placeholder="휴대폰 번호를 입력하세요 ( - 없이)" value="${sessionScope.userInfo.memberPhone}"><br><br><br>
                        <div>예약 인원</div><br><br>
                        <select id="search_sel" name="reserParty" class="inputLarge">
                            <option value="1">1인 방문</option>
                            <option value="2">2인 방문</option>
                            <option value="3">3인 방문</option>
                            <option value="4">4인 방문</option>
                            <option value="5">5인 방문</option>
                            <option value="6">6인 방문</option>
                            <option value="7">7인 방문</option>
                            <option value="8">8인 방문</option>
                        </select><br><br><br>
                        <div>요청 사항</div><br><br>
                        <input type="text" class="inputLarge" id="comment" name="reserComment" placeholder="ex) 창가쪽 자리로 주세요"><br><br><br>
                        <input type="text" name="shopIdx" value="${shop.shopIdx}" style="display:none">
                        <label for="" style="margin-left: 10px;">
                            <input type="checkbox" required>
                            개인 정보 수집 및 이용에 동의 합니다.
                        </label><br><br>
                        <p class="fontXXSmall"> * 해당 점포로 부터 승인 문자 수신 시 예약이 완료됩니다.</p><br><br>
                        <button class="btnLarge" id="reserBtn" name="${shop.shopIdx}" style="margin-left: 10px;">
                            예약하기
                        </button>
                    </form>
                </div>
			</div> <!-- body -->
		</div> 
		<%@ include file="/WEB-INF/views/include/footer.jsp" %>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
</html>
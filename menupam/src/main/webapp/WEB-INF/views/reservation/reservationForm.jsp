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
				<div class=reservation_info>
					<%-- <form:form modelAttribute="reservation" action="${context}/reservation/reserve" method="POST" id="reserForm"><br> --%>
						<div class="fontBox">
							<p class="fontMedium" id="title">예약</p>
						</div><br>
						<div class="line">

						</div>
						<div class="content">
							<div class="wrap_shop">
								<i class="fas fa-store store"></i>
								<div class="shop">
									<span id="shop_info">${shop.shopName}</span>
									<!-- 매장 이름 -->
								</div>
							</div>
							<br>
							<div class="line">

							</div><br>
							<p class="fontMedium">방문 일자</p><br> 
							<input type="datetime-local" class="inputLarge" id="calendar" step="1800" name="reserDate"><br><br>
							<div class="imgBox">
								<div class="imgsmall">
									<input type="text" class="inputLarge" name="reserName" id="name" placeholder="성함을 입력해주세요" value="${sessionScope.userInfo.memberName}"><br><br>
									<input type="text" class="inputLarge" name="reserPhone" id="phone" value="${sessionScope.userInfo.memberPhone}" placeholder="전화번호를 입력해주세요">
								</div><br>
								<div id="search_bar">
									<p class="fontLarge" class="inputLarge">예약 인원 
										<select id="search_sel" name="reserParty">
											<option value="1">1인 방문 ▼</option>
											<option value="2">2인 방문</option>
											<option value="3">3인 방문</option>
											<option value="4">4인 방문</option>
											<option value="5">5인 방문</option>
											<option value="6">6인 방문</option>
											<option value="7">7인 방문</option>
											<option value="8">8인 방문</option>
										</select>
									</p>
								</div>
							</div><br>
							<div class="phone_num">
								<p class="fontLarge">요청사항</p><br>
								<input type="text" class="inputLarge" id="comment" name="reserComment" placeholder="요청사항을 입력해주세요">
							</div>
							<input type="text" name="shopIdx" value="${shop.shopIdx}" style="display:none">
							<div class="btnBox"><br>
								<button class="btnLarge" id="reserBtn" name="${shop.shopIdx}">예약하기</button><br>
							</div>
						</div>
					<%-- </form:form> --%>
				</div>
			</div> <!-- body -->
		</div> 
		<div class="footer">
			<div>
				<i class="fas fa-search"></i>
			</div>
			<div>
				<i class="fas fa-qrcode"></i>
			</div>
			<div>
				<i class="fas fa-home"></i>
			</div>
			<div>
				<i class="far fa-clipboard"></i></i>
			</div>
			<div>
				<i class="far fa-user"></i>
			</div>
		</div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
</html>
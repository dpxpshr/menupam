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
<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopModify.css'>
<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationReque.css'>
<script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
		<div class="main">
			<!--여기서 부터 코드 작성-->
			<div class="body">
				<div class="content_wrapper">
					<p class="fontMedium" id="title">예약 승인 요청</p><br>
					<div class="line"></div>
					<div class="content">
						<div class="wrap_shop">
							<i class="fas fa-store store"></i>
							<div class="shop">
								<span id="shop_info">${shop.shopName}</span>
							</div>
						</div>
						<hr color="#F2BB13">
						<div>
							<div id="divClock"></div>
						</div><br>
						<c:if test="${empty requestScope.resRequeList}">
							<p class="fontSmall">요청된 예약이 없습니다.</p>
						</c:if>
						<div class="wrap_box">
							<c:forEach var="reservation" items="${resRequeList}">
								<div class="reserv_box" value="${reservation.reserIdx}" id="${reservation.reserIdx}">
									<div class="box">
										<span class="reserv_info">${reservation.reserDate} ${reservation.reserParty}인</span>
										<button class="btn" id="reserv_ok" name="${reservation.reserIdx}"
										 	data-id="${reservation.memberId}" data-phone="${reservation.reserPhone}"
										 	data-date="${reservation.reserDate}">
											예약 승인
										</button>
									</div>
									<div class="box">
										<span class="reserv_info">
											${reservation.reserName} ${reservation.reserPhone}
										</span>
										<button class="btn" id="reserv_not" name="${reservation.reserIdx}" 
											data-id="${reservation.memberId}" data-phone="${reservation.reserPhone}">
											예약 거부
										</button>
									</div>
									<p class="fontXSmall">
										요청사항 : ${reservation.reserComment}
									</p>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
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
		<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
		<script type="text/javascript">
			function showClock(){
			   var date = new Date();
			   var divClock = document.getElementById("divClock");
			   if(date.getHours() > 12){
			      var msg = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate() + " 오후 " + (date.getHours()-12)+"시";
			   }
			   else{
			      var msg = "현재 시간 : 오전 " + date.getHours()+"시";
			   }
			   msg+=date.getMinutes()+"분";
			   msg+=date.getSeconds()+"초";
			   
			   divClock.innerText = msg;
			   setTimeout(showClock,1000);
			}
	
            window.addEventListener('load', function() {
            	showClock();         	 
            });
       </script>
</body>
</html>
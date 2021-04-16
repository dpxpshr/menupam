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
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/reset.css'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/main.css'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/mypage.css'>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/e5012d0871.js"
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="wrapper">
		<div class="header">
			<a href="${context}/member/logout"><span>logout</span></a>
			<div class="search">
				<i class="fas fa-search"></i>
			</div>
			<div class="notice">
				<i class="far fa-clipboard"></i>
			</div>
		</div>
		<div class="main">
			<!--여기서 부터 코드 작성-->
			<form name="form" method="get">


				<div class="body">
					<div class="content">
						<p class="fontMedium" id="title">마이페이지</p>
						<br>
						<div class="line"></div>
						<br>
						<div class="buttonBox">
							<div class="manageBtn  border">
								<a href="${context}/member/mypage/mypage">
									<div class="manageBtnIcon">
										<i class="fas fa-id-card"></i>
									</div>
									<div class="manageBtnText">계정 정보
								</a>
							</div>
						</div>
						<div class="manageBtn">
							<div class="manageBtnIcon">
								<i class="fas fa-hand-holding-usd"></i>
							</div>
							<div class="manageBtnText">이용 내역</div>
						</div>
						<div class="manageBtn">
							<a href="${context}/member/mypage/reservation">
								<div class="manageBtnIcon">
									<i class="far fa-calendar-check"></i>
								</div>
								<div class="manageBtnText">예약 현황
							</a>
						</div>
					</div>
					<div class="manageBtn">
						<a href="${context}/member/mypage/waiting">
							<div class="manageBtnIcon">
								<i class="fas fa-user-friends"></i>
							</div>
							<div class="manageBtnText">대기 현황
						</a>
					</div>
				</div>
				<div class="manageBtn"></div>
				<div class="manageBtn"></div>
		</div>
		<br>


		<div>
			<div class="wrap_user">
				<i class="fas fa-user-circle"></i>

				<div class="user">

					<span id="user_info">${sessionScope.userInfo.memberId}</span><br>
					<!-- 아이디 -->
					<span id="user_info">${sessionScope.userInfo.memberName}님</span>
					<!-- 이름 -->
				</div>
			</div>

			<hr color="#F2BB13">
			<div class="wrap_type">
				<div class="type">
					<p>등급</p>
					<div>${sessionScope.userInfo.memberType}</div>
					<!-- or 사장님 -->
				</div>
				<div class="point">
					<p>적립포인트</p>
					<div>00점</div>
				</div>
			</div>
			<hr color="#F2BB13">
			<div class="wrap_info">
				<div class="info">
					<div class="icon">
						<i class="far fa-envelope"></i>
					</div>
					<span id="user_info">${sessionScope.userInfo.memberEmail}</span>

				</div>

				<div class="info">

					<div class="icon">
						<i class="fas fa-mobile-alt"></i>
					</div>
					<input type="tel" id="user_info" required="required"
						value="${sessionScope.userInfo.memberPhone}"> 
						<input type="hidden" id="userMember"
						value="${sessionScope.userInfo.memberId}">
					<form action="${context}/member/modify" method="post">
					<button class="far fa-edit icon"></button>

					<!-- 버튼 누르면 #user_info의 readonly="false"로 변경 + 
		                    	far fa-edit버튼 hidden +
		                    	<input class="modify" type="submit" value="수정" onclick='modifyTel()'>
		                    	 -->
					<br>
	

				</div>
				
		<%-- 		<div id="usertest" >
				${sessionScope.userInfo.memberId}
					${list.memberId}
						${list}
						${userList}
						${memberId}
				fklwsefkslklskl
					<c:forEach var="list" items="${userList}" varStatus="i">
						${list.memberId}
						${list}
						${userList}
						${memberId}
					</c:forEach> --%>
						
				</div>
				<input type="submit" id="submit" value="수정 완료" class="btnUpdate">
			</div>


		</div>
		</form>	
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

	<!--  <script src="/resources/js/member/mypage.js"></script>
 -->
	<script type="text/javascript">
 	<!-- 버튼 실행 $document 넣기 -->
 	
 	
			
			
 
		
 	$(function(){
 		
 			
 		
 				var userMember = $('#userMember').val();
 			
 		 		console.log(userMember);
 		 	
 	 			$.ajax({
 	 		    url:'/member/selectUserInfo', //request 보낼 서버의 경로
 	 		    type:'post', // 메소드(get, post, put 등)
 	 		    data: {userMember:userMember} , //보낼 데이터
 	 		    success: function(data) {
 	 		        console.log(data);
 	 		        
 	 		    },
 	 		    error: function(err) {
 	 		        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
 	 		        
 	 		    } 
 			});
 		
 	});
 				
 
 	
 	
 	
 	
 </script>

	</form>
</body>
</html>
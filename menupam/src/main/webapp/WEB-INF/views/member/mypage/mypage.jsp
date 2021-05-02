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
					<form name="form" method="post">
					<div class="content">
						<p class="fontMedium" id="title">마이페이지</p>
						<br>
						<div class="line"></div>
						<br>
						<div class="buttonBox">
							<div class="manageBtn  border">
								<a href="${context}/member/mypage">
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
					
					<!-- MT00이면 일반 MT10이면 사장으로 보이게 -->
					<c:if test="${sessionScope.userInfo.memberType=='MT00'}">
					<p>회원님</p>
					<div>일반회원</div>
					</c:if>
					<c:if test="${sessionScope.userInfo.memberType=='MT10'}">
					<p>점주</p>
					<div>사장님</div>
					</c:if>
					<c:if test="${sessionScope.userInfo.memberType=='MT20'}">
					<p>admin</p>
					<div>관리자</div>
					</c:if>
				<%-- 	<c:if test="${'MT00' eq sessionScope.userInfo.memberType} ">
						<div>일반</div>
					</c:if>
					<c:if test="${sessionScope.userInfo.memberType eq 'MT00'} ">
					<div>일반</div>
					</c:if>
					<c:if test="${sessionScope.userInfo.memberType eq 'MT00'} ">
						<div>일반</div>
					</c:if>
					아니? --%>
					
					<!-- or 사장님 -->
					
				</div>
				<div class="point">
					<br>
					<a href="${context}/member/logout"><p>로그아웃</p></a>
					</div>
			</div>
			<hr color="#F2BB13">
			<div class="wrap_info">
				<div class="info">
					<div class="icon">
						<i class="far fa-envelope"></i>
					</div>
					<span id="user_info">${sessionScope.userInfo.memberEmail}</span>
					<br>
					
				</div>
				<br>
				<div class="info"> 
				<i class="fas fa-key" style="margin-left:15px; "></i>
				<input style="margin-left:15px; height: 30px;" type="tel" id="Pw" name="Pw"> 
				<input type="submit" value="수정" id="modifyPw" class="btnSmall">
				</div>
				
				<div class="info">
					<div class="icon">
						<i class="fas fa-mobile-alt"></i>
					</div>
					<!-- 1 -->
						
						<input style="margin-left:20px;" type="tel" id="phone" name="phone" required="required" value="${sessionScope.userInfo.memberPhone}"> 
						<input type="submit" value="수정" id="modify" class="btnSmall"><br>
						
						
					
				
				</div>
				
				<c:if test="${sessionScope.userInfo.memberName=='관리자'}">
						<div><a href="${context}/member/adminList"> 회원 관리[관리자전용]</a></div>
					</c:if>
				</div>
				<c:if test="${sessionScope.userInfo.memberType=='MT10' && shopst.SHOP_NAME == null}">
					<input type="button" class="btnLarge width100" onclick="handleOnClick()"
					value="매장등록" style="margin-top:20px;"/>
					<div id='result'/>
				</c:if>
				
				<c:if test="${sessionScope.userInfo.memberType=='MT10' && shopst.SHOP_NAME != null} ">
					<input type="button" class="btnLarge width100" onclick="handleOnClick()"
					value="메뉴관리" style="margin-top:20px;"/>
					<div id='result'/>
				</c:if>
				<br>
				<div>
				<c:if test="${shopst.SHOP_NAME != null}">
				<input type="button" class="btnLarge width100" onclick="handleOnClick2()"
					value="메뉴관리" style="margin-bottom:20px;"/>
					<div id='result'/>
				</c:if>
				</div>
				<input  type="submit" value="회원탈퇴" id="userLeave" class="btnLarge width100">
			
			</div>
		</div>
	</div>
	
	</div>
</form>
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
	 $(document).ready(function(){
	    	$("#reserbtn").click(function(){
	    		document.form.action = "${context}/member/reservation";
	    	});	
	    	$("#waitbtn").click(function(){
	    		document.form.action = "${context}/member/waiting";
	    	});	
	    	$("#mypagebtn").click(function(){
	    		document.form.action = "${context}/member/mypage";
	    	});	
	    	
	    	$("#modify").click(function(){
	    		document.form.action = "${context}/member/modify";
	    	});	
	    	$("#modifyPw").click(function(){
	    		document.form.action = "${context}/member/modifyPw";
	    	});	
	    	$("#userLeave").click(function(){
	    		document.form.action = "${context}/member/userLeave";
	    	});	
	    	$("#cancelReservation").click(function(){
	    		document.form.action = "${context}/member/cancelReservation";
	    	});
	    	$("#shopIdx").click(function(){
	    		document.form.action = "${context}/member/shopIdx";
	    	});
	    });
	
 	
 	
	    	
 function handleOnClick() {
	 let like = confirm("매장등록을 하시겠습니까?");
	 document.getElementById('result').innerText = like;
	 
	 if(like == true){
		 location = "${context}/shop/shopRegister";
	 }else{
		 location = "${context}/member/mypage";
	 }
 }
 function handleOnClick2() {
	 let like = confirm("메뉴관리를 하시겠습니까?");
	 document.getElementById('result').innerText = like;
	 
	 if(like == true){
		 location = "${context}/shop/menuManage";
	 }else{
		 location = "${context}/member/mypage";
	 }
 }
 
			
			
 
		
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
</body>
</html>
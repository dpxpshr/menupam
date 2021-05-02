<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
table {
	width: 375px;
	height: 300px;
	margin: auto;
	text-align: center;
	margin-top : 20px;
	
}
#form{
	margin-top : 20px;
}

.wrapperM{
max-width: 375px;
    margin: 0 auto;
    width: 375px;
    position: relative;
    background: #fff;
    min-height: 100%;
    box-shadow: 0 0 20px rgb(0 0 0 / 5%);
	
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/reset.css'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/main.css'>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/e5012d0871.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<br>
<div class="wrapperM">
	<p class="fontMedium" id="title">회원상세</p>
	<br>
	<div class="line"></div>
	<br>
	<c:choose>
		<c:when test="${sessionScope.userInfo.memberType=='MT20'}">
			<form id="form" name="form" method="post">
				<table border="1">
					<tr>
						<td>ID</td>
						<td><input name="memberId" value="${member.memberId}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input name="memberName" value="${member.memberName}"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input name="memberPw" value="$2a$10$NGEwtX/x625IhQfq"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input name="memberEmail" value="${member.memberEmail}"></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input name="memberPhone" value="${member.memberPhone}"></td>
					</tr>
					<tr>
						<td>등급</td>
						<%-- <td><input name="memberType" value="${member.memberType}"></td> --%>
						<td><select name="memberType" style="width:170px;">
							 <optgroup label="일반회원">
							<option vlaue="MT00" >MT00</option>
							</optgroup>
							 <optgroup label="사장">
							<option vlaue="MT00" >MT10</option>
							</optgroup>
							 <optgroup label="관리자">
							<option vlaue="MT00" >MT20</option>
							</optgroup>
							
						</select>
						</td>
					</tr>

					<tr>
						<td>가입일</td>
						<td><input name="reg" value="${member.memberRegDate}"></td>
					</tr>
					<tr>
						<c:if test="${empty member.memberLeaveDate}">
							<td>회원탈퇴</td>
							<td><input type="submit" class="btnMedium" value="회원탈퇴"
								id="leavebtn"></input></td>
						</c:if>
					</tr>
					<c:if test="${not empty member.memberLeaveDate}">
						<td>탈퇴일</td>
						<td><input name="memberLeaveDate" style="margin-left:40px; width:150px;"
							value="${member.memberLeaveDate}"> <input type="submit"
							class="btnsmall" value="복구"
							id ="restorebtn">
						</td>


					</c:if>


			

				</table>
					<br><br><br><br>
				<div class="line" id="Linediv">
				<input id="upbtn" type="submit" value="정보 수정 완료"
						class="btnLarge width100">
						
				</div>
			</form>
		</c:when>
	</c:choose>
	<br>


	<c:if test="${sessionScope.userInfo.memberType!='MT20'}">
		<h1>회원 상세 페이지는 관리자만 조회가 가능합니다.</h1>
	</c:if>

</div>
	<script type="text/javascript">
	/* 	$('#btn').('click',function(){
		 	$('#linediv').load(location.href + '#linediv'); 
			
		}); */
		 $(document).ready(function(){
		    	$("#upbtn").click(function(){
		    		document.form.action = "${context}/member/adminmodify";
		    	});
		    	
		    	$("#restorebtn").click(function(){
		    		document.form.action = "${context}/member/memberRestore";
		    	});
		    	
		    	$("#leavebtn").click(function(){
		    		document.form.action = '${context}/member/memberLeave';
		    	});
		    	
		    });
		
	</script>
</body>
</html>
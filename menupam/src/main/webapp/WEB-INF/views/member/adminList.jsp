<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>

<html>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>메뉴팜</title>

<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/main.css'>

<script src="https://kit.fontawesome.com/e5012d0871.js"
	crossorigin="anonymous"></script>

<style type="text/css">
table{
	text-align: center;
	
    width:100%;
    height: 1000px;
}
table,td,th{
 



}

div.paging{
	margin-left: 40%;
	color: orange;
}


</style>

</head>
<body>
<c:if test="${sessionScope.userInfo.memberType=='MT20'}">
<p class="fontMedium" id="title">회원관리</p>
		<br>
		<div class="line"></div>
		<br>
	<div class="wrapper"></div>
		
		<div class="header"></div>

			<div class="main">




				<table border="1" bordercolor="orange">

					<tr>

						<th><span>id</span></th>
						<th>회원성명</th>
						<th>등급</th>
						<th>번호</th>
						<th>이메일</th>
						<th>가입일</th>
						<th>탈퇴일</th>
						<th>관리</th>
					</tr>


					<c:forEach items="${selectMemberList}" var="member">
						<tr>
							<td>${member.memberId}</td>
							<td>${member.memberName}</td>
							<td>${member.memberType}</td>
							<td>${member.memberPhone}</td>
							<td>${member.memberEmail}</td>
							<td>${member.memberRegDate}</td>
							<td>${member.memberLeaveDate}</td>

							<td><a href="${context}/member/detail?memberId=${member.memberId}">
							<input value="변경" class="btnSmall"></a></td>
						</tr>
					</c:forEach>
				</table>
	
				<div class="paging">
					<a href="${context}/${paging.type}/adminList" class="nav first">《</a>
					<a href="${context}/${paging.type}/adminList?page=${paging.prev}">〈</a>

					<c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}"
						var="page">
						<a href="${context}/${paging.type}/adminList?page=${page}"><span>${page}</span></a>
					</c:forEach>

					<a href="${context}/${paging.type}/adminList?page=${paging.next}">〉</a>
					<a
						href="${context}/${paging.type}/adminList?page=${paging.lastPage}">》</a>
				</div>



				
			</div>
	</c:if>
	<c:if test="${sessionScope.userInfo.memberType!='MT20'}">
	<h1>관리자 페이지는 관리자만 조회 가능합니다.</h1>
	</c:if>
</body>
</html>
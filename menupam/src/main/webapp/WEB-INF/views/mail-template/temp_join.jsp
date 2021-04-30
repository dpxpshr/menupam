<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="com.kh.toy.common.code.Code" %>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<body>

<h1>메뉴팜 회원가입을 완료해주세요!</h1>
<h1>반갑습니다. ${memberName} 님.</h1>
<h1>메뉴팜 ID : ${memberId}의 회원가입을 원하시면</h1>
<h1>아래의 링크를 클릭해 회원가입을 완료해주세요.</h1>
<%-- <c:if test="${memberType == 'MT00'} "> --%>
<%-- <c:if test="${companyNum == 'null'} ">
<a href="<%= Code.DOMAIN %>/member/joinimpl/${authPath}">회원가입완료</a><br>
</c:if> --%>

<%-- <c:if test="${memberType == 'MT10'} "> --%>
<%-- <c:if test="${companyNum != 'null'} ">

<a href="<%= Code.DOMAIN %>/member/ceojoinimpl/${authPath}">회원가입완료</a><br>
</c:if> --%>

<!-- 세 -->
<c:if test="${empty memberType}"> 
	<h1></h1> 
	<a href="<%= Code.DOMAIN %>/member/joinimpl/${authPath}"><br>
		<img src="https://cdn.pixabay.com/photo/2017/08/04/18/33/join-2580972_1280.png" />
	</a>
</c:if>


<c:if test="${not empty memberType}">
	<h1></h1>
	<a href="<%= Code.DOMAIN %>/member/ceojoinimpl/${authPath}"><br>
		<img src="https://cdn.pixabay.com/photo/2020/07/14/10/23/button-5403722_1280.png" />
	</a>
</c:if>


</body>
</html>
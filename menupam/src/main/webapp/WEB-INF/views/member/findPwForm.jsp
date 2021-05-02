<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>

 <form action="${context}/member/findPw" method="post">
		
		<label>회원Email</label><br> <input type="text" id="memberEmail" name="memberEmail"> <br>
		<br>
		<button id="findPw" type="submit">찾기</button>
		
	
	 
	 <!-- <h1>회원 비밀번호 변경</h1> -->

<%-- <div class="pwinfo">
<span id="pw_num">${mem.memberPw}</span> <input id="pw_number" name="memberPw"/><br>
</div>
<br>
<input id="updatePw"type="submit" class="btnLarge"  value="변경"> --%>
		                    
</form>

<script type="text/javascript">


</script>

</body>
</html>
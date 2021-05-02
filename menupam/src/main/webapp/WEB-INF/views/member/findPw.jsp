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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/login.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    
 <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	        	<div class="bg-img">
<h1>회원 비밀번호 변경</h1>
<form action="${context}/member/updatePw" method="post">
<div class="pwinfo">
<span id="pw_num">
<!-- 여기서 memberId로  -->
<input type="hidden" name="memberId" value="${mem.memberId}"/></span> 

<input type="text" id="pw_number" name="Pw" /><br>
</div>
<br>
<input type="submit" class="btnLarge"  value="변경">
		     
</div>
</div>
</div>
</div>		                    
</form>

<script type="text/javascript">
/* $(document).ready(function(){
	$("#pwbtn").click(function(){
		document.form.action = "${context}/member/updatePw";
	});	
	$("#findpwbtn").click(function(){
		document.form.action = "${context}/member/updatePw";
	});	
}); */

</script>

<!-- <script src="/resources/js/member/findPw.js"></script> -->
</body>
</html>
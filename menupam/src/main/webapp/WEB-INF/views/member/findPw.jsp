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
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
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
	      			<div class="content">
	        			<header>메뉴팜</header>
	        			<div class="loginInline"></div>
	        			<div class="field">
	            			
	            		<span id="pw_num">
	            		
	            		<form action="${context}/member/updatePw" method="post">
<!-- 여기서 memberId로  -->
<input type="hidden" name="memberId" value="${mem.memberId}"/></span> </div>
						<span class="fa fa-user"></span>
						<input type="text" id="pw_number" name="Pw" style="text-align: center; width:65%;" /><br>
						<input type="submit" class="btnMedium" style="margin-top:30px;"  value="변경">
	          		</div>
				</div>
			</div>
        </div>
        </form>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div> 

<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
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
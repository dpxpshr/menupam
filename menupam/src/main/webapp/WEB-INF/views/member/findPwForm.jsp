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
        <div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="body">
	        	<div class="bg-img">
	      			<div class="content">
	        			<header>메뉴팜</header>
	        			<div class="loginInline"></div>
	        			<div class="field">
	        			 <form action="${context}/member/findPw" method="post">
						<label style="margin-bottom:20px;">이메일</label>
						 <input type="text" id="memberEmail" name="memberEmail" style="background-color:skyblue; text-align: center;" >
						<button id="findPw" class="btnLarge" type="submit" style="margin-top:30px;" value="찾기">찾기</button>
						 </form>
	            	
	            		</div>
						
	          		</div>
				</div>
			</div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div> 
                   
</form>
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
</body>
</html>
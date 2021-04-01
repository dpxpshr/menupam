<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/join.css'>
    <script src='main.js'></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>

    
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
           <div class="body">
            <!--여기서 부터 코드 작성  버튼 : 아이디중복확인, 전화번호인증, 주소찾기-->
           <div class="content">
	        <header>회원 가입</header>
          
	          <div class="field">
	            <span class="fas fa-ghost"></span>
	            <input type="text" class="name" id="name" name="name" required placeholder="이름" required="required">
	          </div>
	          <div class="field space">
	            <span class="fa fa-user"></span>
	            <input type="text" class="id" id="id" name="id" required placeholder="아이디" required="required">
	            <input type="button" id="id_btn" value="확인" onclick='idCheck()'>
	          </div>
	          <div class="field space">
	            <span class="fas fa-lock"></span>
	            <input type="password" class="pw" id="pw" name="pw" required placeholder="비밀번호" required="required">
	          </div>
	          <div class="field space">
	            <span class="fas fa-unlock"></span>
	            <input type="password" class="pw" id="pw2" name="pw2" required placeholder="비밀번호 확인" required="required">
	          </div>
	          <div class="field space">
	            <span class="far fa-envelope"></span>
	            <input type="email" class="email" id="email" name="email" required placeholder="이메일 주소" required="required">
	          </div>
	          <div class="field space">
	            <span class="fas fa-mobile-alt"></span>
	            <input type="tel" class="name" id="name" name="name" required placeholder="전화번호" required="required">
	          </div>
	          	<br>
	          <div class="field space" id="login_wrapper">
	            <input type="submit" value="가입하기" onclick='login()'>
	          </div>
          
           
          </div>
       </div>
       
       <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
       
    </div> 

</body>
</html>
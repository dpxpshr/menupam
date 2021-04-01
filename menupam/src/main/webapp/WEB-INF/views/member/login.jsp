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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/login.css'>
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
            <!--여기서 부터 코드 작성-->
            <div class="body">
	          
	          <div class="bg-img">
	      <div class="content">
	        <header>메뉴팜</header>
	        
	        
	          <div class="field">
	            <span class="fa fa-user"></span>
	            <input type="text" class="id" id="id" name="id" required placeholder="아이디">
	          </div>
		<div class="field space">
	            <span class="fa fa-lock"></span>
	            <input type="password" class="pass-key" id="pw" name="pw" required placeholder="비밀번호">
	            <span class="show">SHOW</span>
	             
	          </div>
	          <span class='valid_info'></span>
		<div class="pass">
	            <a> </a>
	          </div>
	         <br>
		<div class="field" id="login_wrapper">
	            <input type="submit" value="LOGIN" onclick='login()'>
	          </div>
		<div class="login"></div>
		
	          	<a id="kakao-login-btn" href="javascript:kakaoLogin()">
				  <img
				    src="https://odaeri.kr/images/buttons/btn_kakao-v2.3.png"
				    width="250"
				  />
				</a>
				<div class="signup">아이디 찾기 | 비밀번호 찾기 | <a href="/member/join">회원가입</a>
	        	</div>
				
	          </div>
		
	
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
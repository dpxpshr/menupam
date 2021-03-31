<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/main.css'>
    <script src='main.js'></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    <style type="text/css">
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  user-select: none;
}

.body{
	padding-top: 48px;
}
    
.content{
  position: relative;
  top: 50%;
  left: 50%;
  z-index: 999;
  text-align: center;
  padding: 100px 32px;
  width: 370px;
  transform: translate(-50%,0%);
  background: rgba(255,255,255,0.04);
}
.content header{
  color: #F2BB13;
  font-size: 33px;
  font-weight: 600;
  margin: 0 0 35px 0;
}
.field{
  position: relative;
  height: 45px;
  width: 100%;
  display: flex;
  background: rgba(255,255,255,0.94);
}

#id, #pw{
	 border-bottom: solid 1px;
  border-bottom-color: black; 
}

.field span{
  color: #222;
  width: 40px;
  line-height: 45px;
}
.field input{
  height: 100%;
  width: 100%;
  background: transparent;
  border: none;
  outline: none;
  color: #222;
  font-size: 16px;
	
}
.space{
  margin-top: 16px;
}
.show{
  position: absolute;
  right: 13px;
  font-size: 13px;
  font-weight: 700;
  color: #222;
  display: none;
  cursor: pointer;
}
.pass-key:valid ~ .show{
  display: block;
}
.pass{
  text-align: left;
  margin: 10px 0;
}
.pass a{
  color: black;
  text-decoration: none;
}
.pass:hover a{
  text-decoration: underline;
}
.field input[type="submit"]{
  width:250px;
  background: #F2BB13;
  color: white;
  font-size: 18px;
  letter-spacing: 1px;
  font-weight: 600;
  cursor: pointer;
}
.field input[type="submit"]:hover{
  background: #FFa500;
}

#login_wrapper{
	display: block;
}

.login{
  color: black;
  margin: 20px 0;
}
.links{
  display: flex;
  cursor: pointer;
  color: white;
  margin: 0 0 20px 0;
}


.links i{
  font-size: 17px;
}
i span{
  margin-left: 8px;
  margin-right: 8px;
  font-weight: 500;
  letter-spacing: 1px;
  font-size: 16px;
  color: black;
}
.signup{
	margin-top : 30px;
	font-size: 15px;
	color: black;
}
.signup a{
  color: block;
  text-decoration: none;
}
.signup a:hover{
  text-decoration: underline;
}
    </style>
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
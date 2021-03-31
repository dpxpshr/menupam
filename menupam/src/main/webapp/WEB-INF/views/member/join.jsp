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
  border-bottom: solid 1px;
  border-bottom-color: black; 
	
}

#id{
	width: 85%;
}
#id_btn{
	width: 15%;
}

.space{
  margin-top: 10px;
}

.field input[type="submit"]{
  width:250px;
  background: #F2BB13;
  color: white;
  font-size: 18px;
  letter-spacing: 1px;
  font-weight: 600;
  cursor: pointer;
  border-bottom: none;
}
.field input[type="submit"]:hover{
  background: #FFa500;
}

#login_wrapper{
	display: block;
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
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
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/shopModify.css'>
    <script src='main.js'></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    .body{
    padding-top: 48px;
}
.content{
    width: 90%;
    height: 717px;
    /* background-color: #F2F2F2; */
    margin: auto;
    border-radius: 10px;
}

.line{
	height: 5px;
	background-color: #F2BB13;
}

.buttonBox{
    height: 160px;
    border-radius: 6px;
    
    display: flex;
    justify-content: space-around;
    flex-wrap:wrap;
}
.manageBtn{
    background-color: #F2F2F2;
    width: 108px;
    height: 75px;
    border-radius: 6px;
}
.manageBtnIcon{
    height: 60%;
    text-align: center;
    display: flex;
}
.manageBtnIcon > i{
    margin: auto;
}
.manageBtnText{
    height: 40%;
    text-align: center;
}
.border{
    border: 2px solid #F2BB13;
}
.border > .manageBtnIcon{
    color: #F2BB13;
}
    
.wrap_user{
	padding-left: 10px;
	font-size: 50px;
	height: 14%;
} 
    
.user{
 	display: inline-block;
 	padding-left: 10px;
 	font-size: 30px;
 	align-self: center;
 }

.wrap_type{
	display: flex;
	height: 15%;
}

.wrap_type>*>*{
	text-align: center;
	margin-top: 10px;
}

.wrap_type p{
	font-weight: bolder;
}

.type{
	width:50%;
	height: 100%;
	border-right: solid #F2BB13;
}

.point{
	width:50%;
	height: 100%;
}

.info{
	display: flex;
	margin-top: 15px;
}

.icon{
	font-size: 20px;
	padding-left: 15px;
	width: 10px;
}

#user_info{
font-size: 20px;
margin-left: 20px;
width: 60%;
}

.modify{
	width:30px;
	padding: 0;
	border: none;
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
                <div class="content">
                    <p class="fontMedium" id="title">마이페이지</p><br>
                    <div class="line"></div>
                    <br>
                    <div class="buttonBox">
                        <div class="manageBtn  border">
                            <div class="manageBtnIcon"><i class="fas fa-id-card"></i></div>
                            <div class="manageBtnText">계정 정보</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-hand-holding-usd"></i></div>
                            <div class="manageBtnText">이용 내역</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="far fa-calendar-check"></i></div>
                            <div class="manageBtnText">예약 현황</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-user-friends"></i></div>
                            <div class="manageBtnText">대기 현황</div>
                        </div>
                        <div class="manageBtn">
                        </div>
                        <div class="manageBtn"></div>
                    </div>
                    <br>
                    
                    
                    <div>
	                    <div class="wrap_user">
							<i class="fas fa-user-circle"></i>
	                    	<div class="user">
								<span id="user_info">abcdef123</span><br> <!-- 아이디 -->
								<span id="user_info">OOO님</span> <!-- 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    <div class="wrap_type">
	                    	<div class="type">
	                    		<p>등급</p>
	                    		<div>일반 회원</div> <!-- or 사장님 -->
	                    	</div>
	                    	<div class="point">
	                    		<p>적립포인트</p>
	                    		<div>00점</div>
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    <div class="wrap_info">
	                    	<div class="info">
		                    	<div class="icon"><i class="far fa-envelope"></i></div>
		                    	<span id="user_info">abc@google.com</span>
		                    </div>
		                    <div class="info">
		                    	<div class="icon"><i class="fas fa-mobile-alt"></i></div>
		                    	<input type="tel" id="user_info" required="required" readonly="readonly" value="010-0000-0000">
		                    	
		                    	<button class="far fa-edit icon"></button>
		                    	
		                    	<!-- 버튼 누르면 #user_info의 readonly="false"로 변경 + 
		                    	far fa-edit버튼 hidden +
		                    	<input class="modify" type="submit" value="수정" onclick='modifyTel()'>
		                    	 -->
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
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

.wrap_shop{
	padding-left: 10px;
	font-size: 50px;
	height: 60px;
	display:flex;
	justify-content: space-around;
} 
    
.store{
	margin-top: 10px;
	text-align: justify;
}
    
.shop{
 	display: inline-block;
 	padding-left: 10px;
 	font-size: 25px;
 	font-weight: lighter;
 	height: 100%;
 }

.shop>span{
	height: 50%;
	margin-top: 20px;
	vertical-align: sub;
}


.wating_box{
	width: 100%;
	height: 60px;
	display:block;
	justify-content: space-around;
	background-color: 	#FFFFE0;
	margin-top: 10px;
}

.waiting_info{
	display: inline-block;
	width: 100%;
	height: 40%;
	text-align: center;
	margin-top: 5px;
}

.wrap_btn{
	display:inline-flex;
	justify-content: space-around;
	width: 100%;
	height: 50%;
}

.btn{
	width: 30%;
	border: none;
	color: white;
}



#send_msg{
	background-color: #FFD700;
}

#send_msg:hover{
	background-color: #FFFF00;
}

#arrived{
	background-color: #FFDAB9;
}

#arrived:hover{
	background-color: 		#FFEFD5;
}

#cancel_wait{
	background-color: 	#BDB76B;
}

#cancel_wait:hover{
	background-color: 	#F0E68C;
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
                    <p class="fontMedium" id="title">대기자 리스트</p><br>
                    <div class="line"></div>
                    
                    <div>
	                    <div class="wrap_shop">
							<i class="fas fa-store store"></i>
	                    	<div class="shop">
								<span id="shop_info">abcdef123</span><br> <!--매장 인덱스 -->
								<span id="shop_info">나이스 닭다리</span> <!-- 매장 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    
	                    <div class="time">
	                    	<p class="fontXSmall">현재시간 : 2021.04.11 16:25 </p>
	                    </div>
	                    
	                    <div class="wrap_box">
	                    	<div class="wating_box">
	                    		<span class="waiting_info">3인 010-0000-0000</span>
	                    		<div class="wrap_btn">
	                    			<input type="button" class="btn" id="send_msg" value="문자 전송" onclick='sendMsg()'>
	                    			<input type="button" class="btn" id="arrived" value="손님 도착" onclick='arrived()'>
	                    			<input type="button" class="btn" id="cancel_wait" value="대기 취소" onclick='cancelWait()'>
	                    		</div>
	                    	</div>
	                    	
	                    	<div class="wating_box">
	                    		<span class="waiting_info">3인 010-0000-0000</span>
	                    		<div class="wrap_btn">
	                    			<input type="button" class="btn" id="send_msg" value="문자 전송" onclick='sendMsg()'>
	                    			<input type="button" class="btn" id="arrived" value="손님 도착" onclick='arrived()'>
	                    			<input type="button" class="btn" id="cancel_wait" value="대기 취소" onclick='cancelWait()'>
	                    		</div>
	                    	</div>
	                    	
	                    	<div class="wating_box">
	                    		<span class="waiting_info">3인 010-0000-0000</span>
	                    		<div class="wrap_btn">
	                    			<input type="button" class="btn" id="send_msg" value="문자 전송" onclick='sendMsg()'>
	                    			<input type="button" class="btn" id="arrived" value="손님 도착" onclick='arrived()'>
	                    			<input type="button" class="btn" id="cancel_wait" value="대기 취소" onclick='cancelWait()'>
	                    		</div>
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
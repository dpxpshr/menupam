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


.date_box{
	height: 50px;
}

.date_box>div{
	display: flex;
	justify-content: space-around;
	height: 50%;
}

.date_box i{
	width: 20%;
	font-size: 15px;
	text-align: center;
}

.date_box p{
	width: 60%;
	font-size: 15px;
	text-align: center;
}

.search_box{
	display: flex;
	width: 100%;
	height: 30px;
	margin-top: 5px;
}

.wrap_input{
	width: 75%;
	height: 100%;
	font-size: 20px;
	margin-left: 4px;
	text-align-last: center;
}

#search_input{
	border: none;
	border-bottom: solid thin;
	height:90%;
}

#search_btn{
	background-color: #F2BB13;
	color: white;
	border: none;
	width: 25%;
	height: 100%;
}

#search_btn:hover{
	background: #FFa500;
}
.reserv_box{
	width: 100%;
	height: 50px;
	display: inline-block;
	justify-content: space-around;
	background-color: 	#FFFFE0;
	margin-top: 10px;
}

.box{
	margin-top: 5px;
	height: 50%;
}

.reserv_info{
	display: inline-block;
	width: 70%;
	height: 20px;
	text-align: center;
}

.btn{
	width: 20%;
	height: 20px;
	border: none;
	padding: 0;
}


#cancel_reserv{
	background-color: 	#BDB76B;
	color: white;
}

#cancel_reserv:hover{
	background-color: #F0E68C;
}


.fontXSmall{
	margin-left: 3px;
	font-size: smaller;
	height: 45%;
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
                    <p class="fontMedium" id="title">예약 리스트</p><br>
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
	                    
	                    <div class="date_box">
	                    	<div class="year">
	                    		<i class="fas fa-chevron-left"></i>
	                    		<p> 2021.04 </p>
	                    		<i class="fas fa-chevron-right"></i>
	                    	</div>
	                    	<div class="date">
	                    		<i class="fas fa-chevron-left"></i>
	                    		<p> 30 | 화 </p>
	                    		<i class="fas fa-chevron-right"></i>
	                    	</div>
	                    </div>
	                    
	                    <div class="search_box">
	                    	<div class="wrap_input">
	                    		<span class="fas fa-ghost"></span>
	                    		<input type="text" id="search_input" value="" placeholder="예약자 이름">
	                    	</div>
	                    		<input type="button" id="search_btn" value="검색" onclick='searchReserve()'>
	                    </div>
	                    
	                    <div class="wrap_box">
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
	                    	</div>
	                    	
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
	                    	</div>
	                    	
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">하명도 3인 17:30</span>
	                    		<input type="button" class="btn" id="cancel_reserv" value="예약 취소" onclick='cancelReserv()'>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : </span>
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
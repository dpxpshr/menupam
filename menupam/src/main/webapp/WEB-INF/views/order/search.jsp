<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/search.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
        	<div class="saerch">
        		<i class="fas fa-search"></i>
          		<input class="searchName" type="text" placeholder="음식을 검색해 주세요.">
        	</div>
          	 
        </header>
        <section class="main">
            <div class="myPosition">
            	<a><span style="color:#F2BB13"><i class="fas fa-crosshairs"></i> 내 주변 검색 하기</span></a>
            </div>
            
            
        </section>
        <footer class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div> 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/menuCart.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="search">
                <i class="fas fa-search"></i>
            </div>
            <div class="notice">
                <i class="far fa-clipboard"></i>
            </div>
        </header>
        <section class="main">
        	<!-- 작성라인 -->
            <div class="cartTop">
            	<div class="cartName">장바구니</div><a>전체삭제</a>
			</div>
            <div class="shopName">DENO 이태원점</div>
            <div class="List">주문내역</div>
            <div class="menuItem">
            	<div class="menuItem_Left">
            		<div class="menuItem_Name">버터 알감자</div>
            		<div class="menuItem_Price">5,900 원</div>
            	</div>
            	<div class="menuItem_Right">
            		<div class="menuItem_Delete">
            			<a><i class="far fa-trash-alt"></i></a>
            		</div>
            		<div class="menuItem_Count">
            			<a><i class="fas fa-minus"></i></a> 1개 <a><i class="fas fa-plus"></i></a>
            		</div>
            	</div>
            </div>
            <div class="menuItem">
            	<div class="menuItem_Left">
            		<div class="menuItem_Name">프리미엄 치즈 플래터</div>
            		<div class="menuItem_Price">25,00 원</div>
            	</div>
            	<div class="menuItem_Right">
            		<div class="menuItem_Delete">
            			<a><i class="far fa-trash-alt"></i></a>
            		</div>
            		<div class="menuItem_Count">
            			<a><i class="fas fa-minus"></i></a>1개<a><i class="fas fa-plus"></i></a>
            		</div>
            	</div>
            </div>
             <div class="menuItem">
            	<div class="menuItem_Left">
            		<div class="menuItem_Name">봉골레 파스타</div>
            		<div class="menuItem_Price">12,000 원</div>
            	</div>
            	<div class="menuItem_Right">
            		<div class="menuItem_Delete">
            			<a><i class="far fa-trash-alt"></i></a>
            		</div>
            		<div class="menuItem_Count">
            			<a><i class="fas fa-minus"></i></a>1개<a><i class="fas fa-plus"></i></a>
            		</div>
            	</div>
            </div>
            
        </section>
        
        <button class="menuOrder">주문하기</button>
        
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
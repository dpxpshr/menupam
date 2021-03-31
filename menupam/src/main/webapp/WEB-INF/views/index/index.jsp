<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href="../../../resources/css/reset.css">
    <link rel='stylesheet' type='text/css' media='screen' href="../../../resources/css/main.css">
    <link rel='stylesheet' type='text/css' media='screen' href="../../../resources/css/index.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script src='main.js'></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
        </div> <!--커밋테스트 19:33  -->
        <div class="main">
        	<!-- 커밋 -->
            <!--여기서 부터 코드 작성-->
            <p class="quick_search_head fontMedium">빠른 검색</p>
            <div class="quick_search">
            	<div class="cate_box"><p class="fontLarge">🥘</p><p class="fontSmall">한식</p></div>
            	<div class="cate_box"><p class="fontLarge">🍤</p><p class="fontSmall">중식</p></div>
            	<div class="cate_box"><p class="fontLarge">🍥</p><p class="fontSmall">일식</p></div>
            	<div class="cate_box"><p class="fontLarge">🥓</p><p class="fontSmall">양식</p></div>
            	<div class="cate_box"><p class="fontLarge">🍙</p><p class="fontSmall">분식</p></div>
            	<div class="cate_box"><p class="fontLarge">🍽</p><p class="fontSmall">뷔페</p></div>
            	<div class="cate_box"><p class="fontLarge">🍔</p><p class="fontXSmall">패스트푸드</p></div>
            	<div class="cate_box"><p class="fontLarge">☕</p><p class="fontXSmall">카페/디저트</p></div>
            	<div class="cate_box"><p class="fontLarge">🍀</p><p class="fontXSmall">랜덤메뉴</p></div>
            </div>
            <p class="trail_head fontMedium">공지 & 이벤트</p>
            <div class="banner">
            	<div class="slickBox">
            		<div><img src="../../../resources/images/t1.jpg"></div>
            		<div><img src="../../../resources/images/t2.jpg"></div>
            		<div><img src="../../../resources/images/t3.jpg"></div>
            	</div>
            </div>
            <p class="trail_head fontMedium">메뉴팜 이용방법</p>
            <div class="infoBox">
            	<p class="fontLarge downArrow"><i class="fas fa-angle-double-down"></i></p>
            </div>
            <div class="usageBox">
            	<p class="fontSmall">-손님 이용방법-</p>
            	<p class="fontSmall">1. 대기 QR[<i class="fas fa-qrcode"></i>] 찍기!</p>
            	<p class="fontSmall">2. 입장해서 메뉴 QR[<i class="fas fa-qrcode"></i>] 찍기!</p>
            	<p class="fontSmall">3. 메뉴를 고르고 주문하면 끝!</p>
            	<br><br>
            	<p class="fontSmall">-사장님 이용방법-</p>
            	<p class="fontSmall">1. 매장 등록하기</p>
            	<p class="fontSmall">2. 매장 정보 입력하기</p>
            	<p class="fontSmall">3. QR[<i class="fas fa-qrcode"></i>] 출력해서 붙이기</p>
            	<p class="fontSmall">4. 예약,대기,주문받기</p>
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
	<script type="text/javascript">
		$('.slickBox').slick({
			  dots:true,
			  arrows:false,
			  infinite:true,
			  autoplay: true,
			  autoplaySpeed: 5000,
			});
		$(".infoBox").on("click",function(){
			$(".infoBox").css("display","none");
			$(".usageBox").css("display","flex");
			$(".main").css("height","1000px")
		});
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/index.css'>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
    <div class="wrapper">
        <div class="header">
            <div class="notice">
                <i class="far fa-bell" style="color: #CDC7D5;" ></i>
                <div class="alertCnt">1</div>
            </div>
        </div>
        <!--알림이 있는것 1. 예약, 주문,  -->
        <div class="alertNotice">
            <div class="alert">
                <div class="alertMsg">
                    <a href="" class="fontXSmall">롯데리아 과천점 예약</a>
                </div>
                <div class="alertTime">
                    <p class="fontXXSmall">21.04.13</p>
                </div>
            </div>
            <div class="alert">
                <div class="alertMsg">
                    <a href="" class="fontXSmall">롯데리아 과천점 3번 주문</a>
                </div>
                <div class="alertTime">
                    <p class="fontXXSmall">21.04.13</p>
                </div>
            </div>
            <div class="alert">
                <div class="alertMsg">
                    <a href="" class="fontXSmall">롯데리아 과천점 3번 주문</a>
                </div>
                <div class="alertTime">
                    <p class="fontXXSmall">21.04.13</p>
                </div>
            </div>
        </div>
        <div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="banner">
                <div class="bannerContent"><img src="../../../resources/images/Banner1.jpg" alt=""></div>
                <div class="bannerContent"><img src="../../../resources/images/Banner2.jpg" alt=""></div>
                <div class="bannerContent"><img src="../../../resources/images/Banner3.jpg" alt=""></div> 
            </div>
            <div class="body">
                <div class="content">
                    <p class="fontSmall title">가까운 매장 찾기</p>
                    <br>
                    <div class="line"></div>
                    <div class="categoryBox">
                        <div>
                            <div id="C1">
                                <p class="fontSmall"></p>
                            </div>
                            <div id="C2">
                                <p class="fontSmall"></p>
                            </div>
                            <div id="C3">
                                <p class="fontSmall"></p>
                            </div>
                        </div>
                        
                        <div>
                            <div id="C4">
                                <p class="fontSmall"></p>
                            </div>
                            <div id="C5">
                                <p class="fontSmall"></p>
                            </div>
                            <div id="C6">
                                <p class="fontSmall"></p>
                            </div>
                        </div>
                    </div>
                    <div class="searchBarBox">
                        <input type="text" class="searchBar" placeholder="    검색어를 입력하세요">
                    </div>
                    <p class="fontSmall title">메뉴팜 이란?</p>
                    <div class="explainBox">
                        <div class="QRBox"></div>
                        <div class="explainContent">
                            <p class="fontXSmall QR">QR코드 메뉴판 시스템</p>
                            <p class="explain">식당에서 QR코드를 활용해 메뉴를 주문할 수 있는 키오스크를 대체할 <br>새로운 방식의 요식업 솔루션 입니다.</p>
                        </div>
                    </div>
                    <div class="realFooter">
                        <p class="fontXXSmall footerContet">상호명 : 메뉴팜&nbsp;&nbsp;&nbsp;&nbsp;대표 : 하명도 <br>주소 : 서울특별시 금천구 디지털로9길 68 <br>사업자등록번호 : 123-45-67890 [사업자정보확인]
                        </p>
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
</body>
<script>
    $(document).ready(function(){
      $('.banner').slick({
        arrows : false,
        autoplay : true
      });
    });
</script>
<script type="text/javascript" src="../../../resources/js/main.js"></script>
</html>
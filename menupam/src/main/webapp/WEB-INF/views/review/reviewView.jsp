<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/review/reviewView.css'>
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
                <div class="content">
                    <p class="fontSmall">가게이름적는곳</p><br>
                    <div class="line"></div>
                    <div class="reviewBox">
                        <div class="profileBox">
                            <div class="profileImg">
                            </div>
                            <div class="profileName">
                                <p class="fontXSmall" id="name">lee5031207</p>
                                <p class="fontXSmall rating" id="1"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="2"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                            </div>
                        </div>
                        <div class="contentBox">
                            잘 먹었습니다^^
                        </div>
                    </div>
                    <div class="reviewBox">
                        <div class="profileBox">
                            <div class="profileImg">
                            </div>
                            <div class="profileName">
                                <p class="fontXSmall" id="name">lee5031207</p>
                                <p class="fontXSmall rating" id="1"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="2"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                            </div>
                        </div>
                        <div class="contentBox">
                            잘 먹었습니다^^
                        </div>
                        <div class="imgBox">
                            <img src="../../resources/images/목살.PNG" alt="">
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
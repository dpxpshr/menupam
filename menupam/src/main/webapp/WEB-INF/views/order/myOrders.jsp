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
            <div class="btnBox">
               
                
                
            </div>
            <br>
            <div class="fontBox">
                <p class="fontLarge">나의 주문 내역</p>
                      <br>
                <div class="line"></div>
          
             
                <br>
                
                <p class="fontMedium">매장명 2021-3-26   
                <input type="button" value="리뷰 작성" class="btnSmall">
                </p>
                <br>
                <p class="fontMedium">매장명 2021-3-25   
                <input type="button" value="리뷰 작성" class="btnSmall">
                </p>
                <br>
                <p class="fontMedium">매장명 2021-3-24   
                <input type="button" value="리뷰 작성" class="btnSmall">
                </p>
                <br>
                <p class="fontMedium">매장명 2021-3-23   
                <input type="button" value="리뷰 작성" class="btnSmall">
                </p>
            </div>
            <br>
            
            
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
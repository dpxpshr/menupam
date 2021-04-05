<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body style="font-family: 'Noto Sans KR', sans-serif;">
    <div class="wrapper" style="max-width: 375px;
		    margin: 0 auto;
		    width: 375px;
		    position: relative;
		    background: #fff;
		    min-height: 100%;
		    box-shadow: 0 0 20px rgb(0 0 0 / 5%);">
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
            <div class="body" style="padding-top: 48px;">
                <div class="content" style="width: 90%;
            min-height: 900px;
            margin: auto;
            border-radius: 10px;
            margin-bottom: 100px;">
                    <p class="fontSmall" style="font-family: 'Noto Sans KR', sans-serif; font-size:20px; font-weight:700">[메뉴팜] QR코드 발송알림 </p><br>
                    <div class="line" style="background-color:#F2BB13;height: 3px; width:60%; "></div>
                    <div class="box" style="margin-top: 20px;">
                        <p class="fontXSmall" style="font-family: 'Noto Sans KR', sans-serif;  font-weight:700">${memberId}님!!</p>
                        <br>
                        <p class="fontXSmall" style="font-family: 'Noto Sans KR', sans-serif; font-weight:700">저희 서비스를 이용해 주셔서 감사합니다.</p>
                        <br>
                        <p class="fontXSmall" style="font-family: 'Noto Sans KR', sans-serif; font-weight:700">본 메일과 관련되어 궁금하신 점이나 불편한 사항은<br> 고객센터에 문의해 주시기 바랍니다.</p>
                        <button style=" margin-top: 20px;
            							width: 100%;
            							border : none;
            							border-radius: 6px;
            							background-color: #F28C0F;
            							color: white;
            							height: 40px;
            							font-family: 'Noto Sans KR', sans-serif;
            							font-weight:700;
            							">
            			문의 하기
            			</button>
                    </div>
                </div>
            </div>
            
        </div> 
    </div> 

</body>
</html>
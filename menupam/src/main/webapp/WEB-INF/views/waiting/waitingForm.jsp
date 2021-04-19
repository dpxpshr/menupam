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
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/waitForm.css'>
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
            <form action="${context}/waiting/registerWait" method="POST" enctype="multipart/form-data">
               <div class="imgLarge">
                    <img src="../../resources/images/sample.PNG" alt="">
                </div>
                <div class="text_box">
                	<p class="fontLarge">ccc${shop_name}</p>
                	<br>
                	<p class="fontLarge">대기 신청하기</p>
                </div>
                <div class="text_box">
                	<p class="fontSmall">현재 대기인원 수 : 00명</p>
                	<br>
					<p class="fontSmall">예상 대기시간 : (00시간) 00분</p>
				</div>
				<br><br>
				<div class="field">
	            <span class="fas fa-ghost"></span>
	            <input type="number" class="name" id="name" name="waitParty" required placeholder="인원수" required="required">
	          </div>
	          <br>
	          <div class="field space">
	            <span class="fas fa-mobile-alt"></span>
	            <input type="tel" class="name" id="Phone" name="waitPhone" required placeholder="전화번호" required="required"
	            pattern="[0-9]{11}">
	          </div>
            	<button class="btnMedium">대기 등록하기</button>
            	</form>
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
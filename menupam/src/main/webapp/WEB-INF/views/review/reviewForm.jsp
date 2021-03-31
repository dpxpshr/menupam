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
     <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reviewForm.css'>
     
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

            <br>
            <div class="fontBox">
                <p class="fontLarge">리뷰 작성</p>
                <br>
                <div class="line"></div>
                <br>
                <p class="fontMedium">매장 이름</p>
            </div>
            <div class="review_content">
          		
            	<textarea>내용을 입력해주세요.</textarea>
          
            
          
            별점
            
           <img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		
          
            </div>
            <br>
            <div> <i class="fas fa-camera">사진 첨부 하기</i>
            	<br>
            	<input type="file" name="files" id="contract_file" multiple/>
            </div> 
                        <div class="btnBox">
        <input type="button" value="리뷰 등록 하기" class="btnLarge">
            </div>
            <br>
            <div class="imgBox">
            
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
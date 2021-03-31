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
        <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reviewView.css'>
    <script src='main.js'></script>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>

<body>
<style type="text/css">


</style>
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
            
                <p class="fontLarge">리뷰</p>
                <br>
                 <div class="line"></div>
                 
                <br>
            </div>
            <div>
            	<p class="fontsmall">전체리뷰 002</p>
            	<br><br>
            </div>
            <div>
            	<button>최신순</button>
            	<button>높은별점순</button>
            </div>
         <section class="section">  
         
        

       
		
		
          <div class="review">
       		<div class="star" data-rate="3">
       		  <img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		
       		
       		</div>
       		
      		
       		<div class=review-sumaary>
       			<div class="average">
       			<h5>
       				<span>
       				2개 리뷰 별점 평균
       				</span>
       			
       			</h5>
       			
       			</div>
       	
       	
       		</div>
           <br>
          <input type="checkbox" name="Ptcheck" checked>사진리뷰보기
                   
                        </div>
           </section>
            
            <br>
            <p>닉네임</p>
               <img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		
            <div class="imgBox">
             <div class="imgLarge">
             		
                    <img src="resources/images/sample.PNG" alt="">
                
                </div>
               
            </div>
            
            리뷰내용
            <br><br>
             <p>닉네임</p>
              <img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		<img alt="Image" src="resources/images/star_full.png" width="30" height="30">
       		
            <div class="imgBox">
             <div class="imgLarge">
             		
                    <img src="resources/images/sample.PNG" alt="">
                </div>
            </div>
            
            리뷰내용
            <br>   <br>   <br>
            
                  <input type="button" value="목록" class="btnSmall">
                 
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
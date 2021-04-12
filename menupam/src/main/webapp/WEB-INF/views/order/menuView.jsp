<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/menuView.css'>
    <link rel="stylesheet" href="resources/slick/slick.css">
	<link rel="stylesheet" href="resources/slick/slick-theme.css">
    
</head>
<body>
    <div class="wrapper">
        <header class="header">
          <div><img src='resources/images/배너1.png'></div>
		  <div><img src='resources/images/배너2.png'></div>
		  <div><img src='resources/images/배너3.png'></div>  
        </header>
        <section class="main">
        	<!-- 작성라인 -->
            <div class="shopInfo">
            	<h2 class="shopName">크치치킨 화기점</h2>
            	<p class="slogan">치킨, 닭강정</p>
            	<p class="tag">치킨,닭강정 • 화기동</p>
            	<p class="star"><i class='fa fa-star fa-fw'></i> 4.0</p>
            	
            </div>
            
            <div class="menuBox">
               <div>
                 <div class="menuCategory">
                 	<div class="menuName">치킨</div>
                     <i class="fas fa-angle-down"></i>
                 </div>
                 
                 <div class="menuItems">
                     <div class="menuItem">
                         <div class="menuItemLeft">
                             <div class="menuItemName">반반치킨 콤보</div>
                             <div class="menuItemPrice">18,000 원</div>
                         </div>
                         <div class="menuItemRight">
                             <img src="resources/images/반반치킨콤보.PNG" alt="">
                         </div>
                     </div>
                     <div class="menuItem">
                         <div class="menuItemLeft">
                             <div class="menuItemName">후라이드 콤보</div>
                             <div class="menuItemPrice">17,000 원</div>
                         </div>
                         <div class="menuItemRight">
                             <img src="resources/images/후라이드콤보.PNG" alt="">
                         </div>
                     </div>
                     
                 </div>   
             </div>
             
             <div>
                 <div class="menuCategory">
                     <div class="menuName">서브메뉴</div>
                     <i class="fas fa-angle-down"></i>
                 </div> 
                 <div class="menuItems">
                     <div class="menuItem">
                         <div class="menuItemLeft">
                             <div class="menuItemName">감자튀김</div>
                             <div class="menuItemPrice">11,000 원</div>
                         </div>
                         <div class="menuItemRight">
                             <img src="resources/images/감자튀김.PNG" alt="">
                         </div>
                     </div>
                 </div>   
             </div>
             
             <div>
                 <div class="menuCategory">
                     <div class="menuName">국물</div>
                     <i class="fas fa-angle-down"></i>
                 </div> 
                 <div class="menuItems">
                     <div class="menuItem">
                         <div class="menuItemLeft">
                             <div class="menuItemName">크치 해물어묵탕</div>
                             <div class="menuItemPrice">17,000 원</div>
                         </div>
                         <div class="menuItemRight">
                             <img src="resources/images/크치해물어묵탕.PNG" alt="">
                         </div>
                     </div>
                    
                 </div>   
             </div>    
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
	<script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-migrate-3.3.2.js" integrity="sha256-BDmtN+79VRrkfamzD16UnAoJP8zMitAz093tvZATdiE=" crossorigin="anonymous"></script>
	<script type="text/javascript" src='resources/slick/slick.min.js'></script>
	<script type="text/javascript" src='resources/js/menuView.js'></script>
</body>
</html>
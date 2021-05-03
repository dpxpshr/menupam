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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/menuView.css'>
    <link rel="stylesheet" href="../../../resources/slick/slick.css">
	<link rel="stylesheet" href="../../../resources/slick/slick-theme.css">
</head>
<body>
    <div class="wrapper">
        <header class="header">
        		<!-- shop정보가 있으니 shop.fileIdx 활용해서 file정보도 가져온후 사진을 찍어주자  -->
          <div><img src='${shopPhotoPath}'></div> <!-- 사진 경로 작성 -->
        </header>
        <section class="main">
        	<!-- 작성라인 -->
            <div class="shopInfo">
            	<h2 class="shopName">${shop.shopName}</h2>
            	<p class="slogan">${shop.shopType}</p>
            	<p class="tag">${shop.shopAddress}</p>
            	<c:if test="${shop.shopRating != 0}"> <!-- 리뷰가 한번도 등록되지 않은 매장은 별점정보를 출력하지 않음 -->
            		<p class="star"><i class='fa fa-star fa-fw'></i>${shop.shopRating}</p>
            	</c:if>
            </div>
            
            <div class="menuBox">
               <div>
               <c:forEach items="${menulist}" var="category">
                 <div class="menuCategory">
                 	<div class="menuName">${category.key}</div>
                     <i class="fas fa-angle-down"></i>
                 </div>
                 
                 <div class="menuItems">
                 	<c:forEach items="${category.value}" var="menu">
                     <div class="menuItem" id="${menu.MENU_IDX}">
                         <div class="menuItemLeft">
                             <div class="menuItemName">${menu.MENU_NAME}</div>
                             <div class="menuItemPrice">${menu.MENU_PRICE}원</div>
                         </div>
                         <div class="menuItemRight">
                             <img src="${menu.FILE_SAVE_PATH}${menu.FILE_RENAME}.${menu.FILE_TYPE}" alt=""><!-- 사진 경로 작성 -->
                         </div>
                     </div>
                     <script type="text/javascript">
                     	document.querySelector("#${menu.MENU_IDX}").addEventListener("click",()=>{
                     		location.href="/order/menucart?shopIdx=${shop.shopIdx}&add=${menu.MENU_IDX}&tableNum=${tableNum}";
                     	})
                     </script>
                     </c:forEach>
                 </div>
                
             </c:forEach>   
             </div>
           </div>
        </section>
        <footer class="footer">
        	<div class="menuCart"><i class="fas fa-shopping-bag"></i></div>
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div>
    <%@ include file="/WEB-INF/views/include/javascript.jsp" %>
    <c:if test="${tableNum == null}">
	    <script type="text/javascript">
	    	document.querySelector(".menuCart").addEventListener("click",()=>{
	    		location.href="/order/menucart?shopIdx=${shop.shopIdx}";
	    	});
	    </script>
    </c:if>
    <c:if test="${tableNum != null}">
    	<script type="text/javascript">
	    	document.querySelector(".menuCart").addEventListener("click",()=>{
	    		location.href="/order/menucart?shopIdx=${shop.shopIdx}&tableNum=${tableNum}";
	    	});
	    </script>
    </c:if>
	<script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-migrate-3.3.2.js" integrity="sha256-BDmtN+79VRrkfamzD16UnAoJP8zMitAz093tvZATdiE=" crossorigin="anonymous"></script>
	<script type="text/javascript" src='../../../resources/slick/slick.min.js'></script>
	<script type="text/javascript" src='../../../resources/js/menuView.js'></script>
</body>
</html>
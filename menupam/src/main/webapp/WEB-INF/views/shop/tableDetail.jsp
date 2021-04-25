<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/tableDetail.css'>
    <!-- <script src='main.js'></script> -->
    <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
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
                    <p class="fontSmall">${shop.shopName}</p><br>
                    <div class="line"></div><br>
                    <div class="tableInform">
                        <p class="fontXSmall">테이블 번호 : ${order.orderTableNum}</p><br>
                        <p class="fontXSmall">${order.orderDate}</p><br>
                        <div class="menuList">
                            <p class="fontXSmall">메뉴</p>
                            <p class="fontXSmall">가격</p>
                            <p class="fontXSmall">수량</p>
                            <p class="fontXSmall">취소</p>
                            <c:forEach var="orders" items="${menuOrders}">
                            	<p class="fontXSmall">${orders.ORDER_MENU_NAME}</p>
	                            <p class="fontXSmall">${orders.ORDER_MENU_PRICE}원</p>
	                            <p class="fontXSmall">${orders.ORDER_MENU_CNT}</p>
	                            <p class="fontXSmall"><a class="menuCancel"><i class="far fa-times-circle"></i></p></a>
                            </c:forEach>
                          
                        </div>
                        <br>
                        <p class="fontSmall">총 결제 금액 : ${menuSum}원</p><br>
                    </div>
                    <br>
                
                    <div class="menuBox">
                         <c:forEach var="categorys" items="${categorys}" >
                        	<div class="menuCategory">
                                ${categorys.menuCategoryName} <i class="fas fa-angle-down"></i>
                                
                            </div>
                             <div class="menuItems">
                             	<c:forEach var="menuList" items="${menuList}">
                             		<c:if test="${categorys.menuCategoryName == menuList.MENU_CATEGORY_NAME}">
		                                <div class="menuItem">
		                                    <div class="menuItemLeft">
		                                        <div class="menuItemName">${menuList.MENU_NAME}</div>
		                                        <div class="menuItemPrice">${menuList.MENU_PRICE} 원</div>
		                                        <!-- ${menuList.MENU_CATEGORY_NAME} -->
		                                    </div>
		                                    <div class="menuItemRight">
		                                        <img src="${menuList.FILE_SAVE_PATH}${menuList.FILE_RENAME}.${menuList.FILE_TYPE}">
		                                    </div>
		                                </div>
                               		</c:if>
                             	</c:forEach>   
                             </div>
                             
                        </c:forEach>
                            
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
    </div> 
    
    <script src="/resources/js/shop/tableDetail.js"></script>
   
    
</body>

</html>
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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/myOrders.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
        <div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="btnBox">
            </div>
            <br>
            <div class="fontBox">
                <p class="fontLarge title">나의 결제 내역</p>
                      <br>
                <div class="line"></div>
                <br>
                <c:forEach items="${orderlist}" var="map">
                <div class="fontXSmall singleOrder">
                <span class="orderTitleBox">${map.SHOP_NAME}</span>
                <span> ${map['ORDER_DATE']}  <input type="button" value="리뷰 작성" class="btnSmall"></span>                
                </div>
                <br>
                </c:forEach>
            </div>
            <br>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div> 
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
</body>
</html>
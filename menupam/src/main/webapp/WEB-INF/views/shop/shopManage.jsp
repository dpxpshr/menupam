<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/shopManage.css'>
    <!-- <script src='main.js'></script> -->
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
                    <p class="fontSmall" id="title">${shop.shopName}</p><br>
                    <div class="line"></div><br>
                    <div class="buttonBox">
                       <a class="manageBtn border" href="${context}/shop/shopManage">
                            <div class="manageBtnIcon"><i class="fas fa-check fontSmall"></i></div>
                            <div class="manageBtnText">매장 관리</div>
                        </a>
                        <a class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-won-sign fontSmall"></i></div>
                            <div class="manageBtnText">매출 관리</div>
                        </a>
                        <a class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-users fontSmall"></i></div>
                            <div class="manageBtnText">직원 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/shop/menuManage">
                            <div class="manageBtnIcon"><i class="fas fa-utensils fontSmall"></i></div>
                            <div class="manageBtnText">메뉴 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/shop/shopModify">
                            <div class="manageBtnIcon"><i class="fas fa-cog fontSmall"></i></div>
                            <div class="manageBtnText">매장 정보 수정</div>
                        </a>
                        <div class="manageBtn"></div>
                    </div>
                    <br>
                    <div class="waitReservationBox">
                        <div class="leftBox">
                            <p class="fontXSmall">예약 승인 요청(5)</p>
                        </div>
                        <div class="rightBox">
                            <input type="button" value="예약 확인" class="btnSmall">
                        </div>
                    </div>
                    <br>
                    <div class="tableBox">                        
                    	<c:set var="tableArr" value="${fn:length(tableArr)}"/> 
                    	<c:forEach var="i" begin="1" end="${tableArr}" step="1" >
                    	<c:set var="flg" value="true"/>
		                    <c:forEach items="${menuOrderListList}" var="list" > 
              		 		 	<c:if test="${i == list[0].ORDER_TABLE_NUM}">
              		 		 	<c:set var="flg" value="false"/>
              		 			 	<a href="${context}/shop/tableDetail?orderTableNum=${i}">
              		 			 	<div class="table eating">                 	
              		 					<p class="fontXSmall"><c:out value="${i}번"/></p> 
              		 					<p class="fontXXSmall">${list[0].ORDER_TITLE}</p> 			
              		 				</div></a>               		 				
              		 		 	</c:if>                    		 		 	              		 		                 			
		                    </c:forEach>
		                    	<c:if test="${flg}">
	                    		<div class="table">                  	
                       				<p class="fontXSmall"><c:out value="${i}번"/></p> 
                      			</div>
                      			</c:if>
                    	</c:forEach>
                    </div>
                    <br>
                </div>
            </div>
        </div>
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><a onclick="mypage()"><i class="far fa-user"></i></a></div>
        </div> 
    </div> 
    <script type="text/javascript">
    let mypage = () => {
    	var memberIdinfo = '${sessionScope.userInfo.memberId}';
    	if(memberIdinfo != ''){
    	location.href = "${context}/member/mypage";
    		
    	}else{
    		location.href = "${context}/member/login";
    	}
    	
    }
    
    </script>

</body>
</html>
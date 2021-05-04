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
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
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
                        <a class="manageBtn border" href="${context}/shop/QRManage?shopIdx=${shop.shopIdx}">
                            <div class="manageBtnIcon"><i class="fas fa-qrcode"></i></div>
                            <div class="manageBtnText">QR 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/waiting/list?shopIdx=${shop.shopIdx}">
                            <div class="manageBtnIcon"><i class="fas fa-users fontSmall"></i></div>
                            <div class="manageBtnText">대기 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/shop/menuManage">
                            <div class="manageBtnIcon"><i class="fas fa-utensils fontSmall"></i></div>
                            <div class="manageBtnText">메뉴 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/shop/shopModify">
                            <div class="manageBtnIcon"><i class="fas fa-cog fontSmall"></i></div>
                            <div class="manageBtnText">매장 정보 수정</div>
                        </a>
                        <a class="manageBtn" href="${context}/reservation/list?shopIdx=${shop.shopIdx}">
                            <div class="manageBtnIcon"><i class="fas fa-user-clock"></i></div>
                            <div class="manageBtnText">예약 리스트</div>
                        </a>
                    </div>
                    <br>
                    <div class="waitReservationBox">
                        <div class="leftBox">
                            <p class="fontXSmall">대기 QR 발송</p>
                        </div>
                        <div class="rightBox">
                            <input type="button" onclick="location.href='${context}/review/waitQRsend?shopIdx=${shopIdx}'"   
                            value="대기" class="btnSmall">
                        </div>
                    </div>
                    <div class="waitReservationBox">
                        <div class="leftBox">
                            <p class="fontXSmall">테이블 별 QR코드 발송</p>
                        </div>
                        <div class="rightBox">
                            <input type="button" onclick="location.href='${context}/review/tableQRsend?shopIdx=${shopIdx}'"   
                            value="테이블" class="btnSmall">
                        </div>
                    </div>
                
                </div>
            </div>
        </div>
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div> 
    <%@ include file="/WEB-INF/views/include/javascript.jsp" %>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/menuManage.css'>
    <!-- <script src='main.js'></script> -->
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
        <div class="main">
            <div class="body">
                <div class="content">
                    <p class="fontSmall">${shop.shopName}</p><br>
                    <div class="line"></div><br>
                    <div class="buttonBox">
                        <a class="manageBtn" href="${context}/shop/shopManage">
                            <div class="manageBtnIcon"><i class="fas fa-check fontSmall"></i></div>
                            <div class="manageBtnText">매장 관리</div>
                        </a>
                       <a class="manageBtn" href="${context}/shop/QRManage?shopIdx=${shop.shopIdx}">
                            <div class="manageBtnIcon"><i class="fas fa-qrcode"></i></div>
                            <div class="manageBtnText">QR 관리</div>
                        </a>
                        <a class="manageBtn" href="${context}/waiting/list?shopIdx=${shop.shopIdx}">
                            <div class="manageBtnIcon"><i class="fas fa-users fontSmall"></i></div>
                            <div class="manageBtnText">대기 관리</div>
                        </a>
                        <a class="manageBtn border" href="${context}/shop/menuManage">
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
                    <div class="categoryModifyBox">
                        <div class="categoryModifyTitle">
                            <p class="fontSmall">카테고리 편집</p>
                        </div>
                        <div class="categoryModifyBtn">
                            <a href="${context}/shop/categoryData"><input type="button" value="수정 하기" class="btnSmall"></a>
                        </div>
                    </div>
                    <br>
                    <div class="categoryModifyBox">
                        <div class="categoryModifyTitle">
                            <p class="fontSmall" style="padding-right: 37px;">메뉴 편집</p>
                        </div>
                        <div class="categoryModifyBtn">
                            <a href="${context}/shop/menuModify"><input type="button" value="메뉴 추가" class="btnSmall"></a>
                        </div>
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
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    </div> 



</body>
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
    document.querySelectorAll(".menuCategory").forEach((e)=>{
        e.addEventListener("click", (event)=>{
            let menuItems = e.nextSibling.nextSibling;
            //만약 클래스명에 active가 없다면 넣어주기
            if(menuItems.className.indexOf("active") != -1){
                menuItems.className = "menuItems";
            }else{
                menuItems.className += " active";
            }
        })
    })
</script>
</html>
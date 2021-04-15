<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/menuModify.css'>
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
            <div class="body">
                <div class="content">
                    <p class="fontSmall">공차 사당점</p><br>
                    <div class="line"></div><br>
                    <div class="buttonBox">
                        <a class="manageBtn" href="${context}/shop/shopManage">
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
                        <a class="manageBtn border" href="${context}/shop/menuManage">
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
                    <form action="${context}/shop/menuRegister" method="post" enctype="multipart/form-data">
                    	 <p class="fontSmall">매뉴 이름</p><br>
	                    <input type="text" class="inputLarge" name="menuName" placeholder=" 이름을 적어주세요" required><br><br>
	                    <p class="fontSmall">매뉴 가격</p><br>
	                    <input type="text" class="inputLarge" name="menuPrice" placeholder=" 가격을 적어주세요" required><br><br>
	                    <p class="fontSmall">매뉴 사진</p><br><br>
	                    <label class="input-file-button"  for="input-file" >
	                        업로드
	                    </label>
	                    <input type="file" name="file" id="input-file" style="display:none" />
	                    <br><br><br>
	                    <p class="fontSmall">매뉴 카테고리</p><br>
	                    <select name="menuCategoryName" class="inputMedium">
	                    	<c:forEach var="categorys" items="${categorys}">
	                    		<option>${categorys.menuCategoryName}</option>
	                    	</c:forEach>
	                       
	                    </select><br><br>
	                    <label><input type="checkbox" name="menuVegan" value="Y"> 비건 식사 가능 여부</label><br><br>
	                    <input type="submit" value="정보 수정 완료" class="btnLarge width100">
                    </form>
                   
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
    
   
 
</body>
</html>
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
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/menuModify.css'>
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
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-check fontSmall"></i></div>
                            <div class="manageBtnText">매장 관리</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-won-sign fontSmall"></i></div>
                            <div class="manageBtnText">매출 관리</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-users fontSmall"></i></div>
                            <div class="manageBtnText">직원 관리</div>
                        </div>
                        <div class="manageBtn border">
                            <div class="manageBtnIcon"><i class="fas fa-utensils fontSmall"></i></div>
                            <div class="manageBtnText">메뉴 관리</div>
                        </div>
                        <div class="manageBtn">
                            <div class="manageBtnIcon"><i class="fas fa-cog fontSmall"></i></div>
                            <div class="manageBtnText">매장 정보 수정</div>
                        </div>
                        <div class="manageBtn"></div>
                    </div>
                    <br>
                    <p class="fontSmall">매뉴 이름</p><br>
                    <input type="text" class="inputLarge" placeholder=" 삼겹살"><br><br>
                    <p class="fontSmall">매뉴 가격</p><br>
                    <input type="text" class="inputLarge" placeholder=" 13000"><br><br>
                    <p class="fontSmall">매뉴 사진</p><br><br>
                    <label class="input-file-button" for="input-file">
                        업로드
                    </label>
                    <input type="file" id="input-file" style="display:none" /> 
                    <br><br><br>
                    <p class="fontSmall">매뉴 카테고리</p><br>
                    <select name="" id="" class="inputMedium">
                        <option value="volvo">구이</option>
                        <option value="volvo">식사</option>
                        <option value="volvo">후식</option>
                        <option value="volvo">음료</option>
                    </select><br><br>
                    <label><input type="checkbox" name="color" value="blue"> 비건 식사 가능 여부</label><br><br>
                    <input type="button" value="정보 수정 완료" class="btnLarge width100">
                </div>
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
<script type="text/javascript">
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
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
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/categoryModify.css'>
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
                    <p class="fontSmall">카테고리 편집</p><br>
                    <div class="categoryBoxs">
                        <div class="categoryBox">
                            <form action="">
                                <div class="categoryInput">
                                    <input type="text" class="inputMedium" value=" 구이류">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="정보 수정 완료" class="btnSmall">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="삭제" class="btnXSmall red">
                                </div>
                            </form>
                        </div>
                        <div class="categoryBox">
                            <form action="">
                                <div class="categoryInput">
                                    <input type="text" class="inputMedium" value=" 식사류">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="정보 수정 완료" class="btnSmall">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="삭제" class="btnXSmall red">
                                </div>
                            </form>
                        </div>
                        <div class="categoryBox">
                            <form action="">
                                <div class="categoryInput">
                                    <input type="text" class="inputMedium" value=" 후식류">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="정보 수정 완료" class="btnSmall">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="삭제" class="btnXSmall red">
                                </div>
                            </form>
                        </div>
                        <div class="categoryBox">
                            <form action="">
                                <div class="categoryInput">
                                    <input type="text" class="inputMedium" value=" 음료 및 기타">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="정보 수정 완료" class="btnSmall">
                                </div>
                                <div class="categoryBtn">
                                    <input type="button" value="삭제" class="btnXSmall red">
                                </div>
                            </form>
                        </div><br>
                    </div>
                    
                    <input type="button" value="추가" class="btnLarge width100" id="addBtn">
                    
                    

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

    document.querySelector("#addBtn").addEventListener("click", (e)=>{
        console.log(e.target);
        let categoryBox = document.createElement("div");
        categoryBox.className = "categoryBox";

        let form = document.createElement("form");
        let categoryInput = document.createElement("div");
        categoryInput.className = "categoryInput";
        let inputText = document.createElement("input");
        inputText.type = "text";
        inputText.className = "inputMedium";

        let categoryBtn1 = document.createElement("div");
        let categoryBtn2 = document.createElement("div");
        categoryBtn1.className = "categoryBtn";
        categoryBtn2.className = "categoryBtn";

        let modifyBtn = document.createElement("input");
        modifyBtn.type = "button";
        modifyBtn.value = "정보 수정 완료";
        modifyBtn.className = "btnSmall";

        let deleteBtn = document.createElement("input");
        deleteBtn.type = "button";
        deleteBtn.value = "삭제";
        deleteBtn.className = "btnXSmall red";

        categoryBtn1.appendChild(modifyBtn);
        categoryBtn2.appendChild(deleteBtn);

        categoryInput.appendChild(inputText);
        form.appendChild(categoryInput);

        form.appendChild(categoryBtn1);
        form.appendChild(categoryBtn2);
        categoryBox.appendChild(form);



        document.querySelector(".categoryBoxs").appendChild(categoryBox);
    })
</script>
</html>
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
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/menuManage.css'>
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
                    <div class="categoryModifyBox">
                        <div class="categoryModifyTitle">
                            <p class="fontSmall">카테고리 편집</p>
                        </div>
                        <div class="categoryModifyBtn">
                            <input type="button" value="수정 하기" class="btnSmall">
                        </div>
                    </div>
                    <br>
                    <div class="categoryModifyBox">
                        <div class="categoryModifyTitle">
                            <p class="fontSmall" style="padding-right: 37px;">메뉴 편집</p>
                        </div>
                        <div class="categoryModifyBtn">
                            <input type="button" value="메뉴 추가" class="btnSmall">
                        </div>
                    </div>
                    <br>
                    <div class="menuBox">
                        <div>
                            <div class="menuCategory">
                                구이 <i class="fas fa-angle-down"></i>
                            </div> 
                            <div class="menuItems">
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">삼겹살</div>
                                        <div class="menuItemPrice">13,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/삼겹살.PNG" alt="">
                                    </div>
                                </div>
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">목살</div>
                                        <div class="menuItemPrice">13,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/목살.PNG" alt="">
                                    </div>
                                </div>
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">항정살</div>
                                        <div class="menuItemPrice">12,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/항정살.PNG" alt="">
                                    </div>
                                </div>
                            </div>   
                        </div>
                        <div>
                            <div class="menuCategory">
                                식사류 <i class="fas fa-angle-down"></i>
                            </div> 
                            <div class="menuItems">
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">육회 비빔밥</div>
                                        <div class="menuItemPrice">8,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/no-Img.PNG" alt="">
                                    </div>
                                </div>
                            </div>   
                        </div>
                        <div>
                            <div class="menuCategory">
                                후식류 <i class="fas fa-angle-down"></i>
                            </div> 
                            <div class="menuItems">
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">볶음밥</div>
                                        <div class="menuItemPrice">4,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/no-Img.PNG" alt="">
                                    </div>
                                </div>
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">냉면</div>
                                        <div class="menuItemPrice">4,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/냉면.PNG" alt="">
                                    </div>
                                </div>
                            </div>   
                        </div>
                        <div>
                            <div class="menuCategory">
                                음료 및 기타 <i class="fas fa-angle-down"></i>
                            </div>
                            <div class="menuItems">
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">콜라</div>
                                        <div class="menuItemPrice">1,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/no-Img.PNG" alt="">
                                    </div>
                                </div>
                                <div class="menuItem">
                                    <div class="menuItemLeft">
                                        <div class="menuItemName">사이다</div>
                                        <div class="menuItemPrice">1,000 원</div>
                                    </div>
                                    <div class="menuItemRight">
                                        <img src="resources/images/no-Img.PNG" alt="">
                                    </div>
                                </div>
                            </div>   
                        </div>
                    </div>
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
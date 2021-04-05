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
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/tableDetail.css'>
    <script src='main.js'></script>
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
                    <p class="fontSmall">공차 사당점</p><br>
                    <div class="line"></div><br>
                    <div class="tableInform">
                        <p class="fontXSmall">테이블 번호 : 03</p><br>
                        <p class="fontXSmall">2021.03.28 - 오후 3 : 51</p><br>
                        <div class="menuList">
                            <p class="fontXSmall">메뉴</p>
                            <p class="fontXSmall">가격</p>
                            <p class="fontXSmall">수량</p>
                            <p class="fontXSmall">취소</p>
                            <p class="fontXSmall">김치볶음밥</p>
                            <p class="fontXSmall">6000원</p>
                            <p class="fontXSmall">1</p>
                            <p class="fontXSmall"><i class="far fa-times-circle"></i></p>
                            <p class="fontXSmall">라면</p>
                            <p class="fontXSmall">4000원</p>
                            <p class="fontXSmall">1</p>
                            <p class="fontXSmall"><i class="far fa-times-circle"></i></p>
                        </div>
                        <br>
                        <p class="fontSmall">총 결제 금액 : 10000원</p><br>
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
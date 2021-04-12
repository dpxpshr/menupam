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
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/shopManage.css'>
    <script src='main.js'></script>
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
                    <p class="fontSmall" id="title">공차 사당점</p><br>
                    <div class="line"></div><br>
                    <div class="buttonBox">
                        <div class="manageBtn border">
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
                        <div class="manageBtn">
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
                        <div class="table eating">
                            <p class="fontXSmall">1번</p>
                            <p class="fontXXSmall">김치볶음밥 외 3개</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">2번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">3번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">4번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">5번</p>
                        </div>
                        <div class="table eating">
                            <p class="fontXSmall">6번</p>
                            <p class="fontXXSmall">치즈 라면 외 2개</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">7번</p>
                        </div>
                        <div class="table eating">
                            <p class="fontXSmall">8번</p>
                            <p class="fontXXSmall">김치볶음밥 외 3개</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">9번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">10번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">11번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">12번</p>
                        </div>
                        <div class="table">
                            <p class="fontXSmall">13번</p>
                        </div>
                        <div class="table eating">
                            <p class="fontXSmall">14번</p>
                            <p class="fontXXSmall">김치볶음밥 외 3개</p>
                        </div>
                    </div>
                    <br>
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
</html>
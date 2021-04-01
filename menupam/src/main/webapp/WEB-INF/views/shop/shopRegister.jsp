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
    <link rel='stylesheet' type='text/css' media='screen' href='/resources/css/shopRegister.css'>
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
                    <p class="fontMedium" id="title">매장 등록</p>
                    <div class="line"></div>
                    <br>
                    <p class="fontSmall">매장 이름</p><br>
                    <!-- <p class="fontXSmall" id="title">*정확한 매장 명을 입력해주세요</p><br> -->
                    <input type="text" class="inputLarge" placeholder="  정확한 매장 명을 입력해주세요">
                    <br><br>
                    <p class="fontSmall">사업자 등록 번호</p><br>
                    <input type="text" class="inputLarge" placeholder="  사업자 등록 번호를 입력해주세요">
                    <br><br>
                    <p class="fontSmall">매장 위치</p><br>
                    <input type="text" id="inputPost">
                    <button class="addressSearch" onclick="kakaoAddress()">주소 찾기</button><br><br>
                   	<input type="text" id="inputAddress"><br><br>
                    <input type="text" id="inputAddressDetail" placeholder="상세 주소를 입력해 주세요"><br><br>
                    <p class="fontSmall">매장 전화 번호</p><br>
                    <input type="text" class="inputLarge" placeholder="  전화번호를 입력하세요 (-빼고 입력)"><br><br>
                    <p class="fontSmall">업종</p><br>
                    <select name="cars" id="cars" class="inputLarge">
                        <option value="volvo">한식</option>
                        <option value="saab">분식</option>
                        <option value="mercedes">카페/디저트</option>
                        <option value="audi">돈까스.회.일식</option>
                        <option value="audi">치킨</option>
                        <option value="audi">피자</option>
                        <option value="audi">아시안.양식</option>
                        <option value="audi">중국집</option>
                        <option value="audi">족발, 보쌈</option>
                        <option value="audi">야식</option>
                        <option value="audi">패스트푸드</option>
                    </select>
                    <br><br>
                    <label><input type="checkbox" name="color" value="blue"> 포장 가능 여부</label>
                    <br><br>
                    <p class="fontSmall">테이블 수</p><br>
                    <select name="cars" id="cars" class="inputMedium">
                        <option value="volvo">1</option>
                        <option value="volvo">2</option>
                        <option value="volvo">3</option>
                        <option value="volvo">4</option>
                        <option value="volvo">5</option>
                        <option value="volvo">6</option>
                        <option value="volvo">7</option>
                        <option value="volvo">8</option>
                        <option value="volvo">9</option>
                        <option value="volvo">10</option>
                        <option value="volvo">11</option>
                        <option value="volvo">12</option>
                        <option value="volvo">13</option>
                        <option value="volvo">14</option>
                        <option value="volvo">15</option>
                        <option value="volvo">16</option>
                        <option value="volvo">17</option>
                        <option value="volvo">18</option>
                    </select>
                    <br><br>
                    <p class="fontSmall confirmText"><i class="far fa-check-circle"></i> 전체 동의</p><br>
                    <p class="fontXSmall confirmText"><i class="far fa-check-circle"></i> 개인회원 약관에 동의</p><br>
                    <p class="fontXSmall confirmText"><i class="far fa-check-circle"></i> 개인정보 제 3자 제공 및 위탁사항 이용약관</p><br>
                    <br>
                    <input type="button" value="등록하기" class="btnXLarge">
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
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/resources/js/shop/kakaoAddress.js"></script>
    
</body>
</html>
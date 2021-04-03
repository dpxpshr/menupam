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
        
        <form action="${context}/shop/shopInfo" method="post">
        	<div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="body">
                <div class="content">
                    <p class="fontMedium" id="title">매장 등록</p>
                    <div class="line"></div>
                    <br>
                    <p class="fontSmall">매장 이름</p><br>
                    <!-- <p class="fontXSmall" id="title">*정확한 매장 명을 입력해주세요</p><br> -->
                    <input type="text" name="shopName" class="inputLarge" placeholder="  정확한 매장 명을 입력해주세요" required>
                    <br><br>
                    <p class="fontSmall">사업자 등록 번호</p><br>
                    <input type="text" name="shopBln" class="inputLarge" placeholder="  사업자 등록 번호를 입력해주세요" >
                    <br><br>
                    <p class="fontSmall">매장 위치</p><br>
                    <!-- 나중에 바뀔수도 있음 생각중 -->
                    <input type="text" name="shopAddress" id="inputPost" >
                    <button class="addressSearch" type="button" onclick="kakaoAddress()">주소 찾기</button><br><br>
                   	<input type="text" name="shopAddress" id="inputAddress"><br><br>
                    <input type="text" name="detailedAddress" id="inputAddressDetail" placeholder="상세 주소를 입력해 주세요" ><br><br>
                    
                    <p class="fontSmall">매장 전화 번호</p><br>
                    <input type="text" name="shopTell" class="inputLarge" placeholder="  전화번호를 입력하세요 (-빼고 입력)" ><br><br>
                    
                    <p class="fontSmall">업종</p><br>
                    <select name="shopType" id="cars" class="inputLarge">
                        <option value="한식">한식</option>
                        <option value="분식">분식</option>
                        <option value="카페/디저트">카페/디저트</option>
                        <option value="돈까스.회.일식">돈까스.회.일식</option>
                        <option value="치킨">치킨</option>
                        <option value="피자">피자</option>
                        <option value="아시안.양식">아시안.양식</option>
                        <option value="중국집">중국집</option>
                        <option value="족발, 보쌈<">족발, 보쌈</option>
                        <option value="야식">야식</option>
                        <option value="패스트푸드">패스트푸드</option>
                    </select>
                    <br><br>
                    <label>
                    	<input type="checkbox" name="checkPackAble"> 포장 가능 여부
                    	<input type="hidden" name="shopPackAble">
                    </label>
                    <br><br>
                    <p class="fontSmall">테이블 수</p><br> <!-- 고민중 -->
                    <select name="shopTableCount" class="inputMedium">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                    </select>
                    <br><br><br>
          			
          			<input type="checkbox" id="chkbox1" class="all">
          			<label for="chkbox1" class="all confirmText"><em></em>전체 동의</label><br><br>
          			<input type="checkbox" id="chkbox2" class="check">
          			<label for="chkbox2" class="fontXSmall confirmText"><em></em>개인회원 약관에 동의</label><br><br>
          			<input type="checkbox" id="chkbox3" class="check">
          			<label for="chkbox3" class="fontXSmall confirmText"><em></em>개인정보 제 3자 제공 및 위탁사항 이용약관</label>
          			<br><br><br>
          			
                    <input type="submit" value="등록하기" class="btnXLarge">
                </div>
              </div>
            </div>
        </form>
        
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
    <script src="/resources/js/shop/shopRegister.js"></script>
    	
   
</body>
</html>
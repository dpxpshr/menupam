<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='resources/css/shopList.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="search">
                <i class="fas fa-search"></i>
            </div>
            <div class="notice">
                <i class="far fa-clipboard"></i>
            </div>
        </header>
        
        <section class="main">
        	<!-- 맵 설정 -->
            <div class="map">
            	
            </div>
            <!-- 매장 검색 목록 -->
            <div class="shopList">
             <table>
	           	<thead>
	           		<tr class="list"><td>목록</td></tr>
	           	</thead>
	           	
	           	<tbody >
	           		<tr class="shopList_tr">
	           			<td class="shopList_img"><img src="resources/images/교촌치킨.png"></td>
	           			<td class="shopList_name">교촌치킨</td>
	           			<td class="shopList_address">서울시 강남구 삼성동 44-18</td>
	           		</tr>
	           	</tbody>
	           	<!-- test용 List로 적용시 삭제필수! -->
	           	<tbody >
	           		<tr class="shopList_tr">
	           			<td class="shopList_img"><img src="resources/images/교촌치킨.png"></td>
	           			<td class="shopList_name">교촌치킨</td>
	           			<td class="shopList_address">경기도 성남시 분당구 판교로 303-13</td>
	           		</tr>
	           	</tbody>
           	 </table>
            </div>
        </section>
        <footer class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div> 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopList.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8741f560dfcb3473fb94dadb4c4b536c"></script>
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
            <div id="map"></div>
            <br>
            <div class="location_msg fontXSmall"></div>
            <!-- 매장 검색 목록 -->
            <div class="shopList">
             <table>
	           	<thead>
	           		<tr class="list"><td>목록</td></tr>
	           	</thead>
	           	
	           	<tbody >
	           		<tr class="shopList_tr">
	           			<td class="shopList_img"></td>
	           			<td class="shopList_name">교촌치킨</td>
	           			<td class="shopList_address">서울시 강남구 삼성동 44-18</td>
	           		</tr>
	           	</tbody>
	           	<!-- test용 List로 적용시 삭제필수! -->
	           	<tbody >
	           		<tr class="shopList_tr">
	           			<td class="shopList_img"></td>
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
    <script type="text/javascript">
	    let latlng = ()=>{ //현재 좌표값을 먼저 구한다
			return new Promise((resolve,reject)=>{
				navigator.geolocation.getCurrentPosition((position)=>{
					resolve(position.coords);
				},
				()=>{
					alert("위치 정보를 읽는 데 실패하였습니다.")
				},
				{
					enableHighAccuracy: true,
					timeout: 5000,
					maximumAge: 0
				});
			});
		}
	    (async function drawAndSearch(){
			let coords = await latlng(); //현재 좌표값이 구해지면 진행
			let header = new Headers();
			header.append("Authorization","KakaoAK a1dd8df76ed926adfc905911f8959e96");
			let url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+coords.longitude+"&y="+coords.latitude;
			let response = await fetch(url,{"method":"get", "headers": header});
			let obj = await response.json();
			let locName = await obj.documents[0].region_2depth_name;
			document.querySelector(".location_msg").innerHTML = locName + "에 있는 음식점을 검색합니다.";
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(coords.latitude,coords.longitude), //지도의 중심좌표
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			//검색 요청 단계
			let searchUrl = "http://localhost:9090/order/shoplist?location="+locName+"&keyword=롯데";
			searchUrl = encodeURI(searchUrl);
			let searchResponse = await fetch(searchUrl);
			let searchResult = await searchResponse.json();
			console.dir(searchResult);
		})();
	    
	    
    </script> 
</body>
</html>
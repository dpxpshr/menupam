<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/search.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopList.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8741f560dfcb3473fb94dadb4c4b536c"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
        	<div class="search">
        		<input id="location" style="display:none">
          		<input class="searchName" type="text" placeholder="검색어를 입력해주세요.">
          		<i class="fas fa-search" id="search_btn"></i>
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
		        <tbody id="list_body">
	           		<tr class="shopList_tr">
	           			<td class="shopList_img"></td>
	           			<td class="shopList_name">${shop.shopName}</td>
	           			<td class="shopList_address">${shop.shopAddress}</td>
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
	     //현재 좌표값을 구하는 함수, 가장 먼저 수행되어야 함.
	     let latlng = ()=>{ 
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
	     //현재 좌표값을 가지고 현재 위치를 지도에 표시한다.
	     // *** 원활한 테스트를 위해 지도기능 주석처리
// 		 (async function drawAndSearch(){
// 			let coords = await latlng(); //현재 좌표값이 구해지면 진행
// 			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
// 			var options = { //지도를 생성할 때 필요한 기본 옵션
// 				center: new kakao.maps.LatLng(coords.latitude,coords.longitude), //지도의 중심좌표
// 				level: 3 //지도의 레벨(확대, 축소 정도)
// 			};
// 			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
// 		})();

	     	//현재 좌표값으로 주소 이름을 얻고 input 태그에 저장
			(async function getLocationAndSave(){
				let coords = await latlng(); //현재 좌표값이 구해지면 진행
				let header = new Headers();
				header.append("Authorization","KakaoAK a1dd8df76ed926adfc905911f8959e96");
				let url = "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x="+coords.longitude+"&y="+coords.latitude;
				let response = await fetch(url,{"method":"get", "headers": header});
				let obj = await response.json();
				let locName = await obj.documents[0].region_2depth_name;
				console.log(locName);
				document.querySelector("#location").value = await locName;
				document.querySelector(".location_msg").innerHTML = await locName + "에 있는 음식점을 검색합니다.";
			})();
			
	     	//검색버튼 클릭시 동작 : 태그에 저장된 주소이름과 검색키워드를 가지고 find 주소로 fetch한다.
	     	//fetch가 성공하면 리스트에 받아온 정보들을 뿌린다.
			document.querySelector("#search_btn").addEventListener("click",()=>{
				let location = document.querySelector("#location").value;
				let keyword = document.querySelector(".searchName").value;
				
				let searchHeader = new Headers();
				let slist = null;
				searchHeader.append("content-type","application/x-www-form-urlencoded");
				
				// *** 테스트를 위해 위치정보 제거
				//fetch("/order/find",{method:"POST", headers:searchHeader, body:"keyword="+keyword+"&location="+location})
				fetch("/order/find",{method:"POST", headers:searchHeader, body:"keyword="+keyword})
				.then(response=>{
					if(response.ok){
						response.json().then(function(data) {
							  if(data.length == 0){
								  alert("검색 결과가 없습니다.");
							  }else{
								  drawList(data);
							  }
						})
					}else{
						alert("검색에 실패하였습니다.");
					}
				});
				
			});
			//받은 데이터를 리스트에 뿌려주는 함수
			let drawList = (data)=>{
				console.log("리스트 새로 그리기");
				let list = document.querySelector("#list_body");
				while(list.hasChildNodes()){
					list.removeChild(list.firstChild);
				}
				data.forEach((shop)=>{
					let row = document.createElement("tr");
					row.className = "shopList_tr";
					
					let image = document.createElement("td");
					image.className = "shopList_img"
					
					let name = document.createElement("td");
					name.className = "shopList_name";
					name.append(shop.shopName);
					
					let address = document.createElement("td");
					address.className = "shopList_address";
					address.append(shop.shopAddress);
					
					row.append(image);
					row.append(name);
					row.append(address);
					
					row.addEventListener('click',()=>{
						location.href="/order/menuview?shop="+shop.shopIdx;
					});
					list.append(row);
				});
			}
	    
    </script> 
</body>
</html>
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
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
    	
        <header class="header">
        	<div class="saerch">
        		<i class="fas fa-search"></i>
        		<input id="location" style="display:none">
          		<input class="searchName" type="text" placeholder="검색어를 입력해주세요.">
        	</div>
          	 
        </header>
        <section class="main">
            <div class="myPosition">
            	<a><span style="color:#F2BB13"><i class="fas fa-crosshairs"></i> 내 주변 검색 하기</span></a>
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
			})();
			document.querySelector(".myPosition").addEventListener("click",()=>{
				let location = document.querySelector("#location").value;
				let keyword = document.querySelector(".searchName").value;
				
				let searchHeader = new Headers();
				searchHeader.append("content-type","application/x-www-form-urlencoded");
				
				fetch("/order/find",{method:"POST", headers:searchHeader, body:"keyword="+keyword+"&location="+location})
				.then(response=>{
					if(response.ok){
						console.dir(response);
					}else{
						alert("검색에 실패하였습니다.")
					}
				});
				
			})
	</script>
</body>
</html>
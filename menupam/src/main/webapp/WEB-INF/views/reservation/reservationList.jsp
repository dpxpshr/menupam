<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>메뉴팜</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/reset.css'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/main.css'>
<link rel='stylesheet' type='text/css' media='screen'
	href='../../../resources/css/reservationList.css'>
<script src="https://kit.fontawesome.com/e5012d0871.js"
	crossorigin="anonymous"></script>

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
					<p class="fontMedium" id="title">예약 리스트</p>
					<br>
					<div class="line"></div>

					<div>
						<div class="wrap_shop">
							<i class="fas fa-store store"></i>
							<div class="shop">
								<span id="shop_info">${shop.shopIdx}</span><br> <span
									id="shop_info">${shop.shopName}</span>
								<!-- 매장이름 -->
							</div>
						</div>
						<hr color="#F2BB13">
						<div class="date_box">
							<div class="date">
								<input type="date" id="calendar" name="reserDate">
							</div>
						</div>
						<div class="wrap_box">

						</div>
						</div>
					</div>
				</div>
				<!-- content -->
			</div>
			<!-- body -->
			<div class="footer">
				<div>
					<i class="fas fa-search"></i>
				</div>
				<div>
					<i class="fas fa-qrcode"></i>
				</div>
				<div>
					<i class="fas fa-home"></i>
				</div>
				<div>
					<i class="far fa-clipboard"></i></i>
				</div>
				<div>
					<i class="far fa-user"></i>
				</div>
			</div>
		</div>
		<!-- main -->

<script type="text/javascript">

	let getToday = () => {
		//2021-02-10T09:00
		let today = new Date();   
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		if(month<10){
			month = '0'+month;
		}
		let date = today.getDate();  // 날짜
		let day = today.getDay();  // 요일
		return year+'-'+month+'-'+date;
	}
  document.querySelectorAll("#cancel_reserv").forEach((e)=>{
		e.addEventListener("click", (event)=>{
			fetch("/reservation/cancelRes?reserIdx="+e.name,{
				method:"POST"
			})
			.then(response => response.text())
			.then(text => {
				if(text=="success"){
					let reserIdx = e.name;
					let removeTarget = document.querySelector("#"+reserIdx);
					removeTarget.parentNode.removeChild(removeTarget);

				}else if(text=="fail"){
					window.alert("예약 취소 도중 오류가 발생했습니다. 다시 시도해주세요");
				}
			})
			
		})
	})
	let makeReservBox = (reserName, reserParty, reserDate, reserIdx, reserComment) => {
		let reserv_box = document.createElement("div");
		reserv_box.className = "reserv_box";
		let box = document.createElement("div");
		box.className = "box";
		let reserv_info = document.createElement("span");
		reserv_info.className = "reserv_info";
		let infoStr = reserName+"  "+reserParty+"인 "+reserDate.slice(-5);
		reserv_info.innerHTML = infoStr;

		// <button class="btn" id="cancel_reserv"
		// 								name="${reservation.reserIdx}">예약 취소</button>
		let cancel_reserv = document.createElement("button");
		cancel_reserv.className = "btn";
		cancel_reserv.id = "cancel_reserv";
		cancel_reserv.name = reserIdx;
		cancel_reserv.innerHTML = "예약 취소";

		//<p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>\
		let comment = document.createElement("p");
		comment.className = "fontXSmall";
		comment.innerHTML = "요청 사항 : "+reserComment;

		box.appendChild(reserv_info);
		box.appendChild(cancel_reserv);

		reserv_box.appendChild(box);
		reserv_box.appendChild(comment);
		
		return reserv_box;
	}
	
	window.onload = function(){
		document.querySelector("#calendar").value = getToday();	
		let today = getToday();
		
		//1. 저페이지를 로드하면 오늘날짜가 들어가자나요
		//2. 오늘날짜 데이터를 비동기로 받아옴 그리고 뷰에 그려줌(JS)
		
		fetch("/reservation/getList?shopIdx=${shop.shopIdx}&reserDate="+today, {
			method:"POST"
		})
		.then(response => response.json())
		.then(json => {
			if(Object.keys(json).length==0){
				//예약없습니다 그려주면댐
			}else{
				for(let i=0; i<Object.keys(json).length; i++){
					let reserv_box = makeReservBox(json[i].reserName, json[i].reserParty, json[i].reserDate, json[i].reserIdx, json[i].reserComment);
					document.querySelector(".wrap_box").appendChild(reserv_box);
				}
			}
		})
		
		document.querySelector("#calendar").addEventListener("change", (e)=>{
			// 캘린더에서 날짜 변경시 원래있던애들 삭제해준다 . 
			let wrap_box = document.querySelector(".wrap_box");
			while ( wrap_box.hasChildNodes() ) { 
				wrap_box.removeChild( wrap_box.firstChild ); 
			}
			//또똑같이 비동기로 저거 가져와서 그려준다.
			fetch("/reservation/getList?shopIdx=${shop.shopIdx}&reserDate="+e.target.value, {
				method:"POST"
			})
			.then(response => response.json())
			.then(json => {
				if(Object.keys(json).length==0){
					//예약없습니다 그려주면댐
				}else{
					for(let i=0; i<Object.keys(json).length; i++){
						let reserv_box = makeReservBox(json[i].reserName, json[i].reserParty, json[i].reserDate, json[i].reserIdx, json[i].reserComment);
						document.querySelector(".wrap_box").appendChild(reserv_box);
					}
				}
			})
		})
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>메뉴팜</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
<link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationList.css'>
<script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
		<div class="main">
			<!--여기서 부터 코드 작성-->
			<div class="body">
				<div class="content">
					<p class="fontMedium" id="title">예약 리스트</p><br>
					<div class="line"></div>
					<div>
						<div class="wrap_shop">
							<i class="fas fa-store store"></i>
							<div class="shop">
								<span id="shop_info">${shop.shopIdx}</span><br> 
								<span id="shop_info">${shop.shopName}</span> <!-- 매장이름 -->
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
		</div>
			<%@ include file="/WEB-INF/views/include/footer.jsp" %>
		</div>
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
<script type="text/javascript">

	window.addEventListener('load', function() {
		document.querySelector("#calendar").value = getTodayforList();	
		let today = getTodayforList();
		
		//1. 저페이지를 로드하면 오늘날짜가 들어가자나요
		//2. 오늘날짜 데이터를 비동기로 받아옴 그리고 뷰에 그려줌(JS)
		
		fetch("/reservation/getList?shopIdx=${shop.shopIdx}&reserDate="+today, {
			method:"POST"
		})
		.then(response => response.json())
		.then(json => {
			if(Object.keys(json).length==0){
				//예약없습니다 그려주면댐
				noRes();
			}else{
				for(let i=0; i<Object.keys(json).length; i++){
					let reserv_box = makeReservBox(json[i].reserName, json[i].reserParty, json[i].reserDate,
													json[i].reserIdx, json[i].reserPhone, json[i].reserComment,
													json[i].memberId);
					//let reserv_box = makeReservBox(json[i]);
					document.querySelector(".wrap_box").appendChild(reserv_box);
				}
			}
		})
		
		         	 
    });
</script>
</body>
</html>
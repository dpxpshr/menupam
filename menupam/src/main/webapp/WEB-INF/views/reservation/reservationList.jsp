<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationList.css'>
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
	                    
	                    <div class="search_box">
	                    	<div class="wrap_input">
	                    		<span class="fas fa-ghost"></span>
	                    		<input type="text" id="search_input" value="${reservation.reserName}" placeholder="예약자 성함">
	                    	</div>
	                    		<button id="search_btn">검색</button>
	                    </div>
	                    
	                    <c:if test="${empty requestScope.resList}">
				            <p class="fontSmall"> 예약이 없습니다.</p> 
				        </c:if>   
	                    
	                    <div class="wrap_box">
	                    	<c:forEach var="reservation" items="${resList}" varStatus="status">
	                    	<form name="form" method="POST">
	                    	<div class="reserv_box">
	                    		<div class="box">
	                    		<span class="reserv_info">${reservation.reserName} ${reservation.reserParty}인 시간</span>
	                    		<button class="btn" id="cancel_reserv" name="${reservation.reserIdx}">예약 취소</button>
	                    		</div>
	                    		<p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>
	                    	</div>
	                    	</form>
	                    	</c:forEach>
	                    	
	                    
	                    </div>
                </div>
            </div> <!-- content -->
        </div> <!-- body -->
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
    </div> <!-- main -->
    
  <script type="text/javascript">
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
    
    <script>
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
	
	
	window.onload = function(){
		document.querySelector("#calendar").min = getToday();	
	}
</script>
    
   
    </script>
    
    

</body>
</html>
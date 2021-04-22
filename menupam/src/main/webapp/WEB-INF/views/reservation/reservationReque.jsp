<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴팜</title>
<script type="text/javascript" src="/resources/js/common/asyncResponseError.js"></script>
<script type="text/javascript" src="/resources/js/common/urlEncoder.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">

window.onload = function(){

    //소켓 관련 JS
    let socket = null;
	
    connectWs();
    
    function connectWs(){
		sock = new SockJS("<c:url value='/echo' />");
		socket = sock;

		sock.onopen = function(){
			console.log("info : connection opened");
		}

		sock.onclose = function(){
			console.log("info : connection closed");
		}

		sock.onmessage = function(event){
			//메시지가 오는 메서드
			let data = event.data;
			let p = document.createElement("p");
			p.innerHTML = data;
			document.querySelector("body").appendChild(p);
		}		
    }


	function socketTest(){
		if(socket){
			let userId = '${sessionScope.userInfo.memberId}';
			let receiveId = "kim2";
			let msg = "메시지 입니다";
			socket.send(userId+","+msg+","+receiveId);

		}
	}
}

</script>
</head>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/shopModify.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reservationReque.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
<style type="text/css">
 #divClock{
	 font-size:10px;
 	height: 10vh;
 }
</style>

</head>
<body>
<script type="text/javascript">
function $(selector, text){ 
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`; 
	}
	return document.querySelector(selector); 
}

function showClock(){
	var date = new Date();
	var divClock = document.getElementById("divClock");
	if(date.getHours() > 12){
		var msg = "현재 시간 : 오후 " + (date.getHours()-12)+"시";
	}
	else{
		var msg = "현재 시간 : 오전 " + date.getHours()+"시";
	}
	msg+=date.getMinutes()+"분";
	msg+=date.getSeconds()+"초";
	
	divClock.innerText = msg;
	setTimeout(showClock,1000);
}

</script>
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
                <div class="content_wrapper">
                    <p class="fontMedium" id="title">예약 승인 요청</p><br>
                    <div class="line"></div>
                    <div class="content">
	                    <div class="wrap_shop">
							<i class="fas fa-store store"></i>
	                    	<div class="shop">
								<span id="shop_info">${sessionScope.shop.shopIdx}</span><br> <!--매장 인덱스 -->
								<span id="shop_info">${sessionScope.shop.shopName}</span> <!-- 매장 이름 -->
	                    	</div>
	                    </div>
	                    <hr color="#F2BB13">
	                    
	                    <div onload="showColck()">
	                    <div id="divClock"></div>
	                    </div>
	                    <br>
	                    <c:if test="${empty requestScope.resRequeList}">
				            <p class="fontSmall"> 요청된 예약이 없습니다.</p> 
				        </c:if>  
	                    
	                    
	                   <div class="wrap_box">
	                   <c:forEach var="reservation" items="${resRequeList}">
		                    	<div class="reserv_box" value="${reservation.reserIdx}">
		                    		<div class="box">
		                    		<span class="reserv_info">${reservation.reserDate} ${reservation.reserParty}인</span>
		                    		<button class="btn" id="reserv_ok" onclick="hitApprove(${reservation.getReserIdx()})">예약 승인</button>
		                    		</div>
		                    		<div class="box">
		                    		<span class="reserv_info">${reservation.reserName} ${reservation.memberPhone}</span>
		                    		<button class="btn" id="reserv_not" onclick="hitreject()">예약 거부</button>
		                    		</div>
		                    		<p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>
		                    	</div>
	                    	</c:forEach>
	                    	
	                    	<script type="text/javascript">
	                    		let hitApprove = (reserIdx) =>{
	                    			location.href = "${context}/reservation/approveRes?reserIdx="+reserIdx;
	                    		}
	                    	
							    /* function hitApprove(reserIdx()}){
							    	location.href = "${context}/reservation/approveRes?reserIdx="+${reservation.reserIdx};
							    }; */
							    
							    function hitreject(){
							    	location.href = "${context}/reservation/rejectRes?reserIdx="+${reservation.reserIdx};
							    		
							    };
						    </script>
	                    </div><!-- wrap_box -->
                </div><!-- content -->
            </div><!-- content_wrapper -->
        </div><!-- body -->
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
    </div> <!-- main -->
    
    
</body>
</html>
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
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/waitingList.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
        <div class="main">
            <!--여기서 부터 코드 작성-->
            <div class="body">
                <div class="content">
                    <p class="fontMedium" id="title">대기자 리스트</p><br>
                    <div class="line"></div> 
                    <div>
	                	<div class="wrap_shop">
							<i class="fas fa-store store"></i>
	                    	<div class="shop">
								<span id="shop_info">${shop.shopIdx}</span><br> <!--매장 인덱스 -->
								<span id="shop_info">${shop.shopName}</span> <!-- 매장 이름 -->
	                    	</div>
	                	</div>
	                	<hr color="#F2BB13">
	                	<div class="time">
                    		<div id="divClock"></div>
                    	</div>    
						<c:if test="${empty requestScope.waitList}">
				            <p class="fontXSmall">대기자가 없습니다.</p> 
				        </c:if> 	                        
		                <div class="wrap_box">
		                    <c:forEach var="waiting" items="${waitList}">
		                    	<div class="wating_box" id="${waiting.waitIdx}">
		                    		<span class="waiting_info">${waiting.waitParty}인 ${waiting.waitPhone}</span>
		                    		<div class="wrap_btn">
		                    			<!-- 만약 waiting.waitSmstime == null -->
		                    			<c:choose>
		                    				<c:when test="${empty waiting.waitSmsTime}">
		                    					<button class="btn" id="send_msg" name="${waiting.waitIdx}">문자 전송</button>	
		                    				</c:when>
		                    				<c:otherwise>
        										<button class="btn" id="waitSmsTime" name="${waiting.waitSmsTime}"></button>
    										</c:otherwise>
		                    			</c:choose>
		                    				
		                    			<!-- 그렇지 않다면 버튼을 그리는게 아니라 그 시간을 계산해서 쭈루루 보여주기  -->
		                    			
		                    			<button class="btn" id="arrived" name="${waiting.waitIdx}">손님 도착</button>
		                    			<button class="btn" id="cancel_wait" name="${waiting.waitIdx}">대기 취소</button>
		                    		</div>
		                    	</div>
		                    </c:forEach>
		                </div>
               	 	</div>
            	</div>
        	</div>
	        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    	</div>
    </div>
</body>
<%@ include file="/WEB-INF/views/include/javascript.jsp" %>
<script type="text/javascript">
     // 현재 시간
     function showClock(){
		 var date = new Date();
		 var divClock = document.getElementById("divClock");
		 if(date.getHours() > 12){
			 var msg = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate() + " 오후 " + (date.getHours()-12)+"시";
		 }else{
		     var msg = "현재 시간 : 오전 " + date.getHours()+"시";
		 }
		 msg+=date.getMinutes()+"분";
		 msg+=date.getSeconds()+"초";
		   
		 divClock.innerText = msg;
		 setTimeout(showClock,1000);
	}
	
	let changeTime = () => {
		
		//console.log(date);
		
		document.querySelectorAll("#waitSmsTime").forEach((e)=>{
			
			let date = new Date();
			let waitSmstime = new Date(e.name);
			
			waitSmstime.setHours(waitSmstime.getHours()+9);
			date = date.getTime();
			waitSmstime = waitSmstime.getTime();
			
			let gangyuk = date-waitSmstime;
			
			var hour = Math.floor((gangyuk % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
			hour = hour*60;
			var minute = Math.floor((gangyuk % (1000 * 60 * 60)) / (1000 * 60));
			
			e.innerHTML = (hour+minute)+"분 경과";
			
		})
		
		setTimeout(changeTime,60000);
	}

    window.addEventListener('load', function() {
    	showClock();   
		changeTime();      	 
    });


    
      
    document.querySelectorAll("#send_msg").forEach((e)=>{
		e.addEventListener("click", (event)=>{
			fetch("/waiting/sendMsg?waitIdx="+e.name,{
				method:"POST"
			})
			.then(response => response.text())
			.then(text => {
				if(text=="success"){
					//console.log("test");
					//location.reload();
		        }else if(text=="fail"){
		        	window.alert("문자 전송 도중 오류가 발생했습니다. 다시 시도해주세요");
		        }
		    })
		})
	})
    
    document.querySelectorAll("#arrived").forEach((e)=>{
		e.addEventListener("click", (event)=>{
			fetch("/waiting/arrived?waitIdx="+e.name,{
				method:"POST"
			})
			.then(response => response.text())
			.then(text => {
				if(text=="success"){
					let waitIdx = e.name;
					let removeTarget = document.querySelector("#"+waitIdx);
					removeTarget.parentNode.removeChild(removeTarget);
		       }else if(text=="fail"){
		          window.alert("손님도착 처리 도중 오류가 발생했습니다. 다시 시도해주세요");
		       }
		    })
		})
	})     
			
	document.querySelectorAll("#cancel_wait").forEach((e)=>{
		e.addEventListener("click", (event)=>{
			fetch("/waiting/cancelWait?waitIdx="+e.name,{
				method:"POST"
			})
			.then(response => response.text())
			.then(text => {
				if(text=="success"){
					let waitIdx = e.name;
					let removeTarget = document.querySelector("#"+waitIdx);
					removeTarget.parentNode.removeChild(removeTarget);
		       }else if(text=="fail"){
		          window.alert("대기 취소 도중 오류가 발생했습니다. 다시 시도해주세요");
		       }
		    })
		})
	})  
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">

window.onload = function(){
	//우측 상단 알림벨 클릭 시 알림창 open/close 작업
	let open = false;
	let bell = document.querySelector(".bell")
	let notifications = document.querySelector(".notifications")
	
	bell.addEventListener("click",(e)=>{
		socketTest();
	    if(open){
	        //open O
	        notifications.style.display = "none";
	        console.log("닫힘");
	        open = false;
	    }else{
	        //open X
	        notifications.style.display = "block";
	        console.log("열림");
	        open = true;
	    }
	})

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

		// [메시지가 오는 메서드]
		sock.onmessage = function(event){
			let data = event.data;
			let p = document.createElement("p");
			p.innerHTML = data;
			document.querySelector("body").appendChild(p);
		}		
    }

	
	function socketTest(){
		if(socket){
			let userId = '${sessionScope.userInfo.memberId}';
			let receiveId = "kakao1700452227";
			let msg = "메시지 입니다";
			socket.send(userId+","+msg+","+receiveId);
		}
	}


	// [메시지 보내는 메서드]
	function sendNotification(receiveId, msg, link){
		if(socket){
			window.alert("멈추나여기서");
			socket.send(receiveId+","+msg+","+link);
		}
	}
	
	let makeNotificationDIV = (content, link, regDate) => {
		let notification = document.createElement("div");
		notification.className = 'notification';

		let notificationMsg = document.createElement("div");
		notificationMsg.className = 'notificationMsg';
		let aTag = document.createElement("a");
		aTag.className = 'fontXSmall'
		aTag.href = link;
		aTag.innerHTML = content;
		notificationMsg.appendChild(aTag);

		let notificationTime = document.createElement("div");
		notificationTime.className = 'notificationTime';
		let pTag = document.createElement("p");
		pTag.className = 'fontXXSmall';
		pTag.innerHTML = regDate;
		notificationTime.appendChild(pTag);

		notification.appendChild(notificationMsg);
		notification.appendChild(notificationTime);

		return notification;
	}
	
	let getNotification = (memberId) => {
		console.log(memberId);
		fetch("/notification/notifications?memberId="+memberId,{
			method:"POST"
		})
		.then(response => response.json())
		.then(json => {
			if(Object.keys(json).length == 0){
				document.querySelector(".notificationCnt").style.display = 'none';
			}else{
				document.querySelector(".notificationCnt").style.display = 'block';
				document.querySelector(".notificationCnt").innerHTML = Object.keys(json).length;
				for(let i=1; i<=Object.keys(json).length; i++){
					let content = json[i].notificationContent;
					let link = json[i].notificationLink;
					let regDate = json[i].notificationRegDate.substring(2,10);
					
					let notification = makeNotificationDIV(content,link,regDate);
					document.querySelector(".notifications").appendChild(notification);
				}
			}
		})
	}

	getNotification('${sessionScope.userInfo.memberId}');	 


	
	
}

let allReadNotification = (memberId) => {
	fetch("/notification/allRead?memberId="+memberId,{
		method:"POST"
	})
	.then(response => response.text())
	.then(text => {
		if(text=='success'){
			document.querySelectorAll(".notification").forEach((e)=>{
				e.parentNode.removeChild(e);
				document.querySelector(".notificationCnt").innerHTML = "";
				document.querySelector(".notificationCnt").style.display = 'none';
			})
			
		}else if(text=='fail'){
			//여기도 예외처리 해야함
		}
	})
}

</script>
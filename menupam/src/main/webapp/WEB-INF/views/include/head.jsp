<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%-- 모든 페이지에서 공통적으로 사용할 head를 작성하는 페이지이다. --%>
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
	//우측 상단 알림벨 클릭 시 알림창 open/close 작업
	let open = false;
	let bell = document.querySelector(".bell")
	let notifications = document.querySelector(".notifications")
	
	bell.addEventListener("click",(e)=>{
		
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

</script>
</head>

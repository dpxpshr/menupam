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
	
	if(bell!=null){
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
	}


    //소켓 관련 JS
    let socket = null;
    
    function connectWs(){
		sock = new SockJS("<c:url value='/echo' />");
		socket = sock;

		sock.onopen = function(){
			console.log("info : sock Connection Open 입니다");
		}

		sock.onclose = function(){
			console.log("info : sock Connection Close 입니다");
		}

		// [메시지가 오는 메서드]
		sock.onmessage = function(event){
			console.log("비동기 알림 메시지 도착");
			let data = event.data;
			deleteNotification();
			getNotification('${sessionScope.userInfo.memberId}');
			let alarm = new Audio();
			alarm.src = '../../../resources/sound/ding-dong.wav';
			alarm.play(); 
		}		
    }
    
    connectWs();

	// [메시지 보내는 메서드]
	function sendNotification(receiveId, content, link){
		if(socket){
			socket.send(receiveId+","+content+","+link);
		}
	}
	
	//[알림 Div 만드는 메서드]
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
	
	//[비동기로 안읽은 알림 내역 가져오는 메서드]
	let getNotification = (memberId) => {
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
	

	//[비동기로 안읽은 알림 내역 가져오는 메서드]
	if(bell!=null){
		getNotification('${sessionScope.userInfo.memberId}');	 	
	}
	
		
	

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
		return year+'-'+month+'-'+date+'T09:00';
	}

	if(document.querySelector("#calendar")!=null){
		document.querySelector("#calendar").min = getToday();	
	}
	
	if(document.querySelector("#reserBtn")!=null){
		document.querySelector("#reserBtn").addEventListener("click",(e)=>{
			//[알림파트]
			//1. 예약버튼 누름 -> 원래 이벤트 잠시 멈춤
			//1-1. 알림을 DB에 저장해주기 ->이거는 service에서 같이 해줬다
			//1-2. 알림을 sendNotification 메서드를 통해 보내준다.
			e.preventDefault();
			sendNotification("${shop.memberId}", "${shop.shopName} 예약이 있습니다!", "/reservation/list?shopIdx=${shop.shopIdx}");
			document.querySelector("#reserForm").submit();
		})		
	}


	
}


//[알림 모두 읽음 처리]
let allReadNotification = (memberId) => {
	fetch("/notification/allRead?memberId="+memberId,{
		method:"POST"
	})
	.then(response => response.text())
	.then(text => {
		if(text=='success'){
/* 			document.querySelectorAll(".notification").forEach((e)=>{
				e.parentNode.removeChild(e);
				document.querySelector(".notificationCnt").innerHTML = "";
				document.querySelector(".notificationCnt").style.display = 'none';
			}) */
			deleteNotification();
		}else if(text=='fail'){
			//여기도 예외처리 해야함
		}
	})
}	


let deleteNotification = () => {
	document.querySelectorAll(".notification").forEach((e)=>{
		e.parentNode.removeChild(e);
		document.querySelector(".notificationCnt").innerHTML = "";
		document.querySelector(".notificationCnt").style.display = 'none';
	})
}
</script>
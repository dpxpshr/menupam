<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript">

window.onload = function(){
	
	let notifications = document.querySelector(".notifications")
	
	//==============[우측 상단 bell클릭시 알림창 열고 닫는 메서드]==============
	let open = false;
	let bell = document.querySelector(".bell")
	if(bell!=null){
		bell.addEventListener("click",(e)=>{
		    if(open){
		        //open O
		        notifications.style.display = "none";
		        console.log("닫힘");
		        allReadNotification('${sessionScope.userInfo.memberId}');
		        open = false;
		    }else{
		        //open X
		        notifications.style.display = "block";
		        console.log("열림");
		        open = true;
		    }
		})	
	}


    //==============[소켓 기본 설정 JS]==============
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

		//==============[알림 메시지 도착]==============
		sock.onmessage = function(event){
			console.log("알림 메시지 도착");
			let data = event.data;
			//[소리 재생(필요없음)]
			let alarm = new Audio();
			alarm.src = '../../../resources/sound/ding-dong.wav';
			alarm.play();
			//[원래 있던 알림들을 다 삭제 한다]
			deleteNotification();
			//[DB가 변동 되었으니 다시 그려준다]
			getNotification('${sessionScope.userInfo.memberId}');
		}		
    }
    
    connectWs();

  	//==============[echoHandler로 메시지 보내는 메서드]==============
	function sendNotification(receiveId, content, link){
		if(socket){
			socket.send(receiveId+","+content+","+link);
		}
	}
	
	//==============[내용,링크,등록일 으로 알림div 만들어 반환하는 메서드]==============
	let makeNotificationDIV = (content, link, regDate) => {
		let notification = document.createElement("div");
		notification.className = 'notification';

		let notificationMsg = document.createElement("div");
		notificationMsg.className = 'notificationMsg';
		let aTag = document.createElement("a");
		aTag.style.fontSize = '12px';
		aTag.href = link;
		aTag.innerHTML = content;
		notificationMsg.appendChild(aTag);

		let notificationTime = document.createElement("div");
		notificationTime.className = 'notificationTime';
		let pTag = document.createElement("p");
		pTag.style.fontSize = '11px';
		pTag.innerHTML = regDate;
		notificationTime.appendChild(pTag);

		notification.appendChild(notificationMsg);
		notification.appendChild(notificationTime);

		return notification;
	}
	
	//==============[DB에 저장된 알림 가져와서 알림창에 그려주는 메서드]==============
	let getNotification = (memberId) => {
		fetch("/notification/notifications?memberId="+memberId,{
			method:"POST"
		})
		.then(response => response.json())
		.then(json => {
			if(Object.keys(json).length == 0){
				document.querySelector(".notificationCnt").style.display = 'none';
			}else{
				console.log(json);
				let notificationCnt = 0;
				for(let i=1; i<=Object.keys(json).length; i++){
					if(json[i].notificationCheck == '0'){
						notificationCnt++;
						let content = json[i].notificationContent;
						let link = json[i].notificationLink;
						let regDate = json[i].notificationRegDate.substring(2,10);
						let notification = makeNotificationDIV(content,link,regDate);
						document.querySelector(".notifications").appendChild(notification);
					}else if(json[i].notificationCheck == '1'){
						let content = json[i].notificationContent;
						let link = json[i].notificationLink;
						let regDate = json[i].notificationRegDate.substring(2,10);
						let notification = makeNotificationDIV(content,link,regDate);
						notification.style.opacity = '0.6';
						document.querySelector(".notifications").appendChild(notification);						
					}
				}
				
				if(notificationCnt==0){
					document.querySelector(".notificationCnt").style.display = 'none';
				}else{
					document.querySelector(".notificationCnt").style.display = 'block';
					document.querySelector(".notificationCnt").innerHTML = notificationCnt;	
				}
				
				
				// 아까 예약 승인 , 예약 신청만 이상하지
				
				
				/* document.querySelector(".notificationCnt").style.display = 'block';
				document.querySelector(".notificationCnt").innerHTML = Object.keys(json).length;
				for(let i=1; i<=Object.keys(json).length; i++){
					let content = json[i].notificationContent;
					let link = json[i].notificationLink;
					let regDate = json[i].notificationRegDate.substring(2,10);
					let notification = makeNotificationDIV(content,link,regDate);
					document.querySelector(".notifications").appendChild(notification);
				} */
			}
		})
	}
	

	//==============[실행부(DB에 저장된 알림 가져와서 알림창에 그려주는 메서드)]==============
	if(bell!=null){
		getNotification('${sessionScope.userInfo.memberId}');	 	
	}
	
		
	
	//==============[오늘 날짜 반환하는 메서드]==============
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

	//==============[캘린더 최소 날짜를 오늘로 지정]==============
	if(document.querySelector("#calendar")!=null){
		document.querySelector("#calendar").min = getToday();	
	}
	
	//==============[예약 버튼 누르면 알림 전송 & DB에 데이터 전송]==============
	if(document.querySelector("#reserBtn")!=null){
		document.querySelector("#reserBtn").addEventListener("click",(e)=>{
			e.preventDefault();
			sendNotification("${shop.memberId}", "${shop.shopName} 예약이 있습니다!", "/reservation/reque?shopIdx=${shop.shopIdx}");
			document.querySelector("#reserForm").submit();
		})		
	}
	
	//==============[DB에서 나온 date를 (4/30 오후 3:00)로 바꾸는 메서드]==============
	let getDate = (dbDate) => {
		let date = dbDate.substring(5,7)+"/"+dbDate.substring(8,10);
		let hour = Number(dbDate.substring(11,13));
		let korean = null;
		if(hour<12){
			korean = "오전"
		}else{
			korean = "오후"
			hour = hour-12;
		}
		let time = korean+" "+hour+":"+dbDate.substring(14,16);
		return date+" "+time;
	}
	
	//==============[예약 승인 누르면 알림 전송 & DB에 데이터 전송]==============
	if(document.querySelector("#reserv_ok") != null){
		document.querySelectorAll("#reserv_ok").forEach((e)=>{
	        e.addEventListener("click", (event)=>{
	           fetch("/reservation/approveRes?reserIdx="+e.name,{
	              method:"POST"
	           })
	           .then(response => response.text())
	           .then(text => {
	              if(text=="success"){
	                 let reserIdx = e.name;
	                 let removeTarget = document.querySelector("#"+reserIdx);
	                 removeTarget.parentNode.removeChild(removeTarget);
						//비동기로 알림 보내주어야 함
						if(e.dataset.id != 'notMember'){
							//회원이 이니까 예약완료라고 알림 보내주자
							sendNotification(e.dataset.id, '${shop.shopName} 예약이 완료 되었습니다!', "/member/mypage");
							// 문자도 보내주자
							let date = getDate(e.dataset.date);
							let content = "[메뉴팜] ${shop.shopName} 예약 알림\n예약이 정상적으로 완료 되었습니다.\n"+date;
							fetch("/notification/sms?phone="+e.dataset.phone+"&content="+encodeURI(content,"UTF-8"),{
			                	method:"POST"
			              	})
							.then(response => response.text())
							.then(text => {})
						}
	              }else if(text=="fail"){
	                 window.alert("승인 도중 오류가 발생했습니다. 다시 시도해주세요");
	              }
	           })
	        })
	    })    
	}
	
	//==============[예약 거절 누르면 알림 전송 & DB에 데이터 전송]==============
	if(document.querySelector("#reserv_not") != null){
	    document.querySelectorAll("#reserv_not").forEach((e)=>{
            e.addEventListener("click", (event)=>{
               fetch("/reservation/rejectRes?reserIdx="+e.name,{
                  method:"POST"
               })
               .then(response => response.text())
               .then(text => {
                  if(text=="success"){
                     let reserIdx = e.name;
                     let removeTarget = document.querySelector("#"+reserIdx);
                     removeTarget.parentNode.removeChild(removeTarget);
                   	 //비동기로 알림 보내주어야 함
						if(e.dataset.id != 'notMember'){
							//회원이 이니까 예약완료라고 알림 보내주자
							sendNotification(e.dataset.id, '${shop.shopName} 예약이 거부 되었습니다!', "/member/mypage");
							let content = "[메뉴팜] ${shop.shopName} 예약 알림\n예약이 가게 사정으로 인해 거부 되었습니다.\n";
							// 문자도 보내주자 
							fetch("/notification/sms?phone="+e.dataset.phone+"&content="+encodeURI(content,"UTF-8"),{
			                	method:"POST"
			              	})
							.then(response => response.text())
							.then(text => {})
						}
                  }else if(text=="fail"){
                     window.alert("승인 거부 도중 오류가 발생했습니다. 다시 시도해주세요");
                  }
               })
            })
        })
	}
}


//==============[알림 모두 읽음 DB Update & 모두 회색으로 변경]==============
let allReadNotification = (memberId) => {
	fetch("/notification/allRead?memberId="+memberId,{
		method:"POST"
	})
	.then(response => response.text())
	.then(text => {
		if(text=='success'){
			grayNotification();
		}else if(text=='fail'){
			//여기도 예외처리 해야함
		}
	})
}	

//==============[알림 들을 회색으로 변경하는 메서드]==============
let grayNotification = () => {
	document.querySelectorAll(".notification").forEach((e)=>{
		//e.parentNode.removeChild(e);
		e.style.opacity = '0.6';
 		document.querySelector(".notificationCnt").innerHTML = "";
		document.querySelector(".notificationCnt").style.display = 'none'; 
	})
}


//==============[알림 모두 삭제하는 메서드]==============
let deleteNotification = () => {
	document.querySelectorAll(".notification").forEach((e)=>{
		e.parentNode.removeChild(e);
		//e.style.opacity = '0.6';
 		document.querySelector(".notificationCnt").innerHTML = "";
		document.querySelector(".notificationCnt").style.display = 'none'; 
	})
}

//===============================================================절취선===============================================================
 	let getTodayforList = () => {
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
	
	
	//==============[reservationList.jsp 에서 예약 내역 생성하는 메서드]==============
	let makeReservBox = (reserName, reserParty, reserDate, reserIdx, reserPhone, reserComment) => {
	//let makeReservBox = (json) => {
		let reserv_box = document.createElement("div");
		reserv_box.className = "reserv_box";
		reserv_box.id = reserIdx;
		let box = document.createElement("div");
		box.className = "box";
		let reserv_info = document.createElement("span");
		let reserv_info2 = document.createElement("span");
		reserv_info.className = "reserv_info";
		let infoStr = reserName+"  "+reserParty+"인 "+reserDate.slice(-5);
		reserv_info.innerHTML = infoStr;
		let infoStr2 = reserPhone;
		reserv_info2.className = "reserv_info";
		reserv_info2.innerHTML = infoStr2;
	
		// <button class="btn" id="cancel_reserv"
		// 								name="${reservation.reserIdx}">예약 취소</button>
		let cancel_reserv = document.createElement("button");
		cancel_reserv.className = "btn";
		cancel_reserv.id = "cancel_reserv";
		cancel_reserv.name = reserIdx;
		cancel_reserv.innerHTML = "예약 취소";
		cancel_reserv.addEventListener("click", (event)=>{
			fetch("/reservation/cancelRes?reserIdx="+reserIdx,{
				method:"POST"
			})
			.then(response => response.text())
			.then(text => {
				if(text=="success"){
					let removeTarget = document.querySelector("#"+reserIdx);
					removeTarget.parentNode.removeChild(removeTarget);
					//취소된 친구 아이디, 
					sendNotification("test","test","test");
					
					let content = "[메뉴팜] ${shop.shopName} 예약 알림\n예약이 가게 사정으로 인해 취소 되었습니다.\n";
					// 문자도 보내주자 
					fetch("/notification/sms?phone="+reserPhone+"&content="+encodeURI(content,"UTF-8"),{
	                	method:"POST"
	              	})
					.then(response => response.text())
					.then(text => {
						
					})
				}else if(text=="fail"){
					window.alert("예약 취소 도중 오류가 발생했습니다. 다시 시도해주세요");
				} 
			}) 
		})
		//1. 매개변수로 버튼(cancel_reserv)를 받아옴
		//2. 그 받아온 애에다가 eventListener 걸어줌
		//3. return cancel_reserv 해줌
	
		//<p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>\
		let comment = document.createElement("p");
		comment.className = "fontXSmall";
		comment.innerHTML = "요청 사항 : "+reserComment;
	
		box.appendChild(reserv_info);
		box.appendChild(reserv_info2);
		box.appendChild(cancel_reserv);
	
		reserv_box.appendChild(box);
		reserv_box.appendChild(comment);
		
		return reserv_box;
	}
	
	//==============[예약 리스트가 없을때 '예약이 없습니다' 그리는 메서드]==============
	let noRes = ()=>{
		let msg = document.createElement("p");
		msg.className = "fontXSmall";
		msg.innerHTML = "예약이 없습니다."
		document.querySelector(".wrap_box").appendChild(msg);
	}

</script>
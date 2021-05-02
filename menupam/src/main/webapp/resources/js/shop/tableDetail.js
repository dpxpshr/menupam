const context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));



function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}

let mypage = () => {
	var memberIdinfo = '${sessionScope.userInfo.memberId}';
	if(memberIdinfo != ''){
	location.href = "${context}/member/mypage";
		
	}else{
		location.href = "${context}/member/login";
	}
	
}
document.querySelectorAll(".menuCategory").forEach((e)=>{
	 e.addEventListener("click", (event)=>{
		
	    let menuItems = e.nextSibling.nextSibling;
        //만약 클래스명에 active가 없다면 넣어주기
        if(menuItems.className.indexOf("active") != -1){
            menuItems.className = "menuItems";
        }else{
            menuItems.className += " active";
        }
	})
})

/* 취소 할 메뉴 이름 찾기 */
document.querySelectorAll(".menuCancel").forEach((e)=>{
	 e.addEventListener("click", (event)=>{
		let check = confirm("정말 취소 하시겠습니까?");
		
		if(check){
			let menuName = event.srcElement.parentElement.parentElement
				.previousElementSibling.previousElementSibling.previousElementSibling.innerHTML;
				
			let menuOrders = {}
			menuOrders.orderMenuName = menuName;
			
			let xhr2 = new XMLHttpRequest();
			xhr2.open("post", context + "/cancelMenu");
			xhr2.setRequestHeader("content-type", "application/json");
			xhr2.send(JSON.stringify(menuOrders));
			
			xhr2.onreadystatechange = () =>{
				if(xhr2.status == 200){
					if(xhr2.responseText == "cancelSuccess"){
						location.href = context + "/tableDetail";
					}
				}else{
					error.alertMessage();
				}
			}
		}
	   
	})
})

$(".tableBack").addEventListener("click",()=>{
	location.href = context + "/shopManage";
})

$(".tableEmpty").addEventListener("click",()=>{
	
	let check = confirm("정말 자리를 비우시겠습니까?");
	
	if(check){
		
		let table = document.querySelector(".tableInform");
		let tableNum = table.firstChild.nextSibling.nextSibling.innerHTML;
		let tableJson = {}
		tableJson.orderTableNum = tableNum;
		
		fetch(context+"/tableNum",{
			method : "post",
			headers : {"Content-Type": "application/json"},
			body : JSON.stringify(tableJson)
		}).then(response =>{
			if(response.ok){
				return response.text();
			}
		}).then(text =>{
			if(text == "tableNumSuccess"){
				alert(tableNum + "번 테이블 자리를 비웠습니다.");
				location.href = context + "/shopManage";
			}
			else if(text == "fail"){
				alert("잘못된 정보 입니다.");
				location.href = context + "/shopManage";				
			}
		})
	}
	
});


const context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}


$(".btnLarge").addEventListener("click",()=>{
	let check = confirm("정말 대기취소를 하시겠습니까?");
	
	if(check){
		let num = document.querySelector(".wrap_info");
		let waitNum = num.firstChild.nextElementSibling.nextElementSibling.nextElementSibling.lastElementChild.innerHTML;
		let waitJson = {}
		waitJson.waitIdx = waitNum;
		
		fetch(context+"/waitPass",{
			method : "post",
			headers : {"content-Type": "application/json"},
			body : JSON.stringify(waitJson)
		}).then(response =>{
			if(response.ok){
				return response.text();
			}
			
		}).then(text =>{
			if(text == "waitSuc"){
				alert(waitNum + "대기가 취소 되었습니다.")
				location.href = context + "/mypage/waiting";
			}
			else if(text == "fail"){
				alert("잘못된 정보 입니다.");
				location.href = context + "/mypage/waiting";
			}
		})
		
		
		console.log(waitNum);
		
	}
	
	
})
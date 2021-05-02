
const context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}


$(".btnLarge").addEventListener("click",()=>{
	
	let check = confirm("정말 예약취소를 하시겠습니까?");
	
	if(check){
		let num = document.querySelector(".wrap_info");
		let idxNum = num.firstChild.nextSibling.nextElementSibling.nextElementSibling.lastElementChild.innerHTML;
		let numJson = {}
		numJson.reserIdx = idxNum;
		
		fetch(context+"/reserPass",{
			method : "post",
			headers : {"content-Type": "application/json"},
			body : JSON.stringify(numJson)
		}).then(response =>{
			if(response.ok){
				return response.text();
			}
		}).then(text =>{
			if(text == "updateSuc"){
				alert(idxNum + "주문이 취소 되었습니다.");
				location.href = context + "/mypage/reservation";
			}
			else if(text == "fail"){
				alert("잘못된 정보 입니다.");
				location.href = context + "/mypage/reservation";
			}
		
		})
		
		console.log(idxNum);
		
	}
	
})

















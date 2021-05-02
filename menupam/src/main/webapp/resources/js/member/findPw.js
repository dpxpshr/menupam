
const context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}


$(".btnLarge").addEventListener("click",()=>{
	
	let check = confirm("비밀번호를 변경 하시겠습니까?");
	
	if(check){
		let pw = document.querySelector(".pwinfo");
		let Pwnum = pw.firstChild.nextElementSibling.innerHTML
		
		console.log(Pwnum);
		
		let pwJson = {}
		pwJson.memberPw = Pwnum;
	
		fetch(context+"/updatePw",{
			method : "post",
			headers : {"content-Type": "application/json"},
			body : JSON.stringify(pwJson)
		}).then(response =>{
			if(response.ok){
				return response.text();
			}
		
		
		}).then(text =>{
			if(text == "updatePwc"){
				alert(Pwnum + "비밀번호가 변경 되었습니다.");
				location.href = context + "/mypage/login";
			}else if(text == "fail"){
				alert("잘못된 정보 입니다.");
				location.href = context + "/mypage/findPw";
			
			}
		})
		
		}
		})
		

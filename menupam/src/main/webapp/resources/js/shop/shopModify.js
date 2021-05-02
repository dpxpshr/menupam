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
// 체크박스 전체 선택
$('input[name="shopPackAble"]').addEventListener('click', (e)=>{
	
	if($('input[name="shopPackAble"]').checked){
		e.checked = true;
		$('input[name="shopPackAble"]').value = "Y";
	}else{
		e.checked = false;
		$('input[name="shopPackAble"]').value = "N";
		
	}
});

$('.btnLarge').addEventListener('click',(e)=>{
	
	let check = confirm("정말 수정 하시겠습니까?");
	
	if(check){
		e.target.type = "submit";
		alert("매장 정보 수정 완료 되었습니다.");
	}else{
		e.target.type = "button";
	}
})
function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}

// 체크박스 전체 선택
$('input[name="checkPackAble"]').addEventListener('click', (e)=>{
	
	if($('input[name="checkPackAble"]').checked){
		e.checked = true;
		$('input[name="shopPackAble"]').value = "Y";
	}else{
		e.checked = false;
		$('input[name="shopPackAble"]').value = "N";
		
	}
	console.log($('input[name="shopPackAble"]').value);
});
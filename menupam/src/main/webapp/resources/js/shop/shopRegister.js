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
	
});

$(".all").addEventListener("click",()=>{
	document.querySelectorAll('.check').forEach((e)=>{
		
		if($('.all').checked){
			e.checked = true;
		}else{
			e.checked = false;
		}
		
	})
})

$(".btnXLarge").addEventListener("click", ()=>{
	if($('.all').checked){
		return;
	}else{
		alert("모든 약관에 동의 하셔야 합니다.");
	}
})

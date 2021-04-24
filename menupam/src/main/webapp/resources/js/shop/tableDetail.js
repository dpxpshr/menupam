const context = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
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
			
			let xhr = new XMLHttpRequest();
			xhr.open("post", context + "/cancelMenu");
			xhr.setRequestHeader("content-type", "application/json");
			xhr.send(JSON.stringify(menuOrders));
			
			xhr.onreadystatechange = () =>{
				if(xhr.status == 200){
					if(xhr.responseText == "cancelSuccess"){
						location.href = context + "/tableDetail";
					}
				}else{
					eroor.alertMessage();
				}
			}
		}
	   
	})
})
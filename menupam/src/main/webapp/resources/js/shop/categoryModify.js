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

document.querySelector("#addBtn").addEventListener("click", (e)=>{
   
    let categoryBox = document.createElement("div");
    categoryBox.className = "categoryBox";
	
	
    let form = document.createElement("form");
	form.action = context + "/addCategory";
	form.method = "post";
	
    let categoryInput = document.createElement("div");
    categoryInput.className = "categoryInput";
    let inputText = document.createElement("input");
    inputText.type = "text";
    inputText.className = "inputMedium";
 	inputText.name = "menuCategoryName";

    let categoryBtn1 = document.createElement("div");
    let categoryBtn2 = document.createElement("div");
    categoryBtn1.className = "categoryBtn";
    categoryBtn2.className = "categoryBtn";

    let modifyBtn = document.createElement("input");
    modifyBtn.type = "button";
    modifyBtn.value = "카테고리 추가";
    modifyBtn.className = "btnSmall";

    let deleteBtn = document.createElement("input");
    deleteBtn.type = "button";
    deleteBtn.value = "삭제";
    deleteBtn.className = "btnXSmall red";

    categoryBtn1.appendChild(modifyBtn);
    categoryBtn2.appendChild(deleteBtn);

    categoryInput.appendChild(inputText);
    form.appendChild(categoryInput);

    form.appendChild(categoryBtn1);
    form.appendChild(categoryBtn2);
    categoryBox.appendChild(form);

    document.querySelector(".categoryBoxs").appendChild(categoryBox);
	
	/* 추가된것만 삭제 할 경우 */
	deleteBtn.addEventListener("click",()=>{
		categoryBtn1.parentElement.parentElement.remove();
	})
	
	/* 추가 버튼 이벤트 발생 */
	modifyBtn.addEventListener("click" ,(e)=>{
		let check = confirm("정말 추가 하시겠습니까?");
		
		if(check){
			e.target.type = "submit";
		}else{
			e.target.type = "button";
		}
	})
	
	
})

/* 기존 카테고리에 저장된 정보를 삭제할 경우 */
document.querySelectorAll(".btnXSmall").forEach((e)=>{
	
	e.addEventListener("click",(event)=>{
		
		let check = confirm("정말 삭제 하시겠습니까?");
		
		if(check){
			
			let menuCategoryName = event.target.form.querySelector(".inputMedium").value;
			let menuCategoryIdx = event.target.form.querySelector(".categoryIdx").value;
			
			let category = {}
			category.menuCategoryName = menuCategoryName;
			category.menuCategoryIdx = menuCategoryIdx;
			
			let xhr = new XMLHttpRequest();
			xhr.open("post", context + "/deleteCategory");
			xhr.setRequestHeader("content-type", "application/json");
			xhr.send(JSON.stringify(category));
			
			xhr.onreadystatechange = () =>{
				if(xhr.status == 200){
					if(xhr.responseText == "success"){
						document.querySelector(".categoryBox").remove();
						location.href = context + "/categoryModify";
						
					}
				}else{
					eroor.alertMessage();
				}
			}
			
		}else{
			event.target.type = "button";
		}
		
	})
	
})

document.querySelectorAll(".btnSmall").forEach((e)=>{
	e.addEventListener("click",(event)=>{
		let check = confirm("정말 수정 하시겠습니까?");
		
		if(check){
			event.target.type = "submit";
		}else{
			event.target.type = "button";
		}
	})
})


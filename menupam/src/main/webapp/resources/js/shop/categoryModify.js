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

document.querySelector("#addBtn").addEventListener("click", (e)=>{
   
    let categoryBox = document.createElement("div");
    categoryBox.className = "categoryBox";
	
    let form = document.createElement("form");
    let categoryInput = document.createElement("div");
    categoryInput.className = "categoryInput";
    let inputText = document.createElement("input");
    inputText.type = "text";
    inputText.className = "inputMedium";

    let categoryBtn1 = document.createElement("div");
    let categoryBtn2 = document.createElement("div");
    categoryBtn1.className = "categoryBtn";
    categoryBtn2.className = "categoryBtn";

    let modifyBtn = document.createElement("input");
    modifyBtn.type = "button";
    modifyBtn.value = "정보 수정 완료";
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
		console.log(categoryBtn1.parentElement.parentElement.remove());
	})
})

/* 기존 카테고리에 저장된 정보를 삭제할 경우 */
document.querySelectorAll(".btnXSmall").forEach((e)=>{
	
	e.addEventListener("click",()=>{
		document.querySelector(".categoryBox").remove();
	})
	
})
function $(selector,text) {
	if(text){
		document.querySelector(selector).innerHTML += `${text}<br>`;
	}
		
	return document.querySelector(selector);
}

$(".btnXLarge").addEventListener("click", ()=>{
	
	const KAKAO_API_KEY = "KakaoAK 994cea81558b0dc8f4f8c6b2b4bd0488";
	let address = document.getElementById("inputAddress").value;
	let url = "https://dapi.kakao.com/v2/local/search/address.json?query=" + address;
	
	console.log(address);
	
	let header = new Headers();
	header.append("Authorization",KAKAO_API_KEY);
	
	fetch(url,{
		method : "GET",
		headers : header,
	})
	.then(response => response.json())
	.then(json => {		
		document.getElementById("shopX").value = json.documents[0].x;
		document.getElementById("shopY").value = json.documents[0].y;
		registShop.submit();
	})
})
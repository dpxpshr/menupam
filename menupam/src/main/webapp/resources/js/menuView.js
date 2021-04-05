$(document).ready(function(){
	$('.header').slick({
		dots: true, 
        infinite:true,
        autoplay:true,
        slidesToShow: 1,
        centerPadding:'150px',
        fade:true,
        speed:3000
	});
});
		
		
document.querySelectorAll(".menuCategory").forEach((e)=>{
    e.addEventListener("click", (event)=>{
        let menuItems = e.nextSibling.nextSibling;
		
        //만약 클래스명에 active가 없다면 넣어주기
        if(menuItems.className.indexOf("active") != -1){
			menuItems.className = "menuItems";
        }else{
            menuItems.className = "menuItems active";
        }
    })
})
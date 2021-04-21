<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/menuCart.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="wrapper">
        <header class="header">
            <div class="search">
                <i class="fas fa-search"></i>
            </div>
            <div class="notice">
                <i class="far fa-clipboard"></i>
            </div>
        </header>
        <section class="main">
        	<!-- 사용자 session에 저장된 메뉴정보를 출력하고 수량추가 or 제거를 할 수 있는 화면-->
        	<!-- 
        		세션에 저장 : String-String Map MenuIdx-가격
        		주문하기 클릭시 MenuIdx + 수량을 서버로 전송한다.
        	 -->
            <div class="cartTop">
            	<div class="cartName">장바구니</div><a onclick="deleteAll()">전체삭제</a>
			</div>
            <div class="shopName">${shop.shopName}</div>
            <div class="List">주문내역</div>
            <c:forEach items="${sessionScope.cart}" var="menu">
	            <div class="menuItem">
	            	<div class="menuItem_Left">
	            		<div class="menuItem_Name">${menu.menuName}</div>
	            		<span class="${menu.menuIdx}unit_price" style="display:none">${menu.menuPrice}</span> <!-- 메뉴의 1개당 가격을 저장 -->
	            		<div class="menuItem_Price"><span class="${menu.menuIdx}price">${menu.menuPrice * menu.count}</span> 원</div> <!-- 실제 화면에 나타나는 가격 -->
	            	</div>
	            	<div class="menuItem_Right">
	            		<div class="menuItem_Delete" onclick="deletemenu('${menu.menuIdx}')">
	            			<a><i class="far fa-trash-alt"></i></a>
	            		</div>
	            		<div class="menuItem_Count">
	            			<a onclick="minusmenu('${menu.menuIdx}')"><i class="fas fa-minus"></i></a> <span class="${menu.menuIdx}count">${menu.count}</span> 개 
	            			<a onclick="plusmenu('${menu.menuIdx}')"><i class="fas fa-plus"></i></a>
	            		</div>
	            	</div>
	            </div>
			</c:forEach>
            
        </section>
        
        
        
        

        <button class="menuOrder" onclick="payment()">주문하기</button>
        
       
        <script type="text/javascript">
        	document.querySelector(".shopName").addEventListener("click",()=>{
        		location.href="/order/menuview?shopIdx=${shop.shopIdx}"
        	});
        	let deleteAll = ()=>{ //전체 메뉴 제거
        		fetch("/order/modifycart?&remove=all",{method:"GET"})
				.then(response=>{
					if(response.ok){
						location.href="/order/menucart?shopIdx=${shop.shopIdx}";
					}else{
						alert("통신에 오류가 발생하였습니다.");
					}
				});
        	}
        	
        	let deletemenu = (menuIdx)=>{ //메뉴 제거
        		fetch("/order/modifycart?menuIdx="+menuIdx+"&remove=this",{method:"GET"})
				.then(response=>{
					if(response.ok){
						location.href="/order/menucart?shopIdx=${shop.shopIdx}";
					}else{
						alert("통신에 오류가 발생하였습니다.");
					}
				});
        	}
        	let plusmenu = (menuIdx)=>{ //주문 수량 1개 증가
        		fetch("/order/modifycart?menuIdx="+menuIdx+"&countTo=plus",{method:"GET"})
				.then(response=>{
					if(response.ok){
						document.querySelector("."+menuIdx+"count").innerHTML++;
						document.querySelector("."+menuIdx+"price").innerHTML = document.querySelector("."+menuIdx+"count").innerHTML * document.querySelector("."+menuIdx+"unit_price").innerHTML;
					}else{
						alert("통신에 오류가 발생하였습니다.");
					}
				});
        	}
        	let minusmenu = (menuIdx)=>{ //주문 수량 1개 감소
        		fetch("/order/modifycart?menuIdx="+menuIdx+"&countTo=minus",{method:"GET"})
				.then(response=>{
					if(response.ok){
						if(document.querySelector("."+menuIdx+"count").innerHTML > 1){
							document.querySelector("."+menuIdx+"count").innerHTML--;
							document.querySelector("."+menuIdx+"price").innerHTML = document.querySelector("."+menuIdx+"count").innerHTML * document.querySelector("."+menuIdx+"unit_price").innerHTML;
						}
					}else{
						alert("통신에 오류가 발생하였습니다.");
					}
				});
        	}
			let payment = ()=>{
				location.href = "/order/payment?shopIdx=${shop.shopIdx}";
			}
    	</script>
        <footer class="footer">
            <div class="menuView"><i class="fas fa-store"></i></div>
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div>
    <script type="text/javascript">
	    document.querySelector(".menuView").addEventListener("click",()=>{
			location.href="/order/menuview?shopIdx=${shop.shopIdx}";
		});
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/payment.css'>
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
            <div class="paymentTop">${shop.shopName} 주문 정보</div>
            <div class="paymentInfo">
            	
            	<p>휴대폰 번호</p>
            	<input type="text" placeholder="01011112222">
            	
            	<p>주문 요청 사항</p>
            	<input type="text" placeholder="ex) 조금 매콤하게 부탁드립니다^_^">
            	
            	<p>주문 유형</p>
            	<input type="text" placeholder="테이블 번호(QR코드 스켄시 자동 입력)">
            	<c:if test="${shop.shopPackAble == 'Y'}">
            		<div id="checkBox"><input type="checkbox" id="check_pack"> 포장 주문</div> <!-- shop의 정보를 읽고, 활성화 or 비활성화 -->
            	</c:if>
            	<p>결제 정보</p>
            	<div  id="paymentBox" ><input type="radio" name="pay_method" id="radio_direct" checked="checked"> 매장 직접 결제</div>
            	<div id="paymentBox" ><input type="radio" name="pay_mehtod" id="radio_kakao"><img src="../../resources/images/카카오페이.png"> 카카오페이 결제</a>
            	<div class="paymentList">
            		<c:forEach items="${orderMenu}" var="menu">
	            		<div class="money"> 
	            			<p>${menu.orderMenuName} ${menu.orderMenuCnt}개</p>
	            			<div>${menu.orderMenuCnt * menu.orderMenuPrice}원</div>
	            		</div>
            		</c:forEach>
            		<hr>
            		<div class="sum">
            			<p>총 결제 금액</p>
            			<div>${order.orderPrice}원</div>
            		</div>
            	</div>
            </div>
        </section>
        <button class="discard" onclick="discard()">주문취소</button>
        <button class="payments" onclick="pay()">결제하기</button>
        <footer class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></div>
            <div><i class="far fa-user"></i></div>
        </footer> 
    </div>
    <script type="text/javascript">
    	let discard = ()=>{
    		if (confirm("정말 주문을 취소하시겠습니까?")) {
    			location.href="/order/discard?orderIdx=${order.orderIdx}";
			}
    	}
    	let pay = ()=>{
    		if(confirm("결제하시겠습니까?")){ 
    			if(document.querySelector("#radio_direct").checked){ //직접 결제 진행
    				location.href="/order/pay?payType=일반&shopIdx=${shop.shopIdx}&orderIdx=${order.orderIdx}";
    			}else if(document.querySelector("#radio_kakao").checked){ //여기서 카카오페이 결제 진행
    				let url = "https://kapi.kakao.com/v1/payment/ready";
    				let header = new Headers();
    				header.append("Authorization","KakaoAK 391cbc9b669382620463a8b72d1632c0");
    				header.append("Content-type","application/x-www-form-urlencoded;charset=utf-8");
    				let body = {
    					cid : "TC0ONETIME", //카카오페이 테스트 가맹점 코드
    					partner_order_id : "${order.orderIdx}", 
    					partner_user_id : "${userInfo.memberId}",
    					item_name : "${shop.shopName} 주문",
    					quantity : 1,
    					total_amount : "${order.orderPrice}",
    					tax_free_amount : 0,
    					approval_url : "결제 성공시 보낼 url",
    					cancel_url : "결제 취소시 보낼 url",
    					fail_url : "결제 실패시 보낼 url"
    				};
    				
    				//fetch로 카카오 결제준비 요청후 받아온 url로 카카오 결제 진행
    				fetch(url,{method : "post", headers : header})
    				
    				//결제 끝나고 서버에 결제확인 요청
    			}	
    		}
    	}
    </script> 
</body>
</html>
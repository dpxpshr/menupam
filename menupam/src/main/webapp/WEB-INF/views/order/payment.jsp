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
<%@ include file="/WEB-INF/views/include/notification.jsp" %>
        <section class="main">
            <div class="paymentTop">${shop.shopName} 주문 정보</div>
            <div class="paymentInfo">
            	<c:if test="${shop.shopPackAble == 'Y'}">
            		<div id="checkBox"><input type="checkbox" id="check_pack"> 포장 주문</div> <!-- shop의 정보를 읽고, 활성화 or 비활성화 -->
            	</c:if>
            	<p>결제 방법</p>
            	<div class="paymentBox"><input type="radio" name="pay_method" id="radio_direct" checked="checked"> 매장 직접 결제</div>
            	<div class="paymentBox"><input type="radio" name="pay_method" id="radio_kakao"><img src="../../resources/images/카카오페이.png"> 카카오페이 결제</a>
            	<br><br><br>
            	<p>결제 정보</p>
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
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        
        
    </div>
    <%@ include file="/WEB-INF/views/include/javascript.jsp" %>
    <c:if test="${changed != null}">
	    <script type="text/javascript">
	    	alert("아직 결제하지 않은 정보가 있어, 장바구니의 정보가 교체되었습니다.");
	    </script>
    </c:if>
    <script type="text/javascript">
    	let discard = ()=>{
    		if (confirm("정말 주문을 취소하시겠습니까?")) {
    			location.href="/order/discard?shopIdx=${shop.shopIdx}&orderIdx=${order.orderIdx}";
			}
    	}
    	let pay = ()=>{
   			if(document.querySelector("#radio_direct").checked && confirm("일반 결제로 결제하시겠습니까?")){ //직접 결제 진행
   				location.href="/order/pay?payType=일반&shopIdx=${shop.shopIdx}&orderIdx=${order.orderIdx}";
   			}else if(document.querySelector("#radio_kakao").checked && confirm("카카오페이로 결제하시겠습니까?")){ //여기서 카카오페이 결제 진행
   				window.open("/order/pay?payType=카카오&shopIdx=${shop.shopIdx}&orderIdx=${order.orderIdx}");	
   			}	
    	}
    </script> 
</body>
</html>
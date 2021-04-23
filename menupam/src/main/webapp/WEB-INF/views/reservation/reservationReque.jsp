<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<title>메뉴팜</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' type='text/css' media='screen'
   href='../../../resources/css/reset.css'>
<link rel='stylesheet' type='text/css' media='screen'
   href='../../../resources/css/main.css'>
<link rel='stylesheet' type='text/css' media='screen'
   href='../../../resources/css/shopModify.css'>
<link rel='stylesheet' type='text/css' media='screen'
   href='../../../resources/css/reservationReque.css'>
<script src='main.js'></script>
<script src="https://kit.fontawesome.com/e5012d0871.js"
   crossorigin="anonymous"></script>
<style type="text/css">
</style>

</head>
<body>
   <script type="text/javascript">
function showClock(){
   var date = new Date();
   var divClock = document.getElementById("divClock");
   if(date.getHours() > 12){
      var msg = date.getFullYear() + "." + (date.getMonth()+1) + "." + date.getDate() + " 오후 " + (date.getHours()-12)+"시";
   }
   else{
      var msg = "현재 시간 : 오전 " + date.getHours()+"시";
   }
   msg+=date.getMinutes()+"분";
   msg+=date.getSeconds()+"초";
   
   divClock.innerText = msg;
   setTimeout(showClock,1000);
}

</script>
   <div class="wrapper">
      <div class="header">
         <div class="search">
            <i class="fas fa-search"></i>
         </div>
         <div class="notice">
            <i class="far fa-clipboard"></i>
         </div>
      </div>
      <div class="main">
         <!--여기서 부터 코드 작성-->
         <div class="body">
            <div class="content_wrapper">
               <p class="fontMedium" id="title">예약 승인 요청</p>
               <br>
               <div class="line"></div>
               <div class="content">
                  <div class="wrap_shop">
                     <i class="fas fa-store store"></i>
                     <div class="shop">
                        <span id="shop_info">${shop.shopName}</span>
                        <!-- 매장 이름 -->
                     </div>
                  </div>
                  <hr color="#F2BB13">

                  <div>
                     <div id="divClock"></div>
                  </div>
                  <br>
                  <c:if test="${empty requestScope.resRequeList}">
                     <p class="fontSmall">요청된 예약이 없습니다.</p>
                  </c:if>


                  <div class="wrap_box">
                     <c:forEach var="reservation" items="${resRequeList}">
                        <div class="reserv_box" value="${reservation.reserIdx}" id="${reservation.reserIdx}">
                           <div class="box">
                              <span class="reserv_info">${reservation.reserDate}
                                 ${reservation.reserParty}인</span>
                              <button class="btn" id="reserv_ok" name="${reservation.reserIdx}">예약 승인</button>
                           </div>
                           <div class="box">
                              <span class="reserv_info">${reservation.reserName}
                                 ${reservation.reserPhone}</span>
                              <button class="btn" id="reserv_not" name="${reservation.reserIdx}">예약
                                 거부</button>
                           </div>
                           <p class="fontXSmall">요청사항 : ${reservation.reserComment}</p>
                        </div>
                     </c:forEach>

                     <script type="text/javascript">

                        document.querySelectorAll("#reserv_ok").forEach((e)=>{
                           e.addEventListener("click", (event)=>{
                              fetch("/reservation/approveRes?reserIdx="+e.name,{
                                 method:"POST"
                              })
                              .then(response => response.text())
                              .then(text => {
                                 if(text=="success"){
                                    let reserIdx = e.name;
                                    let removeTarget = document.querySelector("#"+reserIdx);
                                    removeTarget.parentNode.removeChild(removeTarget);

                                 }else if(text=="fail"){
                                    window.alert("승인 도중 오류가 발생했습니다. 다시 시도해주세요");
                                 }
                              })
                              
                           })
                        })
                     
                        
                           document.querySelectorAll("#reserv_not").forEach((e)=>{
                           e.addEventListener("click", (event)=>{
                              fetch("/reservation/rejectRes?reserIdx="+e.name,{
                                 method:"POST"
                              })
                              .then(response => response.text())
                              .then(text => {
                                 if(text=="success"){
                                    let reserIdx = e.name;
                                    let removeTarget = document.querySelector("#"+reserIdx);
                                    removeTarget.parentNode.removeChild(removeTarget);

                                 }else if(text=="fail"){
                                    window.alert("승인 거부 도중 오류가 발생했습니다. 다시 시도해주세요");
                                 }
                              })
                              
                           })
                        })
                          
                        
                        window.onload = function(){
                           showClock();   
                        }
                      </script>
                  </div>
                  <!-- wrap_box -->
               </div>
               <!-- content -->
            </div>
            <!-- content_wrapper -->
         </div>
         <!-- body -->
         <div class="footer">
            <div>
               <i class="fas fa-search"></i>
            </div>
            <div>
               <i class="fas fa-qrcode"></i>
            </div>
            <div>
               <i class="fas fa-home"></i>
            </div>
            <div>
               <i class="far fa-clipboard"></i></i>
            </div>
            <div>
               <i class="far fa-user"></i>
            </div>
         </div>
      </div>
      <!-- main -->
</body>
</html>
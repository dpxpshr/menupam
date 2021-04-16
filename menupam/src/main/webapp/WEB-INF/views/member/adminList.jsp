<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
   
   
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>

</head>
<body>
    <div class="wrapper">
        <div class="header">
         
        </div>
        <div class="main">
              <c:forEach items="${selectMemberAll}" var="member">
	           <tr>
	           		<td>${member.memberId}</td>
	           </tr>
	        </c:forEach>
                    
                   
	  
  	    <table style="text-align:center" border="1">
	       
	           <tr>
	              
	               <th><span>id</span></th>
	               <th ><span>이름</span></th>
	               <th>등급</th>
	               <th>번호</th>
	               <th>이메일</th>
	               <th>가입일</th>
	               <th>탈퇴일</th>
	               <th>관리</th>
	           </tr>
	       
	      
	       <c:forEach items="${selectMemberList}" var="member">
	           <tr>
	           		<td>${member.memberId}</td>
	               <td>${member.memberName}</td>
	               <td>${member.memberType}</td>
	               <td>${member.memberPhone}</td>
	               <td>${member.memberEmail}</td>
	               <td>${member.memberRegDate}</td>
	                <td>${member.memberLeaveDate}</td>
	               
	         	<td><button>변경</button> <button>탈퇴</button></td>
	           </tr>
	        </c:forEach>
	    
	    
	  
	    </table>
	    
	   <div class="paging">
	         <a href="${context}/${paging.type}/adminList" class="nav first">《</a>
	         <a href="${context}/${paging.type}/adminList?page=${paging.prev}">〈</a>
	       
	         <c:forEach begin="${paging.blockStart}" end="${paging.blockEnd}" var="page">
	         	<a href="${context}/${paging.type}/adminList?page=${page}"><span>${page}</span></a>
	         </c:forEach> 
	        
	         <a href="${context}/${paging.type}/adminList?page=${paging.next}">〉</a>
	 	   	 <a href="${context}/${paging.type}/adminlist?page=${paging.lastPage}">》</a>
	   	  </div>
	    	
	 
	 
	
	                    </div>
	                    
	                   
  

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../../resources/css/login.css'>
    <script src="https://kit.fontawesome.com/e5012d0871.js" crossorigin="anonymous"></script>
</head>
<body>
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
	        	<div class="bg-img">
	      			<div class="content">
	        			<header>메뉴팜</header>
	        			<div class="loginInline"></div>
	        			<div class="field">
	        			 <form action="${context}/member/findId" method="post">
						<label style="margin-bottom:20px;">이메일</label>
						 <input type="text" id="memberEmail" name="email" style="background-color:skyblue; text-align: center;" >
						<button class="btnLarge" type="submit" style="margin-top:30px;" value="찾기">찾기</button>
						 </form>
	            	
	            		</div>
						
	          		</div>
				</div>
			</div>
        </div>
        <div class="footer">
            <div><i class="fas fa-search"></i></div>
            <div><i class="fas fa-qrcode"></i></div>
            <div><i class="fas fa-home"></i></div>
            <div><i class="far fa-clipboard"></i></i></div>
            <div><i class="far fa-user"></i></div>
        </div> 
    </div> 

<script type="text/javascript">
	
	let login = () => {
		
		const url = '/member/loginimpl';
		let params = {};
		params.memberId = id.value;
		params.memberPw = pw.value;

		//post방식으로 진행
		//헤더 설정
		let headerObj = new Headers();
		//form태그의 기본 content 타입인 application/x-www-form-urlencoded 로
		//content-type을 맞춰야 서버에서 편하게 getParameter로 사용 할 수 있다.
		//name=value&name=value
		headerObj.append("content-type","application/json");
		
		fetch(url,{
			method:"post",
			headers:headerObj,
			body:JSON.stringify(params)
		})
		.then(response => {
			//200번대 응답코드라면
			if(response.ok){
				return response.text();
			}else{
				throw new AsyncResponseError(response.text());
			}
		})
		.then(text => {
			if(text == 'fail'){
				document.querySelector('.valid_info').innerHTML = '아이디나 비밀번호를 확인하세요.';
				
				}else if(text == 'success'){
					location.href = "/index";
			}
		}).catch((error)=>{
			error.alertMessage();
		})
	}
	function kakaoLogin(){
		location.href = "https://kauth.kakao.com/oauth/authorize?client_id=e6a2ed92a0d0a64336f42c9222ec8a26&redirect_uri=http://localhost:9090/social/kakaoOauth&response_type=code";
	}
	
	function naverLogin(){
		location.href = "https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=zUZKAN8pubA1MePInXEY&state=${sessionScope.state}&redirect_uri=http://localhost:9090/social/naverOauth";
	}
	</script>		
</body>
</html>
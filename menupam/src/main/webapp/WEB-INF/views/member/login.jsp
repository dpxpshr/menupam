<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	            			<span class="fa fa-user"></span>
	            			<input type="text" class="id" id="id" name="memberId" required placeholder="아이디">
	          			</div>
						<div class="field space">
	            			<span class="fa fa-lock"></span>
	            			<input type="password" class="pass-key" id="pw" name="memberPw" required placeholder="비밀번호">
	            			<span class="show">SHOW</span>
	          			</div>
	          			<span class='valid_info'></span>
						<div class="pass">
	            			<a></a>
	          			</div>
	         			<br>
						<div class="btnBox">
							<div class="btn">
								<button class="loginBtn fitImg" onclick="login()">LOGIN</button>
							</div>
							<div class="btn" onclick="kakaoLogin()">
								<img alt="" src="../../../resources/images/kakaoBtn.png" class="fitImg">
							</div>
							<div class="btn" onclick="naverLogin()">
								<img alt="" src="../../../resources/images/naverBtn.PNG" class="fitImg">
							</div>
						</div>
						<div class="signup"><a href="${context}/member/findIdForm">아이디 찾기</a> | <a href="${context}/member/findPwForm">비밀번호 찾기</a> | 
							<a href="/member/join">회원가입</a>
							<br>
							<a href="/member/ceojoin">사장님회원가입</a>
	        			</div>
	          		</div>
				</div>
			</div>
        </div>
        <div class="footer">
		    <div onclick="location.href='/order/shoplist'"><i class="fas fa-search"></i></div>
		    <div onclick="location.href='/index'"><i class="fas fa-qrcode"></i></div>
		    <div onclick="location.href='/index'"><i class="fas fa-home"></i></div>
		    <div onclick="location.href='/index'"><i class="far fa-clipboard"></i></div>
		    <div onclick="location.href='/member/login'"><i class="far fa-user"></i></div>
		 </div>
    </div> 

<script type="text/javascript">
	
	
	
let mypage = () => {
	var memberIdinfo = '${sessionScope.userInfo.memberId}';
	if(memberIdinfo != ''){
	location.href = "${context}/member/mypage";
		
	}else{
		location.href = "${context}/member/login";
	}
	
}
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>메뉴팜</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/reset.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/review/reviewForm.css'>
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
                <div class="content">
                    <p class="fontSmall">가게이름적는곳</p><br>
                    <div class="line"></div><br>
                    <form action="${context}/review/write" method="POST" enctype="multipart/form-data">
                        <label for="input-file" class="input-file-button">업로드</label>
                        <input type="file" name="file"  id="input-file" style="display: none;">
                        <textarea name="reviewContent" id="reviewContent" cols="50" rows="10" placeholder="리뷰를 작성하세요" required="required"></textarea>
                        <div class="ratingBox">
                            <div class="ratings">
                                <p class="fontSmall rating" id="1" style="color : #F28C0F"><i class="fas fa-star"></i></i></p>
                                <p class="fontSmall rating" id="2"><i class="fas fa-star"></i></p>
                                <p class="fontSmall rating" id="3"><i class="fas fa-star"></i></p>
                                <p class="fontSmall rating" id="4"><i class="fas fa-star"></i></p>
                                <p class="fontSmall rating" id="5"><i class="fas fa-star"></i></p>
                            </div>
                        </div>
                        <input type="text" name="reviewScore" id="reviewScore" value="1" style="display : none;"><br>
                        <input type="submit" value=" 리뷰 작성 완료" class="btnLarge width100">
                    </form>
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
    <script>
        document.querySelectorAll(".rating").forEach((e)=>{
            e.addEventListener("click", (event)=>{
                //먼저 모든 애들을 다 바꿔줘여함 원래색으로
                document.querySelector("#reviewScore").value = e.id;
                document.querySelectorAll(".rating").forEach((t)=>{
                    t.style.color = "lightsteelblue";
                })
                prevColorChange(e);
            })
        })
        let prevColorChange  = (e)  => {
            e.style.color = "#F28C0F";
            if(e.id != "1"){
                prevColorChange(e.previousSibling.previousSibling)
            }else{
                return
            }
        }
    </script>
</body>
</html>
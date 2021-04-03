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
    <link rel='stylesheet' type='text/css' media='screen' href='../../resources/css/review/reviewView.css'>
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
                    <div class="line"></div>
                    <!-- <div class="reviewBox">
                        <div class="profileBox">
                            <div class="profileImg">
                            </div>
                            <div class="profileName">
                                <p class="fontXSmall" id="name">lee5031207</p>
                                <p class="fontXSmall rating" id="1"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="2"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                            </div>
                        </div>
                        <div class="contentBox">
                            잘 먹었습니다^^
                        </div>
                    </div> -->
                    <!-- <div class="reviewBox">
                        <div class="profileBox">
                            <div class="profileImg">
                            </div>
                            <div class="profileName">
                                <p class="fontXSmall" id="name">lee5031207</p>
                                <p class="fontXSmall rating" id="1"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="2"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                                <p class="fontXSmall rating" id="3"><i class="fas fa-star"></i></p>
                            </div>
                        </div>
                        <div class="contentBox">
                            잘 먹었습니다^^
                        </div>
                        <div class="imgBox">
                            <img src="../../resources/images/목살.PNG" alt="">
                        </div>
                    </div> -->
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
</body>
<script>
	let page = 1;
    window.onload = function () {
        getReviews(page);
        page++
    }

    let getReviews = (page) => {
        fetch("/review/views?page=" + page,{
            method:"POST"
        })
        .then(response => response.json())
        .then(json => {
            for(let i=1; i<=5; i++){

                // DB에서 데이터 가져온 데이터 파싱
                let memberId = json[i].memberId;
                let reviewContent = json[i].reviewContent; 
                let revireScore = json[i].reviewScore;
                let fileIdx = json[i].fileIdx;

                let reviewBox = document.createElement("div");
                reviewBox.className = "reviewBox";
                let profileBox = document.createElement("div");
                profileBox.className = "profileBox";
                let profileImg = document.createElement("div");
                profileImg.className = "profileImg";
                let profileName = document.createElement("div");
                profileName.className = "profileName";
                let name = document.createElement("p");
                name.className = "fontXSmall";
                name.id = "name";
                name.innerHTML = memberId;

                let star = document.createElement("p");
                star.className = "fontXSmall rating";
                let starFont = document.createElement("i");
                starFont.className = "fas fa-star";

                let contentBox = document.createElement("div")
                contentBox.className = "contentBox";
                contentBox.innerHTML = reviewContent;

                let imgBox = document.createElement("div");
                imgBox.className = "imgBox";
                let img = document.createElement("img");

                if(fileIdx!=null){
                    fetch("/review/photo?fileIdx=" + fileIdx,{
                        method:"POST"
                        })
                        .then(response => response.text())
                        .then(text => {
                            console.log(text);
                            img.src = text;
                    })
                }


                profileBox.appendChild(profileImg);
                profileName.appendChild(name);


                for(let i=1; i<=revireScore; i++){
                    let star = document.createElement("p");
                    star.className = "fontXSmall rating";
                    let starFont = document.createElement("i");
                    starFont.className = "fas fa-star";
                    star.appendChild(starFont);
                    profileName.appendChild(star);
                }
                profileBox.appendChild(profileName);


                reviewBox.appendChild(profileBox);
                reviewBox.appendChild(contentBox);
                imgBox.appendChild(img);
                if(fileIdx!=null){
                    reviewBox.appendChild(imgBox);
                }

                let content = document.querySelector(".content");
                content.appendChild(reviewBox);
            }
        })
    }

    let getImagePath = (fileIdx) => {
    	let result = "";
        fetch("/review/photo?fileIdx=" + fileIdx,{
            method:"POST"
            })
            .then(response => response.text())
            .then(text => {
                result = text;
        })
        return result;
    }


    document.addEventListener("wheel", () => {
        //console.dir(`scrollY : ${scrollY} / clientHeight : ${document.querySelector("body").clientHeight} / screen.availHeight : ${screen.availHeight}`);
        console.log("scrollY = "+ window.scrollY);
        console.log("clientHeight = "+ document.querySelector("body").clientHeight)
        console.log("innerHeight = "+ window.innerHeight);
    })

    
</script>
</html>
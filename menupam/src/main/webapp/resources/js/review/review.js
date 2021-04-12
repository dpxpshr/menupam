
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
                let imgPath = getImagePath(fileIdx)
                img.src = imgPath;
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
    fetch("/review/photo?fileIdx=" + fileIdx,{
        method:"POST"
        })
        .then(response => response.text())
        .then(text => {
            return text;
    })
}



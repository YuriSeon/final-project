<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.attracDetail{
    width: 75%;
    margin: auto;
}
.attracDetail *{
    box-sizing: border-box;
    margin: auto;
    text-align: center;
}

.attracDetail #content{
    width: 100%;
    height: auto;
    position: absolute;
}
.attracDetail .titleType, .attracDetail .titleType h2{
    width: 100%;
    
}
.attracDetail .titleType h2{
    font-weight: 700;
    margin-bottom: 15px;
    margin-top: 15px;
}
.attracDetail .titleType #topAddr{
    color: gray;
    font-weight: 500;
    margin-bottom: 10px;
}
.attracDetail .titTypeWrap span{
    text-decoration-line: underline;
    text-decoration-color: rgb(250, 205, 212);
    text-decoration-thickness: 10px;
    color: rgb(44, 44, 44);
    font-size: 25px;
    font-weight: 500;
}
.attracDetail .post_area {
    text-align: right;
    margin-right: 5%;
}
.attracDetail .post_area .ico img{
    width: 30px;
    margin-left: 15px;
}
.attracDetail hr{
    border: 0;
    height: 3px;
    background: #ccc;
    width: 95%;
    margin-top: 10px;
    margin-bottom: 20px;
}
.attracDetail .img_area {
    position: relative;
    width: 100%;
    height: 450px;
}
.attracDetail #wrapSlide {
    width:100%;
	height:100%;
}

.attracDetail #float{
    width: 100%;
	height: 90%;
}
.attracDetail #slideArea {
    width: 60%;
    height: 100%;
}
.attracDetail #slideImage {
    width: auto;
    max-height: 405px;
    height: 100%;
}
.attracDetail #float>img, .attracDetail #float>div{
    float: left;
}
.attracDetail #prev, .attracDetail #next {
	position: relative;
	opacity: 0.3;
    width: 20%;
    height: 100%;
}

.attracDetail #dotArea {
	position: relative;
	margin-top: 5px;
    height: 5%;
}

.attracDetail #dotArea * {
	margin-right: 10px;
}
.attracDetail .contView{
    width: 100%;
    height: 30px;
}
.attracDetail #cont1, .attracDetail #cont2{
    width: 50%;
    height: 100%;
    float: left;
}
.attracDetail #detailInfo {
    font-size: 25px;
    font-weight: 650;
    margin-left: 7%;
    color: rgb(53, 53, 53);
}
.attracDetail #cont1 {
    text-align: left;
}
.attracDetail #cont2 {
    text-align: right;
}
.attracDetail .btn_modify {
    margin-right: 7%;
    font-size: 17px;
    font-weight: 600;
}
.attracDetail .inr {
    width: 93%;
    text-align: left;
}
.attracDetail .cont_more {
    text-align: right;
    margin-right: 3%;
}
.attracDetail .surroundingsMap {
    margin-top: 10px;
    margin-bottom: 15px;
    width: 90%;
}
.attracDetail .surroundingsMap img {
    width : auto;
    height: 100%;
    max-height: 400px;
}
.attracDetail #detailinfoview {
    margin-bottom: 20px;
}
.attracDetail #reply-area {
	margin-top: 1%;
	width: 95%;
}

.attracDetail #reply-title {
	font-size: 23px;
    font-weight: 800;
    text-align: left;
}
.attracDetail #reply-title span {
    font-size: 21px;
    color: dodgerblue;
}
.attracDetail #reply-back {
	background-color: rgb(234, 234, 234);
	width: 100%;
	height: 50px;
}

.attracDetail #reply-back input {
	width: 80%;
	height: 60%;
	margin-top: 1%;
	margin-left: 2%;
    border-color: darkgray;
    border-style: solid;
    border-width: 1px;
}
.attracDetail #reply-back button {
    width: 90px;
	height: 30px;
    border-color: darkgray;
    border-style: solid;
    border-width: 2px;
    background-color: gray;
    color: white;
    font-weight: 800;
}
.attracDetail .foodReco{
    width: 90%;
    height: 370px;
}
.attracDetail .foodReco .food {
    width: 88%;
    height: 100%;
    border: 1px solid black;
}
.attracDetail .foodReco .foodImg {
    width: 95%;
    height: 75%;
    border: 1px solid;
    margin-top: 2%;
}
.attracDetail .foodReco .foodInfo {
    width: 95%;
    height: 18%;
    margin-top: 2%;
    border: 1px solid;
}
.attracDetail .foodInfo .foodTitle {
    width: 100%;
    height: 60%;
    font-size: 25px;
    font-weight: 700;
}
.attracDetail .foodInfo .foodAddress {
    width: 100%;
    height: 40%;
    font-size: 15px;
    font-weight: 500;
}
</style>
<body>
<%@include file="../../common/menubar.jsp" %>
    <div class="attracDetail">
        <div id="contents">
            <!-- 상단 -->
            <div class="titleType">
                <h2 id="topTitle">장소이름</h2>
                <div class="area_address" id="topAddr">
                    <span>지역정보</span>
                </div>
                <div class="titTypeWrap">
                    <span>
                        한줄설명내용 영역
                    </span>
                </div>
                <div class="post_area">
                    <span class="ico"><img src="resources/images/Like-before.png"></span>
                    <span class="num" id="conLike">좋아요 수</span>
                    <span class="ico"><img src="resources/images/view.png">
                    <span class="num" id="conRead">조회수 수</span></span>
                    <span class="ico"><img src="resources/images/star.png"></span>
                </div>
            </div>
            <!-- //상단 -->
            <hr>
            <!-- 내용 -->
            <div class="db_cont_detail">
                <!-- 사진보기 -->
                <div class="img_area">
                    <div id="wrapSlide">
                        <div id="float">
                            <img src="resources/images/left.png" id="prev" onclick="prev()">
                            <div id="slideArea" onmouseover="opacityIn(this)" onmouseout="opacityOut(this)">
                                <img id="slideImage"/>
                            </div>
                            <img src="resources/images/right.png" id="next" onclick="next()">
                        </div>
                        <div id="dotArea"></div>
                    </div>
                </div>
                <div id="detailGo">
                    <div class="wrap_contView">
                        <div class="contView">
                            <div id="cont1">
                                <span id="detailInfo">상세정보</span>
                            </div>
                            <div id="cont2">
                                <button class="btn_modify" onclick="modifyRequest();">관광정보 수정요청</button>
                            </div>
                        </div>
                        <hr>
                        <div class="inr_wrap">
                            <div class="inr">
                                강원도 평창 고랭지 청정지역에서 유기농 허브와 유기농 블루베리를 재배하고 있는 대한민국 스타팜 농장입니다. 2009년 8월에 국립농산물품질관리원에서 농장 전체를
                                유기농인증을 받은 농장이다. 평창라벤다팜은 삼면이 산으로 둘러싸여 있어 더욱 청정지역을 유지할 수 있는 환경이며, 고랭지 해발 700m에 위치하여 큰 일교차, 비옥한
                                토양, 일조량 등의 환경에서 자란 유기농허브와 유기농블루베리는 맛이 뛰어나다.2015년부터는 체험장을 오픈하여 더 많은 소비자들과 소통을
                                하기위해 노력하고 있으며,십 수 년간 허브를 연구해 오신 대표님과 원장님이 각 허브와 블루베리에 맞는 천연비료를 직접 조제하셔서 적절한 시기에 주기 때문에 맛과 향이
                                오래간다. 다양한 허브와 블루베리를 이용한 체험프로그램을 진행하고 있고 중.고등학교 진로체험을 위한 프로그램도 진행하고 있다.<br>
                            </div>
                            <div class="cont_more">
                                <button type="button" class="btn_more" title="내용더보기">더보기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 주변정보 지도 -->
                <div class="surroundingsMap" id="detailGo">
                    <img src="resources/images/ex.map.png">
                </div>
                <div class="wrap_contView" id="detailinfoview">
                    <!-- 세부 정보 -->
                    <div class="inr">
                        장소 세부 정보 들어가는 영역
                    </div>
                </div>
            </div>
        </div>
        <div class="contView">
            <div id="cont1">
                <span id="detailInfo">주변 맛집 추천</span>
            </div>
        </div>
        <hr>
        <div class="foodReco">
            <div id="cont1">
            <div class="food">
                    <div class="foodImg"></div>
                    <div class="foodInfo">
                        <div class="foodTitle">fdsafdsa</div>
                        <div class="foodAddress">fdsafd</div>
                    </div>
                </div>
            </div>
            <div id="cont2">

                <div class="food">
            </div>
            </div>
        </div>
        <hr>
        <div id="reply-area">
            <div id="reply-title">명소톡<span> 1</span></div>
            <div>
                <form action="insert.re" id="reply-form">
                    <div id="reply-back">
                        <input type="text" name="reply-content" placeholder="지금 보고계신 명소에 대해 댓글을 작성해주세요!">
                        <button type="submit">작성</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="../../common/footer.jsp" %>
    <script>
	    /* 사진 슬라이더 */
		const slideIndex = ['ticket.png', '하트.png', 'star.png'];
	    let currentIndex = slideIndex[0];
	    const imagePath = 'resources/images/';
	    const dotPath = 'resources/images/dot.png';
	    
	    $(function(){
	        $("#slideImage").prop("src", imagePath + slideIndex[0]);
	
	        slideIndex.forEach(function(item, index, array){
	            let img = document.createElement("img");
	            img.setAttribute("src", dotPath);
	            img.setAttribute("width", "15px");
	            img.setAttribute("height", "15px");
	            img.setAttribute("id", "dotImage" + index);
	            img.setAttribute("class", "dotImage");
	            img.setAttribute("onclick", "dotClickEvent(" + index + ")");
	
	            document.querySelector("#dotArea").appendChild(img);
	        });
	    });
	    function prev(){
	        slideIndex.some(function(item, index, array){
	            if(index != 0){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index - 1]);
	                    currentIndex = slideIndex[index - 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[slideIndex.length - 1]);
	                    currentIndex = slideIndex[slideIndex.length - 1];
	                    return true;
	                }
	            }
	        });
	    }
	    function next(){
	        slideIndex.some(function(item, index, array){
	            if(index != slideIndex.length - 1){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index + 1]);
	                    currentIndex = slideIndex[index + 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[0]);
	                    currentIndex = slideIndex[0];
	                    return true;
	                }
	            }
	        });
	    }
	    function opacityIn(obj){
	        obj.style.opacity = "0.5";
	        $("#prev").css("opacity", 0.7);
	        $("#next").css("opacity", 0.7);
	    }
	
	    function opacityOut(obj){
	        obj.style.opacity = "1";
	        $("#prev").css("opacity", 0.3);
	        $("#next").css("opacity", 0.3);
	    }
	
	    function dotClickEvent(index){
	        $("#slideImage").prop("src", imagePath + slideIndex[index]);
	        currentIndex = slideIndex[index];
	    }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<meta charset="UTF-8">
    <title>메인</title>
    <style>
     	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
    	#mainContentOuter div{
    		border : 1px solid black;
    		height:700px;
    	}
.swiper {
  width: 600px;
  height: 300px;
} 
    </style>
</head>
    
    <body>
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <%@include file="WEB-INF/views/common/menubar.jsp" %>
    
 	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
	
    <div class="main-banner">
        <div class="counter-content">
        	<p id="festivalName">&lt;보령 머드 축제&gt;</p>
            <ul>
                <li>Days<span id="days"></span></li>
                <li>Hours<span id="hours"></span></li>
                <li>Minutes<span id="minutes"></span></li>
                <li>Seconds<span id="seconds"></span></li>
            </ul>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-content">
                        <div class="next-show">
                            <i class="fa fa-arrow-up"></i>
                            <span>가까운 축제 남은 날짜</span>
                        </div>
                        <h6>여행을 가고싶은 당신!</h6>
                        <h2>여행 정보가 필요한 당신!</h2>
                        <div class="main-white-button">
                            <a class="btn btn-outline-secondary">가보자고</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<br>

	<div id="mainContentOuter">
			<div id="themeOuter">
			
					   <div class="themeTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">다채로운 추천 테마 여행!</p>
		                	<a style="position:relative; left:1500px; bottom:50px;" class="btn" href="theme.bo" >더 알아보기 ></a>
		                </div>

  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">Slide 1</div>
      <div class="swiper-slide">Slide 2</div>
      <div class="swiper-slide">Slide 3</div>
      <div class="swiper-slide">Slide 4</div>
      <div class="swiper-slide">Slide 5</div>
      <div class="swiper-slide">Slide 6</div>
      <div class="swiper-slide">Slide 7</div>
      <div class="swiper-slide">Slide 8</div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
  </div>

<script>
var swiper = new Swiper(".mySwiper", {
    cssMode: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
    },
    mousewheel: true,
    keyboard: true,
  });
// var swiper = new Swiper(".mySwiper", {
//     slidesPerView: 3,
//     spaceBetween: 30,
//     pagination: {
//       el: ".swiper-pagination",
//       clickable: true,
//     },
//   });
</script>

			</div>
			
			<br>
			
			<div id="festivalOuter">
						<div class="festivalTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">구석구석 축제가는 날</p>
		                	<a style="position:relative; left:1500px; bottom:50px;" class="btn" href="festival.fe" >더 알아보기 ></a>
		                </div>
			</div>
			<br>
			
			<div id="attractionOuter">
						<div class="attractionTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">이 지역의 명소는 ?</p>
		                	<a style="position:relative; left:1500px; bottom:50px;" class="btn" href="attraction.bo" >더 알아보기 ></a>
		                </div>
			</div>
			
			<br>
			
			<div id="togetherOuter">
						<div class="togetherTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">혼자 여행가기 적적할 때</p>
		                	<a style="position:relative; left:1500px; bottom:50px;" class="btn" href="together.bo" >더 알아보기 ></a>
		                </div>
			</div>
	</div>

	
	<%@include file="WEB-INF/views/common/footer.jsp" %>
    <script src="resources/js/custom.js"></script>

  </body>
</html>
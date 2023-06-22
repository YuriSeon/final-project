<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<style>
	/* 사진 슬라이드 부트스트랩 */
	@import url(https://fonts.googleapis.com/css?family=Varela+Round);

html, body { background: #333 url("https://codepen.io/images/classy_fabric.png"); }

.slides {
    padding: 0;
    width: 609px;
    height: 420px;
    display: block;
    margin: 0 auto;
    position: relative;
}

.slides * {
    user-select: none;
    -ms-user-select: none;
    -moz-user-select: none;
    -khtml-user-select: none;
    -webkit-user-select: none;
    -webkit-touch-callout: none;
}

.slides input { display: none; }

.slide-container { display: block; }

.slide {
    top: 0;
    opacity: 0;
    width: 609px;
    height: 420px;
    display: block;
    position: absolute;

    transform: scale(0);

    transition: all .7s ease-in-out;
}

.slide img {
    width: 100%;
    height: 100%;
}

.nav label {
    width: 200px;
    height: 100%;
    display: none;
    position: absolute;

	opacity: 0;
    z-index: 9;
    cursor: pointer;

    transition: opacity .2s;

    color: #FFF;
    font-size: 156pt;
    text-align: center;
    line-height: 380px;
    font-family: "Varela Round", sans-serif;
    background-color: rgba(255, 255, 255, .3);
    text-shadow: 0px 0px 15px rgb(119, 119, 119);
}

.slide:hover + .nav label { opacity: 0.5; }

.nav label:hover { opacity: 1; }

.nav .next { right: 0; }

input:checked + .slide-container  .slide {
    opacity: 1;

    transform: scale(1);

    transition: opacity 1s ease-in-out;
}

input:checked + .slide-container .nav label { display: block; }

.nav-dots {
	width: 100%;
	bottom: 9px;
	height: 11px;
	display: block;
	position: absolute;
	text-align: center;
}

.nav-dots .nav-dot {
	top: -5px;
	width: 11px;
	height: 11px;
	margin: 0 4px;
	position: relative;
	border-radius: 100%;
	display: inline-block;
	background-color: rgba(0, 0, 0, 0.6);
}

.nav-dots .nav-dot:hover {
	cursor: pointer;
	background-color: rgba(0, 0, 0, 0.8);
}

input#img-1:checked ~ .nav-dots label#img-dot-1,
input#img-2:checked ~ .nav-dots label#img-dot-2,
input#img-3:checked ~ .nav-dots label#img-dot-3,
input#img-4:checked ~ .nav-dots label#img-dot-4,
input#img-5:checked ~ .nav-dots label#img-dot-5,
input#img-6:checked ~ .nav-dots label#img-dot-6 {
	background: rgba(0, 0, 0, 0.8);
}
          
	/* 디테일 헤더 */
		#title_menu{
			font-size: 28px;
			/* position: relative; */
			/* top: -15px; */
			/* left: 21%; */
			padding: 0px 0px 0px 400px;
			width:1000px;
		}
		#title_menu>a{
			font-size: 18px;
            text-decoration: none;
            color: rgb(138, 138, 138);
            font-weight: 600;
		}
		#title_menu>a:hover{
			color:black;
		}
		#topTitle{
			font-size: 30px;
          	font-weight: 600;
          	height: 60px;
          	line-height: 40px;
		}
		.titleType1 {
			text-align: center;
            position: relative;
			/* background-color : green; */
		}
		.titleType1 .area_tag {
            text-align: left;
        }
        .brandingIcon {
            float: right;
            text-align: center;
        }
        .btn_good{
            border: none;
            background-color: white;
            position: relative;
            left: -470px;
        }
        .num_view{
        	position: relative;
            left: -470px;
        }
        .btn_sharing{
        	position: relative;
            left: 450px;
            background-color:green;
            border-radius: 20px;
            border:50px;
            border-color:black;
            border-width: medium;
        }
    /* 축제 정보 */
	#fes-infor{
		margin-top: 10px;
	    margin-bottom: 30px;
	}
	#map-infor{
		margin-top: 30px;
		margin-bottom: -10px;
	}
	#fes-infor dl, #map-infor dl{
		position: relative;
	    padding: 0px 0px 0px 200px;
	   /*  text-align: left; */
	    /* margin: 0; */
	    
	    /* display: block; */
	    margin-block-start: 1em;
	    /* margin-inline-start: 0px; */
	    /* margin-inline-end: 0px; */
	}
	#fes-infor dt, #map-infor dt{
		position: absolute;
	    left: 0px;
	    /* top: 10px; */
	    /* z-index: 1; */
	    /* width: 200px; */
	    font-size: 18px;
	    /* color: #222; */
	    /* font-weight: 700; */
	    
	    /* margin: 0; */
	    /* padding: 0; */
	    
	    /* display: block; */
	}
	#fes-infor dd, #map-infor dd{
	   	/* margin: 0; */
	    /* padding: 0; */
	    
	    /* display: block; */
	}
	/* 지도 */
	#map-wrap{
		margin-top: 40px;
		margin-bottom: 50px;
	}
	#map{
		width: 800px;
		height: 400px;
		margin: auto;
	}
	
	/* 명소 css */
	#M-container {
	  margin: 0 auto;
	  padding-right: .8em;
	  padding-left: .8em;
	  width: 100%;
	  height: auto;
	  max-width: 1260px;
	  background: #fff;
	  margin-bottom: -50px;
	 }
	#M-header {
	  display: flex;
	  flex-direction: column;
	  align-items: center;
	  margin-top: 30px;
	  margin-bottom: -10px;
	}
	#M-name {
	  text-transform:uppercase;
	  font-weight: 800;
	  font-size: 2em;
	  line-height: 1;
	  margin: 0 0 1.5em;
	}
	#M-list-wrap img {
	   max-width: 100%;
	}
	#photo-list {
	  border: 1px solid rgb(200, 200, 200);
	  margin-bottom: 3em;
	  text-align: center;
	  margin-left: .8em;    /* these margins depend on the .photo-container width in @media */
	  margin-right: .8em;
	}
	
	#photo-list h2 {
	  text-transform:uppercase;
	  font-size: 1.5em;
	  line-height: .4;
	  font-weight: 550;
	  color: rgb(76, 76, 76);
	  margin-top: 25px;
	}
	#photo-list p {
	  font-size: .9375em;
	  margin: 0 0 1.5em;
	  line-height: 1.4;
	  margin-top: 20px;
	  margin-bottom: 30px;
	}
	
	
	#M-list-wrap img {
	  transition: transform .5s cubic-bezier(.7,-0.39,.31,1.38);
	}
	#M-list-wrap img:hover {
	  transform: rotate(-5deg) scale(1.1);
	}
	
	@media (min-width: 1024px) {
	#M-list-wrap {
	  display: flex;
	  flex-direction: row;
	  flex-wrap: wrap;
	  justify-content: center;
	}
	}
	@media (min-width: 1600px) {
	#photo-list {
	  margin-bottom: 4em;
	  width: 30%;
	}
	}
	</style>

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>축제</title>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/owl-carousel.css">

    <link rel="stylesheet" href="/finalProject/resources/css/tooplate-artxibition.css">
    
    </head>
    
    <body>
    <!-- ***** Preloader End ***** -->
    <%@include file="../common/menubar.jsp" %>
    
  	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div id="fesDe_wrap">
		<div>
			<div id="title_menu" >
				<a href=""><img src="resources/images/home.png" alt="" style="width:23px; height:23px; position: relative; top: -7px;"></a> > <a href="festival.fe" style="position: relative; top: -3px; left: -3px;">축제</a>
			</div>
		</div>
        
        <div class="titleType1">
			<h2 id="topTitle">${b.boardTitle }</h2>
            <div class="area_address" id="topAddr" style="color: rgb(135, 135, 135); position: relative; top: -18px;">${b.zone.zoneName }</div>
    
			<div class="post_area">
		        	<button type="button" class="btn_good" onclick="setLike();">
		            	<span class="ico"><img src="resources/images/heart.png" alt="" style="height: 21px; width: 21px;"></span>
		           		<span class="num" id="conLike">${b.good }</span>
		        	</button>
		        <span class="num_view"><img src="resources/images/eye.png" alt="" style="height: 24px; width: 24px;">&nbsp;${b.count }</span>
		        <span class="rline">
		            <button type="button" class="btn_sharing" onclick="openShare();">
		                	수정요청
		            </button>
		        </span>
			</div>
        </div>
        
        <hr style="width:1110px;">
        
		<div id="fes_body" style="/* background-color:blue; */ width: 1110px; margin:auto;">  
        
			<div id="fes_body_photo" style=" margin:30px 30px 30px 30px;">
				<ul class="slides">
				
					<c:forEach var="at" items="${at}" varStatus="status">
					    <input type="radio" name="radio-btn" id="${status.count}" checked />
					    <li class="slide-container">
					        <div class="slide">
					            <img src="${at.filePath}" />
					        </div>
					        <div class="nav">
					            <c:choose>
					                <c:when test="${status.count == 1}">
					                    <label for="${status.end}" class="prev">&#x2039;</label>
					                    <label for="${status.count + 1}" class="next">&#x203a;</label>
					                </c:when>
					                <c:when test="${status.last}">
					                    <label for="${status.count - 1}" class="prev">&#x2039;</label>
					                    <label for="1" class="next">&#x203a;</label>
					                </c:when>
					                <c:otherwise>
					                    <label for="${status.count - 1}" class="prev">&#x2039;</label>
					                    <label for="${status.count + 1}" class="next">&#x203a;</label>
					                </c:otherwise>
					            </c:choose>
					        </div>
					    </li>
					</c:forEach>
					
				</ul>
        	</div>
        	
        	<div id="fes_detail_text">
        		<pre width="1110px;" style="white-space: pre-wrap; word-wrap: break-word;">
${b.boardContent }
        		</pre>
        	</div>
        	
        	<div id="fes-infor">
        		<dl>
		        	<dt>행사 기간</dt>
		        	<dd>${b.festival.startDate } ~ ${b.festival.endDate }</dd>
		      	</dl>
		      	<dl>
		        	<dt>전화번호</dt>
		        	<dd>${b.info.infoCall }</dd>
		      	</dl>
		      	<dl>
		        	<dt>이용시간</dt>
		        	<dd>${b.info.infoTime }</dd>
		      	</dl>
		      	<dl>
		        	<dt>이용요금</dt>
		        	<dd>${b.festival.fesMoney }</dd>
		      	</dl>
    		</div>
    		
    		<hr style="width:1110px;">
    		
			<div id="map-wrap" style="width:1110px;">
				<div id="detail-map" style=" width:1110px;">
					<div id="map" style="background-color:yellow;">
			      		<img src="resources/images/ex.map.png" alt="" style="width: 100%; height: 100%;">
			      	</div>
			    </div>
			        
			    <div id="map-infor">
			      	<dl>
			        	<dt>주소</dt>
			        	<dd>${b.info.infoAddress }</dd>
			      	</dl>
			      	<dl>
		        	<dt>웹사이트</dt>
		        	<dd><a href="${b.info.infoHomepage }" target="_blank" title="새창열림">웹사이트 보기<span class="ion-ios-arrow-thin-right"></span></a></dd>
		      		</dl>
			    </div>
		  	</div>
		  	
		  	<hr style="width:1110px;">
		  	
		  	<div id="M-container">
				<header id="M-header">
				  <h1 id="M-name">주변 추천 명소</h1>
				</header>
				
				<div id="M-list-wrap">
				  <div id="photo-list">
				    <img src="https://res.cloudinary.com/olti/image/upload/v1463520654/1_xdyhpf.jpg" alt="Big Sur">
				    <h2>알파카 월드</h2>
				    <p>1200여년 전 시작되어 오늘날까지 이어지고 있는 전통축제. 연등행렬에는 자신이 직접 만든 등을 만들어 참여하는데, 이 등에는 자신과 가족</p>
				  </div>
				
				  <div id="photo-list">
				    <img src="https://res.cloudinary.com/olti/image/upload/v1463520653/2_keuljm.jpg" alt="Turquoise waters">
				    <h2>서울숲</h2>
				    <p>1200여년 전 시작되어 오늘날까지 이어지고 있는 전통축제. 연등행렬에는 자신이 직접 만든 등을 만들어 참여하는데, 이 등에는 자신과 가족</p>
				  </div>
				
				  <div id="photo-list">
				    <img src="https://res.cloudinary.com/olti/image/upload/v1463520654/3_yn1nie.jpg" alt="The retro van">
				    <h2>대천 해수욕장</h2>
				    <p>1200여년 전 시작되어 오늘날까지 이어지고 있는 전통축제. 연등행렬에는 자신이 직접 만든 등을 만들어 참여하는데, 이 등에는 자신과 가족</p>
				  </div> 
				</div>
			</div>
        	
        </div>
        
    </div>

   <jsp:include page="../common/footer.jsp"/>
   
   <script>
	   
   </script>

    <!-- jQuery -->
    <script src="/finalProject/resources/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/finalProject/resources/js/popper.js"></script>
    <script src="/finalProject/resources/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/finalProject/resources/js/scrollreveal.min.js"></script>
    <script src="/finalProject/resources/js/waypoints.min.js"></script>
    <script src="/finalProject/resources/js/jquery.counterup.min.js"></script>
    <script src="/finalProject/resources/js/imgfix.min.js"></script> 
    <script src="/finalProject/resources/js/mixitup.js"></script> 
    <script src="/finalProject/resources/js/accordions.js"></script>
    <script src="/finalProject/resources/js/owl-carousel.js"></script>
    
    <!-- Global Init -->
    <script src="/finalProject/resources/js/custom.js"></script>

  </body>
</html>
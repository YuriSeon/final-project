<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>명소</title>
   	<style>
		.attr *{
			margin: auto;
			box-sizing: border-box;
			text-align: center;
		}
   		.attr #mainPhoto {
			background-image: url('resources/images/main-attraction.jpg');
			background-size: cover;
			background-repeat: no-repeat;
			width: 100%;
			height: 450px;
		}
		.attr .float, .attr #content {
			width: 100%;
			height: 780px;
			margin-top: 10px;
		}
		.attr #main-map, .attr #mini-map{
			width: 70%;
			height: 100%;
			margin-left: 5%;
			display: flex;
		    justify-content: center;
		    align-items: center;
		}
		.attr #main-map svg, .attr #mini-map svg {
			width: 100%;
			height: 100%;
			display: flex; justify-content: center; align-items: center;
			background-color: #ffffff;
			padding-left:250px;
			padding-top : 30px;
		}
		.attr #zone-area {
			width: 20%;
			height: 100%;
			margin-right: 5%;
			margin: auto;
		}
		.attr #zone-area>div {
			width: 50%;
			height: 35px;
			margin-top: 5px;
			line-height: 1.8;
			font-size: 18px;
			font-weight: 450;
			border: 2px solid rgb(138, 138, 138);
		} 
		/* .attr #zone-area>div:hover {
			cursor: pointer;
		}
		.attr #zone-area>div:active {
			font-weight: 700;
			color: white;
		} */
		.attr #zone-area #first{
			margin-top: 20px;
		}
		.attr .float>div, .attr #content-area>div, .attr .list, .attr .content_search div, .list-area>div {
			float: left;
		}
		.attr #mini-map {
			width: 40%;
			height: 100%;
		}
		.attr #content-area {
			width: 55%;
			height: 90%;
/* 			margin-right: 5%; */
		}
		.attr .pagination {
			width: 55%;
			height: 10%;
			margin-right: 5%;
		}
		/* 여기부터 영역 다시 보고 크기 다시 잡기  */
		.attr .search-area { 
			width: 100%;
			height: 20%;
			display: block;
			margin: 0 auto;
		}
		.attr .content-title {
			width: 100%;
			height: 80%;
		}
		.attr .content-title #p {
			font-size : 30px;
		}
		.attr #content-search {
			width: 100%;
			height: 20%;
		}
		.attr #search-input {
			width: 80%;
			height: 100%;
		}
		.attr #search-icon {
			width: 20%;
			height: 100%;
		}
		.attr #search-icon img, .attr #search-icon button {
			width: 100%;
			height: 100%;
			max-height: 100px;
		}
		input#search-bar{
			margin: 0 auto;
			width: 100%;
			height: 100%;
			font-size: 1rem;
			border: 1px solid #D0CFCE;
			outline: none;
			&:focus{
				border: 1px solid #008ABF;
				transition: 0.35s ease;
				color: #008ABF;
				&::-webkit-input-placeholder{
				transition: opacity 0.45s ease; 
				opacity: 0;
				}
				&::-moz-placeholder {
				transition: opacity 0.45s ease; 
				opacity: 0;
				}
				&:-ms-placeholder {
				transition: opacity 0.45s ease; 
				opacity: 0;
				}    
			}
		}
		
	/* 지도영역 */
	.OUTLINE {
    stroke-linejoin:round;
    stroke: #28324a;
    stroke-width: 2;
	}
	.서울,
	.부산,
	.대구,
	.인천,
	.광주,
	.대전,
	.울산,
	.세종,
	.경기,
	.강원,
	.충북,
	.충남,
	.전북,
	.전남,
	.경북,
	.경남,
	.제주{
		fill: #e9eaea;
	}
	.서울:hover,
	.부산:hover,
	.대구:hover,
	.인천:hover,
	.광주:hover,
	.대전:hover,
	.울산:hover,
	.세종:hover,
	.경기:hover,
	.강원:hover,
	.충북:hover,
	.충남:hover,
	.전북:hover,
	.전남:hover,
	.경북:hover,
	.경남:hover,
	.제주:hover{
		fill: #508edf;
		transform: translateY(-10px);
	}
	
	.TEXT {
	    fill: #f7f7f7;
	    font-size: 10;
	    font-weight: bold;
	    text-anchor: middle;
	}
	.hover-class {
	background-color: #508edf;
	}
	.thumbnail { 
  transition: all .2s ease-in-out; 
}

.thumbnail:hover { 
  transform: scale(1.025); 
}
.containers{width: 33%;}
.rows{
height: 270px;
} 
.rows img{ width:300px; height: 150px;}
#btn{
	float:right;
	margin-right : 30px;
	
}
   	</style>
  </head>
   <body>
	<%@include file="../../common/menubar.jsp" %>
   <!-- 페이징처리랑 버튼 위치 설정 -->
	<script>
		/* 현재 페이지에 해당하는 메뉴바 체크되도록 설정 */
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
    <div class="attr">
		<div id="mainPhoto"></div>
		<div class="float">
			<div id="main-map">
				<svg xmlns="http://www.w3.org/2000/svg">
					<defs>
					    <filter id="dropshadow">
					        <feGaussianBlur in="SourceAlpha" stdDeviation="3" />
					        <feOffset dx="2" dy="2" result="offsetblur" />
					        <feMerge>
					            <feMergeNode />
					            <feMergeNode in="SourceGraphic" />
					        </feMerge>
					    </filter>
					</defs> 
					<g transform="scale(0.9, 0.66)"  filter="url(#dropshadow)" id="locale">
					<path id="CD11" class="OUTLINE 서울" d =" M 178 231 l -4 2 -4 3 -1 0 0 1 -3 1 -4 -5 -4 0 -6 1 -4 3 -2 -1 -1 -1 -3 2 -3 -3 -1 -3 -2 -3 0 0 -1 -2 -3 2 -3 1 -2 -4 0 -8 -3 -1 0 0 0 0 0 0 -2 -1 -3 -2 2 -4 3 -3 0 -1 0 0 0 0 0 -1 1 0 4 2 7 1 2 -2 0 1 2 0 1 -4 2 -8 7 -1 4 2 0 -3 1 -1 2 -4 3 -4 2 0 3 2 7 2 2 8 1 4 1 1 0 0 0 2 0 2 0 1 0 0 -1 6 3 0 8 -1 0 5 -4 3 -1 5 z " />
					<path id="CD26" class="OUTLINE 부산" d =" M 496 722 l 0 4 -1 0 -2 -5 -1 6 -1 -2 0 0 -1 0 -1 1 -1 2 0 1 -1 -1 -1 -6 -1 -6 -2 3 -2 -3 0 2 0 0 0 0 0 0 0 0 -1 0 1 0 -4 1 -2 -5 -1 5 -1 2 0 0 -2 0 -7 -2 0 -2 2 -2 -1 -3 -5 -4 -2 -2 4 -1 9 0 0 -5 1 -6 5 -1 6 -2 7 -1 4 -6 1 -4 2 0 3 1 1 -3 6 -3 4 -1 1 -5 3 -6 7 0 3 -2 0 -3 0 0 2 -3 1 3 0 0 1 0 2 0 4 -1 4 4 1 3 0 1 -1 1 5 1 -7 4 -1 6 -1 4 -1 0 0 0 0 -1 -1 2 -1 1 2 2 -1 4 -2 4 -3 6 -3 4 0 1 0 0 -5 0 -4 0 -2 -1 -1 4 -1 4 1 -1 0 4 -7 0 -2 -4 -1 1 -3 4 z " />
					<path id="CD27" class="OUTLINE 대구" d =" M 441 530 l 3 1 3 7 0 4 2 9 1 7 -4 4 -2 -1 0 4 -1 2 -3 6 -2 7 0 8 -4 2 -4 2 -3 1 -3 -5 -6 0 -5 3 -1 6 -3 7 -2 3 -5 0 -7 3 -7 1 0 -8 -4 -4 -1 -3 5 -2 6 0 0 -5 -5 -4 -1 -5 3 -5 3 -2 8 -1 0 -5 -8 -4 -6 0 0 -5 2 -5 3 -4 3 -3 5 -1 2 7 3 3 1 0 2 -4 3 -7 0 -7 2 2 1 1 3 -2 6 -4 3 -3 5 -1 z " />
					<path id="CD28" class="OUTLINE 인천" d =" M 91 229 l 1 -2 0 1 0 0 1 0 1 0 0 -1 1 0 -1 -1 0 0 0 0 2 0 -4 -5 0 -5 1 -3 0 0 1 0 -1 0 0 -1 0 0 1 -1 0 -1 4 -1 4 -1 -5 -1 -3 -1 -1 -1 -2 1 1 -3 5 -3 3 -4 4 1 3 3 5 4 4 3 5 2 -2 4 -1 3 -1 5 -2 2 2 5 2 3 -1 7 -1 2 -2 3 -1 -3 -1 6 -7 2 -1 6 -6 1 -1 0 -3 -5 -2 -4 -1 -5 5 -2 -4 -2 0 -3 -2 2 z M 82 219 l 3 1 0 0 1 2 2 3 -2 2 -4 1 -8 5 -9 7 -4 -2 -3 -3 -1 0 -2 1 -2 -4 4 -5 4 -2 7 -1 7 -3 1 -4 z M 64 156 l 3 2 4 4 7 4 0 4 2 3 -1 2 -2 4 2 3 -1 4 0 3 2 0 0 2 -1 1 1 1 -1 1 1 2 1 2 1 1 -1 0 -5 4 -8 1 -8 0 -5 -4 0 -4 4 -3 0 -5 -2 -4 1 0 0 -1 -5 -3 -1 -8 0 -7 4 -4 0 0 1 0 z " />
					<path id="CD29" class="OUTLINE 광주" d =" M 113 687 l 2 3 6 3 7 -3 4 -2 2 0 1 0 0 0 0 0 1 0 0 0 1 -1 4 0 4 3 2 3 -1 1 1 1 3 4 6 3 1 4 -1 7 -4 4 -3 4 -7 1 -7 0 -6 2 -1 1 -1 0 -1 1 -4 1 -8 -1 0 -4 -4 -5 -4 -1 -7 0 -4 -7 -1 -1 3 -3 2 -6 2 -4 2 0 1 1 4 -4 1 -4 0 0 0 0 z " />
					<path id="CD30" class="OUTLINE 대전" d =" M 223 432 l 1 6 4 1 0 0 3 0 4 -4 1 0 0 2 -1 2 3 2 2 6 5 1 0 5 -2 6 -2 3 -2 7 -1 8 1 7 -5 3 -2 4 -7 -1 -3 -4 -2 -1 1 -2 -1 -2 1 -1 0 0 -3 -2 -2 6 -1 6 -3 4 -1 1 -1 -4 -3 -4 -1 1 -1 0 -2 -3 -1 -7 -5 -4 1 -2 1 -3 2 -8 1 -7 0 -6 9 -3 2 -3 2 -3 2 -5 z " />
					<path id="CD31" class="OUTLINE 울산" d =" M 550 641 l 2 6 -1 7 -1 8 -3 3 0 0 -1 0 0 1 0 0 -2 1 -5 -1 1 -1 0 -1 -1 -3 -4 -4 -4 1 -2 0 -1 0 0 0 -1 -3 -1 -7 -4 -1 -6 -2 -4 -5 -2 -3 -4 -3 -5 -3 -1 -3 -3 1 -1 0 0 0 -2 0 -3 -2 -4 -4 5 -5 0 -8 3 -4 1 0 1 1 4 -3 3 0 -2 -3 0 -2 1 -1 0 -1 2 -4 4 -2 4 -1 9 -1 5 0 4 3 3 3 4 7 6 -1 3 -2 4 -2 7 2 1 0 7 3 2 8 0 7 -1 8 -2 4 2 -1 -2 5 -1 4 -1 -1 0 1 -2 1 -2 -6 -3 -6 -3 -1 2 2 -2 1 2 1 1 3 -3 1 2 0 0 0 1 1 0 4 z " />
					<path id="CD36" class="OUTLINE 세종" d =" M 184 410 l -2 -2 0 -5 1 -9 -1 -4 -1 1 0 0 -1 0 -1 -4 3 -4 3 0 5 2 5 3 6 3 2 0 0 0 0 0 0 0 2 1 2 2 -2 4 -1 4 2 4 0 3 0 3 2 1 3 3 6 2 3 4 3 2 0 8 -6 2 -2 5 -2 3 -2 3 -9 3 -6 -1 -6 -4 -1 -3 -3 -9 0 -7 2 -7 1 -4 0 0 0 0 -1 1 z " />
					<path id="CD41" class="OUTLINE 경기" d =" M 81 192 l 1 -2 -1 -1 -1 -7 -1 -3 1 -3 1 -4 -2 -3 0 -5 4 2 4 2 4 1 3 -1 4 -2 4 0 3 5 -1 -4 -1 -12 -1 -1 0 -1 0 0 0 0 0 0 0 0 3 -2 -1 -5 0 0 1 -3 0 -5 -1 1 -1 -4 3 -6 7 -2 7 -2 3 -2 5 -2 1 -4 1 -1 1 -1 3 -3 1 -6 1 -7 4 -4 3 -2 3 2 1 0 3 -5 1 -3 0 0 1 -2 2 -3 3 -7 8 2 3 -5 1 0 1 0 3 0 0 0 1 0 0 0 0 0 1 0 0 0 1 0 3 1 3 -1 1 0 1 3 4 9 1 5 6 1 4 -2 3 -3 4 0 -1 1 -1 5 0 6 4 2 3 3 2 -1 5 -3 5 0 6 2 1 5 1 8 2 6 6 2 6 1 2 5 6 3 4 3 1 3 -1 1 1 2 0 1 -1 4 -4 3 -5 4 -4 6 0 5 -1 2 1 2 1 6 -3 3 -1 4 7 1 -1 7 0 8 8 0 5 1 4 3 5 3 3 4 4 0 4 0 1 -1 3 2 7 3 4 3 1 2 -5 2 -4 2 1 1 -1 0 -3 4 2 5 2 3 0 6 -1 3 -1 5 -4 7 0 8 -1 7 0 6 -1 4 -1 6 -4 6 -2 5 -4 3 -8 0 0 7 -3 4 -1 1 -1 -1 -1 1 0 -1 0 3 -5 3 0 2 0 0 -2 1 -4 -2 -2 0 -3 1 -2 -1 -3 0 -2 5 -3 4 -5 3 -4 3 1 1 1 1 -5 4 -4 2 -4 2 -4 1 1 3 0 1 0 0 0 0 -2 3 -4 -4 -6 -3 -3 -3 -5 -3 -5 -2 -8 2 -1 3 -1 0 -2 0 -4 1 -7 1 -8 2 -6 2 -3 4 0 -4 -8 1 -8 -1 0 -7 3 -8 -9 -1 2 -7 -6 -3 -1 -5 -10 -11 0 -5 0 -4 -2 1 -1 -1 -1 1 -1 0 0 0 0 0 0 0 1 -4 2 -3 -3 0 -1 -4 -3 -5 -2 0 -2 1 -2 -1 2 3 -7 1 0 -7 0 -7 3 -2 -1 -1 1 0 6 -4 2 0 -3 1 -4 4 -2 3 2 1 4 3 3 3 -1 1 2 1 3 3 0 1 0 4 2 -1 3 -1 -2 -2 0 0 0 -1 1 -1 -1 -2 0 0 0 0 -1 -2 5 -3 6 1 5 0 0 0 1 2 -1 1 1 1 0 1 1 -4 1 0 -1 6 3 -6 1 -4 2 -1 -1 -1 3 0 4 3 1 1 1 -2 1 0 0 0 2 1 -1 -2 -7 -3 -7 -2 -4 -1 0 0 -1 0 -2 -2 -8 -5 -1 -4 9 -7 7 -2 -5 -2 0 -1 1 -1 0 -1 1 -2 1 -7 -2 -3 -2 -5 2 -2 1 -5 1 -3 3 2 2 1 0 0 0 0 0 0 3 1 0 8 2 4 3 -1 3 -2 1 2 0 0 2 3 1 3 3 3 3 -2 1 1 2 1 4 -3 6 -1 4 0 4 5 3 -1 0 -1 1 0 4 -3 4 -2 3 -8 1 -5 4 -3 0 -5 -8 1 -3 0 1 -6 0 0 0 -1 0 -2 0 -2 0 0 -1 -1 -1 -4 -2 -8 -7 -2 -3 -2 -2 0 -3 4 -2 4 -1 1 0 3 -4 -2 -7 1 -2 8 -1 4 -2 0 0 -1 -2 2 -7 -1 -4 -2 -1 0 0 1 0 0 0 0 0 1 -3 3 -5 -2 -4 -3 -5 -4 -3 -3 -4 -1 -3 4 -5 3 -7 -1 -2 -5 z M 120 292 l -5 1 -3 4 -5 4 -2 2 9 10 5 0 -1 -7 -1 -2 0 -1 3 -2 5 -4 -3 -2 1 -1 1 -1 -1 -2 1 -4 z " />
					<path id="CD42" class="OUTLINE 강원" d =" M 409 61 l 2 3 0 0 0 3 3 4 3 5 -2 4 2 -1 2 4 1 6 2 4 2 4 4 5 1 0 -1 0 2 3 4 6 5 5 1 3 4 5 0 0 1 0 0 3 4 6 4 4 3 5 2 4 3 3 3 5 0 -1 0 0 0 0 0 1 3 4 4 4 5 5 3 4 3 2 4 5 3 4 4 6 0 5 2 5 -1 0 1 0 4 4 4 3 0 0 0 0 0 0 0 0 0 1 0 -1 1 4 0 4 0 -1 1 4 2 7 4 4 4 4 2 4 1 1 -1 -1 0 0 0 2 2 4 4 3 4 3 2 7 1 4 0 -1 1 2 3 3 2 3 1 0 1 1 2 1 0 0 0 0 0 1 0 1 0 0 0 1 0 0 0 0 0 0 1 1 2 5 0 6 1 8 2 5 -1 0 0 0 0 0 0 0 -1 -1 -1 1 -1 -1 -1 1 -5 4 -5 2 -3 4 -3 4 0 3 0 3 0 1 1 0 -5 0 -6 -3 -5 -4 -3 -2 -7 -1 -3 5 -3 0 -4 -2 0 1 -1 -1 -5 0 -4 0 0 0 -3 -2 -4 1 -4 6 -7 1 -6 -5 -4 -2 -2 0 -3 4 -1 7 -6 -1 -4 -1 -5 -3 -5 -3 -2 -2 -2 1 -1 0 0 -1 -1 0 0 0 -2 1 -3 -1 -6 -2 -4 -4 -2 -2 -2 2 -5 1 -5 0 -4 -7 -2 -3 -1 1 0 0 -2 -1 -1 1 -2 -1 -1 1 -1 -1 0 1 -1 0 1 0 -4 2 -6 -1 -1 -3 5 -4 4 -5 -10 -2 -3 -2 0 0 -2 0 -3 -2 -5 -1 -3 5 -3 -1 -2 -1 -1 0 -1 -1 -2 4 -2 2 -4 2 -1 0 -1 0 -3 1 -2 -5 -2 -4 0 -1 0 0 -4 -3 -7 1 -5 4 0 1 1 5 0 4 -2 3 -4 2 -1 -1 -3 0 -2 1 -1 -1 -1 1 -4 1 -7 0 -4 -5 -2 -7 1 -6 1 -4 0 -6 1 -7 0 -8 4 -7 1 -5 1 -3 0 -6 -2 -3 -2 -5 3 -4 1 0 -1 -1 4 -2 5 -2 -1 -2 -4 -3 -7 -3 -3 -2 -1 1 -4 0 -4 0 -3 -4 -5 -3 -4 -3 -5 -1 -8 0 0 -8 1 -7 -7 -1 1 -4 3 -3 -1 -5 -1 -3 1 -2 0 -5 4 -6 5 -4 4 -3 1 -4 0 -1 -1 -2 1 -1 -1 -3 -4 -3 -6 -3 -2 -5 -6 -1 -6 -2 -2 -6 -1 -8 -1 -5 -6 -2 -5 0 -5 3 -2 1 -3 -3 -4 -2 0 -6 1 -5 1 -1 -4 0 -3 3 -4 2 -6 -1 -1 -5 -4 -9 -1 -3 -1 0 -3 1 -3 -1 0 -3 0 -3 -1 0 -1 -3 3 -1 -1 -1 2 -2 2 -2 0 0 0 0 1 4 6 -2 2 -2 -1 0 0 0 0 0 2 -1 4 -2 7 1 4 4 1 0 0 -1 0 0 -1 -1 0 0 1 0 0 0 0 0 0 -1 0 1 1 0 0 1 8 1 3 -6 6 0 8 3 3 1 4 2 4 -2 4 -2 6 -3 5 1 0 0 0 0 0 0 0 0 0 0 1 1 7 1 0 2 0 0 2 -2 1 2 6 0 3 0 3 -2 5 4 5 3 7 0 5 -5 0 0 4 1 8 3 2 3 1 1 1 -1 2 1 2 -3 5 0 6 -2 3 -5 6 -1 7 -1 2 -6 5 -3 6 -1 1 -5 2 -6 5 0 0 -5 0 1 0 -2 -3 0 3 -1 4 -8 1 -8 -1 -6 4 -2 6 3 1 4 2 8 3 5 2 4 2 6 2 6 3 4 3 5 3 7 1 3 z " />
					<path id="CD43" class="OUTLINE 충북" d =" M 321 275 l 4 3 0 0 0 1 2 4 2 5 3 -1 1 0 1 0 4 -2 2 -2 2 -4 1 1 1 0 2 1 3 1 3 -5 5 1 3 2 2 0 0 0 3 2 10 2 -4 5 -5 4 1 3 6 1 4 -2 -1 0 1 0 0 -1 1 1 1 -1 2 1 1 -1 1 1 1 0 1 -1 2 3 4 7 5 0 5 -1 2 -2 2 2 4 4 6 2 3 1 2 -1 0 0 1 0 0 1 1 0 2 -1 2 2 5 3 -4 1 -2 2 -3 -1 0 1 -5 3 -3 5 -4 3 -4 4 -4 2 -4 4 -2 5 -3 7 2 8 -2 6 -5 1 -7 1 -7 -3 -4 -3 -4 -4 -4 -2 0 0 -3 4 -2 6 -6 0 -5 -2 -1 -1 -3 2 -4 4 -1 2 -3 -3 -3 1 -1 5 -1 8 3 4 1 2 -5 0 -3 -3 -1 0 -4 2 -3 -2 -2 -1 -3 6 -6 2 -3 1 -1 1 0 0 0 1 4 1 4 3 1 5 -1 4 -1 2 1 1 -2 -1 -4 -5 -2 -4 0 -1 -4 4 0 4 0 0 -1 1 -6 2 1 5 7 3 2 5 4 3 0 5 -3 3 0 2 0 1 0 0 0 0 0 0 0 1 0 0 0 1 -1 4 0 2 2 2 -2 3 -1 3 3 3 -1 2 1 0 0 3 -3 4 -3 5 1 6 6 0 2 -3 2 3 4 3 2 2 1 0 1 1 2 0 3 -3 6 1 2 5 2 6 1 2 -4 -1 -7 0 0 8 -1 6 -3 4 0 1 0 2 -1 3 -3 6 -5 2 -4 3 -4 2 -9 -1 -8 2 -6 -2 -5 -2 -2 -3 -3 3 -2 -1 -5 -3 -1 -7 -4 -9 0 -6 0 -7 -2 -6 -6 -2 -8 0 -1 -7 1 -8 2 -7 2 -3 2 -6 0 -5 -5 -1 -2 -6 -3 -2 1 -2 0 -2 -1 0 -4 4 -3 0 0 0 -4 -1 -1 -6 0 -8 -3 -2 -3 -4 -6 -2 -3 -3 -2 -1 0 -3 0 -3 -2 -4 1 -4 2 -4 -2 -2 -1 -2 3 -4 5 -5 5 -4 7 1 -1 -5 -1 -5 -5 -4 -5 -2 -2 -5 -3 -5 -3 -3 2 -3 0 0 0 0 0 -1 -1 -3 4 -1 4 -2 4 -2 5 -4 -1 -1 -1 -1 4 -3 5 -3 3 -4 2 -5 3 0 2 1 3 -1 2 0 4 2 2 -1 0 0 0 -2 5 -3 0 -3 0 1 1 -1 1 1 1 -1 3 -4 0 -7 8 0 4 -3 2 -5 4 -6 2 7 4 5 7 0 4 -1 1 -1 1 1 2 -1 3 0 1 1 4 -2 2 -3 0 -4 -1 -5 0 -1 5 -4 z " />
					<path id="CD44" class="OUTLINE 충남" d =" M 53 418 l 1 8 2 5 2 2 0 4 -1 2 3 2 1 2 0 0 -1 5 -6 -1 -5 -2 0 -3 1 0 -3 -2 -1 -6 -2 2 1 -5 1 -3 -1 0 0 0 -1 0 0 -3 0 -8 -2 -3 0 0 0 0 0 -2 3 -3 6 1 0 3 -1 0 0 1 0 0 z M 30 354 l 1 1 2 -3 4 -3 2 -6 0 -8 2 -4 1 1 0 0 0 0 0 0 -1 2 1 1 0 0 1 0 -2 3 0 4 2 4 1 3 -2 2 1 0 -1 2 -2 4 3 3 -1 0 1 0 -1 1 -3 3 6 -1 2 -5 4 3 0 0 0 -1 -1 -3 1 -1 3 -5 6 -3 0 -5 0 -4 0 0 -1 0 -1 1 -2 0 -2 -1 0 0 -2 -2 -4 -3 5 -1 2 -1 -1 0 -1 -2 -6 -2 3 -3 0 -1 3 1 2 -1 6 0 2 1 3 1 2 -4 8 -7 3 3 5 2 3 1 0 1 0 0 6 3 3 2 10 1 6 2 7 -1 2 5 2 7 2 4 1 3 11 3 4 -2 3 -4 6 -2 8 -2 7 -1 4 -1 2 0 1 0 1 -3 8 -2 5 2 5 3 3 3 6 3 4 4 3 3 3 5 2 5 5 2 5 4 1 5 1 5 -7 -1 -5 4 -5 5 -3 4 -1 1 0 0 0 0 0 0 0 0 -2 0 -6 -3 -5 -3 -5 -2 -3 0 -3 4 1 4 1 0 0 0 1 -1 1 4 -1 9 0 5 4 3 2 3 1 -1 0 0 0 0 -1 4 -2 7 0 7 3 9 1 3 6 4 6 1 0 6 -1 7 -2 8 -1 3 -1 2 5 4 1 7 2 3 1 0 1 -1 3 4 1 4 1 -1 3 -4 1 -6 2 -6 3 2 0 0 -1 1 1 2 -1 2 2 1 3 4 7 1 2 -4 5 -3 8 0 6 2 2 6 0 7 0 6 4 9 1 7 -1 4 1 0 0 2 -2 1 1 3 -1 2 -1 0 -3 -4 -8 -2 -2 8 -5 2 -7 -1 -3 -5 -1 -3 0 0 -4 2 -5 -3 -3 -6 -1 -7 -1 -5 -3 -2 -6 2 -5 1 -1 0 -1 0 -3 3 -7 1 -8 2 -2 2 -6 0 -3 -1 -3 -3 -3 -8 -4 -2 -3 -2 -1 1 -2 0 -4 -2 -4 1 -2 2 -7 3 -2 7 0 5 -6 3 -7 4 -8 4 -2 2 -1 0 0 1 -7 -2 -4 1 1 -3 -3 -6 -3 -4 -1 -3 3 -2 -4 -2 -2 -2 0 0 -1 -2 -6 -3 -4 -2 -3 -1 -4 1 0 0 1 2 -2 -1 0 -3 1 -1 0 0 3 -1 3 -9 0 -7 1 -3 0 0 0 -1 1 -1 -1 -3 -5 -6 2 -5 6 -3 5 0 -4 -1 -4 -2 -4 -3 -5 -3 1 -5 1 -2 0 0 2 -1 2 -2 -3 1 -1 0 0 -1 0 0 0 0 1 -1 -2 -3 -1 -6 -1 -9 -2 -6 -1 -6 -7 -4 0 -1 -7 -2 -5 1 -3 3 -4 2 -1 -6 -2 -9 -3 -3 0 -1 0 0 0 0 0 0 0 -2 1 -3 1 -4 -1 0 0 -1 -1 2 -4 3 -5 4 -3 2 -5 0 1 -6 7 0 -1 -6 -4 -4 -2 0 -1 0 -1 0 -1 4 -2 4 -2 1 1 -3 1 -3 0 0 0 0 -1 -2 -1 -4 2 -1 0 -1 0 0 -1 0 1 -1 0 0 1 0 1 -4 2 -7 2 4 2 4 2 3 -1 -5 -1 -4 -1 -1 2 -3 0 -7 3 -4 0 1 0 -1 0 1 2 -1 4 -1 -2 3 -2 2 z " />
					<path id="CD45" class="OUTLINE 전북" d =" M 134 519 l 0 -5 2 -7 7 -3 2 -2 4 -1 4 2 2 0 1 -1 3 2 4 2 3 8 3 3 3 1 6 0 2 -2 8 -2 7 -1 3 -3 1 0 1 0 5 -1 6 -2 3 2 1 5 1 7 3 6 5 3 4 -2 0 0 1 3 3 5 7 1 5 -2 2 -8 8 2 3 4 1 0 1 -2 -1 -3 2 -1 0 -2 -1 0 1 -4 5 3 2 1 3 -3 2 3 5 2 6 2 8 -2 9 1 2 4 0 1 0 0 2 4 3 7 -4 7 -3 2 -3 5 -4 3 -3 2 -6 2 -5 2 -3 6 -3 4 -5 3 -2 8 0 5 -3 3 -2 7 -1 8 -2 4 -1 3 -2 8 6 6 2 8 0 5 4 3 -1 5 -3 3 -3 5 -2 3 0 1 0 0 0 0 1 4 -2 3 -4 4 -3 -3 -4 -2 -5 -4 -4 -2 -6 -1 -4 1 -2 4 -4 5 -4 1 -3 -2 -1 0 -3 2 -8 0 -4 -1 -5 -3 -2 2 -2 1 -4 -3 -3 1 -4 3 -5 2 -8 -3 -1 -4 0 -8 -4 -3 0 -2 3 -3 -1 -4 -1 -3 -1 -4 -3 1 -2 -1 -1 4 -1 2 -2 2 -1 0 -1 5 -7 -1 -4 -3 -2 -5 -5 -3 -1 -1 -2 1 -1 -4 -6 2 -5 1 -4 4 0 7 -3 3 0 1 0 2 -3 3 -3 3 -5 3 -4 1 1 2 -4 0 -6 0 -1 1 1 0 -2 2 -7 -1 -2 -5 -1 -4 -2 0 -1 1 -1 -4 -1 -8 -2 -3 -6 -2 4 -9 1 -3 4 -5 4 -3 1 0 0 0 0 0 0 0 2 -1 0 1 1 -1 0 1 1 0 0 1 1 -2 0 1 1 0 -1 0 0 -1 4 -1 3 2 1 1 0 -1 0 -1 2 -4 2 -3 0 0 0 0 0 0 2 0 2 0 4 4 2 5 -1 -5 -2 -5 -8 -2 -9 0 -6 0 -3 1 0 0 -3 -3 -4 -3 -1 -1 1 -2 -1 0 1 -1 -1 -2 1 0 3 -2 6 -5 1 -1 1 0 1 -2 3 -2 -1 -3 -4 -4 -3 -6 -4 -11 -2 0 -3 -1 0 -2 5 -2 6 -11 3 -8 -1 -2 -1 -7 5 1 0 -1 3 0 9 0 7 -2 7 -2 4 2 3 -2 0 -4 8 -4 7 -4 z M 70 573 l 1 6 2 3 3 6 6 7 2 0 3 -3 3 -5 2 -8 1 -4 4 0 7 -1 -1 -8 -1 -4 -3 -5 -7 -1 -2 -6 -1 -6 -5 0 -6 1 -4 12 -2 4 -1 5 z " />
					<path id="CD46" class="OUTLINE 전남" d =" M 118 837 l 1 -4 -1 -7 -2 -4 1 0 0 -1 -1 -3 1 -3 0 -1 0 0 -1 3 -2 8 0 9 -2 8 -3 2 0 0 2 3 -3 4 -3 2 -7 4 -4 0 0 0 0 1 -4 4 -2 6 -2 5 -2 4 -7 2 -3 3 -3 0 0 -1 0 0 0 0 0 0 0 -2 1 -2 0 -1 1 -1 -1 -1 0 -1 0 0 -3 -3 -4 1 0 1 -1 -1 1 -1 0 -1 0 0 -1 -2 1 0 -1 -1 0 0 1 -1 -1 0 3 -3 1 -7 -6 -2 0 -2 2 1 -1 -4 0 -4 0 0 0 0 0 0 -1 -4 -1 -4 0 1 0 -1 -2 1 0 -3 -2 -2 1 -1 -2 -1 -2 -1 -2 3 -3 0 -3 -4 -9 -3 -2 -3 -1 -1 -1 1 -1 -4 -2 -6 -3 -5 0 -1 1 -1 -1 -1 1 -2 2 -5 3 -8 5 1 3 5 2 3 2 2 3 -3 2 -3 0 -1 -2 -4 3 -4 6 -1 3 -1 -6 -1 -7 0 1 -7 5 -4 0 -5 -2 -4 -1 1 2 -5 -1 -6 0 -6 -2 -4 -1 -3 -1 5 0 8 -4 3 -2 0 -3 -3 -2 -5 -1 -2 3 -2 6 -1 0 -3 -2 0 4 -3 4 -3 1 -2 -5 -3 -4 -2 -1 -1 1 0 0 0 1 -2 -4 -1 -2 5 -2 1 0 -1 -1 -1 -1 -1 -2 3 -2 6 -2 0 -1 -2 -1 2 -2 -7 -3 -1 0 1 0 0 0 1 -1 -1 -1 -2 0 0 -1 0 0 0 -2 -1 -3 -1 1 -1 0 0 0 -1 -1 -2 0 -2 5 -1 6 1 4 1 0 0 0 0 2 0 0 -1 -2 -3 1 -3 0 -1 1 1 3 -2 4 1 2 1 3 -3 3 -1 -1 5 -1 4 0 3 2 0 1 -1 0 3 3 4 1 -1 1 -2 0 -1 2 2 1 6 0 4 2 -1 1 1 1 -1 0 0 0 -2 2 -3 2 -6 0 -4 -5 -3 -3 -4 -1 0 -1 -2 -3 -4 -1 -5 2 -4 -4 2 -3 1 1 -2 0 -2 -1 0 1 1 0 1 -2 0 -3 -4 1 -5 1 2 2 -1 0 -1 0 -1 1 0 -2 0 2 -4 -1 0 0 -2 4 -1 4 -2 -1 -3 1 -1 0 -1 0 -1 0 0 0 0 0 0 0 0 1 -2 3 -6 4 1 2 3 0 -3 -4 -4 -1 -4 2 -6 3 -1 6 2 2 3 1 8 1 4 1 -1 2 0 1 4 2 5 7 1 2 -2 -1 0 1 -1 6 0 4 0 -1 -2 4 -1 5 -3 3 -3 3 -3 0 -2 0 -1 3 -3 0 -7 4 -4 5 -1 6 -2 1 4 2 -1 1 1 5 3 2 5 4 3 7 1 1 -5 1 0 2 -2 1 -2 1 -4 2 1 3 -1 1 4 1 3 1 4 -3 3 0 2 4 3 0 8 1 4 8 3 5 -2 4 -3 3 -1 4 3 2 -1 2 -2 5 3 4 1 8 0 3 -2 1 0 3 2 4 -1 4 -5 2 -4 4 -1 6 1 4 2 5 4 4 2 3 3 3 8 2 3 1 4 0 8 4 6 5 3 4 6 0 4 4 4 3 4 4 3 3 5 1 2 0 3 -3 6 -5 3 -1 -2 -3 5 -3 3 0 2 -3 -2 -2 3 -1 1 -4 0 -5 -3 -1 -5 -3 8 5 3 0 1 -2 5 1 3 1 0 0 0 0 0 0 -1 0 0 3 3 9 0 3 -2 0 -1 -1 -1 5 0 3 2 0 0 3 -2 2 7 -2 6 -2 9 1 2 -1 1 -5 2 -3 1 0 0 -3 -3 -4 -2 -1 1 -2 3 0 4 -3 -1 0 5 2 9 0 3 -3 -2 -5 -1 -1 3 -2 -2 -2 -4 0 -2 0 0 0 -3 3 -3 -2 -1 -1 -1 -1 1 1 -4 3 -2 1 -6 -3 -3 -1 0 1 0 0 -1 0 1 0 0 1 -1 0 1 0 -2 -4 -4 -4 -1 0 0 2 -5 -2 -2 0 0 0 -1 0 0 0 -1 -1 -3 0 -4 1 0 -1 0 -4 3 -1 6 -6 1 -1 -3 -1 1 0 -1 -1 1 -4 4 -7 -1 -4 -1 4 2 4 3 0 0 1 0 1 0 1 0 1 1 1 -1 -3 3 -3 3 1 1 -1 0 0 1 1 3 -2 2 0 6 2 3 1 0 0 0 3 3 4 4 1 1 0 0 3 2 2 1 0 1 2 1 -3 0 1 2 1 0 0 0 1 1 1 -1 1 4 -1 7 -6 0 -7 1 -2 3 1 2 4 1 0 0 0 0 -1 1 1 1 -1 1 -2 4 -4 2 0 -1 -2 1 1 3 0 0 -2 1 -3 -1 -1 1 -1 1 0 0 -3 2 -1 5 -3 -1 0 0 0 0 0 -1 0 0 1 1 -1 -2 -3 -3 -2 -3 1 0 -1 -3 -6 -3 -3 -3 -1 1 -1 1 0 -1 -1 1 -3 -1 -3 0 0 1 1 0 -2 0 -2 -1 -1 1 -2 -1 0 1 -1 -1 0 0 0 0 -2 -3 0 -4 0 0 1 -1 1 -1 0 0 2 -2 1 -4 2 2 2 -4 1 -2 -1 -1 1 -1 3 -3 6 -3 2 -6 2 -4 3 -1 2 5 0 4 0 0 1 1 4 0 2 -5 2 -7 -3 -6 -3 1 -3 2 -4 0 -3 -4 -4 3 -2 4 -3 5 -6 1 -4 -2 0 0 0 0 0 -1 -3 4 -3 4 -2 0 1 1 -4 2 -3 4 -1 0 -1 0 -2 2 -8 0 -4 -1 4 2 4 3 -1 1 1 0 0 0 -2 4 3 3 -1 2 0 -1 -1 0 -3 4 -1 7 0 6 -5 2 -2 4 -2 -1 -6 0 -1 4 -4 -2 -3 -2 -1 1 -2 0 -1 -1 -1 1 -2 -4 0 -4 -1 0 z M 61 823 l 3 -2 2 -2 -4 -2 -2 -3 -2 1 0 -2 -1 0 0 0 -1 -3 -2 -3 0 0 -1 0 -1 2 -3 0 -1 -4 1 2 1 0 1 -3 -1 -3 2 0 -1 -2 -2 -1 -4 4 -3 0 1 4 2 5 3 6 5 3 4 2 z M 49 798 l 1 0 2 0 3 4 3 -2 2 -1 0 4 -3 4 0 0 4 3 4 2 0 0 0 0 0 0 4 1 3 1 0 0 0 1 0 0 0 0 1 0 0 -2 -4 -4 -3 -4 4 3 7 2 5 3 5 1 2 1 1 -1 -8 -2 -4 -4 1 -2 1 -2 -1 0 1 0 -3 1 -6 -2 2 -1 -3 -1 -2 -3 -4 -2 2 -3 -1 -1 0 0 0 0 0 0 0 0 -1 0 -2 1 -2 -2 -1 1 -2 0 0 0 0 0 0 0 0 -1 0 0 0 0 -2 0 -4 2 -1 2 0 1 0 0 0 0 z M 122 727 l 4 -1 1 -1 1 0 1 -1 6 -2 7 0 7 -1 3 -4 4 -4 1 -7 -1 -4 -6 -3 -3 -4 -1 -1 1 -1 -2 -3 -4 -3 -4 0 -1 1 0 0 -1 0 0 0 0 0 -1 0 -2 0 -4 2 -7 3 -6 -3 -2 -3 -4 1 0 0 0 0 -1 4 -4 4 -2 -1 -1 0 -2 4 -2 6 -3 3 1 1 4 7 7 0 4 1 4 5 0 4 z M 95 876 l -1 0 -1 -7 0 -5 6 -2 6 2 3 6 1 4 0 0 0 0 2 4 2 6 -4 -1 1 0 -3 0 -7 -1 z M 191 843 l 1 0 0 1 0 0 1 3 -2 6 -2 3 -10 1 -7 -4 0 -6 3 -3 0 0 0 0 0 1 4 2 5 -3 0 0 0 0 1 0 0 0 1 0 2 0 1 0 1 0 z M 27 823 l 5 2 4 3 -1 1 0 0 0 0 0 0 4 2 3 2 0 0 2 2 3 6 1 4 -1 -1 -2 3 0 6 -4 5 -2 2 -1 -2 -2 2 -1 -1 0 0 0 1 0 1 -3 1 -5 2 1 1 -3 1 -3 1 -5 1 -7 1 -5 0 1 -1 -1 0 1 -1 1 -2 -5 -2 -2 -8 3 -4 1 1 1 0 0 0 -1 -3 5 -4 4 -1 0 -1 4 -3 4 -3 0 -1 -1 0 2 -3 z M 281 794 l 2 1 5 3 0 2 -1 0 -1 -1 -1 1 0 -1 0 3 2 5 1 0 1 0 0 4 0 7 1 5 -6 0 -3 -1 -1 0 0 -1 0 0 0 0 -3 -3 0 -7 4 -3 1 -5 -1 -6 -1 -1 0 0 0 0 0 0 0 0 0 -1 z " />
					<path id="CD47" class="OUTLINE 경북" d =" M 560 528 l 7 2 5 -4 3 -4 3 -4 1 -1 0 0 3 -4 3 2 2 6 -1 8 -2 3 -1 0 0 0 -1 4 0 4 0 0 -1 0 0 -1 0 1 0 0 -2 2 -2 3 0 2 1 0 0 0 1 4 0 4 -1 -1 -1 1 0 0 1 4 -1 3 0 0 0 0 0 0 0 1 -1 3 0 3 0 0 0 1 -1 -1 -1 4 -1 8 -2 7 -1 6 -2 4 -2 4 -7 -3 -1 0 -7 -2 -4 2 -3 2 -6 1 -4 -7 -3 -3 -4 -3 -5 0 -9 1 -4 1 -4 2 -2 4 0 1 -1 1 0 2 2 3 -3 0 -4 3 -1 -1 -1 0 -3 4 -7 0 -5 -4 -3 0 -3 1 -4 3 -4 5 -5 1 -6 3 -8 0 -7 -2 -8 -1 -7 2 -6 -3 -3 -3 -3 -3 -1 -7 0 -5 1 -6 5 -3 6 0 3 5 3 -1 4 -2 4 -2 0 -8 2 -7 3 -6 1 -2 0 -4 2 1 4 -4 -1 -7 -2 -9 0 -4 -3 -7 -3 -1 -9 0 -5 1 -3 3 -7 4 -2 2 -1 -1 -2 -2 0 7 -3 7 -2 4 -1 0 -3 -3 -2 -7 -5 1 -3 3 -3 4 -2 5 0 5 6 0 8 4 0 5 -8 1 -3 2 -3 5 1 5 5 4 0 5 -6 0 -5 2 1 3 4 4 0 8 -5 -3 -3 -3 -7 -1 -8 1 -3 2 -2 0 -3 -2 -5 -3 2 -3 0 0 1 0 2 -4 -1 -7 -2 -4 -3 -3 -5 -4 -2 -4 -1 -4 -1 0 -1 0 -5 -2 -8 0 -7 -2 -5 -3 -1 0 -3 1 -1 -4 -4 -3 -4 -5 4 -7 -3 -7 -2 -4 0 0 0 -1 -2 -4 4 -2 4 -3 5 -2 3 -6 1 -3 0 -2 0 -1 3 -4 1 -6 0 -8 7 0 4 1 -1 -2 -2 -6 -2 -5 -6 -1 -3 3 -2 0 -1 -1 -1 0 -2 -2 -4 -3 -2 -3 -2 3 -6 0 -1 -6 3 -5 3 -4 0 -3 -1 0 1 -2 -3 -3 1 -3 2 -3 -2 -2 0 -2 1 -4 0 -1 0 0 0 -1 0 0 0 0 0 0 0 -1 0 -2 3 -3 0 -5 -4 -3 -2 -5 -7 -3 -1 -5 6 -2 1 -1 0 0 0 -4 4 -4 0 1 2 4 4 5 2 1 -1 -1 1 -2 1 -4 -1 -5 -4 -3 -4 -1 0 -1 0 0 1 -1 3 -1 6 -2 3 -6 2 1 3 2 4 -2 1 0 3 3 5 0 -1 -2 -3 -4 1 -8 1 -5 3 -1 3 3 1 -2 4 -4 3 -2 1 1 5 2 6 0 2 -6 3 -4 0 0 4 2 4 4 4 3 7 3 7 -1 5 -1 2 -6 -2 -8 3 -7 2 -5 4 -4 4 -2 4 -4 4 -3 3 -5 5 -3 0 -1 3 1 2 -2 4 -1 5 3 4 1 6 1 1 -7 3 -4 2 0 4 2 6 5 7 -1 4 -6 4 -1 3 2 4 0 5 0 1 1 1 -1 3 2 3 0 3 -5 7 1 3 2 5 4 6 3 5 0 -1 0 0 -1 0 -3 0 -3 3 -4 3 -4 5 -2 5 -4 1 -1 1 1 1 -1 1 1 0 0 0 0 0 0 1 0 0 -1 1 2 1 4 2 5 6 7 -1 3 0 1 0 1 -1 2 1 3 0 4 0 1 0 1 -1 1 1 1 0 0 0 1 1 5 0 6 1 5 -1 -1 0 4 4 7 2 3 -1 0 1 1 1 4 3 7 0 9 0 6 -2 5 -1 -2 -1 1 -3 5 -2 6 0 7 4 8 1 5 0 2 0 0 1 2 -1 2 0 1 0 0 0 0 0 0 -1 3 0 7 -2 8 -3 6 -2 3 -1 6 -1 7 0 7 1 8 -1 4 0 -1 1 4 2 3 1 5 1 5 6 3 0 0 0 3 -4 4 -4 3 -1 0 -2 4 6 2 z M 797 205 l 2 1 1 0 -1 3 0 6 1 2 -3 2 -3 3 -6 0 -4 -2 -3 -5 1 -5 6 -2 4 -2 0 0 2 0 z " />
					<path id="CD48" class="OUTLINE 경남" d =" M 307 751 l 4 2 0 5 -1 4 0 0 -1 0 -1 4 1 4 1 0 -1 1 3 3 3 4 3 0 -1 -1 0 0 4 -2 7 -1 4 1 0 0 1 1 0 5 0 7 -1 4 -1 4 1 2 0 0 0 0 0 0 1 0 -1 1 0 0 0 0 -1 1 -2 -1 -1 1 -2 -3 -4 1 -6 -3 -2 -8 -6 2 -2 6 -6 -1 -2 -6 1 -4 -1 1 -1 -4 -2 -3 -2 -4 0 -7 2 -3 0 -1 0 0 0 -2 0 0 0 -1 0 -1 3 -1 2 -5 z M 441 731 l 3 1 1 2 -2 3 0 1 0 0 0 1 -1 0 0 4 3 3 1 5 0 4 0 0 -1 2 -2 3 -1 3 2 0 -1 1 2 -1 3 -2 3 -1 -1 1 -2 5 -1 4 -2 -1 -1 1 -1 1 3 2 0 7 -2 -3 -1 0 0 0 0 0 -1 1 -3 -1 -2 3 -3 4 -1 3 4 4 3 0 -1 1 -1 1 0 -1 -1 0 -1 0 -1 0 -4 2 -6 1 -1 -3 0 0 -1 0 -1 0 2 -5 -1 -3 -2 1 -2 0 -1 -3 5 -3 0 -6 0 -4 0 1 -1 -2 -2 1 0 1 0 0 -3 2 -4 2 -1 3 0 0 -1 0 -2 -4 -3 -3 -1 -4 0 -4 1 -1 0 0 3 -3 4 -4 1 0 0 0 0 0 3 3 4 1 0 -1 4 1 4 0 -1 -2 1 -1 -1 0 0 0 0 0 -3 -4 2 -5 5 -1 3 -5 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 0 0 0 -1 -1 1 0 1 1 0 -4 z M 429 693 l -4 1 -3 2 -2 4 1 3 0 0 0 1 2 3 0 3 0 0 0 1 -1 -1 -1 0 -1 1 4 2 3 6 2 2 -2 1 3 2 -2 1 0 0 0 0 -3 1 -4 1 1 -2 1 -1 -4 -1 3 -3 -4 -1 -3 -4 -3 1 -1 2 0 0 -1 0 0 0 -1 0 -1 -1 -2 -1 -1 2 0 0 -1 0 -3 -1 0 5 -3 2 -3 2 -7 4 0 4 2 -3 5 -2 4 -2 0 -1 0 -1 1 -1 1 1 1 0 0 0 1 -1 2 1 0 0 -1 4 1 4 0 0 0 0 1 -1 0 1 0 0 0 1 2 1 -4 3 -2 2 -1 0 0 0 -1 0 0 0 0 0 0 0 0 0 -4 -1 -1 2 4 2 -2 3 -1 5 -1 7 1 6 1 -2 0 0 1 0 1 -1 0 0 0 0 -1 -1 1 0 0 0 0 -2 -1 -1 4 2 1 5 -1 -2 -1 4 -2 4 -4 2 -6 0 0 -4 5 -1 -5 -3 -1 -3 -1 2 0 -1 -1 2 -2 -1 -1 -1 -2 1 -2 -1 -1 1 -1 -1 -1 0 1 0 -1 -3 4 -1 4 -1 0 -1 -3 -5 -1 -4 -1 1 0 -1 -1 0 0 0 -1 2 -2 3 0 3 0 0 0 0 0 0 0 0 0 0 -4 2 -2 -1 0 0 0 -1 -1 -1 1 -1 0 -1 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 -4 0 -6 0 -2 7 -6 1 -4 2 0 1 -3 -4 -3 -2 3 -1 -2 0 -2 0 0 -1 -1 0 1 0 -1 1 0 0 -4 -1 -5 -4 -1 -3 0 1 2 -2 1 -2 -1 -2 0 -4 1 -2 0 0 0 0 -2 -2 0 -5 1 -4 2 -3 -3 2 -2 5 -1 4 0 0 0 0 0 0 0 0 -2 0 0 0 1 -3 -2 0 1 0 -3 1 2 2 2 4 0 3 -1 0 0 1 -1 1 1 0 0 0 0 -1 -1 0 -1 -1 -2 2 -3 -2 0 0 -1 0 0 0 0 1 0 0 -3 1 -1 -2 0 0 0 -2 -4 -3 1 3 -1 2 1 0 0 0 -1 1 1 0 0 1 0 0 0 0 0 0 0 0 0 1 -2 1 -4 5 -5 0 -2 -2 0 0 0 0 -1 1 -5 2 -4 1 0 0 -1 -1 -2 -5 3 -6 0 -3 -1 -2 -3 -5 -4 -3 -3 -4 -4 -4 0 -4 -4 -6 -5 -3 -4 -6 0 -8 -1 -4 -2 -3 -3 -8 4 -4 2 -3 -1 -4 0 0 0 0 0 -1 2 -3 3 -5 3 -3 1 -5 -4 -3 0 -5 -2 -8 -6 -6 2 -8 1 -3 2 -4 1 -8 2 -7 3 -3 0 -5 2 -8 5 -3 3 -4 3 -6 5 -2 6 -2 3 -2 4 -3 3 -5 3 -2 4 5 4 3 1 4 3 -1 1 0 5 3 7 2 8 0 5 2 1 0 1 0 1 4 2 4 5 4 3 3 2 4 1 7 -2 4 -1 0 0 0 -2 3 5 3 3 2 2 0 3 -2 8 -1 7 1 3 3 5 3 7 -1 7 -3 5 0 2 -3 3 -7 0 5 1 7 3 3 3 3 6 3 7 -2 8 1 7 2 8 0 6 -3 5 -1 4 -5 4 -3 3 -1 3 0 5 4 7 0 0 8 -5 5 4 4 3 2 2 0 0 0 1 0 3 -1 1 3 5 3 4 3 2 3 4 5 6 2 4 1 1 7 -2 3 0 0 0 3 -3 2 -7 0 -3 6 -1 5 -4 1 -6 3 -1 3 -3 -1 -2 0 -1 4 -4 6 -7 1 -6 2 -5 1 -1 6 0 5 -9 0 -4 1 2 2 5 4 1 3 -2 2 -3 2 -4 1 2 -2 0 -1 -4 -1 -2 6 -3 -2 -1 -3 -3 1 -2 -1 -2 0 -1 1 0 -3 -2 -6 -2 3 -1 1 0 -1 -1 -1 0 -1 -1 1 -3 -3 -3 2 1 0 -1 0 1 1 -1 0 -2 -5 -2 -6 4 -6 z " />
					<path id="CD50" class="OUTLINE 제주" d =" M 115 1034 l 5 2 3 2 5 3 6 2 3 5 -1 4 0 0 1 0 0 0 1 1 2 1 -2 1 3 0 -1 7 -2 1 -3 7 -4 4 -3 5 -3 5 -5 4 -5 0 -3 1 0 0 0 0 0 0 -1 1 -2 1 0 1 -3 1 -8 2 -4 0 0 0 -2 0 -3 2 -6 3 -7 0 -8 1 -7 1 -7 -1 -8 0 -7 0 -6 1 -3 5 -6 -1 -3 -4 -4 -3 -5 -2 -2 -4 -2 -8 2 -7 3 -4 1 0 1 0 3 -3 4 -3 3 -5 3 -4 4 -2 6 -4 4 -2 5 -1 6 -1 7 -3 4 -2 4 -1 5 -1 -1 1 4 -1 7 -1 6 -2 3 -3 1 1 0 0 1 0 0 1 0 0 1 0 2 -1 2 0 1 0 0 0 1 0 6 -1 z " />
					</g>
					<g transform="scale(0.9, 0.66)" filter="url(#dropshadow)">
					<text id="LCD11" class="TEXT" x="156" y="214">서울</text>
					<text id="LCD26" class="TEXT" x="503" y="695">부산</text>
					<text id="LCD27" class="TEXT" x="418" y="567">대구</text>
					<text id="LCD28" class="TEXT" x="67" y="177">인천</text>
					<text id="LCD29" class="TEXT" x="127" y="707">광주</text>
					<text id="LCD30" class="TEXT" x="221" y="463">대전</text>
					<text id="LCD31" class="TEXT" x="531" y="622">울산</text>
					<text id="LCD36" class="TEXT" x="199" y="418">세종</text>
					<text id="LCD41" class="TEXT" x="216" y="245">경기</text>
					<text id="LCD42" class="TEXT" x="370" y="179">강원</text>
					<text id="LCD43" class="TEXT" x="294" y="381">충북</text>
					<text id="LCD44" class="TEXT" x="105" y="449">충남</text>
					<text id="LCD45" class="TEXT" x="179" y="592">전북</text>
					<text id="LCD46" class="TEXT" x="138" y="764">전남</text>
					<text id="LCD47" class="TEXT" x="447" y="460">경북</text>
					<text id="LCD48" class="TEXT" x="367" y="672">경남</text>
					<text id="LCD50" class="TEXT" x="76" y="1070">제주</text>
					</g>
				</svg>
			</div>
			<div id="zone-area" style="width: 150px; position: relative;">
				<div class="zone" id="first"><span class="OUTLINE 서울">서울</span></div>
				<div class="zone"><span class="OUTLINE 부산">부산</span></div>
				<div class="zone"><span class="OUTLINE 대구">대구</span></div>
				<div class="zone"><span class="OUTLINE 인천">인천</span></div>
				<div class="zone"><span class="OUTLINE 광주">광주</span></div>
				<div class="zone"><span class="OUTLINE 대전">대전</span></div>
				<div class="zone"><span class="OUTLINE 울산">울산</span></div>
				<div class="zone"><span class="OUTLINE 세종">세종</span></div>
				<div class="zone"><span class="OUTLINE 경기">경기</span></div>
				<div class="zone"><span class="OUTLINE 충북">충북</span></div>
				<div class="zone"><span class="OUTLINE 충남">충남</span></div>
				<div class="zone"><span class="OUTLINE 전북">전북</span></div>
				<div class="zone"><span class="OUTLINE 전남">전남</span></div>
				<div class="zone"><span class="OUTLINE 경북">경북</span></div>
				<div class="zone"><span class="OUTLINE 경남">경남</span></div>
				<div class="zone"><span class="OUTLINE 강원">강원</span></div>
				<div class="zone"><span class="OUTLINE 제주">제주</span></div>
			</div>
		</div>
		<div id="content">
			<div class="float">
				<!-- 작아진 지도 들어갈 위치 -->
				<div id="mini-map"></div>
				<!-- 지도에 표시된 지역으로 조회한 내역 들어갈 위치 -->
				<div id="content-area">
					<div class="search-area">
						<form action="" method="get">
							<div class="content_title">
								<p id="p" style="font-size : 27px; font-weight: 600"><b></b>으로 떠나볼까요?</p>
							</div>
							<!-- <div id="content_search">
								<div id="search-input">
									<input type="text" id="search-bar" placeholder="What can I help you with today?">
									<button type="button">검색</button>
								</div>
								<div class="search-icon"><button type="submit"><img  src="resources/images/fes_search.png"></button></div>
							</div> -->
						</form>
					</div>
					<div class="list-area"></div>
				</div>
				<!-- 페이징바 크기수정하기 -->
				<div class="pagination">
				</div>
				</div>
				<c:if test="${loginUser.status eq 'A' }">
					<button id="btn" class="btn btn-success" onclick="location.href='insert.attr'">게시물 작성하기</button>
				</c:if>
			</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
	<script type="text/javascript" src="resources/js/function.js"></script> 
	<script>
		$(function(){
			$("#content").hide();
		});
		// url에서 넘겨온 값 추출
		var urlParams = new URLSearchParams(window.location.search); 
		var currentPage = urlParams.get('currentPage');
		console.log(currentPage);
		var sort = urlParams.get('sort');
		var data = null; // 조회해온 데이터 담을 변수 미리 지정
		// 지도지역 클릭시 관광정보 조회해오는 API
		$(document).on("click","svg path", function(){
			var map = $("#main-map svg"); // 지도 태그
			// 지도 선택시 위치 변경하며 리스트 보여줌
			$("svg path").css("fill","#e9eaea").css("transform", "translateY(0px)"); // 재호출시 css 초기화
			$("#main-map").parent().remove(); // 원래 들어있던 영역 지우기
			$(map).css("padding","0");
			$("#content #mini-map").append(map); // 지도 옮기기
			$(this).css("fill","#508edf").css("transform", "translateY(-10px)").css("box-shadow","4px 6px 6px 8px rgba(0, 0, 0, 0.5)"); // css 효과
			$("#content").show();
			var zoneName = $(this).attr("class").split(' ')[1];
			$("#p b").text(zoneName);
			$.ajax({
				url : "searchKeyword1",
				data : {
					keyword : zoneName,
					searchType : 12,
					sort : 'O',
					currentPage: currentPage
				},
				success : function(result){
					console.log(result)
					$(".list-area").empty(); // 지도 다시 클릭하면 누적되어서 나오지 않도록 원래 영역 비워주기
					var totalCount = 0;
					if(zoneName=='서울'||zoneName=='부산'){
						totalCount = result.count;
						for(var i in result.info){
							$(".list-area").append($("<div>").prop("class","containers").prop("id",result.info[i].boardNo)
											.append($("<div>").prop("class","rows")
													.append($("<div>").prop("class","col-sm-6 col-md-4")
															,$("<div>").prop("class","thumbnail").append($("<img>")
															, $("<div>").prop("class","caption"), $("<h3>").text(result.info[i].infoName)
															, $("<p>").text(result.info[i].infoAddress)))));
						}
						$(".containers").each(function(){ // 이미지 넣어주기
							var boardNo = $(this).attr("id");
							$(this).attr("src",result.attachment[boardNo].filePath);
						});
					} else {
						totalCount = result.response.body.totalCount; //// 게시물 총 수
						data = result.response.body.items.item; // 게시글
						dataPrint(data); // 데이터출력
					}
					var pi = pagination(totalCount,currentPage); // 페이징바 처리 위한 객체 생성
					var area = $(".pagination"); // 페이징처리 담을 영역
					$(area).html(pagination(totalCount));
				}
			});
		});
		
		// 데이터 출력해주는 구문 (다른곳에서도 사용하기 위해 함수처리)
		function dataPrint(data){
			for(var i in data){
				$(".list-area").append($("<div>").prop("class","containers")
								.append($("<div>").prop("class","rows")
										.append($("<div>").prop("class","thumbnail").append($("<img>").attr("src",data[i].firstimage2)
												, $("<div>").prop("class","caption"), $("<h3>").text(data[i].title)
												, $("<p>").text(data[i].addr1)))));
			}
		}
		$(document).on("keyup", ".search-input input", function(){
			var search = $(this).val();
			console.log(data)
			var list = [];
			for(var i in data){
				if(search.includes(data[i].addr1) || search.includes(data[i].title)) {
					list.push(data[i]);
				}
				console.log(data[i].addr1);
			}
			dataPrint(list);
		});
		
		function pagination(totalCount, currentPage) {
		    var pi = {
		        totalCount: totalCount,
		        currentPage: currentPage,
		        boardLimit: "6",
		        pageLimit: "5",
		        maxPage : Math.ceil(totalCount / boardLimit),
				startPage : (currentPage-1)/pageLimit * pageLimit +1,
				endPage : startPage+pageLimit-1
		    };
		    
		    pi.endPage = pi.startPage + pi.pageLimit - 1;
		    
		    if (pi.endPage > pi.maxPage) {
		        pi.endPage = pi.maxPage;
		    }
		    
		    // 페이징 처리해서 태그 생성
		    var str = '<ul class="pagination">';
		    
		    if (pi.currentPage > 1) {
		        str += '<li><a href="attraction.bo?currentPage=' + (pi.currentPage - 1) + '">이전</a></li>';
		    }
		    
		    // 페이지 번호 링크
		    for (var i = pi.startPage; i <= pi.endPage; i++) {
		        str += '<li><a href="attraction.bo?currentPage=' + i + '">' + i + '</a></li>';
		    }
		    
		    // 다음 페이지 링크
		    if (pi.currentPage < pi.maxPage) {
		        str += '<li><a href="attraction.bo?currentPage=' + (pi.currentPage + 1) + '">다음</a></li>';
		    }
		    
		    str += '</ul>';
		    
		    return str;
		}
		
		//지도에 호버이벤트
		$(function() {
			$("path").hover(
				function() {
					var location = $(this).attr("class");
					location = location.substring(8,10);
					location = "."+location;
					var $span = $(this).closest("#main-map").next().find(location).parent();
					$span.css({"background":"#508edf","color":"white"});
				},
				function() {
					var location = $(this).attr("class");
					location = location.substring(8,10);
					location = "."+location;
					var $span = $(this).closest("#main-map").next().find(location).parent();
					$span.css({"background":"#fff","color":"black"});
				}
			);
		});
		// 게시물 클릭시 상세페이지로 이동 
		$(document).on("click",".containers", function(){
			var boardNo = $(this).attr("id");
			location.href="detail.attr?boardNo="+boardNo;
		})
	</script>
  </body>
</html>
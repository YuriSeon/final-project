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
		.attr div {
			border: 1px solid;
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
			height: 720px;
			margin-top: 10px;
		}
		.attr #main-map{
			width: 70%;
			height: 100%;
			margin-left: 5%;
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
		.attr #zone-area>div:hover {
			cursor: pointer;
			background-color: rgb(173, 173, 173);
		}
		.attr #zone-area>div:active {
			font-weight: 700;
			background-color: rgb(173, 173, 173);
			color: white;
		}
		.attr #zone-area #first{
			margin-top: 20px;
		}
		.attr .float>div, .attr #content-area>div, .attr .list, .attr .content_search div {
			float: left;
		}
		.attr #mini-map {
			width: 40%;
			height: 100%;
		}
		.attr #content-area {
			width: 55%;
			height: 90%;
			margin-right: 5%;
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
			font-size: 20px;
		}
		.attr .content-title #p {
		}
		.attr .content-search {
			width: 100%;
			height: 20%;
		}
		.attr .search-input {
			width: 80%;
			height: 100%;
		}
		.attr .search-icon {
			width: 20%;
			height: 100%;
		}
		.attr .search-icon img, .attr .search-icon button {
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
		

   	</style>
  </head>
   <body>
	<%@include file="../../common/menubar.jsp" %>
	<!-- D3 CDN -->
   <script src="https://d3js.org/d3.v7.min.js"></script>
   
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
	<!-- 먼저 상세페이지로 이동하기위해 만들어놓은 태그 나중에 지우기 -->
	<a href="detail.attr?boardNo=62">상세페이지로이동태그</a>
	<a href="insert.attr">insert page</a>
	<a href="update.attr?boardNo=62">수정페이지로이동태그</a>
    <div class="attr">
		<div id="mainPhoto"></div>
		<div class="float">
			<div id="main-map">
				<!-- main화면의 큰 지도 들어갈 위치 -->
			</div>
			<div id="zone-area">
				<div class="zone" id="first"><span class="서울">서울</span></div>
				<div class="zone"><span class="부산">부산</span></div>
				<div class="zone"><span class="대구">대구</span></div>
				<div class="zone"><span class="인천">인천</span></div>
				<div class="zone"><span class="광주">광주</span></div>
				<div class="zone"><span class="대전">대전</span></div>
				<div class="zone"><span class="울산">울산</span></div>
				<div class="zone"><span class="세종">세종</span></div>
				<div class="zone"><span class="경기">경기</span></div>
				<div class="zone"><span class="충북">충북</span></div>
				<div class="zone"><span class="충남">충남</span></div>
				<div class="zone"><span class="전북">전북</span></div>
				<div class="zone"><span class="전남">전남</span></div>
				<div class="zone"><span class="경북">경북</span></div>
				<div class="zone"><span class="경남">경남</span></div>
				<div class="zone"><span class="강원">강원</span></div>
				<div class="zone"><span class="제주">제주</span></div>
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
								<p id="p"><b>지역명</b>으로 떠나볼까요?</p>
							</div>
							<div class="content_search">
								<div class="search-input">
									<input type="text" id="search-bar" placeholder="What can I help you with today?">
								</div>
								<div class="search-icon"><!--<button type="submit"><img  src="resources/images/fes_search.png"></button>--></div>
							</div>
						</form>
					</div>
					<div class="list-area"><!-- 양쪽과 하방에 마진주는 div -->
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
						<div class="list">
							<div class="area-img">
								<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
							</div>
							<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
							<h4>여행지 이름 들어갈 곳</h4>
							<ul>
								<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 페이징바 크기수정하기 -->
				<div class="pagination">
					<ul>
						<li><a href="#">Prev</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">Next</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../../common/footer.jsp" %>
	<script>
		$(".zone").on("click", function(){
			var zoneName = $(this).attr("class")
			$.ajax({
				url : "zonesearch.attr",
				data : {
					zoneName : zoneName
					// 일단 서울, 부산 이런식으로 했는데 지역코드 변경하면 그거에 맞춰서 넣기
				},
				success : function(result){
					console.log(result);
				},
				complete : function(){
					console.log("일단됨");
				}
			});
		});
	</script>
  </body>
</html>
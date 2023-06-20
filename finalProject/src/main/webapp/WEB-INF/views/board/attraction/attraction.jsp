<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>명소</title>
   	<style>
   		
		#p {
			font-size: 25px;
		    color: black;
		    font-weight: 800;
		    margin-bottom: 15px;
		}
		b {
			font-size : 30px;
		}
		#like{
			width : 20px;
		}
		#content-array {
			float : left;
		}
		#content-array div{
			width : 100%
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
		
		/* 클릭시 상세페이지 이동 */
		$(function(){
			$(".list-area").on("click", function(){
				/* boardNo 꺼내는거 마저 작성하기 */
				var bno = $(this).
				location.href='detail.attr?bno='+bno;
			});
		});
	</script>
	<!-- 먼저 상세페이지로 이동하기위해 만들어놓은 태그 나중에 지우기 -->
	<a href="detail.attr">상세페이지로이동태그</a>
	<a href="insert.attr">insert page</a>
    <div class="page-heading-about"></div>
    <!-- main화면의 큰 지도 들어갈 위치 -->
    <!-- react라서 수업 진도 나가고 나서 해보기 d3 cdn은 미리 넣어둠! -->
    <div id="main-map"></div>
    <div id="content">
    	<div id="content-array">
	    	<!-- 작아진 지도 들어갈 위치 -->
	    	<div id="mini-map"></div>
	    	<!-- 지도에 표시된 지역으로 조회한 내역 들어갈 위치 -->
		    <div id="content-area">
				<div class="search_area">
					<form action="" method="get">
						<div class="content_title">
							<p id="p"><b>지역명</b>으로 떠나볼까요?</p>
						</div>
						<div class="content_search">
							<input type="text" id="search_input" name="search_input">
							<button type="submit">검색</button>
						</div>
					</form>
				</div>
			
				<div class="list-area"><!-- 양쪽과 하방에 마진주는 div -->
					<div class="area-img">
						<img src="" alt="여행지 이미지 크기 정해서 들어갈 곳">
					</div>
					<!-- 좋아요 클릭 전 후 이미지 (조건걸고 좋아요 후 출력) -->
					<img id="like" src="resources/images/Like-before.png"> 
					<img id="like" src="resources/images/Like-after.png"> <br>
					<h4>여행지 이름 들어갈 곳</h4>
					<ul>
						<li><i class="fa fa-map-marker"></i>주소이름 들어갈 곳</li>
					</ul>
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
	<%@include file="../../common/footer.jsp" %>
  </body>
</html>
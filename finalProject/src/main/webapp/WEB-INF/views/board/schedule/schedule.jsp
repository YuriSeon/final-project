<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/schedule.css?v=1">
    <title>일정 자랑</title>
    <style type="text/css"></style>
   </head>
   <body>
    <%@include file="../../common/menubar.jsp" %>
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
    <a href="detail.sc?boardNo=103">상세페이지로</a>
   <div class="main-schedule"></div>
   <div class="schedule">
        <div class="title-area">
            <div><span>일정자랑</span></div>
            <div><button onclick="pageLoad(1);">게시물 등록</button></div>
        </div>
        <hr>
        <div class="sidebar-area">
            <div id="side">
                <div class="side-title">
                        <span>Sort</span>
                </div>
                <div class="col-lg-12"><br>
                    <a href="schedule.bo?sort=recently">Recently</a><br>
                    <a href="schedule.bo?sort=recommend">Recommend</a><br>
                    <a href="schedule.bo?sort=views">Views</a><br>
                </div>  
            </div>
        </div>
        <div class="content-area">
            <div class="list" onclick="pageLoad(2)">
            	<input type="hidden" name="boardNo" value="">
                <div class="list1">
                    <div class="left-content">
                        <div class="list-title">
                            <h5>제목</h5>
                        </div>
                        <div class="list-concept">
                            <p>여행 컨셉 : 힐링 맛집탐방</p>
                        </div>
                        <div class="main-dark-button"><a href="event-details.html">동행하러가기</a></div>
                    </div>
                </div>
                <div class="thumb">
                    <img src="resources/images/star-after.png">
                </div>
                <div class="list2">
                    <div class="right-content">
                        <ul>
                            <li>
                                <i class="fa fa-clock-o"></i>
                                <h6>2023-07-08 <br>&nbsp;&nbsp;&nbsp; ~ 2023-07-10<br> (3days)</h6>
                            </li>
                            <li>
                                <i class="fa fa-map-marker"></i>
                                <h6>강원도 강릉시</h6>
                            </li>
                            <li>
                                <i class="fa fa-users"></i>
                                <h6>3-4인</h6>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
   </div>
	
  
	<%@include file="../../common/footer.jsp" %>
	<script>
		/* 페이지 이동 이벤트 */
        function pageLoad(num){
        	if(num==1){ // 등록하기 페이지
        		location.href="insert.sc";
        	} else { // 디테일뷰 페이지
        		var bno = $(this).children().eq(0).val(); // 이벤트 해당 게시물번호
				location.href="detail.sc?boardNo="+bno;
        	}
        }
	</script>
	
  </body>

</html>

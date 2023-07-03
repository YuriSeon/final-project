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
    <a href="detail.sc">상세페이지로</a>
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
	
  <!--   <div class="schedule">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row" id="tabs">
                        <div class="col-lg-12">
                            <section class='tabs-content'>
                                <article id='tabs-1'>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="heading">
                                                <b>일정 자랑</b>
                                                <div class="button-area">
                                                    <button onclick="pageLoad(1)">게시물 등록</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="sidebar">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="heading-sidebar">
                                                            <h4>Sort</h4>
                                                        </div>
                                                    </div>
                                                    check시 style="color: dimgray;" 적용되도록 설정하기 기본은 최신순
                                                    <div class="col-lg-12"><br>
                                                        <a href="schedule.bo?sort=recently">Recently</a><br>
                                                        <a href="schedule.bo?sort=recommend">Recommend</a><br>
                                                        <a href="schedule.bo?sort=views">Views</a><br>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="row">
	                                                <div class="col-lg-12" onclick="detailView();">
	                                                    <div class="event-item">
	                                                        <div class="row">
	                                                            <div class="col-lg-4">
	                                                                <div class="left-content">
	                                                                	<input type="hidden" name="boardNo" value="">
	                                                                    <h4>게시물제목</h4>
	                                                                    <p>여행 컨셉 : </p>
	                                                                    	<div class="main-dark-button"><a href="">동행하러가기</a></div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="col-lg-4"><br>
	                                                                <div class="thumb">
	                                                                	게시글 대표 이미지 넣을 부분
                                                                        <div class="title-img">
                                                                            <img src="" alt="">
                                                                        </div>
	                                                                </div>
	                                                            </div>
	                                                            <div class="col-lg-4">
	                                                                <div class="right-content">
	                                                                    <ul>
	                                                                        <li>
	                                                                            <i class="fa fa-clock-o"></i>
	                                                                            <h6>${p.startDate }<br>~ ${p.endDate }<br> (${p.totalDate }days)</h6>
	                                                                        </li>
	                                                                        <li>
	                                                                            <i class="fa fa-map-marker"></i>
	                                                                            <h6>${p.infoName }</h6>
	                                                                        </li>
	                                                                        <li>
	                                                                            <i class="fa fa-users"></i>
	                                                                            <c:choose>
		                                                                            <c:when test="${p.together ne 0 }">
		                                                                            	<h6>${p.together }명</h6>
		                                                                            </c:when>
		                                                                            <c:otherwise>
		                                                                            	<h6>${p.togetherCount }명</h6>
		                                                                            </c:otherwise>
	                                                                            </c:choose>
	                                                                        </li>
	                                                                    </ul>
	                                                                </div>
	                                                            </div>
	                                                        </div>
	                                                    </div>
	                                                </div>
                                                <div class="col-lg-12">
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
                                    </div>
                                </article>                            
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
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

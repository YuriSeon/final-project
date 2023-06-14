<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>일정 자랑</title>
   </head>
    <%@include file="../common/menubar.jsp" %>
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
   <div class="main-schedule">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>

    <div class="shows-events-tabs">
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
                                                <b style="font-size: 30px; color: gray;">일정 자랑</b>
                                                <div class="main-dark-button" style="float: right; margin-bottom: 15px;">
                                                    <a href="insert.sc">게시물 등록</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="schedule sidebar">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="schedule heading-sidebar">
                                                            <h4>Sort</h4>
                                                        </div>
                                                    </div>
                                                    <!-- check시 style="color: dimgray;" 적용되도록 설정하기 기본은 최신순-->
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
                                            	<c:forEach var="p" items="list">
	                                                <div class="col-lg-12" onclick="detailView();">
	                                                    <div class="event-item">
	                                                        <div class="row">
	                                                            <div class="col-lg-4">
	                                                                <div class="left-content">
	                                                                	<input type="hidden" name="boardNo" value="${p.boardNo}">
	                                                                    <h4>${p.boardTitle}</h4>
	                                                                    <p>여행 컨셉 : ${p.concept}</p>
	                                                                    <c:if test="${p.together not eq 0 }">
	                                                                    	<div class="main-dark-button"><a href="">동행하러가기</a></div>
	                                                                    </c:if>
	                                                                </div>
	                                                            </div>
	                                                            <div class="col-lg-4"><br>
	                                                                <div class="thumb">
	                                                                	<!-- 게시글 대표 이미지 넣을 부분 -->
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
		                                                                            <c:when test="${p.together not eq 0 }">
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
                                                </c:forEach>
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
    </div>
	<%@include file="../common/footer.jsp" %>
	<script>
        /*
            ajax로 페이지로드된 후 나온 bno로 조회해와서 img태그 append로 넣기 !
        */
		/* 여기 페이지는 여기 작성하는거랑 페이징처리만 하면 끝! */
		
		/* 게시물 클릭시 상세페이지로 이동 */
		function detailView(){
		}
	</script>
  </body>

</html>

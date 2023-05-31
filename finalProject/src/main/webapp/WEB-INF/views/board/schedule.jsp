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
                                                    <a href="">게시물 등록</a>
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
                                                        <a href="">Recently</a><br>
                                                        <a href="">Recommend</a><br>
                                                        <a href="">Views</a><br>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-9">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="event-item">
                                                        <div class="row">
                                                            <div class="col-lg-4">
                                                            	<!-- example. 데이터 출력시 해당 위치에 값 출력하기 동행버튼은 동행 구할시에만 나타나게 설정 -->
                                                                <div class="left-content">
                                                                    <h4>강릉으로 같이 놀러가요</h4>
                                                                    <p>여행 컨셉 : 힐링 맛집탐방</p>
                                                                    <div class="main-dark-button"><a href="event-details.html">동행하러가기</a></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4"><br>
                                                                <div class="thumb">
                                                                    <img src="assets/re/강릉.jpeg" alt="강릉사진">
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-4">
                                                                <div class="right-content">
                                                                    <ul>
                                                                        <li>
                                                                            <i class="fa fa-clock-o"></i>
                                                                            <h6>2023-07-08 <br>~ 2023-07-10<br> (3days)</h6>
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
	
  </body>

</html>

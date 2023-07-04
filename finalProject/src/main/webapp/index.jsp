<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>메인</title>
</head>
    
    <body>
    <!-- ***** Preloader Start ***** -->
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
    <!-- ***** Preloader End ***** -->
    <%@include file="WEB-INF/views/common/menubar.jsp" %>
    
    <!-- ***** Pre HEader ***** -->
 	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
    <!-- ***** Header Area End ***** -->

    <!-- ***** Main Banner Area Start ***** -->
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
                            <a href="ticket-details.html">가보자고</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	
	<%@include file="WEB-INF/views/common/footer.jsp" %>
    <script src="resources/js/custom.js"></script>

  </body>
</html>
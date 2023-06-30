<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- css -->
    <link rel="stylesheet" type="text/css" href="resources/css/dashboard_admin.css?v=2">
    <!-- Alertify JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	<!-- Alertify CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Alertify Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
    <title>대시보드</title>
</head>
<body>
	<!-- 알림창 -->
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.message('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
    <!-- Header - Start  -->
<header id="header">
    <div class="menu-button">
        <div id="nav-icon3">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div id="top-bar">
        <span>ADMINISTRATOR</span>
        <button class="btn btn-primary" onclick="location.href='custom.ad'">사용자</button>
    </div>
</header>
<!-- Header - End  -->
<!-- Navigation - Start  -->
<nav id="sidemenu">
    <div class="main-menu">
        <ul class='main-menu'>
            <li class="link-active">
                <a href="admin.ad">
                    <span class='glyphicon glyphicon-home'></span> 대시보드
                </a>
            </li>
      
            <li id="board-manage">
                <a style="color: white;">
                    <span class='glyphicon glyphicon-list-alt'></span> 게시글관리
                </a>
                <!-- submenu start -->
                <ul id="submenu" >
                    <li>
                        <a href="theme.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 테마
                        </a>
                    </li>
                    <li>
                        <a href="festival.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 축제
                        </a>
                    </li>
                    <li>
                        <a href="attraction.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 명소
                        </a>
                    </li>
                    <li>
                        <a href="feed.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 피드
                        </a>
                    </li>
                    <li>
                        <a href="schedule.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 일정자랑
                        </a>
                    </li>
                    <li>
                        <a href="together.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 함께가치
                        </a>
                    </li>
                </ul>
                <!-- submenu end -->
            </li>
            
            <li>
                <a href="member.ad">
                    <span class='glyphicon glyphicon-user'></span> 회원관리
                </a>
            </li>
<!--             <li> -->
<!--                 <a href="#"> -->
<!--                     <span class='glyphicon glyphicon-comment'></span> 쪽지관리 -->
<!--                 </a> -->
<!--             </li> -->
            <li id="notice-manage">
                <a style="color: white;">
                    <span class='glyphicon glyphicon-question-sign'></span> 문의관리
                </a>
                <!-- submenu start -->
                <ul id="submenu" >
                    <li>
                        <a href="notice.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 공지사항
                        </a>
                    </li>
                    <li>
                        <a href="faq.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> FAQ
                        </a>
                    </li>
                    <li>
                        <a href="qna.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> Q&amp;A
                        </a>
                    </li>
                </ul>
                <!-- submenu end -->
            </li>
            <li>
                <a href="report.ad">
                    <span class='glyphicon glyphicon-exclamation-sign'></span> 신고관리
                </a>
            </li>
        </ul>
        <ul class='main-menu bottom'>
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-user'></span> 관리자
                </a>
            </li>
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-cog'></span> 환경설정
                </a>
            </li>
        </ul>
    </div>
    <p class="copyright">&copy; 2023</p>
</nav>
<!-- Navigation - End  -->

   
   <script>
    //사이드바 열고 닫기
    $("#header>.menu-button").click(function() {
        $("#sidemenu").toggleClass("open");
        $(".copyright").toggleClass("show");
    });
    $("#board-manage, #notice-manage").click(function() {
        $("#sidemenu").addClass("open");
        $(".copyright").addClass("show");
    });

    // 게시판 서브메뉴 
    $(function(){
        // $("#board-manage>a").next("ul").slideUp();
        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#board-manage>a, #notice-manage>a").click(function(){
            console.log("클릭")
            var submenu = $(this).next("ul");
            var submenu2 = $(this).next("ul");
            // submenu 가 화면상에 보일때는 위로 아니면 아래로 펼치기
            if( submenu.is(":visible") ){
                submenu.slideUp();
                submenu2.slideUp();
            }else{
                submenu.slideDown();
                submenu2.slideDown();
            }
        });
        $("#header>.menu-button").click(function(){
            var submenu = $("#board-manage>a").next("ul");
            var submenu2 = $("#notice-manage>a").next("ul");
            // submenu 가 화면상에 보일때는 위로 아니면 아래로 펼치기
            if( submenu.is(":visible") || submenu2.is(":visible") ){
                submenu.slideUp();
                submenu2.slideUp();
            }
        });
    });
    
    //게시판 단축키 이동
    $(document).on("keydown", function(event) {
    	var target = event.target;
    	var key = event.keyCode;
    	//input에 입력할때는 제외
    	if (target.nodeName !== "INPUT" && target.nodeName !== "TEXTAREA") {
    		if (key === 49) {
    			location.href="admin.ad";
    		}else if (key === 50) {
    			location.href="theme.ad";
			}else if (key === 51) {
    			location.href="festival.ad";
			}else if (key === 52) {
    			location.href="attraction.ad";
			}else if (key === 53) {
    			location.href="feed.ad";
			}else if (key === 54) {
    			location.href="schedule.ad";
			}else if (key === 81) {
    			location.href="together.ad";
			}else if (key === 87) {
    			location.href="member.ad";
			}else if (key === 69) {
    			location.href="notice.ad";
			}else if (key === 82) {
    			location.href="faq.ad";
			}else if (key === 84) {
    			location.href="qna.ad";
			}else if (key === 89) {
    			location.href="report.ad";
			}	
		}
   	});
   </script>
</body>
</html>
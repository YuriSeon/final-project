<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="resources/css/dashboard_admin.css">
    <title>게시글관리-테마</title>
</head>
<body>
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
        <button class="btn btn-primary">관리자</button>
        <button class="btn btn-primary">사용자</button>
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
                        <a href="adTheme.ad">
                            <span class='glyphicon glyphicon-list-alt'></span> 테마
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 축제
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 명소
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 피드
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 일정자랑
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 함께가치
                        </a>
                    </li>
                </ul>
                <!-- submenu end -->
            </li>
            
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-user'></span> 회원관리
                </a>
            </li>
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-comment'></span> 쪽지관리
                </a>
            </li>
            <li id="notice-manage">
                <a style="color: white;">
                    <span class='glyphicon glyphicon-question-sign'></span> 문의관리
                </a>
                <!-- submenu start -->
                <ul id="submenu" >
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> 공지사항
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> FAQ
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <span class='glyphicon glyphicon-list-alt'></span> Q&A
                        </a>
                    </li>
                </ul>
                <!-- submenu end -->
            </li>
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-exclamation-sign'></span> 신고관리
                </a>
            </li>
        </ul>
        <ul class='main-menu bottom'>
            <li>
                <a href="#">
                    <span class='glyphicon glyphicon-user'></span> 프로필
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
<!-- Content - Start  -->
<div id="content-wrapper" style="background-color: #EEEEEE;">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>게시글 관리 - 테마</h1>
        </div>
        <div class="board-theme">
            <div class="search-btn" id="searchBtn">
                <!-- 검색 시작 -->
                <div class="search-section">
                    <select name="searchCate" id="searchCate">
                        <option value="title">제목</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input type="text" name="searchBar" id="searchBar">
                    <button class="btn btn-default" id="searchBtn">검색</button>
                </div>
                <!-- 검색 끝 -->
                <!-- 버튼 시작 -->
                <div>
                    <button class="btn btn-info">게시물 등록</button>
                    <button class="btn btn-danger">선택삭제</button>
                </div>
                <!-- 버튼 끝 -->
            </div>
            <!-- 결과 테이블 시작  -->
            <div class="current-board theme-board">
                <table class="theme-table" border="1">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="chkAll"></th>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>작성시각</th>
                            <th>좋아요</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>추천! 웰니스 관광지</td>
                            <td>관리자</td>
                            <td>2023.06.03</td>
                            <td>2</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <th><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>추천! 웰니스 관광지</td>
                            <td>관리자</td>
                            <td>2023.06.03</td>
                            <td>2</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <th><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>추천! 웰니스 관광지</td>
                            <td>관리자</td>
                            <td>2023.06.03</td>
                            <td>2</td>
                            <td>5</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 결과 테이블 끝 -->
            <!-- 페이징 시작 -->
            <div id="pagingArea" align="center">
                <!-- <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul> -->
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>

                </ul>
            </div> 
            <!-- 페이징 끝 -->
        </div>
    </div><!-- container-fluid -->
</div>

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
    
    //체크박스 전체선택
    $(function() {
        $("#chkAll").click(function() {
            if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
            else $("input[name=chk]").prop("checked", false);
        });
        
        $("input[name=chk]").click(function() {
            var total = $("input[name=chk]").length;
            var checked = $("input[name=chk]:checked").length;
            if(total != checked){
                $("#chkAll").prop("checked", false);
            }else{
                $("#chkAll").prop("checked", true); 
            }
        });
    });
   
</script>
</body>
</html>
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
    <title>Document</title>
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
                <a href="#">
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
                        <a href="#">
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
        <h1>대시보드</h1>
        </div>
        <!-- visitors start -->
        <div class="visit-section">
            <table>
                <tr>
                    <th style="border-top-left-radius: 20px;">오늘 방문자</th>
                    <th>이번주 방문자</th>
                    <th>이번달 방문자</th>
                    <th style="border-top-right-radius: 20px;">총 방문자</th>
                </tr>
                <tr>
                    <td>100명</td>
                    <td>200명</td>
                    <td>300명</td>
                    <td>400명</td>
                </tr>
            </table>
        </div>
        <!-- visitors end -->
        <div class="dash-middle">
            <!-- board-count start -->
            <div class="container">
                <canvas id="myChart"></canvas>
            </div>
            <!-- board-count end -->
            <!-- current-board start -->
            <div class="current-board">
                <span>최근 신고 내역</span>
                <table style="margin-bottom: 20px;">
                    <thead>
                        <tr>
                            <th colspan="2">제목</th>
                            <th>작성자</th>
                            <th>신고횟수</th>
                            <th>신고자</th>
                            <th>신고날짜</th>
                            <th>신고사유</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="2">광고글 도배</td>
                            <td>user01</td>
                            <td>2</td>
                            <td>user02</td>
                            <td>2023.06.01</td>
                            <td><button class="btn btn-info">신고 사유</button></td>
                        </tr>
                        <tr>
                            <td colspan="2">광고글 도배</td>
                            <td>user01</td>
                            <td>2</td>
                            <td>user02</td>
                            <td>2023.06.01</td>
                            <td><button class="btn btn-info">신고 사유</button></td>
                        </tr>
                        <tr>
                            <td colspan="2">광고글 도배</td>
                            <td>user01</td>
                            <td>2</td>
                            <td>user02</td>
                            <td>2023.06.01</td>
                            <td><button class="btn btn-info">신고 사유</button></td>
                        </tr>
                        <tr>
                            <td colspan="2">광고글 도배</td>
                            <td>user01</td>
                            <td>2</td>
                            <td>user02</td>
                            <td>2023.06.01</td>
                            <td><button class="btn btn-info">신고 사유</button></td>
                        </tr>
                        <tr>
                            <td colspan="2">광고글 도배</td>
                            <td>user01</td>
                            <td>2</td>
                            <td>user02</td>
                            <td>2023.06.01</td>
                            <td><button class="btn btn-info">신고 사유</button></td>
                        </tr>
                    </tbody>
                </table>
                <span>최근 작성 글</span>
                <table style="margin-bottom: 20px;">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>위치</th>
                            <th>작성시각</th>
                            <th>좋아요</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>피드</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>피드</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>피드</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>피드</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>피드</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
                <span>최근 작성 문의</span>
                <table>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>위치</th>
                            <th>작성시각</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>Q&A</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>Q&A</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>Q&A</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>Q&A</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>제목입니다.</td>
                            <td>작성자</td>
                            <td>Q&A</td>
                            <td>2023.06.01</td>
                            <td>1</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- current-board end -->
        </div>
        <!-- visited-zone start -->
        <div class="container2">
            <div class="row my-3">
                <div class="col">
                    <h3>여행지 별 방문 횟수</h3>
                </div>
            </div>
            <div class="row my-2">
                <div class="col">
                    <div class="card">
                        <div class="card-body">
                            <canvas id="myChart2" height="100"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- visited-zone end -->
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
    
    //조회수 그래프
    var ctx = $('#myChart');
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['테마', '축제', '명소', '피드', '일정자랑', '함께가치'],
        datasets: [{
          label: '게시판 별 조회수',
          data: [50,55, 43, 20, 52, 30],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        }
      }
    });

  	//여행지 그래프
    const colors = ['red','yellow','blue','#c3e6cb','#dc3545','#6c757d'];
    var chBar = $("#myChart2");
    var chartData = {
        labels: ["S", "M", "T", "W", "T", "F", "S"],
        datasets: [{
        data: [809, 445, 483, 503, 689, 692, 634],
        backgroundColor: colors[0]
        },
        {
        data: [209, 245, 383, 403, 589, 692, 580],
        backgroundColor: colors[1]
        },
        {
        data: [489, 135, 483, 290, 189, 603, 600],
        backgroundColor: colors[2]
        },
        {
        data: [639, 465, 493, 478, 589, 632, 674],
        backgroundColor: colors[4]
        }]
    };
    var myChart = new Chart(chBar, {
        // 챠트 종류를 선택
        type: 'bar',

        // 챠트를 그릴 데이타
        data: chartData,

        // 옵션
        options: {
        legend: {
            display: false
        }
        }
    });
   </script>
</body>
</html>
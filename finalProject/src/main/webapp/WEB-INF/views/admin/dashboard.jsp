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
<!--     <link rel="stylesheet" type="text/css" href="resources/css/dashboard_admin.css?after"> -->
    <title>대시보드</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Startt  -->
<div id="content-wrapper" style="height: auto; background-color: #EEEEEE;">
    <div class="container-fluid">
        <div class="dash-title">
        <h1>&nbsp;대시보드</h1>
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
                    <td>${vcList.get("day")}명</td>
                    <td>${vcList.get("week")}명</td>
                    <td>${vcList.get("month")}명</td>
                    <td>${vcList.get("total")}명</td>
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
                <table id="reportTable" style="margin-bottom: 20px;">
                    <thead>
                        <tr>
                            <th style="width: 10%;">번호</th>
                            <th style="width: 35%;">신고사유</th>
                            <th style="width: 10%;">작성자</th>
                            <th style="width: 10%;">신고횟수</th>
                            <th style="width: 10%;">신고자</th>
                            <th style="width: 20%;">신고일자</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
                <span>최근 작성 글</span>
                <table id="boardTable" style="margin-bottom: 20px;">
                    <thead>
                        <tr>
                            <th width="10%;">번호</th>
                            <th width="34%;">제목</th>
                            <th>작성자</th>
                            <th>위치</th>
                            <th width="20%;">작성시각</th>
                            <th>좋아요</th>
                            <th>조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <span>최근 작성 문의</span>
                <table id="qnaTable">
                    <thead>
                        <tr>
                            <th width="10%;">번호</th>
                            <th>제목</th>
                            <th width="10%;">작성자</th>
                            <th width="20%;">작성시각</th>
                            <th width="15%;">답변여부</th>
                        </tr>
                    </thead>
                    <tbody>
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
    
    //조회수 그래프
    var ctx = $('#myChart');
    var countList = [];
    <c:forEach items="${bcList}" var="count">
    	if ('${count.category}'!=4) {
	        countList.push('${count.totalViewCount}');
		}
    </c:forEach>
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['테마', '축제', '명소', '일정자랑', '함께가치'],
        datasets: [{
          label: '게시판 별 조회수',
          data: countList,
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
  	var data = ${mcList};
  	var pcList = {};
  	
 	// 지역별 게시물 개수 초기화
  	var zoneNames = ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"];
  	zoneNames.forEach(function(zoneName) {
  	  pcList[zoneName] = 0;
  	});
  	
  	//zoneName 숫자를 글자로 바꾸기
  	data.forEach(function(item) {
  	  var zoneName = item.zoneName;
  	  if (zoneName == 11) {
		zoneName = "서울";
	  }else if (zoneName == 26) {
		zoneName = "부산";
	  }else if (zoneName == 27) {
		zoneName = "대구";
	  }else if (zoneName == 28) {
		zoneName = "인천";
	  }else if (zoneName == 29) {
		zoneName = "광주";
	  }else if (zoneName == 30) {
		zoneName = "대전";
	  }else if (zoneName == 31) {
		zoneName = "울산";
	  }else if (zoneName == 41) {
		zoneName = "경기";
	  }else if (zoneName == 42) {
		zoneName = "강원";
	  }else if (zoneName == 43) {
		zoneName = "충북";
	  }else if (zoneName == 44) {
		zoneName = "충남";
	  }else if (zoneName == 45) {
		zoneName = "전북";
	  }else if (zoneName == 46) {
		zoneName = "전남";
	  }else if (zoneName == 47) {
		zoneName = "경북";
	  }else if (zoneName == 48) {
		zoneName = "경남";
	  }else {
		zoneName = "제주";
	  }
  	  var postCount = item.postCount;
  	  
  	  pcList[zoneName] = postCount;
  	});
  	
  	//그래프 데이터 넣기
    const colors = ['#CEDEFC','#9EBDF9','#6C94EF','#4671DF','#1241CB','#0D31AE','#092492','#051975','#031161','#CAF5FD','#97E5FC','#62CCF6','#3BB1ED','#0088E2','#0069C2','#004EA2'];
    var chBar = $("#myChart2");
    var chartData = {
        labels: ["서울", "부산", "대구", "인천", "광주", "대전", "울산", "경기", "강원", "충북", "충남", "전북", "전남", "경북", "경남", "제주"],
        datasets: [{
        data: [],
        backgroundColor: [
        	colors[0],
        	colors[1],
        	colors[2],
        	colors[3],
        	colors[4],
        	colors[5],
        	colors[6],
        	colors[7],
        	colors[8],
        	colors[9],
        	colors[10],
        	colors[11],
        	colors[12],
        	colors[13],
        	colors[14],
        	colors[15],
        ],
        }]
    };
    
    // zoneName에 해당하는 인덱스를 찾아서 data 배열에 postCount를 할당
    for (var zoneName in pcList) {
   	  var postCount = pcList[zoneName];
   	  var index = chartData.labels.indexOf(zoneName);
 	  if (index !== -1) {
 	    chartData.datasets[0].data[index] = postCount;
 	  }
   	}
    
    //그래프 그리는 코드
    var myChart = new Chart(chBar, {
        // 챠트 종류를 선택
        type: 'bar',

        // 챠트를 그릴 데이터
        data: chartData,

        // 옵션
        options: {
        legend: {
            display: false
        }
        }
    });
    
    //최신 게시판 불러오기
    $(function() {
		currentReportList();
		currentBoardList();
		currentQnaList();
	});
    
    //최근 신고 5개
    function currentReportList() {
		$.ajax({
			url:"currentReportList.ad",
			success: function(list) {
				var str = "";
				for(var i in list){
					str +="<tr>"
	                    +"<td>"+list[i].reportNo+"</td>"
	                    +"<td>"+list[i].reportReason+"</td>";
	                    
                    if (list[i].replyWriter == null && list[i].rereplyWriter == null) {
                    	str +="<td>"+list[i].boardWriter+"</td>"
                    		+"<td>"+list[i].boardReport+"</td>";
					}else if (list[i].rereplyWriter == null && list[i].boardWriter == null) {
						str +="<td>"+list[i].replyWriter+"</td>"
                   			+"<td>"+list[i].replyReport+"</td>";
					}else{
						str +="<td>"+list[i].rereplyWriter+"</td>"
               				+"<td>"+list[i].rereplyReport+"</td>";
					}
                    
                    str +="<td>"+list[i].writer+"</td>"
	                    +"<td>"+list[i].createDate+"</td>"
	                	+"</tr>";
				}
				
				$("#reportTable>tbody").html(str);
				
				$("#reportTable>tbody>tr").click(function () {
					location.href = 'report.ad';
				});
				
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
    
  	//최근 작성글 5개
    function currentBoardList() {
		$.ajax({
			url:"currentBoardList.ad",
			success: function(list) {
				var str = "";
				for(var i in list){
					str +="<tr>"
	                    +"<td>"+list[i].boardNo+"</td>";

                    if (list[i].boardTitle == null) {
                    	str += "<td>"+list[i].boardContent+"</td>";
					}else {
						str += "<td>"+list[i].boardTitle+"</td>";
					}
	                    
                    str += "<td>"+list[i].boardWriter+"</td>";
	                    
                    if (list[i].category == 1) {
                    	str +="<td>테마</td>";
					}else if (list[i].category == 2) {
						str +="<td>축제</td>";
					}else if (list[i].category == 3) {
						str +="<td>명소</td>";
					}
					else if (list[i].category == 4) {
						str +="<td>피드</td>";
					}
					else if (list[i].category == 5) {
						str +="<td>함께가치</td>";
					}else{
						str +="<td>일정자랑</td>";
					}
                    
                    str +="<td>"+list[i].createDate+"</td>"
	                    +"<td>"+list[i].good+"</td>"
	                    +"<td>"+list[i].count+"</td>"
	                	+"</tr>";
				}
				
				$("#boardTable>tbody").html(str);
				
				$("#boardTable>tbody>tr").click(function () {
// 					var bno = $(this).children().eq(0).text();
					var cate = $(this).children().eq(3).text();
					if (cate == '테마') {
	 					location.href = 'theme.ad';						
					}else if (cate == '축제') {
						location.href = 'festival.ad';
					}else if (cate == '명소') {
						location.href = 'attraction.ad';
					}
					else if (cate == '피드') {
						location.href = 'feed.ad';
					}
					else if (cate == '함께가치') {
						location.href = 'together.ad';
					}else{
						location.href = 'schedule.ad';
					}
				});
				
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
  	
  	//최근 문의글 5개
    function currentQnaList() {
		$.ajax({
			url:"currentQnaList.ad",
			success: function(list) {
				var str = "";
				for(var i in list){
					str +="<tr>"
	                    +"<td>"+list[i].serviceNo+"</td>"
	                    +"<td>"+list[i].serviceTitle+"</td>"
	                    +"<td>"+list[i].writer+"</td>"
	                    +"<td>"+list[i].createDate+"</td>";
	                    
                    if (list[i].answerStatus == 'N') {
                    	str +="<td style='color: red;'>답변대기</td>";
					}else{
						str +="<td style='color: green;'>답변완료</td>";
					}
                    str +="</tr>";
				}
				
				$("#qnaTable>tbody").html(str);
				
				$("#qnaTable>tbody>tr").click(function () {
					var bno = $(this).children().eq(0).text();
					location.href = 'qnaSelect.ad?serviceNo='+bno;
				});
				
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
   </script>
</body>
</html>
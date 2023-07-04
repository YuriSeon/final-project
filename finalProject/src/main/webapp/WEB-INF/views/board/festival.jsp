<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">

    <title>축제</title>
    
    <style>
	.special_box .bg {
	    height: 415px;
	}
	.special_box .cont {
	    padding: 90px 0 0;
	    width: 940px;
	    margin: -415px auto 0;
	}
	.special_box h2 {
	    font-weight: 800;
	    letter-spacing: -3px;
	}
	.special_box p {
	    padding: 10px 0 0;
 	    font-size: 16px;
	}
	.special_box .list {
	    background: #f6fff8;
	    border-radius: 10px;
	    margin: 40px 0 0;
	}
	.special_box {
	    position: relative;
	    color: #333;
	    margin: 0 0 80px;
	}
	.cont h2{
	    font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Tahoma,Sans-serif;
	}

	/* -----달력----- */
	.list {
		background: #f9fffa;
	  	height: 780px;
	}	
	#fes_con{
	    margin: auto;
	    margin-top: 1%
	}
	#fes_con table {
	    position: relative;
	    left: -195px;
	    width: 800px;
	}
	.fes_container {
		width: 510px;
	}
	/* ---------- CALENDAR ---------- */
	
	.calendar {
		text-align: center;
	}
	.calendar header {
		position: relative;
	}
	.calendar thead {
		font-weight: 600;
	}
	.calendar td {
		border-radius: 50%;
		height: 6em;
	}
	.btn-prev,
	.btn-next {
		border: 2px solid #cbd1d2;
		border-radius: 50%;
		height: 2em;
		font-size: .75em;
		margin: -1em;
		position: absolute;
		top: 50%;
		width: 2em;
	}
	
	.btn-prev:hover,
	.btn-next:hover {
		background: #cbd1d2;
	}
	.btn-prev {
		left: 6em;
	}
	.btn-next {
		right: 6em;
	}
	/* 달력 가운데 정렬 */
	#calendar_div{
		margin-top: 30px;
		margin-left: 50px;
	} 
	#fes_con a{
		color: rgb(145, 145, 145);
		font-size: 15px;
		font-weight: 600;
		display: flex;
    	align-items: center;
    	justify-content: center;
	}
	
	/* 카테고리 */
	.cate_main .inner {
	    position: relative;
	    max-width: 928px;
	    margin: 0 auto;
	}
	.search_slide_wrap .search_box_wrap {
	    display: flex;
	    margin-bottom: 50px;
	}
	.search_slide_wrap .search_box_wrap .select_box {
	    flex: 1;
	    margin-right: 12px;
	}
	.search_slide_wrap .search_box_wrap .select_box select {
	    width: 100%;
	    height: 48px;
	    padding: 0 0 0 52px;
	    border-radius: 8px;
	}
	.search_slide_wrap .btn_search {
	    padding: 9px 40px 9px 11px;
	    border: 0;
	    border-radius: 8px;
	    width: 15px;
	    background: #c7c7c7;
	    font-size: 20px;
	    color: #616362;
	}
	.cate_main fieldset {
	    display: block;
	    margin-inline-start: 2px;
	    margin-inline-end: 2px;
	    padding-block-start: 0.35em;
	    padding-inline-start: 0.75em;
	    padding-inline-end: 0.75em;
	    padding-block-end: 0.625em;
	    min-inline-size: min-content;
	}
	.search_slide_wrap .btn_reset {
	    display: inline-block;
	    padding: 11px 10px;
	    border-radius: 8px;
	    background: #FFF no-repeat 50% 50%  / 20px;
	    border: 1px solid #CCCCD1;
	    line-height: 20px;
	    vertical-align: top;
	}
	.cate_main button, .cate_main input[type=submit] {
	    cursor: pointer;
	}
	.search_slide_wrap {
	    margin-top: -40px;
	}
	
	/* ----- 목록 ----- */
	#fes_go{
		background-color: red;
		font-weight: 600;
		height: 10px;
		border-radius: 8px;
		display: flex;
  		align-items: center;
  		top:10px;
  		left: 10px;
	}
	.down-content{
		margin-top: -40px;
	}
	#good_img{
		cursor: pointer;
		width: 15px;
		height: 20px;
		position:relative;
		left: 310px;
		top: 25px;
	}
	.col-lg-4:hover{
		background-color: rgb(154, 154, 154, 0.3);
		border-radius: 10px;
		cursor: pointer;
	}
	.ticket-item{
		margin-top: 14px;
	}
	
	/* 페이지네이션 */
	.page_list{
		background-color: white !important; 
	}
	.page_list:hover{
		background-color: rgb(142, 195, 142) !important;
		border-radius: 50%;
	}
    </style>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/owl-carousel.css">
    <link rel="stylesheet" href="/finalProject/resources/css/tooplate-artxibition.css">
   </head>
   
<body>
	<%@include file="../common/menubar.jsp" %>
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
	<script>
	$(function(){
		$(".nav>li>a").each(function(){
			if($(this).text() == $("title").eq(0).text()){
				$(this).addClass("active");
			}
		});
	});
	</script>
	   <!-- ***** About Us Page ***** -->
    <div id="fes_contents" class="main_contents">
		<div class="pc_main_cont">
			<div class="special_box">
				<div class="bg" style="background: url(&quot;https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=1072c599-d65c-440c-ab62-db163e3a41d7&quot;) 50% center no-repeat rgb(217, 242, 227);"></div>
				<div class="cont">
					<h2 class="mtit">구석구석 축제가는 날</h2>
					<p class="stit">대한민국 구석구석에서 진행되는<br>다양한 축제와 행사를 찾아보아요.</p>
					<span class="img"></span>
					<div class="list">
						<!-- ***** 달력 ***** -->
						<br>
						<div class="fes_container calendar" id="fes_con">
					        <header>
					        
					    		<h6 style="position: relative; left: -60px; top: 10px;">2023년</h6>
					            <h3 style="margin: auto; font-size: 29px; position: relative; top: -8px;"></h3>
					    
					            <a class="btn-prev fontawesome-angle-left" onclick="prevMonth();" href="#"><</a>
					            <a class="btn-next fontawesome-angle-right" onclick="nextMonth();" href="#">></a>
					    
					        </header>
					        <div id="calendar_div"></div>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 카테고리로 검색 -->
	
	<div class="cate_main cate_wrap">
        <!-- 검색 -->
        <div class="search_slide_wrap">
            <div class="inner">
                <form action="search.fe" name="festivalSearch" id="festivalSearch" class="festival_search">
                    <fieldset>
                        <div class="search_box_wrap">
                            <div class="select_box select_date" id="date">
                                <select name="searchDate" id="searchDate" title="시기 선택">
                                    <option value="00">시기</option>
                                    <option value="01">01월</option>
                                    <option value="02">02월</option>
                                    <option value="03">03월</option>
                                    <option value="04">04월</option>
                                    <option value="05">05월</option>
                                    <option value="06">06월</option>
                                    <option value="07">07월</option>
                                    <option value="08">08월</option>
                                    <option value="09">09월</option>
                                    <option value="10">10월</option>
                                    <option value="11">11월</option>
                                    <option value="12">12월</option>
                                </select>
                            </div>
                            <div class="select_box select_area" id="area">
                                <select name="searchArea" id="searchArea" title="지역 선택">
                                    <option value="all">지역</option>
										<option value="서울">서울특별시</option>
										<option value="부산">부산광역시</option>
										<option value="대구">대구광역시</option>
										<option value="인천">인천광역시</option>
										<option value="광주">광주광역시</option>
										<option value="대전">대전광역시</option>
										<option value="울산">울산광역시</option>
										<option value="경기">경기도</option>
										<option value="강원">강원도</option>
										<option value="충북">충청북도</option>
										<option value="충남">충청남도</option>
										<option value="전북">전라북도</option>
										<option value="전남">전라남도</option>
										<option value="경북">경상북도</option>
										<option value="경남">경상남도</option>
										<option value="제주">제주도</option>
                                </select>
                            </div>
                            <div class="select_box select_cate" id="cate">
                                <select name="searchCate" id="searchCate" title="카테고리 선택">
                                    <option value="0">카테고리</option>
                                    <option value="1">공연</option>
                                    <option value="2">문화관광</option>
                                    <option value="3">자연</option>
                                    <option value="4">먹거리</option>
                                    <option value="5">꽃</option>
                                    <option value="6">가족과함께</option>
                                </select>
                            </div>
                            <div class="btn_box">
                              <button type="submit" class="btn_search" id="btnSearch" style="background-color: #c4edcd; border: 1px solid #2cab49;"><img src="/finalProject/resources/images/fes_search.png" style="width: 30px; height: 25px;"></button>
                              <button type="button" class="btn_reset" onclick="btnReset()"><img src="/finalProject/resources/images/circular.png" style="width: 30px; height: 25px;"></button>
                            </div>
                        </div>
                    </fieldset>
                </form>
        </div>
        </div>
    </div>
    
    <c:if test="${not empty date }">
    	<script>
    		$(function(){
    			$("#date option[value=${date}]").attr("selected",true);
    		});
    	</script>
    </c:if>
	<c:if test="${not empty area }">
    	<script>
    		$(function(){
    			$("#area option[value=${area}]").attr("selected",true);
    		});
    	</script>
    </c:if>
	<c:if test="${not empty cate }">
    	<script>
    		$(function(){
    			$("#cate option[value=${cate}]").attr("selected",true);
    		});
    	</script>
    </c:if>
	
	<div class="tickets-page">
	    <div class="container">
	        <div class="row">
	        	<c:forEach var="b" items="${list }">
		            <div class="col-lg-4" id="fes_div" onclick="location.href='fesDetail.fe?boardNo=${b.boardNo}'" style="height: 508px;">
		                <div class="ticket-item">
		                    <div class="thumb">
		                    	<input type="hidden" class="boardNo" name="boardNo" value="${b.boardNo }">
		                        <img src="${b.attachment.filePath }" alt="" style="height: 300px;">
		                    </div>
		                    <div id="good_div"><img src="/finalProject/resources/images/Like-before.png" id="good_img" onclick="goodCk(event, '${b.boardNo}', this)"></div>
		                    <div class="down-content">
								<c:choose>
									<c:when test="${fn:length(b.boardTitle) < 12 }">
										<h4>${b.boardTitle }</h4>									
									</c:when>
									<c:otherwise>
										<h4>${fn:substring (b.boardTitle, 0,11) }...</h4>
									</c:otherwise>
								</c:choose>
		                        <ul>
		                            <li><i class="fa fa-clock-o"></i> ${b.festival.startDate } - ${b.festival.endDate }</li>
		                            <c:choose>
		                            	<c:when test="${fn:length(b.info.infoAddress) < 20 }">		                            	
				                            <li><i class="fa fa-map-marker"></i>${b.info.infoAddress }</li>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<li><i class="fa fa-map-marker"></i>${fn:substring(b.info.infoAddress,0,15) }...</li>
		                            	</c:otherwise>
		                            </c:choose>
		                        </ul>
		                    </div>
		                </div>
		            </div>	
	        	</c:forEach>
	        	<c:if test="${empty list }">
	        		<div style="margin: auto; cursor: default; color: rgb(169, 169, 169);">
	        			개최중인 축제가 없습니다.
	        		</div>
	        	</c:if>
	            <div class="col-lg-12">
	                <div class="pagination">
	                    <ul>
	                    	<c:choose>
	                    		<c:when test="${pi.currentPage eq 1 }">
			                        <li><a href="#" style="background-color: white;" disabled><img src="/finalProject/resources/images/fes_left.png" style="width: 30px; height: 40px;"></a></li>	                    		
	                    		</c:when>
	                    		<c:otherwise>
	                   				<li><a href="festival.fe?currentPage=${pi.currentPage-1 }&searchDate=${date}&searchArea=${area}&searchCate=${cate}" style="background-color: white;"><img src="/finalProject/resources/images/fes_left.png" style="width: 30px; height: 40px;"></a></li>
	                    		</c:otherwise>
	                    	</c:choose>

		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
		                    	<li><a class="page_list" href="festival.fe?currentPage=${p }&searchDate=${date}&searchArea=${area}&searchCate=${cate}">${p }</a></li>
		                    </c:forEach>
		                        
		                   	<c:choose>
		                   		<c:when test="${pi.currentPage eq pi.maxPage }">
			                        <li><a href="#" style="background-color: white;" disabled><img src="/finalProject/resources/images/right01.png" style="width: 30px; height: 40px;"></a></li>
		                   		</c:when>
		                   		<c:otherwise>
									<li><a href="festival.fe?currentPage=${pi.currentPage+1 }&searchDate=${date}&searchArea=${area}&searchCate=${cate}" style="background-color: white;"><img src="/finalProject/resources/images/right01.png" style="width: 30px; height: 40px;"></a></li>		                   		
		                   		</c:otherwise>
		                   	</c:choose>
	                    </ul>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- 로그인 정보 있을시 축제 찜 이미지 있으면 띄워주기 -->
	<c:choose>
		<c:when test="${not empty loginUser }">
			<script>
				$(function(){
					$("#fes_div > .ticket-item").each(function(){
						var boardNo = $(this).find(".thumb .boardNo").val(); //모든 boardNo가져오기
							boardNo = parseInt(boardNo);
						var choiceImg = $(this).find("#good_img");
						var writer = "${loginUser.nickname}";
						var like = false;
						var choiceList = ${choiceList};
						
						for(var i=0; i<choiceList.length; i++){
							var choice = choiceList[i];
							
							if(choice.boardNo === boardNo && choice.writer === writer){
								like = true;
							}
						}
						
						if(like){
							choiceImg.attr("src","/finalProject/resources/images/Like-after.png");
						}else{
							choiceImg.attr("src","/finalProject/resources/images/Like-before.png");
						}
											
					});
				});
			</script>
		</c:when>
	</c:choose>
	
	<script>

		//오늘 날짜 가져오기
	    //년도
	    var yearVal = $("#fes_con header h6");
	    var nowYear = new Date().getFullYear();
	    //월
	    var monthVal = $("#fes_con header h3");
	    var nowMonth = new Date().getMonth()+1;
	
	    //온로드로 페이지 열자마자
	    $(function(){
	    	//오늘 날짜 넣어서 달력 생성
	    	monthVal.text(nowMonth+'월');
	    	yearVal.text(nowYear+'년');
	        createCalendar(nowYear,nowMonth);
	    });
	
	    //이전 달 눌렀을때 이전 달력
	    function prevMonth(){
	    	
	    	event.preventDefault();
	    	
	        nowMonth --;
	        monthVal.text(nowMonth+'월');
	        createCalendar(nowYear,nowMonth);
	
	        //1월달 다음에는 년도, 12월로
	        if(nowMonth ==0){
	            nowYear --;
	            nowMonth = 12;
	            yearVal.text(nowYear+'년');
	            monthVal.text(nowMonth+'월');
	            createCalendar(nowYear,nowMonth);
	        }
	    }
	
	    //다음 달 눌렀을때 다음 달력
	    function nextMonth(){
	    	
	    	event.preventDefault();
	    	
	        nowMonth++;
	        monthVal.text(nowMonth+'월');
	        createCalendar(nowYear,nowMonth);
	
	        //12월 다음에는 년도 바꿔주고 1월로
	        if(nowMonth == 13){
	            nowYear ++;
	            nowMonth = 1;
	            yearVal.text(nowYear+'년');
	            monthVal.text(nowMonth+'월');
	            createCalendar(nowYear,nowMonth);
	        }
	    }
	
	    //달력 만드는 함수
	    function createCalendar(year, month){
	
	        //그 달의 첫번째 요일 (1일의 요일) 0-일 1-월 2-화...
	        var firstDay = new Date(year, month - 1, 1).getDay();
	
	        //그 달의 마지막 날짜
	        var lastDate = new Date(year, month, 0).getDate();
	
	        //달력 코드 생성
	        var str = "<table>";
	        	str += "<thead>";
	             // 월과 년도 표시
	            /* str += "<tr><th colspan='7'>" + year + "년 " + month + "월</th></tr>"; */
	
	            // 요일 표시
	            str += "<tr><td>일</td><td>월</td><td>화</td><td>수</td><td>목</td><td>금</td><td>토</td></tr>";
				
	            str += "</thead>";
	            str += "<tbody>";
	            // 첫 번째 주의 첫 번째 날짜 이전의 빈 칸 처리
	            str += "<tr>";
	            for (var i = 0; i < firstDay; i++) {
	                str += "<td style='pointer-events: none;'></td>";
	            }
	
	            // 달력에 날짜 표시
	            var day = 1;
	            while (day <= lastDate) {
	                // 일자 표시
	                for (var i = firstDay; i < 7 && day <= lastDate; i++) {
	                var cell = "<td id='dateCk' onclick='getDate(this)'>" + day + "</td>";
	        
	                str += cell;
	                day++;
	                }
	
	                // 토요일까지 표시한 후 다음 주로 넘어가기 위해 </tr> 태그 추가
	                if (day <= lastDate) {
	                str += "</tr><tr>";
	                }
	
	                firstDay = 0; // 첫 번째 주는 이미 표시했으므로 0으로 초기화
	            }
	
	            // 마지막 주의 나머지 빈 칸 처리
	            if (day > lastDate) {
	                if( 7-((lastDate + new Date(year, month - 1, 1).getDay()) % 7) != 7){
	                    for (var i = 0; i < 7 - ((lastDate + new Date(year, month - 1, 1).getDay()) % 7); i++) {
	                    str += "<td style='pointer-events: none;'></td>";
	                    }
	                }
	            }
	            
	            str += "</tr>";
	            str += "</tbody>";
	            str += "</table>";
	            
	            // 달력을 HTML 요소에 추가
	            $("#calendar_div").html(str)
	    }
	    
	    var now = ""; // 날짜 저장위해 전역변수 선언
		//마우스 올렸을시 축제 개수 출력
	    $(document).on('mouseover', '#dateCk', function() {
	    	//클릭한 일수
	        var clickDate = this.innerHTML;

	    	//한자리일때 0붙여주기
	        var monthStr = nowMonth.toString(); // nowMonth가 숫자이므로 문자열로 변환
	        if(monthStr.length==1){
	            nowMonth = '0'+nowMonth;
	        }
	        if(clickDate.length ==1){
	            clickDate = '0'+clickDate;
	        }
	        var nowDay = nowYear+'-'+nowMonth+'-'+clickDate;
	        
	        $.ajax({
	        	url : "mouCount.fe",
	        	data :	{nowDay : nowDay},
	        	success : function(count){
	        		now = $(this).text(); //날짜 저장 먼저 하기
	        		$(this).text(count+'개의 축제보기').css({"font-size":"13px","width":"115px","height":"90px","cursor":"pointer",
	        											"transition":"0.5s","background-color":"#93dda4"});
	        		$(this).on('click',function(){
	        			location.href="search.fe?nowDay="+nowDay;
	        		})
	        		
	        	}.bind(this),
	        	error : function(){
	        		console.log("카운트 에이젝스 오류");
	        	}
	        });
	    });
	 	// 마우스 치웠을 때 원래 일자로
	    $(document).on('mouseout', '#dateCk', function() {
	      $(this).text(now).css({"font-size":"17px","background-color":"#f6fff8"}); //저장한 일 수 다시 되돌리기
	    });
	    
	    //찜하기 기능
	    function goodCk(event, boardNo, img){
	    	//div온클릭 멈추기
	    	event.stopPropagation();
	    	
	    	var user = "${loginUser}"
	    	
	    	if(!user == ""){
		    	$.ajax({
		    		url : "goodCk.fe",
		    		data : {boardNo : boardNo},
		    		success : function(result){
		    			if(result.text == 'Y'){
		    				alert("찜하기 완료!")
		    				$(img).attr('src','/finalProject/resources/images/Like-after.png');
		    			}else if (result.text == 'N'){
		    				alert("찜삭제 완료!")
		    				$(img).attr('src','/finalProject/resources/images/Like-before.png');
		    			}else if(result.text == 'YF'){
		    				alert("찜하기 실패하였습니다. 다시 눌러주세요.")
		    			}else{
		    				alert("찜삭제가 실패하였습니다. 다시 눌러주세요.")
		    			}
		    		}
		    	});
	    	}else{
	    		alert("로그인 후 사용이 가능합니다.");
				$('#loginModal').show();
	    	}

	    }
	    
	    //검색 리셋으로 돌리기
	    function btnReset(){
	    	console.log("dd");
	    	$("#searchDate").val("00").prop("selected",true);
	    	$("#searchArea").val("all").prop("selected",true);
	    	$("#searchCate").val("0").prop("selected",true);
	    };
	    
	    
	</script>
	
	<!-- *** Footer *** -->
	<jsp:include page="../common/footer.jsp"/>
	
	<!-- jQuery -->
	<script src="/finalProject/resources/js/jquery-2.1.0.min.js"></script>
	
	<!-- Bootstrap -->
	<script src="/finalProject/resources/js/popper.js"></script>
	<script src="/finalProject/resources/js/bootstrap.min.js"></script>
	
	<!-- Plugins -->
	<script src="/finalProject/resources/js/scrollreveal.min.js"></script>
	<script src="/finalProject/resources/js/waypoints.min.js"></script>
	<script src="/finalProject/resources/js/jquery.counterup.min.js"></script>
	<script src="/finalProject/resources/js/imgfix.min.js"></script>
	<script src="/finalProject/resources/js/mixitup.js"></script>
	<script src="/finalProject/resources/js/accordions.js"></script>
	<script src="/finalProject/resources/js/owl-carousel.js"></script>
	
	<!-- Global Init -->
	<script src="/finalProject/resources/js/custom.js"></script>
</body>
</html>
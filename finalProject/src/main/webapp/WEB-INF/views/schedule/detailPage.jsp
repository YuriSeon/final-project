<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/schedule.css?after">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<!-- 사진이랑 지도, 마커 반복문 추가, 마커 클릭시 데일리 일정 나오도록하고 그 후에... 지도 마커 클릭시 info 보여주기 나중에 대댓글 넣는거 하기 -->
	<%@ include file="../common/menubar.jsp" %>
	<div class="main-schedule">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>
    <div class="schedule-detail">
        <div id="title-area">
            <div id="main-title">
                <div id="title1">${board.boardTitle }</div>
                <div id="title2">
	                <!-- 여행기간 -->
	                <img src="resources/images/calendar.png"> <span>${plan.startDate } ~ ${plan.endDate } (${plan.totalDate })</span>
	                <!-- 여행스타일 -->
	                <img src="resources/images/ticket.png"> <span>${plan.concept }</span>
	                <!-- 조회수 -->
	                <img src="resources/images/view.png"> <span>${board.count }</span>
	                <div id="btn-type">
		                <!-- 게시물 좋아요 -->
		                <c:choose>
		                	<c:when test="${good.userNo eq loginUser.userNo }">
		                		<img class="good" src="resources/images/Like-after.png">
		                	</c:when>
		                	<c:otherwise>
		                		<img class="good" src="resources/images/Like-before.png">
		                	</c:otherwise>
		                </c:choose>
		                <!-- 게시물 찜 -->
		                <c:choose>
		                	<c:when test="${choice.userNo eq loginUser.userNo }">
		                		<img class="choice" src="resources/images/star-after.png">
		                	</c:when>
		                	<c:otherwise>
		                		<img class="choice" src="resources/images/star.png">
		                	</c:otherwise>
		                </c:choose>
		                 <!-- 게시물 신고 -->
		                 <c:choose>
		                	<c:when test="${report.userNo eq loginUser.userNo }">
		                		<img class="report" src="resources/images/bell-after.png">
		                	</c:when>
		                	<c:otherwise>
		                		<img class="report" src="resources/images/bell-before.png">
		                	</c:otherwise>
		                </c:choose>
	                </div>
                </div>
            </div>
            <hr>
            <!-- 총 여행경로 -->
            <div id="total-path">
            	<c:forEach var="p" items="path">
            		<!-- 여기 ... 이상한데 일단 나중에 출력하면서 보기 이상하게 나오면 수정하기 -->
            		<c:when test="${path.size() eq p }">
	            		${p.infoName}
            		</c:when>
            		<c:otherwise>
            			${p.infoName}+" ➙ "
            		</c:otherwise>
            	</c:forEach>
            </div>
        </div>
        <div id="content-area">
        	<!-- 경로 전체 위치 마커 표시된 지도 -->
            <div id="map-area">지도</div>
            <div id="img-path">
            	<!-- info에 저장된 여행지 사진들 -->
                <div id="img-area">
                	사진영역 슬라이드로
                </div>
                <div id="path-area">
                	<!-- 전체 예상 비용 -->
                    <div id="pay">total : ${plan.totalPay }</div>
                    <!-- 데일리 일정 묶음 -->
                    <div id="path">
                    	<c:forEach varStatus="i" begin="1" end="${plan.totalDate }">
                    		<div class="marcker-area">
                    			<img class="marcker" src="resources/images/marker2.png">
                    			<div class="color"></div>
                    		</div>
                    	</c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <hr size="3">
        <div id="reply-area">
            <div id="reply-title">일정톡(<span>%{rlist.size()}</span>)</div>
            <div>
                <form action="insert.re" id="reply-form">
                    <div id="reply-back">
                        <input type="text" name="reply-content" placeholder="지금 보고계신 일정에 대해 댓글을 작성해주세요!">
                        <button type="submit">작성</button>
                    </div>
                </form>
            </div>
            <div id="reply-content"></div>
            <div id="btn">
                <button type="button" onclick="history.back();">목록</button>
            	<c:choose>
            		<!-- 로그인유저가 관리자가 아니거나 작성가자 아닐때 동행버튼 활성  -->
            		<c:when test="${!(loginUser.userId eq board.writer) or !(loginUser.status eq 'A') }">
            			<!-- 동행버튼 클릭시 이동하도록 연결하기 -->
                		<button type="button" onclick="form(3)">동행하러가기</button>
                	</c:when>
                	<c:otherwise>
		                <button type="button" onclick="form(1)">수정</button>
		                <button type="button" onclick="form(2);">삭제</button>
	                </c:otherwise>
            	</c:choose>
            </div>
        </div>
      </div>
    <script>
    	var confirm = confirm("게시물을 정말로 삭제하시겠습니까?");
    	
    	/* 동행, 수정, 삭제 이벤트 연결 */
    	function form(num){
    		var formTeg = $("<form>"); 
    		var bno = $("<input>").prop("type", "hidden").prop("name", "boardNo").prop("value", "${board.boardNo}"); 
    		var obj = formTeg.append(bno); // form 태그내 bno hidden으로 넣어줌
    		
    		if(num==1){ // 수정
    			obj.attr("action","update.sc").attr("method", "get");
    		} else if(num==2){ // 삭제
    			if(confirm){ // 게시물 삭제 confirm으로 확인
        			obj.attr("action", "delete.sc").attr("method", "get");
        		} else {
        			alert("삭제를 취소하셨습니다");
        		}
    		} else { // 동행 (매핑주소 확인 후 작성해넣기)
    			obj.attr("action", "").attr("method", "get");
    		}
    	}
    		
    	/* 좋아요 찜 신고 이미지 클릭시 변경 이벤트 */
    	$(function(){
    		$("#btn-type").children().click(function(){
    			/* 클래스명 잘 가져오는지 확인하기 둥 중 하나 사용하기*/
    			var btnType = $(this).attr("class");
				this.class;
    			$.ajax({
    				url:"btnType",
    				data:{
    					boardNo : ${board.boardNo},
    					userNo : ${loginUser.userNo}
    				},
    				success : function(result){
    					/* 돌려받는 result type 확인하고 수정 필요하면 수정하기 */
    					/* 버튼타입 확인 후 result 값에 맞춰서 기존 이미지 변경해주기 */
    					switch(btnType){
    					case "good" : 
    						if(result==null){
    							$(".good").css("content", "url(resources/images/Like-before.png)");
    						} else {
    							$(".good").css("content", "url(resources/images/Like-atfter.png)");
    						}
    						break;
    					case "choice" :
    						if(result==null){
    							$(".choice").css("content", "url(resources/images/star.png)");
    						} else {
    							$(".choice").css("content", "url(resources/images/star-after.png)");
    						}
    						break;
    					case "report" :
    						if(result==null){
    							$(".report").css("content", "url(resources/images/bell-before.png)");
    						} else {
    							$(".choice").css("content", "url('resources/images/bell-after.png)");
    						}
    					}
    				},
    				error : function(){
    					console.log("통신 실패");
    				},
    				complete : function(){
    					console.log("통신 가능");
    				}
    			});
    		});	
    	});
    	
    	/* 댓글 조회 */
    	$(function(){
    		$.ajax({
    			url : "replyList.sc",
    			data : { boardNo : ${board.boardNo} },
    			success : function(list, m){
    			/* <div id="content-pack">
                    <div class="reply">
                        <div class="pro">프로필</div>
                        <div class="con">댓글내용</div>
                        <div class="date"><a id="nicknameHover" onclick="whoareyou();">닉네임</a>/작성일</div>
                        </div>
                    </div>
                    <div>
                        <div>
                            대댓글 영역 조건문 걸기 있을때만 생성
                            <div class="reply">
                                <div class="pro">프로필</div>
                                <div class="con">댓글내용</div>
                                <div class="date"><a id="nicknameHover" onclick="whoareyou();">닉네임</a>/작성일</div>
                            </div>
                        </div>
                    </div> 
                    원래 넣으려고 했던 형태. 추후 코드작성 끝나면 지우기
                    */
                    
                    var div = $("<div>");
                    var replyDiv = div.prop("id","content-pack").append(div.prop("class","reply"));
                    
                    for(var i=0; i<list.length;i++){
	                    /* 
	                    매개변수2개로 나눠져서 잘 넘어오는지 확인. 아니면 키값으로 프로필 사진 찾아오기
	                   	m이 arraylist를 가져온거면 그냥 순서대로 꺼내도 됨
	                    */
	                    var proDiv = div.prop("class", "pro").append("${m[i]. 프로필사진}");
	                    var conDiv = div.prop("class", "con").append("${list[i].replyContent}");
	                    /* prop아니면 attr로 수정 */
	                    var nic = $("<a>").prop("id", "nicknameHover").prop("onclick", "whoareyou();").text("${list[i].replyWriter}");
	                    var dateDiv = div.prop("class", "date").append(nic).text("${list[i].createDate}");
	                    replyDiv.append(proDiv, conDiv, dateDiv);
                    }
                    $("#reply-content").append(replyDiv); // 일단 댓글까지 출력함(대댓글 나중에!)
    			},
    			error : function(){
    				cosole.log("통신실패");
    			},
    			complete : function(){
    				console.log("통신가능");
    			}
    		});
    	});
    	
    </script>
</body>
</html>
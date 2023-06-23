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
<!-- 지도, 마커 반복문 추가, 마커 클릭시 데일리 일정 나오도록하고 그 후에... 지도 마커 클릭시 info 보여주기 나중에 대댓글 넣는거 하기 -->
	<%@ include file="../../common/menubar.jsp" %>
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
                	<div id="wrapSlide">
				        <div id="slideArea" onmouseover="opacityIn(this)" onmouseout="opacityOut(this)">
				            <img id="slideImage" />
				        </div>
				        <div id="dotArea"></div>
				
				        <img src="resources/img/left.png" id="prev" onclick="prev()">
				        <img src="resources/img/right.png" id="next" onclick="next()">
				    </div>
                </div>
                <div id="path-area">
                	<!-- 전체 예상 비용 -->
                    <div id="pay">total : ${plan.totalPay }</div>
                    <!-- 데일리 일정 묶음 -->
                    <div id="path">
                    	<!-- <c:forEach varStatus="i" begin="1" end="${plan.totalDate }">
                    		<div class="marcker-area">
                    			<img class="marcker" src="resources/images/marker2.png">
                    			<div class="color"></div>
                    		</div>
                    	</c:forEach> -->
                    </div>
                </div>
            </div>
        </div>
        <hr size="3">
        <div id="reply-area">
            <div id="reply-title">일정톡(<span>%{rlist.size()}</span>)</div>
            <div>
				<div id="reply-back">
					<input type="text" name="reply-content" placeholder="지금 보고계신 일정에 대해 댓글을 작성해주세요!">
					<button type="submit">작성</button>
				</div>
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
      <%@include file="../../common/footer.jsp" %>
    <!-- 작성해둔 함수 넣은 파일 불러와서 사용 -->
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script>
		$(function(){
			/* 댓글 조회해오기 */
			selectReplyList();

			/* 데일리 일정 표시하는 마커 출력 */
            var colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'pink', 'skyblue']; // 일정 수 증가시 컬러만 추가해서 사용하도록 설정
            var circle = document.querySelectorAll('.color');
            
            for(var i=0; i < circle.length; i++){
                var list = circle[i];
                $("#path").append(makeTag("div", {"class":"marcker-area"+(i+1)}));
               	$(".marcker-area"+(i+1)).append(makeTag("img",{"class":"marcker"+(i+1),"src":"resources/images/marker2.png"})).append(makeTag("div",{"class":"color"}).append("span",{"text":i+1}));
                $(list).css("background-color", colors[i]);
            }
        });

    	var confirm = confirm("게시물을 정말로 삭제하시겠습니까?"); // 변수처리

    	/* 동행, 수정, 삭제 이벤트 연결 */
    	function form(num){
    		var formTeg = $("<form>"); 
    		var bno = makeTag("input",{"type": "hidden", "name": "boardNo","value": "${board.boardNo}"}); 
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
    			var btnType = $(this).attr("class");
    			$.ajax({
    				url:"btnType",
    				data:{
    					boardNo : "${board.boardNo}",
    					userNo : "${loginUser.userNo}"
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
    	function selectReplyList(){
    		$.ajax({
    			url : "replyList.sc",
    			data : { boardNo : "${board.boardNo}" },
    			success : function(result){
					for(var i in result){
                        // 넣을 태그 생성해서 key:value 
                        var r = {
                            reply : makeTag("div",{"class":"reply"}),
                            pro : makeTag("div",{"class":"pro"}).append(makeTag("img",{"src":"/*프로필사진경로*/"})),
                            date : makeTag("div",{"class":"date"}).text("/*댓글 작성일 들어갈 부분*/").append(makeTag("a",{"id":"nicknameHover","onclick":"whoareyou();"}).text("/*닉네임들어갈부분*/")),
                            good : makeTag("span",{"class":"ico"}).append(makeTag("img",{"class":"good","src":"resources/images/Like-before.png"})),
                            choice : makeTag("span",{"class":"ico"}).append(makeTag("img",{"class":"choice","src":"resources/images/star-before.png"})),
                            reReplyinput : makeTag("intup",{"type":"text","id":"reReply-content","placeholder":"댓글을 작성해주세요!"}),
                            reReplyBtn : makeTag("button", {"onclick":"reReplyinsert();"}),
                            replyNo : makeTag("input",{"type":"hidden","class":"replyNo","value":"/*댓글번호넣어주기*/"}),
                            reReplyNo : makeTag("input",{"type":"hidden","class":"reReplyNo","value":"/*댓글번호넣어주기*/"})
                        }
                        var replyBtn = makeTag("div",{"class":"reply-btn"}).append(r.good, r.choice, r.reReplyinput, r.reReplyBtn, r.replyNo);
                        var reply_re = makeTag("div",{"class":"reply re"}).append(r.pro, r.con, r.date, r.good, r.choice,r.reReplyNo);
                        if(result[i].refRno==null){ // 대댓글이 아닌경우
                            $("#reply-content").append(r.reply.append(r.pro, r.con, r.date, replyBtn));
                        } else { // 대댓글인경우
                            $(".replyNo").each(function(){
                                if($(this).val()==result[i].refRno){
                                    $(this).parent().after(reply_re);
                                }
                            });
                        }
                        // 태그 재성성 할 수 있도록 초기화시키기
                        r = null;
                        replyBtn = null;
                        reply_re = null;
                    }
    			},
    			error : function(){
    				cosole.log("통신실패");
    			},
    			complete : function(){
    				console.log("통신가능");
    			}
    		});
    	}

		/* 댓글 등록 */
        function insertReply(){
            $.ajax({
                url : "insertReply.sc",
                data : {
                    content : $("#reply-content"),
                    replyWriter : "${loginUser.nickName}",
                    refQno : $("#boardNo")
                },
                success : function(result){
                    if(result>0){
                        alert("댓글 등록 성공");
                        selectReplyList(); // 리스트 추가됐으니 다시 조회
                        $("#reply-content").val() = ""; // 댓글 등록됐으니 비워주기 
                    } else {
                        alert("댓글 등록 실패")
                    }
                },
                error : function(){
                    console.log("등록 실패");
                }
            });
        }
    	
    	/* 사진 슬라이더 */
    	const slideIndex = ['image1.png', 'image2.png', 'image3.png', 'image4.png', 'image5.png'];
	    let currentIndex = slideIndex[0];
	    const imagePath = 'resources/images/';
	    const dotPath = 'resources/images/dot.png';
	    
	    $(function(){
	        $("#slideImage").prop("src", imagePath + slideIndex[0]);

	        slideIndex.forEach(function(item, index, array){
	            let img = document.createElement("img");
	            img.setAttribute("src", dotPath);
	            img.setAttribute("width", "15px");
	            img.setAttribute("height", "15px");
	            img.setAttribute("id", "dotImage" + index);
	            img.setAttribute("class", "dotImage");
	            img.setAttribute("onclick", "dotClickEvent(" + index + ")");

	            document.querySelector("#dotArea").appendChild(img);
	        });
	    });
	    function prev(){
	        slideIndex.some(function(item, index, array){
	            if(index != 0){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index - 1]);
	                    currentIndex = slideIndex[index - 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[slideIndex.length - 1]);
	                    currentIndex = slideIndex[slideIndex.length - 1];
	                    return true;
	                }
	            }
	        });
	    }
	    function next(){
	        slideIndex.some(function(item, index, array){
	            if(index != slideIndex.length - 1){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index + 1]);
	                    currentIndex = slideIndex[index + 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[0]);
	                    currentIndex = slideIndex[0];
	                    return true;
	                }
	            }
	        });
	    }
	    function opacityIn(obj){
	        obj.style.opacity = "0.5";
	        $("#prev").css("opacity", 0.7);
	        $("#next").css("opacity", 0.7);
	    }

	    function opacityOut(obj){
	        obj.style.opacity = "1";
	        $("#prev").css("opacity", 0.3);
	        $("#next").css("opacity", 0.3);
	    }

	    function dotClickEvent(index){
	        $("#slideImage").prop("src", imagePath + slideIndex[index]);
	        currentIndex = slideIndex[index];
	    }
    </script>
</body>
</html>
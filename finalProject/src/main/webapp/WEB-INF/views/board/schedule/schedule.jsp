<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="resources/css/schedule.css?v=1">
    <title>일정 자랑</title>
    <style type="text/css"></style>
   </head>
   <body>
   <!-- 페이징처리 -->
    <%@include file="../../common/menubar.jsp" %>
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
   <div class="main-schedule"></div>
   <div class="schedule">
        <div class="title-area">
            <div><span>일정자랑</span></div>
            <div><button onclick="pageLoad(1);">게시물 등록</button></div>
        </div>
        <hr>
        <div class="sidebar-area">
            <div id="side">
                <div class="side-title">
                        <span>Sort</span>
                </div>
                <div class="col-lg-12"><br>
                    <a href="schedule.bo?sort=recently">Recently</a><br>
                    <a href="schedule.bo?sort=recommend">Recommend</a><br>
                    <a href="schedule.bo?sort=views">Views</a><br>
                </div>  
            </div>
        </div>
        <div class="content-area">
      		<c:forEach var="i" items="${dataMap.plan}">
            	<div class="list" onclick="pageLoad(2)">
	                <div class="boardList">
	            		<input type="hidden" name="boardNo" value="${i.boardNo}">
	            		<input type="hidden" name="writer" value="${i.writer }">
	            		<input type="hidden" name="startDate" value="${i.startDate }">
	                    <div class="left-content">
	                        <div class="list-title">
	                            <h5>${i.boardTitle }</h5>
	                        </div>
	                        <div class="list-concept">
	                        	<c:choose>
	                        		<c:when test="${ i.concept ne null}">
			                            <p>여행컨셉 : ${fn:split(i.concept,'/')}</p>
	                        		</c:when>
	                        		<c:otherwise>
	                        			<p>여행컨셉 : 자유</p>
	                        		</c:otherwise>
	                        	</c:choose>
	                        </div>
	                        <!-- 동행하러가는 보드넘버 조회해와서 연결하기 인원수 가득찼다면 비활성화시키기 -->
	                        <!-- 작성자 시작일 종료일만 맞춰서 조회 -->
	                        <c:if test="${i.together eq 0}">
	                        	<div class="main-dark-button"><a class="with">동행하러가기</a></div>
	                        </c:if>
	                    </div>
	                </div>
	                <div class="thumb">
	                    <img class="boardImg">
	                </div>
	                <div class="list2">
	                    <div class="right-content">
	                        <ul>
	                            <li>
	                                <i class="fa fa-clock-o"></i>
	                                <h6>${i.startDate}<br>&nbsp;&nbsp;&nbsp; ~ ${i.endDate }<br> (${i.totalDate }days)</h6>
	                            </li>
	                            <li>
	                                <i class="fa fa-map-marker"></i>
	                                <h6>${i.address }</h6>
	                            </li>
	                            <li>
	                            	<c:choose>
	                            		<c:when test="${i.together eq 0 }">
			                                <i class="fa fa-users"></i>
				                            <h6>${i.togetherCount }인</h6>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<i class="fa fa-users"></i>
				                            <h6>${i.together }인</h6>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
       		</c:forEach>
        </div>
   </div>
	<%@include file="../../common/footer.jsp" %>
	<script>
		$(function(){
			
		});
		/* 페이지 이동 이벤트 */
        function pageLoad(num){
        	if(num==1){ // 등록하기 페이지
        		if("${empty loginUser}"){
        			alert("로그인이 필요한 서비스입니다.");
        		} else {
	        		location.href="insert.sc";
        		}
        	} else { // 디테일뷰 페이지
        		var bno = $(this).children().eq(1).children().eq(0).val(); // 이벤트 해당 게시물번호
				location.href="detail.sc?boardNo="+bno;
        	}
        }
		$(".boardList").each(function(){
			var writer = $(this).children().eq(1).next().val();
			var startDate = $(this).children().eq(1).siblings().eq(2).val();
			console.log(startDate);
			var button = $(this).children().eq(1).children().eq(2);
			var plan = "${dataMap.plan}"
			var togetherList = "${dataMap.together}";
			for(var i=0; i<togetherList.length; i++){
				if(writer==togetherList[i].writer && startDate==together[i].startDate){
					button.attr("href","togetherDetail.bo?boardNo="+together[i].boardNo);
					if(together[i].together==together[i].togetherCount){
						button.attr("href","javascript:void(0)");
					}
				}
			}
		});
	</script>
	
  </body>

</html>

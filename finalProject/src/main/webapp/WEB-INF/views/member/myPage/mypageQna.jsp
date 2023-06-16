<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css?v=1">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>마이페이지 Q&amp;A</title>
    <style type="text/css">
    </style>
</head>
<body>

 	<%@include file="../../common/menubar.jsp" %>
 	
 	<div id="QNAcontents">
	
	    <div class="tit_cont tit_widCol2">
	        <div class="area_tag">
				<span class="name5"><a href="mypage.me"><span class="ico">My</span>마이페이지</a></span>
	        </div>
	        <h2>Q&amp;A</h2>
	        <a href="myQnaEnroll.me" class="btn_apply btn_greyS">질문등록</a>
	    </div>
	
	    <div class="wrap_contView clfix">
	
	        <!-- 썸네일 리스트 -->
	        <div class="box_leftType1">
	            <div class="total_check">
	                <strong>총<span>${pi.listCount}</span>건</strong>
	            </div>
	            <!-- 명소,추천,코스,축제 -->
	            <ul class="list_board1 flnon">
<!-- 					<li class="bdr_nor"> -->
<!-- 						<div class="area_txt"> -->
<!-- 							<strong class="tit on"> -->
<!-- 								<a href="#">죄송합니다만 질문 하나 하겠습니다.</a> -->
<!-- 							</strong> -->
<!-- 							<div class="date"> -->
<!-- 								<em class="line">JASMINE</em> -->
<!-- 								<span class="line">2023. 6. 15.</span> -->
<!-- 								<span class="ans ing">접수확인중</span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<button type="button" title="열기" class="btn_view">더보기</button> -->
<!-- 						<div class="qna_subMenu" tabindex="0"> -->
<!-- 							<ul> -->
<!-- 								<li class="btn_mod" id="" statusid="0"> -->
<!-- 									<a href="javascript:">수정</a> -->
<!-- 								</li> -->
<!-- 								<li class="btn_del" id="" statusid="0"> -->
<!-- 									<a href="javascript:">삭제</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</li> -->
					<c:forEach var="qna" items="${list}">
                    		<li class="bdr_nor">
								<div class="area_txt">
									<strong class="tit on">
										<a href="#">${qna.serviceTitle}</a>
									</strong>
									<div class="date">
										<em class="line">${qna.writer}</em>
										<span class="line">${qna.createDate}</span>
										
										<c:choose>
											<c:when test="${qna.answerStatus == 'N' }">
												<span class="ans ing">접수확인중</span>	
											</c:when>
											<c:otherwise>
												<span class="ans ing" style="color: green;">답변완료</span>
											</c:otherwise>
										</c:choose>
										
										
									</div>
								</div>
								<button type="button" title="열기" class="btn_view">더보기</button>
								<div class="qna_subMenu" tabindex="0">
									<ul>
										<li class="btn_mod" id="" statusid="0">
											<a href="javascript:">수정</a>
										</li>
										<li class="btn_del" id="" statusid="0">
											<a href="javascript:">삭제</a>
										</li>
									</ul>
								</div>
							</li>
                    	</c:forEach>
					
				</ul>
				

	            <!-- //명소,추천,코스,축제 -->
	
	            <!-- paging -->
		            <div class="page_box">
			            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
			            	<c:choose>
				            	<c:when test="${p eq pi.currentPage}">
	                   				<a class="off" title="선택됨" href="myQna.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
		                		</c:when>
		                		<c:otherwise>
		                			<a class="on" title="선택됨" href="myQna.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
		                		</c:otherwise>
	                		</c:choose>
        		        </c:forEach>
		            </div>
	            <!-- //paging -->
	        </div>
	        <!-- //썸네일 리스트 -->
	
	        <div class="box_rightType1">
	            <!-- snb -->
	            <div class="snb_mypage">
	                <ul>
	                    <li><a href="/mypage/mypage_list_fav.do">즐겨찾기</a></li>
	                    <li><a href="/mypage/mypage_list_cos.do">코스</a></li>
	                    <li><a href="/mypage/mypage_list_reply.do">댓글</a></li>
	                    <li><a href="/mypage/tourist_info_list.do">관광정보 수정/신규 요청</a></li>
	                    <c:choose>
	                    	<c:when test="${pi.listCount == 0 }">
	                    		<li class="on"><a href="myQna.me" id="qna">Q&amp;A</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="on"><a href="myQna.me" id="qna">Q&amp;A (${pi.listCount})</a></li>
	                    	</c:otherwise>
	                    </c:choose>

	                    <!-- <li><a href="/mypage/mypage_list_event.do" id="event"></a></li> -->
	                    <li id="stampEnabled"><a href="/mypage/mypage_list_stamp.do" id="stamp">발도장</a></li>
	                </ul>
	            </div>
	            <!-- //snb -->

	        </div>
	
	    </div>
	
	</div>
    <script>
    	//버튼 클릭시 수정 삭제 나타남
    	$(function() {
			$(".btn_view").click(function() {
				if ($(this).next("div").css("display") === "block") {
					$(this).next("div").css("display","none");
				}else{
					$(this).next("div").css("display","block");
				}
			});
		});
    	
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
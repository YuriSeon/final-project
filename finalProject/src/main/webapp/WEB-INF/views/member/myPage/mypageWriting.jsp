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
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css?v=2">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>마이페이지 작성글 보기</title>
    <style type="text/css">
    .snb_mypage ul li.on a {
		background: url(resources/images/ico_mypagemenu.png) 0 0 no-repeat;
		background-size: 4px 100%;
		color: #333;
	}
    </style>
</head>
<body>

 	<%@include file="../../common/menubar.jsp" %>
 	
 	<div id="QNAcontents">
	
	    <div class="tit_cont tit_widCol2">
	        <div class="area_tag">
				<span class="name5"><a href="mypage.me"><span class="ico">My</span>마이페이지</a></span>
	        </div>
	        <h2>작성글 보기</h2>
	    </div>
	
	    <div class="wrap_contView clfix">
	
	        <!-- 썸네일 리스트 -->
	        <div class="box_leftType1">
	            <div class="total_check">
	                <c:choose>
                    	<c:when test="${pi.listCount == 0 }">
                    		<strong>총<span>0</span>건</strong>
                    	</c:when>
                    	<c:otherwise>
                    		<strong>총<span>${pi.listCount}</span>건</strong>
                    	</c:otherwise>
                    </c:choose>
                    <div class="btn_txt2 type1">
                    	<c:choose>
                    		<c:when test="${category == 4}">
                    			<button type="button" id="feed" onclick="location.href='selectBoard.me?category=4';" class="on">피드</button>|
								<button type="button" id="schedule" onclick="location.href='selectBoard.me?category=6';" class="">일정자랑</button>|
								<button type="button" id="together" onclick="location.href='selectBoard.me?category=5';" class="">함께가치</button>
                    		</c:when>
                    		<c:when test="${category == 5}">
                    			<button type="button" id="feed" onclick="location.href='selectBoard.me?category=4';" class="">피드</button>|
								<button type="button" id="schedule" onclick="location.href='selectBoard.me?category=6';" class="">일정자랑</button>|
								<button type="button" id="together" onclick="location.href='selectBoard.me?category=5';" class="on">함께가치</button>
                    		</c:when>
                    		<c:when test="${category == 6}">
                    			<button type="button" id="feed" onclick="location.href='selectBoard.me?category=4';" class="">피드</button>|
								<button type="button" id="schedule" onclick="location.href='selectBoard.me?category=6';" class="on">일정자랑</button>|
								<button type="button" id="together" onclick="location.href='selectBoard.me?category=5';" class="">함께가치</button>
                    		</c:when>
                    		<c:otherwise>
								<button type="button" id="feed" onclick="location.href='selectBoard.me?category=4';" class="">피드</button>|
								<button type="button" id="schedule" onclick="location.href='selectBoard.me?category=6';" class="">일정자랑</button>|
								<button type="button" id="together" onclick="location.href='selectBoard.me?category=5';" class="">함께가치</button>
                    		</c:otherwise>
                    	</c:choose>
					</div>
	            </div>
	            <!-- 명소,추천,코스,축제 -->
	          	<div class="replyWrap mypage">
		          	<div class="wrap_reply">
		          		<div class="list_reply">
							<ul>
								<c:forEach var="w" items="${list}">
									<li>
										<div class="profile">
											<div class="photo" icid="">
												<c:choose>
													<c:when test="${not empty loginUser.profileImg}"><img src="${loginUser.profileImg}" alt="프로필 사진"></c:when>
													<c:otherwise><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png" alt="프로필 사진"></c:otherwise>
												</c:choose>
											</div>
											<span class="ico">
												<img src="resources/images/ico_naver.png" alt="네이버">
											</span>
										</div>
										<div class="txt_reply">
											<c:choose>
												<c:when test="${w.category == 4}"><strong><a href="">[피드]</a></strong></c:when>
												<c:when test="${w.category == 5}"><strong><a href="">[함께가치] ${w.boardTitle}</a></strong></c:when>
												<c:otherwise><strong><a href="">[일정자랑] ${w.boardTitle}</a></strong></c:otherwise>
											</c:choose>
											<p><a href="">${w.boardContent }</a></p>
											<div class="date">
												<em class="name">${w.boardWriter}</em><span>${w.createDate}</span>
											</div>
										</div>
										<button type="button" title="내용 더보기" class="btn_view">더보기</button>
										<div class="wri_subMenu">
											<ul>
												<li class="btn_upd" id="" cotid="">
													<a href="javascript:">수정</a>
												</li>
												<li class="btn_del" id="" cotid="">
													<a href="javascript:">삭제</a>
												</li>
											</ul>
										</div>
									</li>
		                    	</c:forEach>
							</ul>		          		
		          		</div>
		          	</div>
	          	</div>
	            <!-- //명소,추천,코스,축제 -->
	
	            <!-- paging -->
		            <div class="page_box">
			            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
			            	<c:choose>
				            	<c:when test="${p eq pi.currentPage}">
	                   				<a class="off" title="선택됨" href="myWriting.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
		                		</c:when>
		                		<c:otherwise>
		                			<a class="on" title="선택됨" href="myWriting.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
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
	                    <c:choose>
	                    	<c:when test="${pi.listCount == 0 }">
	                    		<li class="on"><a href="myWriting.me">작성글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="on"><a href="myWriting.me">작성글 보기(${pi.listCount})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${r == 0 }">
	                    		<li><a href="myReply.me">댓글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myReply.me">댓글 보기(${r})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${c == 0 }">
	                    		<li><a href="myChoice.me">찜 목록</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myChoice.me">찜 목록(${c})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${rq == 0 }">
	                    		<li><a href="myRequest.me">관광정보 수정 / 신규 요청</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myRequest.me">관광정보 수정 / 신규 요청(${rq})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${q == 0 }">
	                    		<li><a href="myQna.me" id="qna">Q&amp;A</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myQna.me" id="qna">Q&amp;A(${q})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <li id="stampEnabled"><a href="myFoot.me" id="stamp">발도장</a></li>
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
				var targetDiv = $(this).next("div");
				
				$(".wri_subMenu").not(targetDiv).css("display","none");
				
				if (targetDiv.css("display") === "block") {
					targetDiv.css("display","none");
				}else{
					targetDiv.css("display","block");
				}
			});
		});
    	
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
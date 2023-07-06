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
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>마이페이지 정보 수정/신규 요청</title>
    <style type="text/css">
   	.snb_mypage ul li.on a {
		background: url(resources/images/ico_mypagemenu.png) 0 0 no-repeat;
		background-size: 4px 100%;
		color: #333;
	}
	.download a{
		color: black;
		border: 1px solid grey;
		margin-right: 10px;
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
	        <h2>${n.serviceTitle}</h2>
	        <div class="area_titDate">
	            <span class="inTxt" id="screenname">${n.writer}</span> | <span class="inTxt" id="createday">${n.createDate}</span> |
	            <c:choose>
	            <c:when test="${n.answerStatus == 'N'}"><span class="color_red" style="color: red;">접수확인중</span></c:when>
	            <c:otherwise><span class="color_green" style="color: green;">답변완료</span></c:otherwise>
	            </c:choose> 
	        </div>
	    </div>
	
	    <div class="wrap_contView clfix">
			<!-- 내용 -->
	        <div class="box_leftType1">
	            <div class="view_board1">
	            	<div class="btn_fileDown" style="display:none;"></div>
	                <div class="view_data">${n.serviceContent}</div>
	                <c:if test="${not empty a}">
		                <div class="download">파일:
			                <c:forEach var="a" items="${a}">
			                	<a href="${a.filePath}${a.changeName}" download="${a.originName}">
									${a.originName}
		               			</a>
			                </c:forEach>
		                </div>
	                </c:if>
	            </div>	
	
	            <!-- 댓글 -->
	            <h3 class="tit_reply min_tit">댓글<span></span></h3>
	
	            <div class="area_replyWrite">
	                <textarea name="qnaComment" id="qnaComment" placeholder="댓글 쓰기" title="댓글쓰기"></textarea>
	                <div class="list_btn">
	                    <a href="javascript:qnaReplyInsert()" class="btn_greyS btn_apply">등록</a>
	                </div>
	            </div>
	
	            <div class="wrap_reply reply_type2">
	                <div class="list_reply wid100P">
	                    <ul>
<!-- 							<li class="bdr_nor" style="display: flex;"> -->
<!-- 								<div class="profile"> -->
<!-- 									<div class="photo"> -->
<!-- 										<img src="resources/images/blackperson.png"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="txt_reply"> -->
<!-- 									<p>안녕하세요. 대한민국 구석구석 운영진입니다. -->
<!-- 									정확한 답변을 위해 다시한번 문의내용을 남겨주시길 바랍니다. -->
<!-- 									감사합니다 -->
<!-- 									</p> -->
<!-- 									<div class="date"> -->
<!-- 										<em class="name">대한민국 구석구석</em> -->
<!-- 										<span>2023. 6. 16.</span> -->
<!-- 									</div> -->
<!-- 									<button type="button" title="열기" class="btn_view">더보기</button> -->
<!-- 									<div class="qna_subMenu" tabindex="0"> -->
<!-- 										<ul> -->
<!-- 											<li class="btn_del"> -->
<!-- 												<input value="" hidden> -->
<!-- 												<a href="javascript:void(0);">삭제</a> -->
<!-- 											</li> -->
<!-- 										</ul> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
						</ul>
	                </div>
	            </div>
	            <!-- //댓글 -->
	        </div>
	        <!-- //내용 -->
	        	
	        <div class="box_rightType1">
	            <!-- snb -->
	            <div class="snb_mypage">
	                <ul>
	                    <c:choose>
	                    	<c:when test="${w == 0 }">
	                    		<li><a href="myWriting.me">작성글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myWriting.me">작성글 보기(${w})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${r == 0}">
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
	                    		<li class="on"><a href="myRequest.me">관광정보 수정 / 신규 요청</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="on"><a href="myRequest.me">관광정보 수정 / 신규 요청(${rq})</a></li>
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
	                </ul>
	            </div>
	            <!-- //snb -->

	        </div>
	
	    </div>
	
	</div>
    <script>
  	//버튼 클릭시 수정 삭제 나타남
  	$(".list_reply>ul").on("click", ".btn_view", function() {
		var targetDiv = $(this).next("div");
		
		$(".qna_subMenu").not(targetDiv).css("display","none");
		
		if (targetDiv.css("display") === "block") {
			targetDiv.css("display","none");
		}else{
			targetDiv.css("display","block");
		}
	});
    
	
	//댓글 삭제
  	$(".list_reply>ul").on("click", ".qna_subMenu>ul>li>a", function() {
		var rno = $(this).prev().val();

		$.ajax({
			url:"qnaReplyDelete.me",
			type: "POST",
			data:{
				replyNo : rno,
			},
			success: function(result) {
				if(result=="success"){
					alertify.message("댓글 삭제 성공");
					qnaReplyList();
				}else{
					alertify.message("댓글 삭제 실패");
				}
			},
			error: function() {
				console.log("통신실패");
			}
		});
	});
  	
  	//페이지 시작 댓글 불러오기
    $(function() {
    	qnaReplyList();
	});
    
    //댓글 불러오기
    function qnaReplyList() {
    	var nickname = "${loginUser.nickname}";
    	var profileImg = "${loginUser.profileImg}";
    	$.ajax({
			url:"qnaReplyList.me",
			data:{
				serviceNo : "${n.serviceNo}"
			},
			success: function(list) {
				var str = "";
				for(var i in list){
					str +="<li class='bdr_nor' style='display: flex;'>"
						+ "<div class='profile'>"					
           				+ "<div class='photo'>";
           				if (list[i].replyWriter == nickname) {
  							str	+= "<img src='"+profileImg+"'>";
						}else{
           					str	+= "<img src='resources/images/blackperson.png'>";
						}
       				str += "</div>"
	       				+ "</div>"
	       				+ "<div class='txt_reply'>"
	       				+ "<p>"
	       				+ list[i].content
	       				+ "</p>"
	       				+ "<div class='date'>"
	       				+ "<em class='name'>"+list[i].replyWriter+"</em>"
	       				+ "<span>"+list[i].createDate+"</span>"
	       				+ "</div>"
	       				if (list[i].replyWriter == nickname) {
  							str	+= "<button type='button' title='열기' class='btn_view'>더보기</button>";							
						}
       				str += "<div class='qna_subMenu' tabindex='0'>"
	       				+ "<ul>"
	       				+ "<li class='btn_del'>"
	       				+ "<input value='"+list[i].replyNo+"' hidden>"
	       				+ "<a href='javascript:void(0);'>삭제</a>"
	       				+ "</li>"
	       				+ "</ul>"
	       				+ "</div>"
	       				+ "</div>"
	       				+ "</li>";
				}
				$(".list_reply>ul").html(str);
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
    
  	//댓글 등록
	function qnaReplyInsert() {
		$.ajax({
			url:"qnaReplyInsert.me",
			type: "POST",
			data:{
				content : $("#qnaComment").val(),
				refQno : "${n.serviceNo}",
				replyWriter : "${loginUser.nickname}" 
			},
			success: function(result) {
				if(result=="success"){
					alertify.message("댓글 등록 성공");
					qnaReplyList();
					$("#qnaComment").val("");
				}else{
					alertify.message("댓글 등록 실패");
				}
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
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
    <title>마이페이지 댓글 보기</title>
    <style type="text/css">
    .snb_mypage ul li.on a {
		background: url(resources/images/ico_mypagemenu.png) 0 0 no-repeat;
		background-size: 4px 100%;
		color: #333;
	}
	.modal{
		text-align: center;
	}
	@media screen and (min-width: 768px) { 
	    .modal:before {
		    display: inline-block;
		    vertical-align: middle;
		    content: " ";
		    height: 100%;
	    }
	}
	.modal-dialog{
		display: inline-block;
	    text-align: left;
	    vertical-align: middle;
	}
	.modal-header2{
		padding-left: 10px;
		padding-top: 10px;
	}
	.modal-body2{
		padding: 10px;
	}
	.reply-form{
		display: flex;
	}
	.reply-form textarea{
		margin-bottom: 20px;
		height: 100px;
		width: 500px;
		resize: none; 	
	}
	.reply-form button{
		height: 100px;
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
	        <h2>댓글 보기</h2>
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
	            </div>
	            <!-- 명소,추천,코스,축제 -->
	          	<div class="replyWrap mypage">
		          	<div class="wrap_reply">
		          		<div class="list_reply">
							<ul>
								<c:forEach var="r" items="${list}">
									<li>
									<input type="text" value="${r.replyNo}" class="replyNo" hidden>
										<div class="profile">
											<div class="photo">
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
											<strong><a href="javascript:void(0);">${r.boardTitle}</a></strong>
											<p><a href="javascript:void(0);">${r.content}</a></p>
											<div class="date">
												<em class="name">${r.replyWriter}</em><span>${r.createDate}</span>
											</div>
										</div>
										<button type="button" title="내용 더보기" class="btn_view">더보기</button>
										<div class="wri_subMenu">
											<ul>
												<li class="btn_upd modify">
													<a href="javascript:void(0);">수정</a>
												</li>
												<li class="btn_del delete">
													<a href="javascript:void(0);">삭제</a>
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
	            <!-- 댓글 수정 모달 -->
	            <div class="modal fade" id="followModal" role="dialog"> 
                 	<div class="modal-dialog">
                    	<!-- Modal content-->   
                    	<div class="modal-content">
	                      	<div class="modal-header2">
		                        <h4 class="modal-title"></h4>
		                        <button type="button" class="close" data-dismiss="modal" style="color: white;">×</button>
	                      	</div>
                      		<div class="modal-body2">
	                      		<form action="myReplyUpdate.me" method="post" class="reply-form">
	                      			<input type="text" name="replyNo" class="reply-number" hidden>
	                      			<textarea name="content"></textarea>
	                      			<button type="submit" class="btn btn-info">수정</button>
	                      		</form>
                     		</div>
                   		</div>
                 	</div>
               	</div>
				<!-- //댓글 수정 모달 -->
	            <!-- paging -->
		            <div class="page_box">
			            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
			            	<c:choose>
				            	<c:when test="${p eq pi.currentPage}">
	                   				<a class="off" title="선택됨" href="myReply.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
		                		</c:when>
		                		<c:otherwise>
		                			<a class="on" title="선택됨" href="myReply.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
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
	                    	<c:when test="${w == 0 }">
	                    		<li><a href="myWriting.me">작성글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li><a href="myWriting.me">작성글 보기(${w})</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                    <c:choose>
	                    	<c:when test="${pi.listCount == 0}">
	                    		<li class="on"><a href="myReply.me">댓글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="on"><a href="myReply.me">댓글 보기(${pi.listCount})</a></li>
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
    	
    	//댓글 수정
        $(function () {
    		$(".list_reply>ul>li>.wri_subMenu>ul>.modify").click(function () {
    			var rno = $(this).parents("li").find(".replyNo").val();
    			replyModifyModal(rno)
    		});
    	});
    	
      	//댓글 수정 모달
        function replyModifyModal(rno){
            $('#followModal').modal(); //id가 "followModal"인 모달창을 열어준다. 
            $('.modal-title').text("댓글 수정"); //modal 의 header 부분에 값을 넣어준다.
            $('.modal-title').css("font-size","30px");
            $(".reply-number").attr("value",rno);
        }
    	
      	//댓글 삭제
        $(function () {
    		$(".list_reply>ul>li>.wri_subMenu>ul>.delete").click(function () {
    			var $select = $(this); 
    			var rno = $(this).parents("li").find(".replyNo").val();
   				$.ajax({
		            url: "replyDelete.me",
		            type: "POST",
		            data: {
		                replyNo: rno
		            },
		            success: function(result) {
		            	if (result == "success") {
		            		$select.parents("li").remove();
		            		location.reload();
						}else{
							alertify.message("댓글 삭제 실패");
						}
		            },
		            error: function() {
		                console.log("error");
		            }
		        });	
    		});
    	});
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
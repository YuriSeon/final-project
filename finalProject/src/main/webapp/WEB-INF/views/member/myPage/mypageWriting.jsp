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
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css?v=2?after">
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
	.modal-content {
	    background-color: #fff !important;
	    color: black !important;
	}
	.modal-content img{
		margin-top: 10px;
	}
	.modal-dialog{
		display: inline-block;
	    text-align: left;
	    vertical-align: middle;
	    max-width: 520px !important;
	    width: 520px !important;
	}
	.modal-header2{
		padding-left: 10px;
		padding-top: 10px;
	}
	.modal-body2{
		padding: 10px;
	}
	.swiper-container {
		width: 500px !important;
	    height: 340px !important;
	}
	.swiper-button-prev,
	.swiper-button-next {
		background-color: #fff;
		opacity: 0.5;
		border-radius: 20px;
		color: black !important;
	}
	.swiper-button-prev:after,
	.swiper-button-next:after {
		font-size: 1.1rem !important;
		font-weight: 600 !important;
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
									<input type="text" value="${w.boardNo}" class="boardNo" hidden>
									<input type="text" value="${w.category}" class="category" hidden>
										<div class="profile">
											<div class="photo" icid="">
												<c:choose>
													<c:when test="${not empty loginUser.profileImg}"><img src="${loginUser.profileImg}" alt="프로필 사진"></c:when>
													<c:otherwise><img src="https://ssl.pstatic.net/static/pwe/address/img_profile.png" alt="프로필 사진"></c:otherwise>
												</c:choose>
											</div>
											<span class="ico">
												<c:choose>
													<c:when test="${loginUser.certification == 1}"><img src="resources/images/ico_kakao.png" alt="카카오"></c:when>
													<c:when test="${loginUser.certification == 2}"><img src="resources/images/ico_naver.png" alt="네이버"></c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</span>
										</div>
										<div class="txt_reply">
											<c:choose>
												<c:when test="${w.category == 4}"><strong><a href="javascript:void(0);">[피드]</a></strong></c:when>
												<c:when test="${w.category == 5}"><strong><a href="javascript:void(0);">[함께가치] ${w.boardTitle}</a></strong></c:when>
												<c:otherwise><strong><a href="javascript:void(0);">[일정자랑] ${w.boardTitle}</a></strong></c:otherwise>
											</c:choose>
											<p><a href="javascript:void(0);" style="cursor: default;">${w.boardContent }</a></p>
											<div class="date">
												<em class="name">${w.boardWriter}</em><span>${w.createDate}</span>
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
	            
	            <!-- 피드 모달 -->
	            <div class="modal fade" id="followModal" role="dialog"> 
                 	<div class="modal-dialog">
                    	<!-- Modal content-->   
                    	<div class="modal-content">
	                      	<div class="modal-header2">
		                        <h4 class="modal-title"></h4>
		                        <button type="button" class="close" data-dismiss="modal" style="color: white;">×</button>
	                      	</div>
                      		<div class="modal-body2">
                      			<div class="feed-container" style="height: 500px;">
                      				<div class="ticket-item" style="width: 400px;">
				                        <div class="thumb">
				                        	<div class="nicname">							                        	 
	                                            <img src="resources/images/profile/빈프로필.jpg" alt="" style="width:25px; height:25px; border-radius:50%; margin-left:5px; position: relative; top: -5px;" id="profile">			                                        		
			                        			<span><a id="nicknameHover"></a></span>
				                        	</div>
				                        	<div class="swiper-container">
											    <div class="swiper-wrapper">
											    </div>
											    <div class="swiper-button-prev">&lt;</div>
											    <div class="swiper-button-next" style="position: absolute; left: 465px;">&gt;</div>
											</div>
<!-- 				                            <div id="slideShow"> -->
<!-- 												<ul class="slides" id="slides" style="width: 2400px"> -->
<!-- 											    	<li><img src="resources/feed/2023063013450239722.jpg" alt="" style="width: 500px; height: 300px;"></li> -->
<!-- 											    	<li></li> -->
<!-- 											    	<li></li> -->
<!-- 											    	<li></li>  														     -->
<!-- 											    </ul> -->
<!-- 											    <p class="controller" id="controller"> -->
<!-- 												    &lang: 왼쪽 방향 화살표
<!-- 												    &rang: 오른쪽 방향 화살표 --> 
<!-- 													<span class="prev" id="prev">&lang;</span>   -->
<!-- 													<span class="next" id="next">&rang;</span> -->
<!-- 												</p> -->
<!-- 											</div> -->
				                        </div>
				                            <div class="prices" style="width: 500px;">
						                            <div class="price">
						                                <span></span>
						                            </div>
						                        <div class="down-content">
						                            <h5></h5>
						                            <br>
						                            <ul id="address">
						                            	<li style="float: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
															  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
															</svg>
														</li>
						                            	<li></li> 
						                            </ul>									                            
							                        <p></p>
						                        </div>
						                        <hr>
				                            </div>
				                    	</div>
                      				
                      			</div>
                     		</div>
                   		</div>
                 	</div>
               	</div>
				<!-- //댓글 수정 모달 -->
	            
	            <!-- paging -->
		            <div class="page_box">
			            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
			            	<c:choose>
			            		<c:when test="${category != null}">
			            			<c:choose>
						            	<c:when test="${p eq pi.currentPage}">
			                   				<a class="off" title="선택됨" href="selectBoard.me?currentPage=${p}&category=${category}" id="1">${p}<span class="blind">현재 위치</span></a>
				                		</c:when>
				                		<c:otherwise>
				                			<a class="on" title="선택됨" href="selectBoard.me?currentPage=${p}&category=${category}" id="1">${p}<span class="blind">현재 위치</span></a>
				                		</c:otherwise>
			                		</c:choose>
			            		</c:when>
			            		<c:otherwise>
			            			<c:choose>
						            	<c:when test="${p eq pi.currentPage}">
			                   				<a class="off" title="선택됨" href="myWriting.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
				                		</c:when>
				                		<c:otherwise>
				                			<a class="on" title="선택됨" href="myWriting.me?currentPage=${p}" id="1">${p}<span class="blind">현재 위치</span></a>
				                		</c:otherwise>
			                		</c:choose>
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
	                    		<li class="on"><a href="myWriting.me">작성글 보기</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="on"><a href="myWriting.me">작성글 보기(${w})</a></li>
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
    	
    	//상세페이지 이동
    	$(function () {
    		$(".list_reply>ul>li>div.txt_reply>strong>a").click(function () {
    			var bno = $(this).parents("li").find(".boardNo").val();
    			var cate = $(this).parents("li").find(".category").val();
    			if (cate == 4) {
    				$.ajax({
			            url: "selectFeed.me",
			            type: "GET",
			            data: {
			                boardNo: bno
			            },
			            dataType: "json",
			            success: function(response) {
			            	var feed = response.b;
			            	var a = response.a;
			            	var str = "";
			            	console.log(a);
			            	$("#nicknameHover").text(feed.boardWriter);
			            	$(".price>span").text("좋아요 "+feed.good+"개");
			            	$(".down-content>h5").text(feed.boardContent);
			            	$("#address>li:last").text(feed.info.infoAddress);
			            	$(".down-content>p").text(feed.createDate);
			            	for(var i in a){
			            		str+='<div class="swiper-slide"><img src="'+a[i].filePath+'" style="width: 500px; height: 300px;"></div>';
			            		
			            	}
			            	$(".swiper-wrapper").html(str);
		    				replyModifyModal();
			            },
			            error: function() {
			                console.log("error");
			            }
			        });
				}else if (cate == 5) {
					location.href = 'togetherDetail.bo?boardNo='+bno;
				}else{
// 					location.href = '='+bno;
				}
    		});
    	});
    	
    	//수정페이지 이동
        $(function () {
    		$(".list_reply>ul>li>.wri_subMenu>ul>.modify").click(function () {
    			var bno = $(this).parents("li").find(".boardNo").val();
    			var cate = $(this).parents("li").find(".category").val();
    			if (cate == 4) {
    				location.href = 'updateEnroll.fo?boardNo='+bno;	
				}else if (cate == 5) {
					location.href = 'togetherDetail.bo?boardNo='+bno;
				}else{
// 					location.href = '='+bno;
				}
    		});
    	});
    	
    	//작성글 삭제
        $(function () {
    		$(".list_reply>ul>li>.wri_subMenu>ul>.delete").click(function () {
    			var $select = $(this); 
    			var bno = $(this).parents("li").find(".boardNo").val();
    			var cate = $(this).parents("li").find(".category").val();
    			if (cate == 4) {
    				$.ajax({
			            url: "deleteFeed.me",
			            type: "POST",
			            data: {
			                boardNo: bno
			            },
			            success: function(result) {
			            	if (result == "success") {
			            		$select.parents("li").remove();
			            		location.reload();
							}else{
								alertify.message("게시글 삭제 실패");
							}
			            },
			            error: function() {
			                console.log("error");
			            }
			        });	
				}else if (cate == 5) {
// 					location.href = '='+bno;
				}else{
// 					location.href = '='+bno;
				}
    		});
    	});
    	
      	//댓글 수정 모달
        function replyModifyModal(){
            $('#followModal').modal(); //id가 "followModal"인 모달창을 열어준다. 
            $('.modal-title').text("피드"); //modal 의 header 부분에 값을 넣어준다.
            $('.modal-title').css("font-size","30px");
        }
      	
      	//모달 안의 스와이퍼
      	$(function() {
    	    const swiper = new Swiper('.swiper-container', {
    		    slidesPerView : 1, // 한 슬라이드에 보여줄 갯수
    		    spaceBetween : 10, // 슬라이드 사이 여백
    		    loop : false, // 슬라이드 반복 여부
    		    centeredSlides : true,
    		    watchOverflow : true,
//    	 	    loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
    		    pagination : false, // pager 여부
//    	 	    autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
//    	 		    delay : 3000,   // 시간 설정
//    	 		    disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
//    	 	    },
    		    navigation: {   // 버튼 사용자 지정
    			    nextEl: '.swiper-button-next',
    			    prevEl: '.swiper-button-prev',
    		    },
    			observer: true,
    			observeParents : true,
    	    });
    	});
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
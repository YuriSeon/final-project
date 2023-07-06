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
    <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<!-- swiper -->
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <title>게시글관리-피드</title>
    <style type="text/css">

	.swiper-slide {
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.off{
		display: none;
	}
    
    </style>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;게시글 관리 - 피드</h1>
        </div>
        <div class="board-theme">
            <div class="search-btn" id="searchBtn">
                <!-- 검색 시작 -->
                <div class="search-section">
                	<form action="feedSearch.ad" method="get">
                	<input type="hidden" name="currentPage" value="1">
	                    <select name="type" id="searchCate">
	                        <option value="title" ${type == 'title' ? 'selected="selected"': ''}>지역</option>
	                        <option value="content" ${type == 'content' ? 'selected="selected"': ''}>내용</option>
	                        <option value="writer" ${type == 'writer' ? 'selected="selected"': ''}>작성자</option>
	                    </select>
	                    <input type="text" name="keyword" id="searchBar">
	                    <button class="btn btn-default" id="searchBtn">검색</button>
                	</form>
                </div>
                <!-- 검색 끝 -->
                <!-- 버튼 시작 -->
                <div>
                    <button class="btn btn-danger" onclick="chkDelete();">선택삭제</button>
                </div>
                <!-- 버튼 끝 -->
            </div>
            <!-- 결과 테이블 시작  -->
            <div class="theme-board">
                <table class="theme-table" border="1">
                    <thead>
                        <tr>
                            <th style="width: 5%"><input type="checkbox" id="chkAll"></th>
                            <th style="width: 5%">번호</th>
                            <th style="width: 10%">지역</th>
                            <th style="width: 40%">내용</th>
                            <th style="width: 10%">작성자</th>
                            <th style="width: 10%">작성시각</th>
                            <th style="width: 10%">수정시각</th>
                            <th style="width: 10%">좋아요</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="b" items="${list}">
                    		<tr>
	                            <td class="table-chk"><input type="checkbox" class="check" name="chk" id=""></td>
	                            <td>${b.boardNo}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${b.zoneNo == 11}">서울</c:when>
	                            		<c:when test="${b.zoneNo == 23}">인천</c:when>
	                            		<c:when test="${b.zoneNo == 21}">부산</c:when>
	                            		<c:when test="${b.zoneNo == 22}">대구</c:when>
	                            		<c:when test="${b.zoneNo == 24}">광주</c:when>
	                            		<c:when test="${b.zoneNo == 25}">대전</c:when>
	                            		<c:when test="${b.zoneNo == 26}">울산</c:when>
	                            		<c:when test="${b.zoneNo == 31}">경기</c:when>
	                            		<c:when test="${b.zoneNo == 32}">강원</c:when>
	                            		<c:when test="${b.zoneNo == 33}">충북</c:when>
	                            		<c:when test="${b.zoneNo == 34}">충남</c:when>
	                            		<c:when test="${b.zoneNo == 37}">경북</c:when>
	                            		<c:when test="${b.zoneNo == 38}">경남</c:when>
	                            		<c:when test="${b.zoneNo == 35}">전북</c:when>
	                            		<c:when test="${b.zoneNo == 36}">전남</c:when>
	                            		<c:otherwise>제주</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>${b.boardContent}</td>
	                            <td>${b.boardWriter}</td>
	                            <td>${b.createDate}</td>
	                            <td>${b.modifyDate}</td>
	                            <td>${b.good}</td>
                        	</tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- 결과 테이블 끝 -->
            <!-- 페이징 시작 -->
            <div id="pagingArea" align="center">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${keyword != null}">
		                	<c:choose>
		                		<c:when test="${pi.currentPage eq 1}">
		                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			 <li class="page-item"><a class="page-link" href="feedSearch.ad?currentPage=${pi.currentPage - 1}&type=${type}&keyword=${keyword}">&lt;</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
		                    	<c:choose>
		                    		<c:when test="${p eq pi.currentPage}">
		                   				<li class="page-item disabled"><a class="page-link" href="feedSearch.ad?currentPage=${p}&type=${type}&keyword=${keyword}">${p}</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item"><a class="page-link" href="feedSearch.ad?currentPage=${p}&type=${type}&keyword=${keyword}">${p}</a></li>
			                		</c:otherwise>
		                    	</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${pi.currentPage eq pi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:when test="${pi.listCount eq 0}">
				                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="feedSearch.ad?currentPage=${pi.currentPage + 1}&type=${type}&keyword=${keyword}">&gt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
                		</c:when>
                		
                		<c:otherwise>
		                	<c:choose>
		                		<c:when test="${pi.currentPage eq 1}">
		                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			 <li class="page-item"><a class="page-link" href="feed.ad?currentPage=${pi.currentPage - 1 }">&lt;</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
		                    	<c:choose>
		                    		<c:when test="${p eq pi.currentPage}">
		                   				<li class="page-item disabled"><a class="page-link" href="feed.ad?currentPage=${p}">${p}</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item"><a class="page-link" href="feed.ad?currentPage=${p}">${p}</a></li>
			                		</c:otherwise>
		                    	</c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${pi.currentPage eq pi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:when test="${pi.listCount eq 0}">
				                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="feed.ad?currentPage=${pi.currentPage + 1}">&gt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div> 
            <!-- 페이징 끝 -->
        </div>
    </div><!-- container-fluid -->
</div>
<!-- Modal 시작 -->
<div class="feed-modal">
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title" id="exampleModalLabel"></h2>
<!-- 					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					<button type="button" class="close" data-dismiss="modal" style="margin-right: 10px;">X</button>
				</div>
				<div class="modal-body" style="height: 600px; overflow: hidden;">
					<div class="swiper-container">
					    <div class="swiper-wrapper">
					    </div>
					    <div class="swiper-button-prev"></div>
					    <div class="swiper-button-next"></div>
					</div>
					<div class="content-box" style="text-align: center; font-size: 16px; color: #313131; margin-top: 20px;"></div>
				</div>
				<div class="modal-footer">
<!-- 					<button type="button" class="btn btn-primary">Save changes</button> -->
<!-- 					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal 끝 -->
<script>
    
    //체크박스 전체선택
    $(function() {
        $("#chkAll").click(function() {
            if($("#chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
            else $("input[name=chk]").prop("checked", false);
        });
        
        $("input[name=chk]").click(function() {
            var total = $("input[name=chk]").length;
            var checked = $("input[name=chk]:checked").length;
            if(total != checked){
                $("#chkAll").prop("checked", false);
            }else{
                $("#chkAll").prop("checked", true); 
            }
        });
        
    });
   
  	//클릭 시 사진 모달로 띄우기
    $(function () {
		$(".theme-table>tbody>tr>td").not(":first-child").click(function modal() {
			var bno = $(this).parent().children().eq(1).text();
			var content = $(this).parent().children().eq(3).text();
			
			$.ajax({
	    		type: "get",
	    		url: "feedSelectFile.ad",
	    		data: {	boardNo : bno },
				success: function(list) {
					var str = "";
					for(var i in list){
						str +='<div class="swiper-slide"><img src="'+list[i].filePath+'" width="55%;" height="15%;"></div>';
							
					}
					$(".modal-title").text("피드");
					$(".content-box").text(content);
					$(".swiper-wrapper").html(str);
					$("#exampleModal").modal("show");			
				},
				error: function(request,status,error) {
					console.log(error);
				}
	    	});
		});
	});
  	
  	//모달 안의 스와이퍼
  	$(function() {
	    const swiper = new Swiper('.swiper-container', {
		    slidesPerView : 1, // 한 슬라이드에 보여줄 갯수
		    spaceBetween : 10, // 슬라이드 사이 여백
		    loop : false, // 슬라이드 반복 여부
		    centeredSlides : true,
		    watchOverflow : true,
//	 	    loopAdditionalSlides : 1, // 슬라이드 반복 시 마지막 슬라이드에서 다음 슬라이드가 보여지지 않는 현상 수정
		    pagination : false, // pager 여부
//	 	    autoplay : {  // 자동 슬라이드 설정 , 비 활성화 시 false
//	 		    delay : 3000,   // 시간 설정
//	 		    disableOnInteraction : false,  // false로 설정하면 스와이프 후 자동 재생이 비활성화 되지 않음
//	 	    },
		    navigation: {   // 버튼 사용자 지정
			    nextEl: '.swiper-button-next',
			    prevEl: '.swiper-button-prev',
		    },
			observer: true,
			observeParents : true,
	    });
	});
  	
    //체크박스 선택한 항목 삭제
    function chkDelete() {
    	var list = [];
    	
    	$(".check:checked").each(function() {
			var chk = $(this).closest("tr").find("td:eq(1)").text();
			list.push(chk);
			$(this).closest("tr").remove();
		});
    	
    	$.ajax({
    		type: "post",
    		url: "festivalChkDelete.ad",
    		data: {	list : list },
    		dataType: 'json',
			success: function(result) {
				if(result=="success"){
					location.href="feed.ad";
				}else{
					alertify.message("게시글 삭제 실패");
				}
			},
			error: function(request,status,error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
    	});
	}
    
</script>
</body>
</html>
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
    <!-- css -->
    <title>신고관리</title>
    <style type="text/css">
.comments-container {
	margin: 60px auto 15px;
	width: 768px;
}

.comments-container h1 {
	font-size: 36px;
	color: #283035;
	font-weight: 400;
}

.comments-container h1 a {
	font-size: 18px;
	font-weight: 700;
}

.comments-list {
	margin-top: 30px;
	position: relative;
}

/**
 * Lineas / Detalles
 -----------------------*/
.comments-list:before {
	content: '';
	width: 2px;
	height: 100%;
	background: #c7cacb;
	position: absolute;
	left: 32px;
	top: 0;
}

.comments-list:after {
	content: '';
	position: absolute;
	background: #c7cacb;
	bottom: 0;
	left: 27px;
	width: 7px;
	height: 7px;
	border: 3px solid #dee1e3;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

.reply-list:before, .reply-list:after {display: none;}
.reply-list li:before {
	content: '';
	width: 60px;
	height: 2px;
	background: #c7cacb;
	position: absolute;
	top: 25px;
	left: -55px;
}


.comments-list li {
	margin-bottom: 15px;
	display: block;
	position: relative;
}

.comments-list li:after {
	content: '';
	display: block;
	clear: both;
	height: 0;
	width: 0;
}

.reply-list {
	padding-left: 88px;
	clear: both;
	margin-top: 15px;
}
/**
 * Avatar
 ---------------------------*/
.comment-avatar {
	display: flex;
	justify-content: center;
} 
 #p_img {
	margin: auto;
	justify-content: center;
}
#p_img>img {
 	width: 130px !important;
 	height: 130px !important;
 	border-radius: 50%;
 	margin-bottom: 10px;
}
.modal-dialog {
    width: 700px;
    max-width: 700px !important;
}
/**
 * Caja del Comentario
 ---------------------------*/
.comments-list .comment-box {
	width: 680px;
	float: right;
	position: relative;
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	-moz-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	box-shadow: 0 1px 1px rgba(0,0,0,0.15);
}

.comments-list .comment-box:before, .comments-list .comment-box:after {
	content: '';
	height: 0;
	width: 0;
	position: absolute;
	display: block;
	border-width: 10px 12px 10px 0;
	border-style: solid;
	border-color: transparent #FCFCFC;
	top: 8px;
	left: -11px;
}

.comments-list .comment-box:before {
	border-width: 11px 13px 11px 0;
	border-color: transparent rgba(0,0,0,0.05);
	left: -12px;
}

.reply-list .comment-box {
	width: 610px;
}
.comment-box .comment-head {
	background: #FCFCFC;
	padding: 10px 12px;
	border-bottom: 1px solid #E5E5E5;
	overflow: hidden;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
}

.comment-box .comment-head i {
	float: right;
	margin-left: 14px;
	position: relative;
	top: 2px;
	color: #A6A6A6;
	cursor: pointer;
	-webkit-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

.comment-box .comment-head i:hover {
	color: #03658c;
}

.comment-box .comment-name {
	color: #283035;
	font-size: 14px;
	font-weight: 700;
	float: left;
	margin-right: 10px;
}

.comment-box .comment-name a {
	color: #283035;
}

.comment-box .comment-head span {
	float: left;
	color: #999;
	font-size: 13px;
	position: relative;
	top: 1px;
}

.comment-box .comment-content {
	background: #FFF;
	padding: 12px;
	font-size: 15px;
	color: #595959;
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
}

.comment-box .comment-name.by-author, .comment-box .comment-name.by-author a {color: #03658c;}
.comment-box .comment-name.by-author:after {
	content: 'autor';
	background: #03658c;
	color: #FFF;
	font-size: 12px;
	padding: 3px 5px;
	font-weight: 700;
	margin-left: 10px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/** =====================
 * Responsive
 ========================*/
@media only screen and (max-width: 766px) {
	.comments-container {
		width: 480px;
	}

	.comments-list .comment-box {
		width: 390px;
	}

	.reply-list .comment-box {
		width: 320px;
	}
}
    </style>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;신고 관리</h1>
        </div>
        <div class="board-theme">
            <div class="search-btn" id="searchBtn">
                <!-- 검색 시작 -->
                <div class="search-section">
                	<form action="reportSearch.ad" method="get">
                	<input type="hidden" name="currentPage" value="1">
	                    <select name="type" id="searchCate">
	                        <option value="title" ${type == 'title' ? 'selected="selected"': ''}>신고사유</option>
	                        <option value="writer" ${type == 'writer' ? 'selected="selected"': ''}>작성자</option>
	                        <option value="reporter" ${type == 'reporter' ? 'selected="selected"': ''}>신고자</option>
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
                            <th style="width: 5%;"><input type="checkbox" id="chkAll"></th>
                            <th style="width: 5%;">번호</th>
                            <th style="width: 5%;">종류</th>
                            <th style="width: 40%;">신고사유</th>
                            <th style="width: 10%;">작성자</th>
                            <th style="width: 10%;">신고횟수</th>
                            <th style="width: 10%;">신고자</th>
                            <th style="width: 20%;">신고일자</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="r" items="${list}">
                    		<tr>
	                            <td class="table-chk"><input type="checkbox" class="check" name="chk" id=""></td>
	                            <td>
	                            	${r.reportNo}
	                            	<input class="boardNo" value="${r.boardNo}" hidden="hidden">
	                            	<input class="replyNo" value="${r.replyNo}" hidden="hidden">
	                            	<input class="rereplyNo" value="${r.rereplyNo}" hidden="hidden">
	                            </td>
	                            <c:choose>
	                            	<c:when test="${r.replyWriter eq null && r.rereplyWriter eq null}">
	                            		<td>게시글</td>
	                            	</c:when>
	                            	<c:otherwise>
			                            <td>댓글</td>
	                            	</c:otherwise>
	                            </c:choose>
	                            <td>${r.reportReason}</td>
	                            <c:choose>
	                            	<c:when test="${r.replyWriter eq null && r.rereplyWriter eq null}">
	                            		<td>${r.boardWriter}</td>
	                            		<td>${r.boardReport}</td>
	                            	</c:when>
	                            	<c:when test="${r.boardWriter eq null && r.rereplyWriter eq null}">
	                            		<td>${r.replyWriter}</td>
	                            		<td>${r.replyReport}</td>
	                            	</c:when>
	                            	<c:otherwise>
			                            <td>${r.rereplyWriter}</td>
			                            <td>${r.rereplyReport}</td>
	                            	</c:otherwise>
	                            </c:choose>
	                            <td>${r.writer}</td>
	                            <td>${r.createDate}</td>
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
		                			 <li class="page-item"><a class="page-link" href="reportSearch.ad?currentPage=${pi.currentPage - 1}&type=${type}&keyword=${keyword}">&lt;</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
		                    	<c:choose>
		                    		<c:when test="${p eq pi.currentPage}">
		                   				<li class="page-item disabled"><a class="page-link" href="reportSearch.ad?currentPage=${p}&type=${type}&keyword=${keyword}">${p}</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item"><a class="page-link" href="reportSearch.ad?currentPage=${p}&type=${type}&keyword=${keyword}">${p}</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="reportSearch.ad?currentPage=${pi.currentPage + 1}&type=${type}&keyword=${keyword}">&gt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
                		</c:when>
                		
                		<c:otherwise>
		                	<c:choose>
		                		<c:when test="${pi.currentPage eq 1}">
		                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			 <li class="page-item"><a class="page-link" href="report.ad?currentPage=${pi.currentPage - 1 }">&lt;</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
		                    	<c:choose>
		                    		<c:when test="${p eq pi.currentPage}">
		                   				<li class="page-item disabled"><a class="page-link" href="report.ad?currentPage=${p}">${p}</a></li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item"><a class="page-link" href="report.ad?currentPage=${p}">${p}</a></li>
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
		                    		<li class="page-item"><a class="page-link" href="report.ad?currentPage=${pi.currentPage + 1}">&gt;</a></li>
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
					<h2 class="modal-title" id="exampleModalLabel">댓글</h2>
<!-- 					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
					<button type="button" class="close" data-dismiss="modal" style="margin-right: 10px;">X</button>
				</div>
				<div class="modal-body" style="height: 400px; overflow: hidden; background: #dee1e3; width: 100%;">
<!-- 					<div class="comment-main-level"> -->
<!-- 						Avatar -->
<!-- 						<div class="comment-avatar"><img src="resources/images/blackperson.png" alt="" width="100px;"></div> -->
<!-- 						Contenedor del Comentario -->
<!-- 						<div class="comment-box"> -->
<!-- 							<div class="comment-head"> -->
<!-- 								<h6 class="comment-name">Agustin Ortiz</h6> -->
<!-- 								<span style="position: relative; top: 10px;">hace 20 minutos</span> -->
<!-- 							</div> -->
<!-- 							<div class="comment-content"> -->
<!-- 								Lorem ipsum dolor sit amet, consectetur adipisicing elit. Velit omnis animi et iure laudantium vitae, praesentium optio, sapiente distinctio illo? -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
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
    
    //클릭 시 상세페이지 이동
    $(function () {
		$(".theme-table>tbody>tr>td").not(":first-child").click(function () {
			var bno = $(this).parent().children().eq(1).children("input").eq(0).val();
			var rno = $(this).parent().children().eq(1).children("input").eq(1).val();
			var rrno = $(this).parent().children().eq(1).children("input").eq(2).val();
			
			//게시판
			if (rno == 0 && rrno == 0) {
				if (confirm("게시물로 이동하시겠습니까?")) {
					$.ajax({
			    		type: "get",
			    		url: "boardChk.ad",
			    		data: {	boardNo : bno },
						success: function(category) {
							if(category==4){
								location.href="feed.bo";
							}else if (category==5) {
								location.href="togetherDetail.bo?boardNo="+bno;
							}else if (category==6) {
								location.href="detail.sc";
							}else{
								alertify.message("게시물 이동 실패");
							}
						},
						error: function(request,status,error) {
							console.log("통신오류");
						}
					});
				}
				
			//댓글
			}else if (bno == 0 && rrno == 0) {
				$.ajax({
		    		type: "get",
		    		url: "replyChk.ad",
		    		data: {	replyNo : rno },
		    		dataType: "json",
					success: function(reply) {
						var str = "";
							str += '<div class="comment-main-level">' 
								+ '<div class="comment-avatar" id="p_img">';
								if (reply.profileImg == null) {
									str += '<img src="resources/images/blackperson.png" style="border-radius: 50%;">';
								}else {
									str += '<img src="'+reply.profileImg+'" style="border-radius: 50%;">';
								}
							str += '</div>'
								+ '<div class="comment-box">'
								+ '<div class="comment-head">'
								+ '<h6 class="comment-name">'+reply.replyWriter+'</h6>'
								+ '<span style="position: relative; top: 10px;">'+reply.createDate+'</span>'
								+ '</div>' 
								+ '<div class="comment-content">' 
								+ reply.content
								+ '</div>'
								+ '</div>'
								+ '</div>';
								
						$(".modal-body").html(str);
						$("#exampleModal").modal("show");			
					},
					error: function(request,status,error) {
						console.log(error);
					}
		    	});
				
			//대댓글
			}else {
				$.ajax({
		    		type: "get",
		    		url: "rereplyChk.ad",
		    		data: {	replyNo : rrno },
		    		dataType: "json",
					success: function(reply) {
						var str = "";
							str += '<div class="comment-main-level">' 
								+ '<div class="comment-avatar" id="p_img">'
								+ '<img src="'+reply.profileImg+'" style="border-radius: 50%;">'
								+ '</div>'
								+ '<div class="comment-box">'
								+ '<div class="comment-head">'
								+ '<h6 class="comment-name">'+reply.replyWriter+'</h6>'
								+ '<span style="position: relative; top: 10px;">'+reply.createDate+'</span>'
								+ '</div>' 
								+ '<div class="comment-content">' 
								+ reply.content
								+ '</div>'
								+ '</div>'
								+ '</div>';
								
						$(".modal-body").html(str);
						$("#exampleModal").modal("show");			
					},
					error: function(request,status,error) {
						console.log(error);
					}
		    	});
			}
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
    		url: "reportChkDelete.ad",
    		data: {	list : list },
    		dataType: 'json',
			success: function(result) {
				if(result=="success"){
					location.href="report.ad";
				}else{
					alertify.message("신고내역 삭제 실패");
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
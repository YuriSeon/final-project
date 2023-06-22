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
    <!-- CKEditor -->
    <script src="resources/js/ckeditor/ckeditor.js"></script>
    <title>문의관리-Q&amp;A</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;Q&amp;A 답변
                <button class="btn btn-info" onclick="history.back();">취소</button>
                <button class="btn btn-danger" onclick="noticeDelete();">삭제</button>
            </h1>
        </div>
        <form class="notice-enroll-form" action="faqUpdate.ad" method="post" enctype="multipart/form-data">
        	<input type="text" name="serviceNo" value="${n.serviceNo}" hidden>
        	<input type="text" name="category" value="2" hidden>
            <div class="enroll-container">
                <div class="title-area">
                    <label for="title" class="">제목</label>
                    <input type="text" name="serviceTitle" id="title" class="form-control input-lg" style="width: 30%" value="${n.serviceTitle}" readonly="readonly">
                </div>
                <div class="writer-area">
                    <label for="writer" class="">작성자</label>
                    <input type="text" name="writer" id="writer"  class="form-control input-lg" value="${n.writer}" readonly="readonly">
                </div>
                <div class="writer-area">
                    <label for="writer" class="">등록일</label>
                    <input type="text" name="writer" id="writer"  class="form-control input-lg" value="${n.createDate}" readonly="readonly">
                </div>
                <div class="contents-area">
                    <label for="editor" class="">내용</label>
                    <div class="qna-question" style="margin-left: 0px;">
                        ${n.serviceContent}
                    </div>
                   	<div class="question-file">
                   	<label for="editor" class="">첨부파일</label>
                   		<c:forEach var="alist" items="${aList}">
                   			<a href="${alist.filePath}${alist.changeName}" download="${alist.originName}">
								${alist.originName}
                   			</a>
                   		</c:forEach>
                   	</div>
                   	<label for="editor" class="">답변</label>
                   	<div class="qna-answer-enroll">
                   		<textarea id="answer" title="답변작성" placeholder="답변작성"></textarea> <button type="button" class="btn btn-secondary" onclick="qnaReplyInsert();">등록</button>
                   	</div>
					<div class="qna-answer">
	                   	<ul>
	                   	</ul>
                   	</div>                   		
                </div>
            </div>
        </form><!-- notice-enroll-form end -->
    </div><!-- container-fluid end -->
</div>

<script>
    
    //폼 서브밋
	function enrollSubmit() {
		$(".notice-enroll-form").submit();
	}
    
    //공지 삭제
	function noticeDelete() {
		
    	$.ajax({
    		type: "post",
    		url: "qnaDelete.ad",
    		data: {	serviceNo : "${n.serviceNo}" },
			success: function(result) {
				if(result=="success"){
					location.href="qna.ad";
				}else{
					alertify.message("Q&A 삭제 실패");
				}
			},
			error: function(result) {
				console.log("통신실패");
			}
    	});
	}
    
    //답변 불러오기
    $(function() {
		qnaReplyList();
	});
	
    //답변 목록 조회
	function qnaReplyList() {
		$.ajax({
			url:"qnaReplyList.ad",
			data:{
				serviceNo : "${n.serviceNo}"
			},
			success: function(list) {
				var str = "";
				if (list.length == 0) {
					str +="<li>"
						+ "<div class='reply-content' style='text-align:center;'>"
	       				+ "답변을 입력해 주세요."
	       				+ "</div>";
				}else{
					for(var i in list){
						str +="<li>"
							+ "<input type='text' value='"+list[i].replyNo+"' hidden>"					
	           				+ "<div class='date'>"
	       					+ "<em class='name'>"+list[i].replyWriter+"</em>&nbsp;|&nbsp;"
	       					+ "<span>"+list[i].createDate+"</span>"
		       				+ "</div>"
		       				+ "<div class='reply-content'>"
		       				+ list[i].content
		       				+ "</div>"
		       				+ "<div class='reply-btn'>"
	           				+ "<button type='button' class='btn btn-danger' id='replyDelete'>삭제</button>"
	           				+ "<button type='button' class='btn btn-info' id='replyEditForm'>수정</button>"
	       					+ "</div>"
	       					+ "</li>";
					}
				}
				$(".qna-answer>ul").html(str);
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}
	
    //답변 등록
	function qnaReplyInsert() {
		$.ajax({
			url:"qnaReplyInsert.ad",
			type: "POST",
			data:{
				content : $("#answer").val(),
				refQno : "${n.serviceNo}",
				replyWriter : "${loginUser.nickname}" 
			},
			success: function(result) {
				if(result=="success"){
					alertify.message("답변 등록 성공");
					qnaReplyList();
					$("#answer").val("");
				}else{
					alertify.message("답변 등록 실패");
				}
			},
			error: function() {
				console.log("통신실패");
			}
		});
	}

	//답변 수정 폼 변경
	$(".qna-answer").on("click", ".btn-info", function() {
	    var rno = $(this).closest("li").children().first().val();
	    var $content = $(this).closest("li").children(".reply-content");
	    var htmls = "";
	    
	    $(this).closest(".reply-btn").css("display","none");
	    
	    htmls += "<div class='reply-edit-btn' style='display:flex'>"
	    htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3" style= "resize:none">';
	    htmls += $(this).closest("li").children(".reply-content").text();
	    htmls += '</textarea>';
	   	htmls += "<button type='button' class='btn btn-info' id='replyEdit' style='margin-left:5px;'>등록</button>"
	   	htmls += "<button type='button' class='btn btn-danger' id='editCancle' style='margin-left:5px;'>취소</button>"
	   	htmls += "</div>"
	   	
	    $content.replaceWith(htmls);
	    
  	});
    
	//답변 수정
	$(".qna-answer").on("click", "#replyEdit", function() {
		
		var replyNo = $(this).closest("li").children().first().val();
		var editContent = $(this).parent().children("textarea").val();
		console.log(editContent);
		
		$.ajax({
			url:"qnaReplyUpdate.ad",
			type: "POST",
			data:{
				replyNo : replyNo,
				content : editContent
			},
			success: function(result) {
				if(result=="success"){
					alertify.message("답변 수정 성공");
					qnaReplyList();
				}else{
					alertify.message("답변 수정 실패");
				}
			},
			error: function() {
				console.log("통신실패");
			}
		});
	});
	
	//답변 수정 취소
	$(".qna-answer").on("click", "#editCancle", function() {
		qnaReplyList();
	});
    
	//답변 삭제
	$(".qna-answer").on("click", "#replyDelete", function() {
		
		var replyNo = $(this).closest("li").children().first().val();
		
		$.ajax({
			url:"qnaReplyDelete.ad",
			type: "POST",
			data:{
				replyNo : replyNo,
			},
			success: function(result) {
				if(result=="success"){
					alertify.message("답변 삭제 성공");
					qnaReplyList();
				}else{
					alertify.message("답변 삭제 실패");
				}
			},
			error: function() {
				console.log("통신실패");
			}
		});
		
	});
    
</script>
</body>
</html>
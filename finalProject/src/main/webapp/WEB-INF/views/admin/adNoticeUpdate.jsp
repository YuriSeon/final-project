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
    <title>문의관리-공지사항</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;공지사항 수정
                <button class="btn btn-info" onclick="history.back();">취소</button>
                <button class="btn btn-danger" onclick="noticeDelete();">삭제</button>
                <button class="btn btn-success" onclick="enrollSubmit();">저장</button>
            </h1>
        </div>
        <form class="notice-enroll-form" action="noticeUpdate.ad" method="post" enctype="multipart/form-data">
        	<input type="text" name="serviceNo" value="${n.serviceNo}" hidden>
        	<input type="text" name="category" value="1" hidden>
            <div class="enroll-container">
                <div class="title-area">
                    <label for="title" class="">제목</label>
                    <input type="text" name="serviceTitle" id="title" class="form-control input-lg" style="width: 30%" value="${n.serviceTitle}">
                </div>
                <div class="writer-area">
                    <label for="writer" class="">작성자</label>
                    <input type="text" name="writer" id="writer"  class="form-control input-lg" value="${loginUser.nickname}" readonly="readonly">
                </div>
                <div class="file-area bs3-primary">
                    <input type="file" name="upfile" id="upfile" class="upload-hidden">
                    <label for="upfile">첨부파일</label>
                    <input class="upload-name form-control input-lg" value="파일선택" disabled>
                    <button type="button" id="selectFile" onclick="$('#upfile').trigger('click');">파일 선택</button>
                    
                    <c:if test="${not empty a.originName}">
                    	<div id="currentFileBox" style="display: inline;">
		                    <label style="margin-left: 20px;">현재 업로드된 파일 </label> 
		                    <a href="${a.filePath}${a.changeName}" download="${a.originName}">
		                    	<input class="upload-name form-control input-lg" id="currentFile" value="${a.originName}" style="margin-left: 20px; width: 10%;" readonly="readonly">
		                    </a>
		                    <button type="button" onclick="fileDelete();" class="btn btn-danger" style="height: 35px;">파일 삭제</button>
		                    <input type="hidden" value="${a.originName}" name="originName">
		                    <input type="hidden" value="${a.changeName}" name="changeName">
	                    </div>
                    </c:if>
                    
                </div>
                <div class="contents-area">
                    <label for="editor" class="">내용</label>
                    <div class="" style="margin-left: 0px;">
                        <textarea name="serviceContent" class="form-control" id="editor">${n.serviceContent}</textarea>
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
    
	// 텍스트 에디터
    CKEDITOR.replace(editor, {
        filebrowserUploadUrl: '/common/ckeditor/fileUpload',
        font_names:
            '맑은 고딕/Malgun Gothic;굴림/Gulim;돋움/Dotum;바탕/Batang;궁서/Gungsuh;Arial/Arial;Comic Sans MS/Comic Sans MS;Courier New/Courier New;Georgia/Georgia;Lucida Sans Unicode/Lucida Sans Unicode;Tahoma/Tahoma;Times New Roman/Times New Roman;MS Mincho/MS Mincho;Trebuchet MS/Trebuchet MS;Verdana/Verdana',
        font_defaultLabel: '맑은 고딕/Malgun Gothic',
        fontSize_defaultLabel: '12',
        skin: 'office2013',
        language: 'ko',
        width: '80%',
        height: '50vh',
        filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do',
    });

    //파일 input
    $(function(){
        var fileTarget = $('.file-area .upload-hidden');

        fileTarget.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }

            $(this).siblings('.upload-name').val(filename);
        });
    });
    
    //공지 삭제
	function noticeDelete() {
		
    	$.ajax({
    		type: "post",
    		url: "noticeDelete.ad",
    		data: {	serviceNo : "${n.serviceNo}" },
			success: function(result) {
				if(result=="success"){
					location.href="notice.ad";
				}else{
					alertify.message("공지사항 삭제 실패");
				}
			},
			error: function(result) {
				console.log("통신실패");
			}
    	});
	}
    
    //파일 삭제
    function fileDelete() {
		
    	$.ajax({
    		type: "post",
    		url: "noticeFileDelete.ad",
    		data: {
    			fileNo : "${a.fileNo}",
    			boardNo : "${a.boardNo}",
    			originName : "${a.originName}",
    			changeName : "${a.changeName}",
    			filePath : "${a.filePath}"
    		},
			success: function(result) {
				if(result=="success"){
					alertify.message("첨부파일 삭제 성공");
					$("#currentFileBox").remove();
				}else{
					alertify.message("첨부파일 삭제 실패");
				}
			},
			error: function(result) {
				console.log("통신실패");
			}
    	});
	}
    
</script>
</body>
</html>
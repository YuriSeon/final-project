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
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css?v=1?after">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>마이페이지 정보 수정/신규 요청 수정</title>
    <style type="text/css">
    	#QNAcontents{
    		min-height: 70vh;
    	}
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
	        <h2>정보 수정/신규 요청 수정</h2>
	    </div>
	
	    <div class="wrap_contView clfix">
	
			<!-- 요청등록 -->
	        <div class="box_leftType1">
	            <div class="write_board1">
	            
					<form name="tform" id="tform" action="myQnaUpdate.me" method="post" enctype="multipart/form-data">           
	                	<h3 class="tit_write">제목 <em>(필수)</em></h3>
						<input type="text" class="inp_write" id="title" name="serviceTitle" title="제목" value="${fn:split(n.serviceTitle,']')[1]}">
<%-- 						<input type="text" class="inp_write" id="title" name="serviceTitle" title="제목" value="${n.serviceTitle}"> --%>
						<h3 class="tit_write">내용 <em>(필수)</em></h3>
						<textarea name="serviceContent" id="desc" class="inp_textarea" title="내용">${n.serviceContent}</textarea>
						<input type="hidden" name="category" id="fileuploadlist" value="3">
						<input type="hidden" name="writer" value="${loginUser.nickname}">
						<input type="hidden" name="serviceNo" value="${n.serviceNo}">
					</form>
	
					<h3 class="tit_write">파일 첨부</h3>
					<div class="file_area">
						
						<div class="file_inr clfix" id="webfile" style="">
							<input type="file" name="files" id="files" class="hidden" onchange="fileChange(this)">
							<label for="files" class="btn_filesearch"><span>파일첨부</span></label>
							<span class="txt">* 파일첨부는 최대 3개 까지 가능합니다.</span>
						</div>
						
						<div id="addfile">
<!-- 							<div class="uploadfile" > -->
<!-- 								<input type="text" name="filename1" id="filename1" value="next.png" title="첨부된 파일" disabled="disabled"> -->
<!-- 								<button type="button" class="btn_file_del"> -->
<!-- 									<span>첨부 파일 삭제</span> -->
<!-- 								</button> -->
<!-- 								<input type="hidden" value="bcf3955b-b26d-4a4a-b4c2-1a5da3ff2cf2" name="fileid" id="fileid"> -->
<!-- 								<input type="hidden" value="/bc/b2/4a/b4/1a/bcf3955b-b26d-4a4a-b4c2-1a5da3ff2cf2.png" name="fileidfull" id="fileidfull"> -->
<!-- 							</div> -->
							<c:if test="${a != null}">
								<c:forEach var="a" items="${a}">
									<div class="uploadfile">
										<input type="text" name="filename0" id="filename0" value="${a.originName}" title="첨부된 파일" disabled="disabled">
										<button type="button" class="btn_file_del">
											<span>첨부 파일 삭제</span>
										</button>
									</div>
								</c:forEach>
							</c:if>
						</div>
					</div>
	            </div>
	            <div class="btn_center">
	                <a href="javascript:qnaSubmit();" class="btn_greyL">수정</a>
	            </div>
	        </div>
	        <!-- //요청등록 -->    

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
	                    <li id="stampEnabled"><a href="myFoot.me" id="stamp">발도장</a></li>
	                </ul>
	            </div>
	            <!-- //snb -->
	
	        </div>
	
	    </div>
	
	</div>
    <script>
    	
		const dataTransfer = new DataTransfer();
		
		// div 요소 선택
		var divElement = document.getElementById('addfile');

		// 자식 개수 세기
		var count = divElement.childElementCount;
		
		//파일 3개 추가시 버튼 막기
		$(".btn_filesearch").click(function() {
			if (count>2) {
				alert("파일첨부는 3개까지 가능합니다.");
				return false;
			}
		});
		
		//파일 배열에 추가
		$("#files").change(function(){
			if (count<3) {
				let fileArr = document.getElementById("files").files;
				if(fileArr != null && fileArr.length>0){
					// =====DataTransfer 파일 관리========
					for(var i=0; i<fileArr.length; i++){
						dataTransfer.items.add(fileArr[i]);
					}
					document.getElementById("files").files = dataTransfer.files;
					
					// ==========================================
				}
// 				count+=1;
				count = divElement.childElementCount;
			}
		});
    
    	//파일 추가시 div 추가
    	function fileChange(input) {
    		if (count<3) {
	    		var file = input.files[0];
	    		var div = $('<div>').addClass('uploadfile');
	    		var input = $('<input>').attr({
	    			type: 'text',
	    		    name: 'filename'+count,
	    		    id: 'filename'+count,
	    		    value: file.name,
	    		    title: '첨부된 파일',
	    			disabled: 'disabled'
	    		});
	    		var button = $('<button>').attr('type', 'button').addClass('btn_file_del');
	    		var span = $('<span>').text('첨부 파일 삭제');
	    		  
	    		button.append(span);
	    		div.append(input, button);
	    	    $('#addfile').append(div);
	    	    
			}
		}
    	
    	//추가된 파일 삭제
    	$(function() {
			$(document).on('click', '#addfile>.uploadfile>button', function() {
				
				const $divs = $('.uploadfile'); 
				const index = $divs.index($(this).parent()); 
				
				var fileId = $(this).siblings().eq(0).prop("id");
				var fileName = $(this).prev().val();
				
				$(this).parent().remove();
				
				const files = Array.from(dataTransfer.files);
				var fileArr = document.getElementById("files").files;
				
				dataTransfer.items.remove(index);
				fileArr = dataTransfer.files;
// 				count--; 
				count = divElement.childElementCount;
			});
		});
    	
    	//요청 수정
    	function qnaSubmit() {

    		var fileArr = document.getElementById("files").files;
	      	var formData = new FormData();
	      	var result1 = 0;
	      	var result2 = 1;
	      	var parentDiv = $("#addfile");
	      	var fileInput = parentDiv.find("input");
	      	var values = []; 
	      	
	      	fileInput.each(function() {
				var value = $(this).val();
				values.push(value);
			});
	      	
	      	//파일이 있을때
	      	if (values.length>0) {
	      		$.ajax({
	   		        url: "myQnaUpdate.me",
	   		        type: "POST",
	   		        data: {
	   		        	serviceNo : $("input[name=serviceNo]").val(),
	   		        	category : $("input[name=category]").val(),
	   		        	serviceTitle : "[요청]"+$("input[name=serviceTitle]").val(),
	   		        	serviceContent : $("textarea[name=serviceContent]").val(),
	   		        	writer : $("input[name=writer]").val(),
	   		        	fileNames : values
	   		        	},
	   		        success: function(response) {
	   		        	if (response == 1) {
							result1 = 1;
						}
	   		        	console.log("등록 성공");
	   		        	if (fileArr != null && fileArr.length > 0) {
	   		   		    	for (var i = 0; i < fileArr.length; i++) {
	   			   		      	formData.append("file", fileArr[i]);
		   		   		    	console.log(formData);
	   		   		    	}
	   		   		    	formData.append("serviceNo", $("input[name=serviceNo]").val());
	   		   		    	$.ajax({
	   			   		        url: "myQnaFileUpdate.me",
	   			   		        type: "POST",
	   			   		        enctype: 'multipart/form-data',
	   			   		        data: formData,
	   			   		        processData: false,
	   			   		        contentType: false,
	   			   		        success: function(response) {
	   			   		        	if (response == 1) {
	   									result1 = 1;
	   								}
	   			   		        	console.log("파일 등록 성공");
	   			   		        },
	   			   		        error: function(response) {
	   			   		        	if (response == 0) {
	   									result1 = 0;
	   								}
	   			   		        	console.log("파일 등록 실패");
	   			   		        }
	   			   		    });
	   		   		 	}
	   		        	if (result1*result2 == 1) {
	   						location.href = "myRequest.me";
	   					}
	   		        },
	   		        error: function(response,error) {
	   		        	if (response == 0) {
							result1 = 0;
						}
	   		        	console.log("등록 실패");
	   		        	console.log(error);
	   		        }
	   		    });
	      	//파일이 없을때
			}else{
		      	$.ajax({
	   		        url: "myQnaUpdateNf.me",
	   		        type: "POST",
	   		        data: {
	   		        	serviceNo : $("input[name=serviceNo]").val(),
	   		        	category : $("input[name=category]").val(),
	   		        	serviceTitle : "[요청]"+$("input[name=serviceTitle]").val(),
	   		        	serviceContent : $("textarea[name=serviceContent]").val(),
	   		        	writer : $("input[name=writer]").val(),
	   		        	},
	   		        success: function(response) {
	   		        	console.log("등록 성공");
   						location.href = "myRequest.me";
	   		        },
	   		        error: function(response) {
	   		        	console.log("등록 실패");
	   		        }
	   		    });
			}
		}
    	
    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
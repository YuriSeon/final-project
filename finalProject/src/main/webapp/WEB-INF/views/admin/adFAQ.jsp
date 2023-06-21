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
    <title>문의관리-FAQ</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;문의 관리 - FAQ</h1>
        </div>
        <div class="board-theme">
            <div class="search-btn" id="searchBtn">
                <!-- 검색 시작 -->
                <div class="search-section">
                	<form action="faqSearch.ad" method="get">
                	<input type="hidden" name="currentPage" value="1">
	                    <select name="type" id="searchCate">
	                        <option value="title" ${type == 'title' ? 'selected="selected"': ''}>제목</option>
	                        <option value="content" ${type == 'content' ? 'selected="selected"': ''}>내용</option>
	                    </select>
	                    <input type="text" name="keyword" id="searchBar">
	                    <button class="btn btn-default" id="searchBtn">검색</button>
                	</form>
                </div>
                <!-- 검색 끝 -->
                <!-- 버튼 시작 -->
                <div>
                    <button class="btn btn-danger" onclick="chkDelete();">선택삭제</button>
                    <button class="btn btn-info" onclick="location.href='faqEnroll.ad'">게시물 등록</button>
                </div>
                <!-- 버튼 끝 -->
            </div>
            <!-- 결과 테이블 시작  -->
            <div class="theme-board">
                <table class="theme-table" border="1">
                    <thead>
                        <tr>
                            <th style="width: 60px;"><input type="checkbox" id="chkAll"></th>
                            <th style="width: 60px">번호</th>
                            <th >제목</th>
                            <th style="width: 200px;">작성자</th>
                            <th style="width: 300px;">작성시각</th>
                            <th style="width: 100px;">조회수</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="n" items="${list}">
                    		<tr>
	                            <td class="table-chk"><input type="checkbox" class="check" name="chk" id=""></td>
	                            <td>${n.serviceNo}</td>
	                            <td>${n.serviceTitle}</td>
	                            <td>${n.writer}</td>
	                            <td>${n.createDate}</td>
	                            <td>${n.count}</td>
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
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="faq.ad?currentPage=${pi.currentPage - 1 }">&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
                    	<c:choose>
                    		<c:when test="${p eq pi.currentPage}">
                   				<li class="page-item disabled"><a class="page-link" href="faq.ad?currentPage=${p}">${p}</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="faq.ad?currentPage=${p}">${p}</a></li>
	                		</c:otherwise>
                    	</c:choose>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="faq.ad?currentPage=${pi.currentPage + 1}">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div> 
            <!-- 페이징 끝 -->
        </div>
    </div><!-- container-fluid -->
</div>

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
			var bno = $(this).parent().children().eq(1).text();
			location.href = 'faqSelect.ad?serviceNo='+bno;
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
    		url: "faqChkDelete.ad",
    		data: {	list : list },
    		dataType: 'json',
			success: function(result) {
				if(result=="success"){
					location.href="faq.ad";
				}else{
					alertify.message("공지사항 삭제 실패");
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
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
    <title>회원 관리</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper" style="background-color: #EEEEEE;">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;회원 관리</h1>
        </div>
        <div class="board-theme">
            <div class="search-btn" id="searchBtn">
                <!-- 검색 시작 -->
                <div class="search-section">
                	<form action="memberSearch.ad" method="get">
                	<input type="hidden" name="currentPage" value="1">
	                    <select name="type" id="searchCate">
	                        <option value="title" ${type == 'title' ? 'selected="selected"': ''}>아이디</option>
	                        <option value="writer" ${type == 'writer' ? 'selected="selected"': ''}>이름</option>
	                        <option value="status" ${type == 'status' ? 'selected="selected"': ''}>상태</option>
	                        <option value="certification" ${type == 'certification' ? 'selected="selected"': ''}>인증상태</option>
	                    </select>
	                    <input type="text" name="keyword" id="searchBar">
	                    <button class="btn btn-default" id="searchBtn">검색</button>
                	</form>
                </div>
                <!-- 검색 끝 -->
                <!-- 버튼 시작 -->
                <div>
                    <button class="btn btn-danger" onclick="chkDelete();">탈퇴 처리</button>
                    <button class="btn btn-info" onclick="location.href='memberExcel.ad';">정보 받기</button>
<!--                     <button class="btn btn-info">쪽지 발송</button> -->
                    <button class="btn btn-info">메일 발송</button>
                </div>
                <!-- 버튼 끝 -->
            </div>
            <!-- 결과 테이블 시작  -->
            <div class="member-board theme-board">
                <table class="member-table theme-table" border="1">
                    <thead>
                        <tr>
                            <th style="width: 5%;"><input type="checkbox" id="chkAll"></th>
                            <th style="width: 5%;">번호</th>
                            <th style="width: ;">아이디</th>
                            <th style="width: ;">이름</th>
                            <th style="width: 10%;">상태</th>
                            <th style="width: 20%;">가입일</th>
                            <th style="width: 5%;">인증상태</th>
                            <th style="width: ;">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<c:forEach var="m" items="${list}">
                    		<tr>
	                            <td class="table-chk"><input type="checkbox" class="check" name="chk" id=""></td>
	                            <td>${m.userNo}</td>
	                            <td>${m.userId}</td>
	                            <td>${m.userName}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${m.status == 'Y' }">
	                            			<b style="color: green;">정상</b>
	                            		</c:when>
	                            		<c:otherwise>
	                            			<b style="color: red;">탈퇴</b>
	                            		</c:otherwise>
	                            	</c:choose>
	                            </td>
	                            <td>${m.enrollDate}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${m.certification == 1}">
	                            			카카오인증
	                            		</c:when>
	                            		<c:when test="${m.certification == 2}">
	                            			네이버인증
	                            		</c:when>
	                            		<c:otherwise>
	                            			미인증
	                            		</c:otherwise>
	                            	</c:choose>
	       	                    </td>
	                            <td><button class="btn btn-default">관리</button></td>
                        	</tr>
                    	</c:forEach>
<!--                         <tr> -->
<!--                             <td><input type="checkbox" name="chk" id=""></th> -->
<!--                             <td>1</td> -->
<!--                             <td>user01</td> -->
<!--                             <td>김일호</td> -->
<!--                             <td>정상</td> -->
<!--                             <td>2023.06.03</td> -->
<!--                             <td>인증</td> -->
<!--                             <td><button class="btn btn-default">관리</button></td> -->
<!--                         </tr> -->
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
                			 <li class="page-item"><a class="page-link" href="member.ad?currentPage=${pi.currentPage - 1 }">&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
                    	<c:choose>
                    		<c:when test="${p eq pi.currentPage}">
                   				<li class="page-item disabled"><a class="page-link" href="member.ad?currentPage=${p}">${p}</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item"><a class="page-link" href="member.ad?currentPage=${p}">${p}</a></li>
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
                    		<li class="page-item"><a class="page-link" href="member.ad?currentPage=${pi.currentPage + 1}">&gt;</a></li>
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
    
    //체크박스 선택한 항목 삭제
    function chkDelete() {
    	var list = [];
    	
    	$(".check:checked").each(function() {
			var chk = $(this).closest("tr").find("td:eq(1)").text();
			list.push(chk);
		});
    	
    	$.ajax({
    		type: "post",
    		url: "memberChkDelete.ad",
    		data: {	list : list },
    		dataType: 'json',
			success: function(result) {
				if(result=="success"){
					location.href="member.ad";
				}else{
					alertify.message("회원 탈퇴 실패");
				}
			},
			error: function(request,status,error) {
				console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
			}
    	});
	}
    
    //관리페이지 이동
    $(function () {
		$(".member-table>tbody>tr>td>button").click(function () {
			var bno = $(this).closest("tr").children().eq(1).text();
			location.href = 'goMemberUpdate.ad?userNo='+bno;
		});
	});
    
</script>
</body>
</html>
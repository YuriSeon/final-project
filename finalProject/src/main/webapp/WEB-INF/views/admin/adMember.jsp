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
                    <select name="searchCate" id="searchCate">
                        <option value="title">아이디</option>
                        <option value="writer">이름</option>
                        <option value="status">상태</option>
                        <option value="certification">인증상태</option>
                    </select>
                    <input type="text" name="searchBar" id="searchBar">
                    <button class="btn btn-default" id="searchBtn">검색</button>
                </div>
                <!-- 검색 끝 -->
                <!-- 버튼 시작 -->
                <div>
                    <button class="btn btn-danger">탈퇴 처리</button>
                    <button class="btn btn-info">정보 받기</button>
                    <button class="btn btn-info">쪽지 발송</button>
                    <button class="btn btn-info">메일 발송</button>
                </div>
                <!-- 버튼 끝 -->
            </div>
            <!-- 결과 테이블 시작  -->
            <div class="member-board theme-board">
                <table class="member-table theme-table" border="1">
                    <thead>
                        <tr>
                            <th><input type="checkbox" id="chkAll"></th>
                            <th style="width: 60px">번호</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>상태</th>
                            <th>가입일</th>
                            <th>인증상태</th>
                            <th>관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>user01</td>
                            <td>김일호</td>
                            <td>정상</td>
                            <td>2023.06.03</td>
                            <td>인증</td>
                            <td><button class="btn btn-default">관리</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>user01</td>
                            <td>김일호</td>
                            <td>정상</td>
                            <td>2023.06.03</td>
                            <td>인증</td>
                            <td><button class="btn btn-default">관리</button></td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="chk" id=""></th>
                            <td>1</td>
                            <td>user01</td>
                            <td>김일호</td>
                            <td>정상</td>
                            <td>2023.06.03</td>
                            <td>인증</td>
                            <td><button class="btn btn-default">관리</button></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 결과 테이블 끝 -->
            <!-- 페이징 시작 -->
            <div id="pagingArea" align="center">
                <!-- <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul> -->
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>

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
    
    $(function () {
		$(".member-table>tbody>tr>td>button").click(function () {
			var bno = $(this).text();
			location.href = 'adMemberUpdate.ad';
		});
	});
    
</script>
</body>
</html>
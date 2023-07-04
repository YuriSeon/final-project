<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#ser_Title{
			height: 135px;
			text-align: center;
			background-color: rgb(173, 173, 173);
		}
		#ser_Title h2{
			color: white;
			font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,맑은 고딕,helvetica,Apple SD Gothic Neo,sans-serif;
    		font-weight: 800;
    		line-height: 4;
		}
		.notice{
			margin: auto;
			width: 1100px;
			color: rgb(46, 46, 46);
		}
		#notice_Title{
			padding: 40px 0px 20px 18px;
		}
		#notice_Con{
			padding: 0px 0px 20px 18px;
		}
		#notice_Con table{
			text-align: center;
		}
		#notice_Con table tr{
			height: 40px;
			border-top: 1px solid rgb(210, 210, 210);
			border-bottom: 1px solid rgb(210, 210, 210);
		}
		.notice_tr:hover{
			background-color: #fafafa;
			cursor: pointer;
		}
		#notice_page{
			text-align: center;
			padding-bottom: 40px;
		}
		#notice_page button, #qnaGo button{
			background-color: #f8f8f8;
			border: 1px solid rgb(202, 202, 202);
			border-radius: 3px;
		}
		
		#no_notice{
			cursor: default;
		}
		#no_notice:hover{
			background-color: white;
		}
		
		#qnaGo{
			margin: auto;
			width: 1110px;
		}
		#qnaGo button{
			position: relative;
			top: -30px;
			left: 930px;
		}
	</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div class="wrap_ser">
		
		<div id="ser_Title"><h2>여행가보자고 고객센터</h2></div>
		
		<div class="notice">
			<div id="notice_Title"><h5>공지사항</h5></div>
			<div id="notice_Con">
				<table>
					<tr style="background-color: #ececec;">
						<th style="width: 110px;">번호</th>
						<th style="width: 480px;">제목</th>
						<th style="width: 120px;">작성자</th>
						<th style="width: 250px;">작성날짜</th>
						<th style="width: 110px;">조회수</th>
					</tr>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="s" items="${list }">
								<tr class="notice_tr" onclick="location.href='notiDetail.se?boardNo=${s.serviceNo}'">
									<td>${s.serviceNo }</td>
									<td>${s.serviceTitle }</td>
									<td>${s.writer }</td>
									<td>${s.createDate }</td>
									<td>${s.count }</td>
								</tr>					
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr class="notice_tr">
								<td colspan="4" id="no_notice">게시된 공지사항이 없습니다.</td>
							</tr>	
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div id="notice_page">
               	<c:choose>
                	<c:when test="${pi.currentPage eq 1 }">
                    	<button onclick="alert('첫 페이지입니다.')">이전</button>
               		</c:when>
               		<c:otherwise>
              			<button onclick="location.href='service.se?currentPage=${pi.currentPage-1 }'">이전</button>
               		</c:otherwise>
               	</c:choose>
			
				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
					<button onclick="location.href='service.se?currentPage=${p}'">${p }</button>
		        </c:forEach>
				
				<c:choose>
                	<c:when test="${pi.currentPage eq pi.maxPage }">
                    	<button onclick="alert('마지막 페이지입니다.')">다음</button>
               		</c:when>
               		<c:otherwise>
              			<button onclick="location.href='service.se?currentPage=${pi.currentPage+1 }'">다음</button>
               		</c:otherwise>
               	</c:choose>
			</div>
		</div>
		<div id="qnaGo">
			<c:choose>
				<c:when test="${empty loginUser }">
					<button type="button" onclick="qnaLogin()">1:1 문의 바로가기</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="location.href='myQna.me'">1:1 문의 바로가기</button>
				</c:otherwise>
			</c:choose>
		</div>
		
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		function qnaLogin(){
			alert("로그인을 진행해주세요.");
			$("#loginModal").show();
		}
		
		$(function(){
		    $("#loginModal_close").on("click", function(){
		        $("#loginModal").hide();
		    });
		})
	</script>
</body>
</html>
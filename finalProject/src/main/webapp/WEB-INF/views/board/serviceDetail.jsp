<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.notice_Detail{
			margin: auto;
			width: 1000px;
		}
		#head_1{
			font-size: 15px;
    		color: #666;
		}
		#notice_Head h2{
			font-weight: 800;
		    color: #333;
		    font-size: 36px;
		    font-family: NotoSansKR,NotoSansJP,"돋움",Dotum,AppleGothic,Tahoma,Sans-serif;
		}
		.divSet div{
			float: left;
		}
		.notice_Detail button{
			background-color: #f8f8f8;
			border: 1px solid rgb(202, 202, 202);
			border-radius: 3px;
		}
		#notice_img{
			margin-top: 60px;
			margin-left: auto;
			margin-right: auto;
			margin-bottom: 30px;
		}
		
		/* ===== 페이지 ===== */
		#notice_page{
			padding: 30px 0px 10px 0px;
		}
		#notice_page1{
			border-top: 1px solid rgb(210, 210, 210);
			border-bottom: 1px solid rgb(210, 210, 210);
			padding: 10px 0px 10px 10px;
		}
		#notice_page2{
			border-bottom: 1px solid rgb(210, 210, 210);
			padding: 10px 0px 10px 10px;
		}
		#notice_page a{
			padding: 0px 0px 0px 10px;
			color: #474747;
		}
		.a_hover a:hover{
			font-weight: 600;
		}
		
	</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div class="notice_Detail">
		<div id="notice_Head">
			<div id="head_1">공지사항</div>
			<div><h2>${s.serviceTitle }</h2></div>
			<div class="divSet">
				<div><p>${s.createDate }</p></div>
				<div style="padding: 0px 0px 0px 10px; width: 830px;"><img style="width:20px; height: 20px;" src="resources/images/eye.png">${s.count }</div>
			</div>
			<hr style="position: relative; top: 20px; border: 1px solid #474747;">
		</div>
		<div>
			<c:choose>
				<c:when test="${not empty at }">
					<div id="notice_img" style="height: 1000px; width: 900px;">
						<img style="height: 1000px; width: 900px;" src="${at}">
					</div>				
				</c:when>
			</c:choose>
			<div style="width: 900px; padding-top: 20px;">
				<pre style="width: 900px; word-wrap: break-word; white-space: pre-wrap;">
${s.serviceContent }
				</pre>
			</div>
		</div>
		<div id="notice_page">
			<div id="notice_page1">
				<c:choose>
					<c:when test="${not empty preSer }">
						<strong>이전글</strong>
						<span class="a_hover">
							<a href="notiDetail.se?boardNo=${preSer.serviceNo }">${preSer.serviceTitle }</a>
						</span>					
					</c:when>
					<c:otherwise>
						<strong>이전글</strong>
						<span>
							<a>이전글이 없습니다.</a>
						</span>	
					</c:otherwise>
				</c:choose>
			</div>
			<div id="notice_page2">
				<c:choose>
					<c:when test="${not empty nextSer }">
						<strong>다음글</strong>
						<span class="a_hover">
							<a href="notiDetail.se?boardNo=${nextSer.serviceNo }">${nextSer.serviceTitle }</a>
						</span>					
					</c:when>
					<c:otherwise>
						<strong>다음글</strong>
						<span>
							<a>다음글이 없습니다.</a>
						</span>	
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div style="margin: auto; width: 80px;"><button onclick="location.href='service.se'">전체목록</button></div>
	</div>

	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
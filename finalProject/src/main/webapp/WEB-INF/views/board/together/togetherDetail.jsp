<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께가치</title>
<style>
	#detailOuter{
		margin:auto;
		margin-top : 100px;
		width:1110px;
/* 		border : 1px solid black; */
	}
	#detailOuter>div{
		float:left;
	}
	#titleImg{
		width:500px;
		height:400px;
	}
	#titleImg>img{
		width:100%;
		height:100%;
	}
	#detailContent{
		width:600px;
		height:400px;
	}
	#detailContentTable>td{
		text-align:center;
	}
	#detailBtnArea{
		width:1110px;
		margin-top:20px;
	}
	#detailBtnArea>button{
		margin:10px 5px;
	}
	#detailContentTable{
		margin-left:10px;
	}
	#detailContentTable td,th{
		border-bottom : 1px solid black;	
	}
	
</style>
</head>
<body>
		<%@include file="../../common/menubar.jsp" %>
	
		<div id="detailOuter">
				<div id="titleImg">
						<img src="/finalProject${t.filePath }">
				</div>
				<div id="detailContent">
						<table id="detailContentTable">
										<tr>
												<th style="width:90px;">제목</th>
												<td>&nbsp;${t.boardTitle }</td>
												<th>작성자</th>
												<td style="width:90px;">&nbsp;<img src="/finalProject/${t.profilePath }" class='profileLink' style="width:20px; height:20px; border-radius:50%;"> <a id="nicknameHover" class='profileLink' onclick="whoareyou();">${t.boardWriter }</a></td>
												<th style="width:90px;">작성일</th>
												<td>${t.createDate }</td>
										</tr>
										<tr>
												<th>장소</th>
												<td>&nbsp;${t.zoneName}</td>
												<th>기간</th>
												<td colspan="3">&nbsp;${t.totalDate }박 ${t.totalDate +1}일</td>
										</tr>
										<tr>
												<th>날짜</th>
												<td>&nbsp;${t.startDate} ~ ${t.endDate }</td>
												<th>경비</th>
												 <td colspan="3">&nbsp;${t.totalPay }원 이하</td>
										</tr>					
										<tr>
												<th>참여 인원</th>
												<td>&nbsp;${t.togetherCount } / ${t.together }</td>
												<c:choose>
														<c:when test="${loginUser.nickname eq t.boardWriter }">
																<th>동행 신청자</th>
																 <td colspan="3">&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-info">신청자 보기</button></td>
														</c:when>
														<c:otherwise>
																<td colspan="4"></td>
														</c:otherwise>
												</c:choose>
										</tr>	
										<tr>
												<th style="height:278px;">내용</th>
												<td colspan="5">&nbsp;${t.boardContent }</td>
										</tr>				
						</table>
				</div>
				<div id="detailBtnArea" align="center">
						<button type="button" class="btn btn-outline-success">찜하기</button>
					<c:if test="${loginUser.nickname eq t.boardWriter }">
						<button type="button" class="btn btn-outline-warning">수정하기</button>
						<button type="button" class="btn btn-outline-danger">삭제하기</button>
					</c:if>
				</div>
		</div>
</body>
</html>
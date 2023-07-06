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
		#togetherReplyArea{
			margin:auto;
			width:1110px;
			height: 500px;
		}
		#replyEnrollArea{
			height: 100px;
		}
		#replyEnrollArea *{
			float: left;
		}	
		#replyArea{
			width: 1110px;
			/* background-color: blue; */
		}
		.replyDiv{
			border-bottom: 1px solid lightgray;
			margin: auto;
			width: 1010px;
			height: 100px;
			/* background-color: red; */
			position:relative;
		}
		.replyDiv *{
			float: left;
		}
		.replyDiv img{
			width: 80px;
			height: 80px;
			margin: 5px;
			border-radius: 50%;
		}
		#replyWriter{
			margin-left: 10px;
			font-size: 20px;
			font-weight: 600;
		}
		#replyContent{
			font-size: 15px;
			margin: 5px 0px 0px 10px;
		}
		#replyCreateDate{
			font-size: 12px;
			margin: 10px 0px 0px 12px;
			color: gray;
		}
		#replyUL{
			margin: 0px;
			padding: 0px;			
		}
		#replyUL li{
			list-style: none;
			max-width: 900px;
		}
		#etcImgDiv{
			margin-left: 730px;
		}
		#etcImg{
			width:30px; 
			height:30px; 
			margin-left: 0px;
			padding: 0px;
		}
		#etcOptions{
			width:100px; 
			height100px;
			position:absolute; 
			left: 1000px; 
			background-color: rgba(255, 255, 255, 0.8);
			display:none;
		}
		#etcOptions>ul{
			list-style-type: none;
			margin-left: 10px;
			padding: 0px;
		}
		#etcOptions li{
			color:gray;
		}
		#etcOptions li:hover{
			color:black;
			font-size: 17px;
		}
		#etcImg:hover{
			cursor: pointer;
		}
		#participateTable{
			text-align:center;
		}
		#participateTable>tbody tr:hover{
			background-color: lightgray;
		}
		#togetherApplyAlertDiv{
			width:400px;
			height:500px;
			border:3px solid #7c838b;
			border-radius: 20px;
			background-color: #7c838b;
		}
		#applyContent{
			margin:20px;
			width:360px;
			height:460px;
			border-radius: 20px;
			background-color: white;
		}
		#applyTitle{
			padding: 15px 0px 0px 20px;
		}
		#applyMessage{
			width: 320px;
			height: 150px;
			resize: none;
		}
		#applyDate{
			margin-bottom: 10px;
		}
		#applyBtnArea>button{
			margin:0px 10px;
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
												<th style="width:50px;">작성일</th>
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
												<td style="width:180px;">&nbsp;${t.startDate} ~ ${t.endDate }</td>
												<th>경비</th>
												 <td colspan="3">&nbsp;${t.totalPay }원 이하</td>
										</tr>					
										<tr>
												<th>참여 인원</th>
												<td>&nbsp;${t.togetherCount } / ${t.together } &nbsp;
												
															<jsp:useBean id="now" class="java.util.Date" />
															<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" scope="request"/>
															<fmt:parseDate value="${t.startDate }" pattern="yy/MM/dd" var="start" scope="request"/>
															<fmt:parseNumber value="${start.time / (1000*60*60*24)}" integerOnly="true" var="startDate" scope="request"/>
															
												<c:choose> 
							                            <c:when test="${startDate-today >0 and t.together - t.togetherCount != 0}">
							                            		<c:choose>
							                            			<c:when test="${not empty loginUser }">
							                            				<c:choose>
							                            						<c:when test="${t.boardWriter == loginUser.nickname }">
							                            								<button type="button" class="togetherBtn btn btn-outline-secondary" style="background-color:lightgray;">내가 작성한 글입니다.</button>
							                            						</c:when>
							                            						<c:when test="${loginUser.certification eq 0 }">
							                            								<button type="button" class="togetherBtn btn btn-outline-secondary" style="background-color:lightgray;">참여하기</button>
							                            				    			<p>참여하려면 본인 인증을 해주세요.</p>
							                            						</c:when>
							                            						<c:otherwise>
													                            	    <button type="button" id="detailApplyBtn" class="togetherBtn btn btn-outline-secondary">참여하기</button>
							                            						</c:otherwise>
							                            				</c:choose>
							                            			</c:when>
							                            			<c:otherwise>
		 																	<button type="button" class="togetherBtn btn btn-outline-secondary" style="background-color:lightgray;">참여하기</button>
							                            				    <p>참여하려면 로그인을 해주세요.</p>
							                            			</c:otherwise>
							                            		</c:choose>
							                            </c:when>
							                            <c:otherwise>
							                            		<button type="button" class="togetherBtn btn btn-outline-secondary" style="background-color:lightgray;"disabled>마감되었습니다.</button>
							                            </c:otherwise>
					                            </c:choose>		
															
												</td>
												<c:choose>
														<c:when test="${loginUser.nickname eq t.boardWriter }">
																<th style="width:90px;">동행 신청자</th>
																 <td colspan="3">&nbsp;&nbsp;&nbsp;<button type="button" id="applyParticipateListBtn" class="btn btn-outline-info">신청자 보기</button></td>
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
				
							<c:if test="${not empty loginUser and not empty cookie.applyCheck }">
									<script>
											$(function(){
												var applyCheck = "${cookie.applyCheck.value}";
												var applyBoardNo = applyCheck.split("/")[0];
												var applyWriter = applyCheck.split("/")[1];
												var loginUser = "${loginUser.nickname}";
												
												var $btn = $("#detailContentTable").find("button");
												
														if(loginUser == applyWriter){
																if("${t.boardNo}"== applyBoardNo){
// 																	var $applyBtn = $(this).siblings().eq(0).children().eq(1).children("div").children("button");
																	$btn.text("작성자 승인 대기중").attr("disabled",true).css("color","white").css("background-color","lightgreen");																
																}else{
// 																	var $elseBtns = $(this).siblings().eq(0).children().eq(1).children("div").children("button");
																		if($btn.text() != "마감되었습니다."){
																			$btn.text("중복 참여 불가").attr("disabled",true).css("color","black").css("background-color","lightgray");
																		}
																}														
														}
											});
									</script>
							</c:if>					
				
				
				<script>
							
						$("#detailApplyBtn").on("click",function(){
							$("#detailApplyModal").modal('show');
						});
				
						$("#applyParticipateListBtn").on("click",function(){
							var boardNo = "${t.boardNo}";
							
							$("#participateTable>tbody").children().remove();
							
							$.ajax({
								url : "applyParticipate.bo",
								data : {boardNo : boardNo},
								success : function(result){
									
									var str = "";
									
									if(result.length != 0){
											for(var i in result){
												str += "<tr style='height:50px;'><td><input type='checkbox' class='participateCheckBox'><input type='hidden' id='indexInput"+i+"' value='"+result[i].nickname+"'></td><td>"+result[i].nickname+"</td><td>"+result[i].message+"</td><td>"
														+result[i].applyDate+"</td></tr>"
											};
									}else{
												str += "<tr><td colspan='4'>신청자가 없습니다.</td></tr>";										
									}
									$("#participateTable>tbody").append(str);
								},
								error : function(){
									console.log("신청자 리스트 갱신 실패");
								}
							});
							
							$("#applyParticipateListModal").modal('show');
						});
				</script>
				
		<div class="modal fade" id="applyParticipateListModal">
		  <div class="modal-dialog" style="width:520px; height: 500px; ">
			<div class="modal-content" style="width:520px; border-radius: 23px; border: 1px solid #7c838b;">
			  <!-- Modal body -->
			  <div style="width:520px ;padding: 0;" align="center">
			  		<br>
						<table id="participateTable" style="width:520px;">
								<thead>
										<tr style="height:40px;">
												<th style="width:40px;">선택</th>
												<th style="width:60px;">닉네임</th>
												<th style="width:200px;">지원 동기</th>
												<th style="width:220px;">지원 날짜</th>
										</tr>
								</thead>
								<tbody>
									
								</tbody>
						</table>
						<br>
						<div id="participateBtnArea">
								<button type="button" class="btn btn-outline-success" id="participateAcceptBtn">참여 수락</button>
								<button type="button" class="btn btn-outline-warning"id="participateRejectBtn">참여 거절</button>
								<button type="button" class="btn btn-outline-danger" data-dismiss="modal">창 닫기</button>
						</div>
						<br>
			  </div> <!--modal-body-->
			</div>
		  </div>
		</div>
		
		<script>
		
				$("#participateAcceptBtn").on("click",function(){
						var str = "";
						$("input[class=participateCheckBox]").each(function(){
							if($(this).prop("checked")){
								str += $(this).siblings().val()+" ";
							}
						});
						location.href="applyParticipateResult.bo?boardNo=${t.boardNo}&type=accept&nickname="+str						
				});
				
				$("#participateRejectBtn").on("click",function(){
					var str = "";
					$("input[class=participateCheckBox]").each(function(){
						if($(this).prop("checked")){
							str += $(this).siblings().val()+" ";
						}
					});
					location.href="applyParticipateResult.bo?boardNo=${t.boardNo}&type=reject&nickname="+str						
			});
		</script>
		
		
	<div class="modal fade" id="detailApplyModal">
		  <div class="modal-dialog" style="width:400px; height: 500px; ">
			<div class="modal-content" style=" border-radius: 23px; border: 1px solid #7c838b;">
			  <!-- Modal body -->
			  <div id="applyModalBody" style="padding: 0;">
				<div id="togetherApplyAlertDiv" >
					<div id="applyContent">
							<div id="applyTitle">
								<h5 id="applyTermText">[${t.totalDate}박 ${t.totalDate +1}일]</h5>
								<h4 align="center" id="applyTitleText">&lt; ${t.boardTitle} &gt;</h4>
							</div>
							<div id="applyDate" align="center">${t.startDate } ~ ${t.endDate }</div>
							<div id="applyPay" align="center">${t.totalPay }원 이하</div>
							<br>
						<form action="togetherApply.bo" method="post">
							<input type="hidden" name="writer" id="writer" value="${loginUser.nickname }">
							<input type="hidden" name="boardNo" id="applyBoardNo" value="${t.boardNo }">
							<div id="applyMessageDiv" align="center">
								<textarea name="applyMessage" id="applyMessage" placeholder="글 작성자에게 하실 말을 적어주세요. (최대 70자)"></textarea>
							</div>
							<br>
							<div id="applyBtnArea" align="center">
								<button type="submit" id="applySubmitBtn" class="btn btn-outline-info">참여하기</button>
								<button type="button" id="applyOutBtn" class="btn btn-outline-danger" data-dismiss="modal">취소하기</button>
							</div>
						</form>
					</div>
				</div>
			  </div> <!--modal-body-->
			</div>
		  </div>
		</div>			
					
				<br><br>
				<div id="detailBtnArea" align="center">
					<c:if test="${not empty loginUser }">
						<c:choose>
								<c:when test="${choiceCheck eq 1 }">
										<button type="button" class="btn btn-success choiceBtn">찜 취소하기</button>
								</c:when>
								<c:otherwise>
										<button type="button" class="btn btn-outline-success choiceBtn" >찜하기</button>
								</c:otherwise>
						</c:choose>
						<c:if test="${loginUser.nickname eq t.boardWriter }">
							<button type="button" class="btn btn-outline-warning" id="updateBtn">수정하기</button>
							<button type="button" class="btn btn-outline-danger" id="deleteBtn">삭제하기</button>
						</c:if>
					</c:if>
				</div>
				
			<script>
					$(".choiceBtn").on("click",function(){
							location.href="togetherChoice.bo?boardNo=${t.boardNo}&writer=${loginUser.nickname}&choiceCheck=${choiceCheck}";
					});
					
					$("#updateBtn").on("click",function(){
							location.href="togetherUpdate.bo?boardNo=${t.boardNo}";
					});
			</script>
				
	<div id="togetherReplyArea">
		<br>
		<p style="font-size: 25px; margin-left: 15px;">댓글(2)</p>
		<div id="replyEnrollArea">
			<textarea id="replyContentText" placeholder="댓글 내용을 입력해주세요." style="width: 700px; height: 80px; margin-left: 155px; resize: none;"></textarea>
			<button type="button" id="replyEnrollBtn" class="btn btn-outline-dark" style="width:100px; height:80px;">댓글 작성</button>
		</div>
		<div id="replyArea">
			<div class="replyDiv">
				<img src="/finalProject/resources/images/기본프로필.png">
				<ul id="replyUL">
					<li id="replyWriter">한성</li> <br>
					<li id="replyContent">그러게 말이에요 훠훠</li> <br>
					<li id="replyCreateDate">2023-06-23</li>
				</ul>
				<div id="etcImgDiv">
					<img src="/finalProject/resources/images/etcIcon.png" id="etcImg" alt="더보기" >
				</div>
				<div id="etcOptions">
					<ul>
						<li>삭제하기</li><br>
						<li>수정하기</li><br>
						<li>신고하기</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script>
		$("#etcImg").click(function(){
			console.log($("#etcOptions").css("display"));
			if($("#etcOptions").css("display") == "none"){
				$("#etcOptions").css("display","block");
			}else{
				$("#etcOptions").css("display","none");
			}
		});	
	</script>
				
		</div>
</body>
</html>
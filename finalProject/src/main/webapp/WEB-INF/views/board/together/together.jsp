<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Tooplate">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	<style>
	.thumb>img{
		width:350px;
		height:255px;
	}
	.price{
	 	margin : 0px 0px 120px 140px;
	}
	#optionIcons>li>img{
		width: 12px;
		height:14px;
		margin-right:10px;
	}
	
	   #searchDiv{
			width:1110px;
			height: 105px;
			background-color: #7c838b;
		}
		#searchDiv>div{
			float: left;
		}
		#titleMsg{
			width: 25%;
			color: white;
			font-size: 22px;
			font-weight: 500;
			margin: 37px 15px 37px 15px;
		}
		select{
			width: 130px;
			height: 25px;
			color: white;
			background-color: #7c838b;
			border: none;
			border-bottom: 1px solid white;
			text-align:center;
		}
		#searchOption1,#searchOption2{
			width: 13%;
			margin: 37px 3px;
		}
		#searchOption3,#searchOption4{
			width: 15%;
			margin: 39px 2.5px;
		}
		#search-Btn{
			background-color: black;
			width: 90px;
			height: 35px;
			color: white;
			border: none;
			margin-top: 37px;
		}
		input[type=date]{
			border:none;
			background-color : #7c838b;
			color : white;
			border-bottom : 1px solid white;
			margin:0px;
			padding:0px;
		}
		#contentOuter{
			width:1110px;
		}
		#contentOuter>div{
			float:left;
		}
		.togetherBtn{
			border : none;
			width : 150px;
			height : 50px;
			background-color: #7c838b;
		}
		#togetherApplyAlertDiv{
			width:400px;
			height:500px;
			border:3px solid #7c838b;
			border-radius: 20px;
			background-color: #7c838b;
		}
/* 		#applyModalBody{ */
/* 			border:none; */
/* 		} */
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
		#contentOuter .col-lg-4:hover{
			cursor : pointer;
			background-color:lightgray; 
			border-radius : 15px;
		}
		.col-lg-4>.ticket-item{
			margin-top:10px;
		}
	</style>
    <title>함께 가치</title>

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/owl-carousel.css">

    <link rel="stylesheet" href="/finalProject/resources/css/tooplate-artxibition.css">
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <!-- ***** Preloader End ***** -->
	<%@include file="../../common/menubar.jsp" %>
    <!-- ***** Header Area End ***** -->
	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
	
    <div class="page-heading-shows-events">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>같이 여행 갈 사람을 찾아보자 !</h2>
                    <span>당신의 여행 스타일에 맞춰 같이 여행을 떠날 친구를 찾아보아요!</span>
                </div>
            </div>
        </div>
    </div>

    <div class="tickets-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
 					<br>
					 <div id="searchDiv">
							<div id="titleMsg">원하는 조건을 입력해보세요</div>
							<div id="searchOption1">
								<input type="date" id="startDate">
							</div>
							 <div style="color:white; margin:37px 7px 37px 0px;">~</div>
							<div id="searchOption2">
								<input type="date" id="endDate">
							</div>
							<div id="searchOption3">
								<select  id="location">
									<option value="">지역</option>
									<option value='all'>전체</option>
									<option value='서울'>서울특별시</option>
									<option value='부산'>부산광역시</option>
									<option value='대구'>대구광역시</option>
									<option value='인천'>인천광역시</option>
									<option value='광주'>광주광역시</option>
									<option value='대전'>대전광역시</option>
									<option value='울산'>울산광역시</option>
									<option value='경기'>경기도</option>
									<option value='강원'>강원도</option>
									<option value='충북'>충청북도</option>
									<option value='충남'>충청남도</option>
									<option value='전북'>전라북도</option>
									<option value='전남'>전라남도</option>
									<option value='경북'>경상북도</option>
									<option value='경남'>경상남도</option>
									<option value='제주'>제주도</option>
								</select>
							</div>
							<div id="searchOption4">
								<select id="pay">
									<option value="">경비</option>
									<option value="0">전체</option>
									<option value="100000">100,000원 이하</option>
									<option value="200000">200,000원 이하</option>
									<option value="300000">300,000원 이하</option>
									<option value="400000">400,000원 이하</option>
									<option value="500000">500,000원 이하</option>
									<option value="1000000">1,000,000원 이하</option>
								</select>
							</div>
							<div id="searchBtn">
								<button type="button" id="search-Btn" onclick="goOptionSearch();">검색 </button>
							</div>
							
							<c:if test="${not empty loginUser and not empty cookie.applyCheck }">
									<script>
											$(function(){
												var applyCheck = "${cookie.applyCheck.value}";
												var applyBoardNo = applyCheck.split("/")[0];
												var applyWriter = applyCheck.split("/")[1];
												var loginUser = "${loginUser.nickname}";
													$(".togetherBoardNo").each(function(){
														if(loginUser == applyWriter){
																if($(this).val() == applyBoardNo){
																	var $applyBtn = $(this).siblings().eq(0).children().eq(1).children("div").children("button");
																	$applyBtn.text("작성자 승인 대기중").attr("disabled",true).css("color","white").css("background-color","lightgreen");																
																}else{
																	var $elseBtns = $(this).siblings().eq(0).children().eq(1).children("div").children("button");
																		if($elseBtns.text() != "마감되었습니다."){
																			$elseBtns.text("중복 참여 불가").attr("disabled",true).css("color","black").css("background-color","lightgray");
																		}
																}														
														}
													});
											});
									</script>
							</c:if>							
							
							<script>
							
								function goOptionSearch(){
									var startDate = $("#startDate").val();
									var endDate = $("#endDate").val();
									var location = $("#location").val();
									var pay = $("#pay").val();
									
									$.ajax({
										url : "optionSearch.bo",
										data : {
											startDate : startDate,
											endDate : endDate,
											location : location,
											pay : pay
										},
										success : function(result){
											
											$("#contentOuter").children().remove();
											var str = "";
											var today = new Date().getTime();
											for(var i in result[0]){
												str += "<div class='col-lg-4' onclick='goTogetherDetail("+result[0][i].boardNo+");'>"
									                +"<input type='hidden' name='boardNo'  class='togetherBoardNo' value="+result[0][i].boardNo+">"
									                    +"<div class='ticket-item'>"
									                        +"<div class='thumb'>"
									                            +"<img src=/finalProject"+result[0][i].filePath+" alt=></div>"
									                        +"<div class='down-content'>"
									                        	+"<h5>["+result[0][i].totalDate+"박 "+ (result[0][i].totalDate +1)+"일]</h3>"
									                            +"<h4>&lt;"+result[0][i].zoneName+" "+result[0][i].concept+" 여행&gt; <br> "+result[0][i].boardTitle+"</h4>"
									                            +"<ul id='optionIcons'>"
									                                +"<li><i class='fa fa-clock-o'></i>"+result[0][i].startDate+" ~ "+result[0][i].endDate+"</li>"
									                                +"<li><i class='fa fa-map-marker'></i>"+result[0][i].zoneName+"</li>"
									                                +"<li><img src='/finalProject/resources/images/together_won.png'>"+result[0][i].totalPay+"원 이하</li>";
									                                if(result[0][i].profilePath){
								                               		    str += "<li><img src='/finalProject/"+result[0][i].profilePath+"' style='border-radius:50%;''> <a id='nicknameHover' onclick='whoareyou();''>"+result[0][i].boardWriter+"</a></li>";
									                                }else{
									                                	str += "<li><img src='/finalProject/resources/images/기본프로필.png' style='border-radius:50%;''> <a id='nicknameHover' onclick='whoareyou();''>"+result[0][i].boardWriter+"</a></li>";
									                                }
									                                str += "<li>작성일 : "+result[0][i].createDate+"</li></ul>"
									                            +"<div class='main-dark-button' id='applyBtn'>";
																var d = new Date("20"+result[0][i].endDate).getTime();
																if(d - today >0 && result[0][i].together - result[0][i].togetherCount != 0){
									                            			<%if(request.getSession().getAttribute("loginUser") != null){%>
												                            	  str += "<button type='button' class='togetherBtn' data-toggle="modal" data-target="#applyModal">참여하기 "+result[0][i].togetherCount+"/"+result[0][i].together+"</button>";
												                           <%}else{%>
																				  str += "<button type='button' class='togetherBtn' style='background-color:lightgray;'>참여하기 "+result[0][i].togetherCount+"/"+result[0][i].together+"</button>";
														                           		+"<p>참여하려면 로그인을 해주세요.</p>";
												                           <%}%>
																}else{
									                            		str += "<button type='button' class='togetherBtn' style='background-color:lightgray;'>마감되었습니다.</button>";
																}
																str += "</div></div></div></div></div>";
											}
											$('#contentOuter').append(str);
											
											var paging = "<div class='col-lg-12'><div class='pagination' align='center'><ul>";
																if(result[1].currentPage != 1){
																	paging += "<li class='page-item'><a class='page-link' href='together.bo?currentPage="+result[1].currentPage -1+"'>Previous</a></li>";
																}
																for(var i = result[1].startPage; i<=result[1].endPage; i++){
																	if(i != result[1].currentPage){
																		paging += "<li class='page-item'><a class='page-link' href='together.bo?currentPage="+i+"'>"+i+"</a></li>";
																	}else{
																		paging += "<li class='page-item disabled'><a class='page-link' href='together.bo?currentPage="+i+"'>"+i+"</a></li>";
																	}
																}
																if(result[1].currentPage != result[1].endPage){
																	paging += "<li class='page-item'><a class='page-link' href='together.bo?currentPage="+result[1].currentPage +1 +"'>Next</a></li></ul></div>";
																}
											
											$("#contentOuter").append(paging);
										},
										error : function(){
											console.log("옵션 검색 실패");
										}
									});
									
								}
							</script>
						</div>
						
                </div>
                
                <div class="col-lg-12">
                <br><br>
                </div>
                
       <div id="contentOuter">         
                <jsp:useBean id="now" class="java.util.Date" />
                <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="today" scope="request"/>
                <c:choose>
                	<c:when test="${not empty list }">
			                <c:forEach var="i" items="${list }">
			                	<fmt:parseDate value="${i.endDate }" pattern="yy/MM/dd" var="end" scope="request"/>
			                	<fmt:parseNumber value="${end.time / (1000*60*60*24)}" integerOnly="true" var="endDate" scope="request"/>
					                <div class="col-lg-4" onclick="goTogetherDetail(${i.boardNo});">
					                <input type="hidden" name="boardNo"  class="togetherBoardNo" value="${i.boardNo }">
					                    <div class="ticket-item">
					                        <div class="thumb">
					                            <img src="/finalProject${i.filePath}" alt="">
					                        </div>
					                        <div class="down-content">
					                        	<h5>[${i.totalDate}박 ${ i.totalDate +1}일]</h3>
					                            <h4>&lt;${i.zoneName } ${i.concept } 여행&gt; <br> ${i.boardTitle }</h4>
					                            <ul id="optionIcons">
					                                <li><i class="fa fa-clock-o"></i>${i.startDate} ~ ${i.endDate }</li>
					                                <li><i class="fa fa-map-marker"></i>${i.zoneName }</li>
					                                <li><img src="/finalProject/resources/images/together_won.png">${i.totalPay }원 이하</li>
					                                <c:choose>
					                                <c:when test="${not empty i.profilePath }">
				                               		    <li><img src="/finalProject/${i.profilePath }" style="border-radius:50%;"> <a id="nicknameHover" onclick="whoareyou();">${i.boardWriter }</a></li>
					                                </c:when>
					                                <c:otherwise>
					                                	<li><img src="/finalProject/resources/images/기본프로필.png" style="border-radius:50%;"> <a id="nicknameHover" onclick="whoareyou();">${i.boardWriter }</a></li>
					                                </c:otherwise>
					                                </c:choose>
					                                <li>작성일 : ${i.createDate }</li>
					                            </ul>
					                            <div class="main-dark-button" id="applyBtn">
					                            <c:choose>
					                            <c:when test="${endDate-today >0 and i.together - i.togetherCount != 0}">
					                            		<c:choose>
					                            			<c:when test="${not empty loginUser }">
<%-- 								                            	    <a href="#">참여하기 ${i.togetherCount}/${i.together }</a> --%>
								                            	    <button type="button" class="togetherBtn">참여하기 ${i.togetherCount}/${i.together }</button>
					                            			</c:when>
					                            			<c:otherwise>
<%-- 					                            				    <a style="background-color:lightgray;">참여하기 ${i.togetherCount}/${i.together }</a> --%>
 																	<button type="button" class="togetherBtn" style="background-color:lightgray;">참여하기 ${i.togetherCount}/${i.together }</button>
					                            				    <p>참여하려면 로그인을 해주세요.</p>
					                            			</c:otherwise>
					                            		</c:choose>
					                            </c:when>
					                            <c:otherwise>
					                            		<button type="button" class="togetherBtn" style="background-color:lightgray;"disabled>마감되었습니다.</button>
<!-- 					                            		<a  style="background-color:lightgray;" disabled>마감되었습니다.</a> -->
					                            </c:otherwise>
					                            </c:choose>
					                            </div>
					                        </div>
					                    </div>
					                </div>
			                </c:forEach>
                    </c:when>
                	<c:otherwise>
                			<div>조회된 게시물이 없습니다. </div>
                	</c:otherwise>
                </c:choose>
                
                <script>
                	$("#contentOuter").on("click","button",function(){
                		var boardNo = $(this).parent().parent().parent().parent().children("input").val();
                		var title = $(this).parent().siblings("h4").text().split('>');
                		if(confirm("이 여행의 세부 일정을 확인하시겠습니까 ?")){
                			location.href="";
                		}else{
                			if(confirm("세부 일정을 확인하지 않고 이 여행에 참여하시겠습니까 ?")){
	                			if(confirm("참여하기 버튼은 하루에 한개만 누르실 수 있습니다. \n진행하시겠습니까 ?")){
	                				$("#applyTermText").html($(this).parent().siblings("h5").text());
	                				$("#applyTitleText").html(title[0]+"><br>"+title[1].trim());
	                				$("#applyDate").html($(this).parent().siblings("ul").children().eq(0).text());
	                				$("#applyPay").html($(this).parent().siblings("ul").children().eq(2).text());
	                				$("#applyBoardNo").val(boardNo);
	                				
	                				$("#applyModal").modal('show');
	                				
	                			}else{
	                				alert("참여하기를 취소합니다.")
	                			}
                			}else{
                				alert("참여하기를 취소합니다.");
                			}
                		}
                	});
                	
                	function goTogetherDetail(boardNo){
							location.href="togetherDetail.bo?boardNo="+boardNo;                		
                	}
                </script>
                
                <div class="col-lg-12">
                    <div class="pagination" align="center">
						<ul>
							<c:if test="${pi.currentPage != 1 }">
								<li class="page-item"><a class="page-link"
									href="together.bo?currentPage=${pi.currentPage -1 }">Previous</a></li>
							</c:if>
							<c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
								<c:choose>
									<c:when test="${i != pi.currentPage }">
										<li class="page-item"><a class="page-link"
											href="together.bo?currentPage=${i}">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link"
											href="together.bo?currentPage=${i}">${i }</a></li>
										<script>
											$(function() {
												$(".disabled").children("a").css(
														"background-color",
														"lightgray");
											});
										</script>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pi.currentPage != pi.endPage }">
								<li class="page-item"><a class="page-link"
									href="together.bo?currentPage=${pi.currentPage +1 }">Next</a></li>
							</c:if>
						</ul>
                    </div>
                    
					<c:if test="${not empty loginUser }">
	                   <div align="right">
							<a href="togetherEnroll.bo?nickname=${loginUser.nickname}" class="btn btn-secondary">글 쓰기</a>	                   
	                   </div>
                    </c:if>
            	</div> <!-- pagination col-lg-12 -->
             </div>  <!-- content outer -->
        </div>
        
        </div>
    </div>


    <!-- *** Subscribe *** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h4>Subscribe Our Newsletter:</h4>
                </div>
                <div class="col-lg-8">
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-9">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-3">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

		<div class="modal fade" id="applyModal">
		  <div class="modal-dialog" style="width:400px; height: 500px; ">
			<div class="modal-content" style=" border-radius: 23px; border: 1px solid #7c838b;">
			  <!-- Modal body -->
			  <div id="applyModalBody" style="padding: 0;">
				<div id="togetherApplyAlertDiv" >
					<div id="applyContent">
							<div id="applyTitle">
								<h5 id="applyTermText"></h5>
								<h4 align="center" id="applyTitleText"></h4>
							</div>
							<div id="applyDate" align="center"></div>
							<div id="applyPay" align="center"></div>
							<br>
						<form action="togetherApply.bo" method="post">
							<input type="hidden" name="writer" id="writer" value="${loginUser.nickname }">
							<input type="hidden" name="boardNo" id="applyBoardNo">
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

    <!-- *** Footer *** -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <div class="address">
                        <h4>Sunny Hill Festival Address</h4>
                        <span>5 College St NW, <br>Norcross, GA 30071<br>United States</span>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Info</a></li>
                            <li><a href="#">Venues</a></li>
                            <li><a href="#">Guides</a></li>
                            <li><a href="#">Videos</a></li>
                            <li><a href="#">Outreach</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="hours">
                        <h4>Open Hours</h4>
                        <ul>
                            <li>Mon to Fri: 10:00 AM to 8:00 PM</li>
                            <li>Sat - Sun: 11:00 AM to 4:00 PM</li>
                            <li>Holidays: Closed</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="under-footer">
                        <div class="row">
                            <div class="col-lg-6">
                                <p>São Conrado, Rio de Janeiro</p>
                            </div>
                            <div class="col-lg-6">
                                <p class="copyright">Copyright 2021 ArtXibition Company 
                    
                    			<br>Design: <a rel="nofollow" href="https://www.tooplate.com" target="_parent">Tooplate</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="sub-footer">
                        <div class="row">
                            <div class="col-lg-3">
                                <div class="logo"><span>Art<em>Xibition</em></span></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="menu">
                                    <ul>
                                        <li><a href="index.html" class="active">Home</a></li>
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="rent-venue.html">Rent Venue</a></li>
                                        <li><a href="shows-events.html">Shows & Events</a></li> 
                                        <li><a href="tickets.html">Tickets</a></li> 
                                    </ul>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="social-links">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                        <li><a href="#"><i class="fa fa-behance"></i></a></li>
                                        <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery -->
    <script src="/finalProject/resources/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="/finalProject/resources/js/popper.js"></script>
    <script src="/finalProject/resources/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="/finalProject/resources/js/scrollreveal.min.js"></script>
    <script src="/finalProject/resources/js/waypoints.min.js"></script>
    <script src="/finalProject/resources/js/jquery.counterup.min.js"></script>
    <script src="/finalProject/resources/js/imgfix.min.js"></script> 
    <script src="/finalProject/resources/js/mixitup.js"></script> 
    <script src="/finalProject/resources/js/accordions.js"></script>
    <script src="/finalProject/resources/js/owl-carousel.js"></script>
    
    <!-- Global Init -->
    <script src="/finalProject/resources/js/custom.js"></script>

	

  </body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="Tooplate">
	<link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i&display=swap" rel="stylesheet">
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	
	<!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Bootstrap theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>
	
	<title>메뉴바</title>
    
    <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="resources/css/owl-carousel.css">

    <link rel="stylesheet" href="resources/css/tooplate-artxibition.css">

	<style>
    	.col-sm-6 button{
    		font-size : 14px;
    		border : 0px;
    	}
    	.col-sm-6 button:focus{
    		border : none;
    		outline : none;
    	}
    	.col-sm-6 button:hover{
    		font-weight : 600;
    	}
    	.modal-header{
          border-bottom: 0px;
        }
        .modal-body{
          border : 1px solid rgb(184, 184, 184);
          border-radius: 5px;
          height: auto;
          width: 400px;
          margin: auto;
        }
        #login-fales{
          font-size: 11px;
          color: red;
        }
        .modal-footer{
          border-top : 0px;
          display: block;
          text-align: center;
          height: 60px;
          cursor: default;
        }
        .modal-footer a{
          text-decoration: none;
          color: rgb(130, 130, 130);
          padding: 5px;
        }
        .modal-body div{
          margin: 10px;
        }
        #id-pwd{
          height: 95px;
          width: 345px;
          border: 1px solid rgb(184, 184, 184);
          border-radius: 5px;
        }
        #id-input{
          width: 100%;
          height: 50%;
          margin: auto;
          border-bottom: 1px solid rgb(184, 184, 184);
        }
        #pwd-input{
          width: 100%;
          height: 50%;
          margin: auto;
        }
        .modal-body input{
          border: 0px; /*보더 라인 색깔...*/
          border-radius: 5px;
          width: 100%;
          height: 100%;
          color: rgb(184, 184, 184);
        }
        #saveId{
          width: 20px;
          height: 100%;
        }
        #cookie-ck{
          font-size: 15px;
          color: rgb(149, 149, 149);
        }
        #login-button{
          width: 345px;
          height: 50px;
          background-color: rgb(163, 163, 163);
          font-weight: 600;
          color: white;
          font-size: 23px;
          border-radius: 5px;
          border: 2px rgb(74, 74, 74);
        }
        .text-button{
        	cursor : default;
        	font-size : 14.3px;
        }
        .modal-dialog{
      		overflow-y: initial !important
      	}
      	
      	.modal-body {
      		max-height: calc(100vh-200px);
      		overflow-y: auto;
      	}
        #p_img {
        	width: 100%;
        	height: 180px;
      	}

      	#p_img>img {
        	width: 180px;
        	height: 180px;
        	margin-left: 90px;
        	border-radius: 50%;
      	}  
      	#nicknameHover{
      		text-decoration:none;
      		color:black;
      	}
      	#nicknameHover:hover{
      		cursor:pointer;
      	}
    </style>

</head>
<body>
    <!-- jQuery -->
    <script src="resources/js/jquery-2.1.0.min.js"></script>

    <!-- Bootstrap -->
    <script src="resources/js/popper.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Plugins -->
    <script src="resources/js/scrollreveal.min.js"></script>
    <script src="resources/js/waypoints.min.js"></script>
    <script src="resources/js/jquery.counterup.min.js"></script>
    <script src="resources/js/imgfix.min.js"></script> 
    <script src="resources/js/mixitup.js"></script> 
    <script src="resources/js/accordions.js"></script>
    <script src="resources/js/owl-carousel.js"></script>
    <!-- Global Init -->

	<!-- 알림창 -->
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.success('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	<c:if test="${not empty alertMsg2 }">
		<script>
			alertMessage = "${alertMsg2}";
			alert(alertMessage.replace(/<br>/g,'\n'));
		</script>
		<c:remove var="alertMsg2" scope="session"/>
	</c:if>

   <div class="pre-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-sm-6">
                    <span>로그인을 하시면 선호 목록에 따라 메인 페이지가 바뀌어요!</span>
                </div>
                <div class="col-lg-6 col-sm-6">
                    <c:choose>
                		<c:when test="${empty loginUser }">
                			<!-- 로그인 전 -->
		                    <div class="text-button">
		                        <button type="button" data-toggle="modal" data-target="#loginModal">로그인</button>&nbsp;/
		                        <button type="button" onclick="location.href='enrollListForm.me'">회원가입</button>
		                    </div>
                		</c:when>
                		<c:when test="${not empty loginUser and loginUser.status eq 'Y' }">
                			<!-- 일반 회원 로그인 후 -->
		                    <div class="text-button">
		                    <input type="checkbox" id="mbtiCheckBox" style="margin-right:3px; display:none;">
		                    <label for="mbtiCheckBox" id="mbtiCheckBoxLabel" style="margin-right:5px; display:none;">여행 계획 추천 받기</label>
							 <c:choose>
	                                        		<c:when test="${not empty loginUser.profileImg}">
			                                            <!--프로필 있으면-->
			                                            <img src="${loginUser.profileImg}" alt="프로필사진" style="width:25px; height:25px; border-radius:50%; margin-right:5px;">
	                                        		</c:when>
	                                        		<c:otherwise>
			                                            <!--프로필 없으면-->
			                                            <img src="resources/images/profile/person.png" alt="프로필사진" style="width:25px; height:25px; border-radius:50%; margin-right:5px;">
	                                        		</c:otherwise>
	                         </c:choose>
		                    	${loginUser.nickname }님 환영합니다!&nbsp;&nbsp;&nbsp;
		                        <button onclick="location.href='mypage.me'">마이페이지</button>
		                        <button type="button" onclick="removeRecentSession();">로그아웃</button>
		                    </div>
                		</c:when>
						<c:otherwise>
							<!-- 관리자 로그인 후 -->
		                    <div class="text-button">
		                        <button onclick="location.href='admin.ad'">관리자페이지</button>
		                        <button type="button" onclick="location.href='logout.me'">로그아웃</button>
		                    </div>
						</c:otherwise>
                	</c:choose>
                </div>
            </div>
        </div>
    </div>
    
    <!-- ***** Header Area Start ***** -->
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <!-- ***** Logo Start ***** -->
                        <a href="main.bo" class="logo">여행<em>가보자고</em></a>
                        <!-- ***** Logo End ***** -->
                        <!-- ***** Menu Start ***** -->
                        <ul class="nav">
                            <li><a href="main.bo">메인</a></li>
                            <li><a href="theme.bo">테마</a></li>
                            <li><a href="festival.fe">축제</a></li>
                            <li><a href="attraction.bo">명소</a></li> 
                            <li><a href="feed.bo">피드</a></li> 
                            <li><a href="schedule.bo">일정 자랑</a></li> 
                            <li><a href="#" onclick="mbtiQuestion();">함께 가치</a></li> 
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
        
        <script>
        		
        			
        		
        		function mbtiQuestion(){
        			
        			var survey = "${loginUser.survey}";
        			var nickname = "${loginUser.nickname}";

        			var mbtiCheck = decodeURI("${cookie.mbtiCheck.value}");
        			var cookieNickname = mbtiCheck.split("+")[0];
        			
        			console.log(survey);
        			
								<%if (request.getSession().getAttribute("loginUser") != null) {%>
								if(nickname == cookieNickname){
									if (mbtiCheck == "null") {
											if (confirm("회원님의 여행 취향과 맞는 일정을 추천 받으시겠습니까 ?")) {
												if (survey == "") {
													alert("여행 취향 추천을 위해 설문 페이지로 이동합니다.");
													location.href = "survey.me";
												} else {
													location.href = "together.bo?currentPage=1&mbtiCheck="+ nickname+ " "+ survey;
												}
											} else {
												location.href = "together.bo?currentPage=1";
											}
										} else {
											location.href = "together.bo?currentPage=1";
										}
								}else{
									if (confirm("회원님의 여행 취향과 맞는 일정을 추천 받으시겠습니까 ?")) {
										if (survey == "") {
											alert("여행 취향 추천을 위해 설문 페이지로 이동합니다.");
											location.href = "survey.me";
										} else {
											location.href = "together.bo?currentPage=1&mbtiCheck="+ nickname+ " "+ survey;
										}
									} else {
										location.href = "together.bo?currentPage=1";
									}								
								}
								<%} else {%>
									location.href = "together.bo?currentPage=1";
								<%}%>
								
									}
        	
								</script>
        
    </header>
    
    <!-- 로그인 모달 -->
    <form action="login.me">
	    <!-- The Modal -->
	    <div class="modal" id="loginModal">
	      <div class="modal-dialog">
	        <div class="modal-content">
	  
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <img src="" alt="" style="width: 200px; height:70px; display: block; margin:auto; position: relative; left: 48px;">
	            <button type="button" id="loginModal_close" class="close" data-dismiss="modal">&times;</button>
	          </div>
	    
	          <!-- Modal body -->
	          <div class="modal-body">
	            <div id="id-pwd">
	              <div id="id-input">
	                <input type="text" id="userId" name="userId" placeholder="아이디" style="color: black;">
	              </div>
	              <div id="pwd-input">
	                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="color: black;">
	              </div>
	            </div>
	            <div id="cookie-ck">
	              <input type="checkbox" id="saveId" name="saveId" value="off">
	              <label for="saveId">아이디 저장</label>
	            </div>
	            <div id="login-fales">
	              		<!-- *아이디 또는 비밀번호를 잘못 입력했습니다.<br>
	              		&nbsp;&nbsp;입력하신 내용을 다시 확인해주세요. -->
	            </div>
	            <div>
	              <button type="button" id="login-button" onclick="return loginGo();">로그인</button>
	            </div>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <a href="searchIdForm.me">아이디 찾기</a> |
	            <a href="searchPwdForm.me">비밀번호 찾기</a> |
	            <a href="enrollListForm.me">회원가입</a>
	          </div>
	  
	        </div>
	      </div>
	    </div>
  	</form>
  	
  	<script>
  		//엔터키로 로그인버튼 누르기
	  	$(function() {
	  	    $("#userPwd").keyup(function(event) {
	  	        if (event.which === 13) {
	  	            $("#login-button").click();
	  	        }
	  	    });
	  	});
  	
  		//쿠키에 저장된 아이디값 가져오기
  		$(function(){
  			
  			var saveId = "${cookie.userId.value}"
  			if(saveId != ""){//넘어오는 쿠키값이 있으면...
				$("input[name=userId]").val(saveId);
				$("#saveId").attr("checked",true);
  			}
  			
  			var che = $("input[name=userId]").is(':checked');
  		});
  		
  		//로그인 회원인지 조희
  		
  		function loginGo(){
  			
  			if($("#saveId").prop("checked")){
  				$("#saveId").val("on");
  			}
  			
  			$.ajax({
  				url : "login.me",
  				data : {userId : $("#userId").val(),
  						userPwd : $("#userPwd").val(),
  						saveId : $("#saveId").val()},
  				success : function(result){
  					if(result == "NNNNN"){//로그인 유저 없을시
  						console.log("dd");
  						$("#login-fales").html("*아이디 또는 비밀번호를 잘못 입력했습니다.<br>입력하신 내용을 다시 확인해주세요.");
  					}else{//로그인 유저 있을시 전 페이지로 돌려주기
  						location.href = result;
  					}
  				}
  			});
  			return false;
  		}
  		
  	</script>
  	
  	<div class="modal" id="profile" role="dialog">
		<div class="modal-dialog ">
			<div class="modal-content">

				<div class="modal-header" style="border-bottom: 0;">
					<button type="button" class="close" data-dismiss="modal" id="closeModal"
						style="height: 100%;">&times;</button>
				</div>

                <div class="modal-body" style="box-sizing: border-box;">
                    <div style="border-bottom: 0.5px solid lightgray; width: 100%; height: 100%;">
                        <div id="p_img">
                            <img src="/finalProject/resources/images/기본프로필.png" alt="프로필사진">
                        </div>
                        <br>
                        <div id="p_nickname" align="center">
                            <p style="font-size: 33px; font-weight: 580;"></p>
                        </div>
                        <div id="p_age" align="center">
                            <p style="font-size: 20px; font-weight: 540;"></p>
                        </div>
                        <div id="p_style" align="center">
                            <p style="font-size: 20px; font-weight: 540;"></p>
                        </div>
                        <div id="p_report" align="center">
                            <p style="font-size: 20px; font-weight: 540;"></p>
                        </div>
                        <br>
                    </div>
            
                    <div align="center">
                        <br>
                        <div class="modal_btns">
                            <button type="button" class="btn btn-success">채팅하기</button>
                            <button type="button" class="btn btn-info">쓴글보기</button>
                            <button type="button" class="btn btn-danger" >신고하기</button>
                        </div>
                        <br>
                    </div>
                </div>
			</div>
		</div>
	</div>

    <script>
        function whoareyou() {
        	
        		event.stopImmediatePropagation();
        		var nickname = event.target.text;
        		
        		$.ajax({
        			url : "loadProfile.me",
        			data : {nickname : nickname},
        			success : function(result){
        				
        				var gender = "";
        				if(result.gender == 'M'){
        					gender = "남자";
        				}else{
        					gender = "여자";
        				}
        				$("#p_img>img").attr("src",result.profileImg);
        				$("#p_nickname>p").html(result.nickname);
        				$("#p_age>p").html(result.age+"대 "+gender);
        				$("#p_style>p").html("여행 스타일 : "+result.style);
        				$("#p_report>p").html("신고 누적 횟수 : "+result.report);
        				
        			},
        			error : function(){
        				console.log("프로필 로딩 실패 !");
        			}
        			
        		});
        		
				$("#profile").modal('show');
    	};
    	
    	//로그아웃 최근 글 세션 삭제
    	function removeRecentSession() {
    		sessionStorage.removeItem('recentPages');
    		location.href='logout.me';
		}
    </script>
    
</body>
</html>
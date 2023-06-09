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
	<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
	
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
    <script src="resources/js/custom.js"></script>

	<!-- 알림창 -->
	<c:if test="${not empty alertMsg }">
		<script>
			alertify.message('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session"/>
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
		                        <button type="button" onclick="location.href='enrollForm.me'">회원가입</button>
		                    </div>
                		</c:when>
						<c:otherwise>
							<!-- 로그인 후 -->
		                    <div class="text-button">
		                    	${loginUser.nickname }님 환영합니다!&nbsp;&nbsp;&nbsp;
		                        <button onclick="location.href='mypage.me'">마이페이지</button>
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
                            <li><a href="festival.bo">축제</a></li>
                            <li><a href="attraction.bo">명소</a></li> 
                            <li><a href="feed.bo">피드</a></li> 
                            <li><a href="schedule.bo">일정 자랑</a></li> 
                            <li><a href="together.bo">함께 가치</a></li> 
                        </ul>        
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                        <!-- ***** Menu End ***** -->
                    </nav>
                </div>
            </div>
        </div>
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
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	    
	          <!-- Modal body -->
	          <div class="modal-body">
	            <div id="id-pwd">
	              <div id="id-input">
	                <input type="text" name="userId" placeholder="아이디" style="color: black;">
	              </div>
	              <div id="pwd-input">
	                <input type="password" name="userPwd" placeholder="비밀번호" style="color: black;">
	              </div>
	            </div>
	            <div id="cookie-ck">
	              <input type="checkbox" id="saveId" name="saveId">
	              <label for="saveId">아이디 저장</label>
	            </div>
	            <div id="login-fales">
	              		<!-- *아이디 또는 비밀번호를 잘못 입력했습니다.<br>
	              		&nbsp;&nbsp;입력하신 내용을 다시 확인해주세요. -->
	            </div>
	            <div>
	              <button type="submit" id="login-button">로그인</button>
	            </div>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <a href="">아이디 찾기</a> |
	            <a href="">비밀번호 찾기</a> |
	            <a href="">회원가입</a>
	          </div>
	  
	        </div>
	      </div>
	    </div>
  	</form>
  	
  	<script>
  		//쿠키에 저장된 아이디값 가져오기
  		$(function(){
  			
  			var saveId = "${cookie.userId.value}"
  			
  			if(saveId != ""){//넘어오는 쿠키값이 있으면...
				$("input[name=userId]").val(saveId);
				$("#saveId").attr("checked",true);
  			}
  			
  			var che = $("input[name=userId]").is(':checked');
  			//console.log(che);
  		});
  	</script>
    
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
	#login_wrap *{
	  margin: 0 auto;
	}
	.btn_primary{
	  color: #fff;
	  background: #5055b1;
	  border: 1px solid #5055b1;
	  transition: background-color 0.2s ease-out, border-color 0.2s ease-out;
	}
	.btn_primary:hover{
	  background-color: #30336d;
	  color: white;
	}
	.btn_wrap {
	  display: flex;
	  }
	.sns_wrap{
	  margin-top: 20px !important;
	}
	#login_wrap a{
	  text-decoration: none;
	  display: inline-flex;
	  justify-content: center;
	  -webkit-justify-content: center;
	  align-items: center;
	  height: 50px;
	  padding: 0 23px 1px;
	  border-radius: 6px;
	  line-height: 24px;
	  letter-spacing: -0.01em;
	  font-weight: 700;
	}
	.btn_wrap a {
	  min-width: 260px;
	}
	.sns_wrap a{
	  min-width: 230px;
	}
	.sns_wrap {
	  margin: auto;
	}
	.sns_wrap p{
		color: rgb(79, 79, 79);
	  	text-align: center;
	}

	
  </style>
</head>
<body>
	
	<%@include file="../common/menubar.jsp" %>

  <div id="login_wrap">
    <div class="btn_wrap">
      <button type="button" onclick="location.href='enrollForm.me'">그냥 회원가입</button>
    </div>
    <div class="sns_wrap">
    	<div><p>뷰페이지 ...</p>
    	</div>
    	<div>
	    	<button type="button" onclick="naver();">네이버연동 로그인</button>
    	    <button type="button" onclick="kakao();">카카오연동 로그인</button>
    	</div>
    </div>
  </div>
  
  <jsp:include page="../common/footer.jsp"/>
  
	<script>
		//네이버 버튼 클릭시 네이버 로그인 페이지로
		//네이버 인증
		function naver(){

			var client_Id = "xezYicDH1SzVKNokPSX2";
			
			var url = "https://nid.naver.com/oauth2.0/authorize";
				url += "?response_type=code";
				url += "&client_id="+client_Id;
				url += "&redirect_uri=http://localhost:8888/finalProject/enrollForm.me";
				url += "&state=test";
				
				location.href=url;
		}
		
		//카카오 버튼 클릭시 카카오 로그인 페이지로
		function kakao(){
			
			//앱키
			appKey = "04c77a2f5ca75a521a0d0e08cbb740b3";
			
			var url = "https://kauth.kakao.com/oauth/authorize";
			url += "?client_id="+appKey;
			url += "&redirect_uri=http://localhost:8888/finalProject/enrollForm.me";
			url += "&response_type=code";
			
			location.href=url;
		}
	</script> 
</body>
</html>
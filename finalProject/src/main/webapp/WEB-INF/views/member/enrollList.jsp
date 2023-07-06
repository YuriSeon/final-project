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
/* fffff */
	#loginList{
		margin: auto;
		width: 1100px;
	}
	#loginList_head{
		text-align: center;
	}
	#loginList_head button{
		background-color: #f8f8f8;
		border: 1px solid rgb(202, 202, 202);
		border-radius: 3px;
		height: 40px;
		width: 260px;
	}
	#cerList{
		width: 260px;
		height: 150px;
		margin: auto;
		position: relative;
		top: 20px;
	}
	#cerName{
		border-top: 1.5px solid rgb(83, 83, 83);
		border-bottom: 1.5px solid rgb(83, 83, 83);
		height: 40px;
		background-color: rgb(247, 247, 247);
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 7px;
	}
	#cerName p{
		font-weight: 600;
		color: #949494;
	}
	#cerList_Tex{
		padding: 10px 80px 30px 80px;
	}
	#cerList_Tex *{
		float: left;
		background-color: white;
	}
	#cerList_Tex button{
		width: 100%;
		height: 100%;
		border:none;
	}
	.cerBtn{
		width: 50px;
    	height: 42px;
	}
	#naverImg{
		width: 100%;
		height: 100%;
	}
	#kakaoImg{
		width: 100%;
		height: 100%;
	}
  </style>
</head>
<body>
	
	<%@include file="../common/menubar.jsp" %>
	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div id="loginList">
		<div id="loginList_head">
	      <button type="button" onclick="location.href='enrollForm.me'">회원가입</button>		
		</div>
		<div id="cerList">
			<div id="cerName">
				<p>인증 후 회원가입</p>
			</div>
			<div id="cerList_Tex">
				<div class="cerBtn">
					<button type="button" onclick="naver();"><img src="/finalProject/resources/images/naverImg.png" id="naverImg"></button>
				</div>
				<div class="cerBtn">
					<button type="button" onclick="kakao();"><img src="/finalProject/resources/images/kakaoImg.png" id="kakaoImg"></button>
				</div>
			</div>
		</div>
	</div>
  
  <jsp:include page="../common/footer.jsp"/>
  
	<script>
		//네이버 버튼 클릭시 네이버 로그인 페이지로
		//네이버 인증
		function naver(){

			var client_Id = "xezYicDH1SzVKNokPSX2";
			var urlEnco = encodeURIComponent("http://localhost:8888/finalProject/enrollForm.me");
			
			var url = "https://nid.naver.com/oauth2.0/authorize";
				url += "?response_type=code";
				url += "&client_id="+client_Id;
				url += "&redirect_uri=http://localhost:8888/finalProject/enrollForm.me?certification=2";
				url += "&state=test";
				
			location.href=url;
		}
		
		//카카오 버튼 클릭시 카카오 로그인 페이지로
		function kakao(){
			
			//앱키
			appKey = "04c77a2f5ca75a521a0d0e08cbb740b3";
			
			var url = "https://kauth.kakao.com/oauth/authorize";
			url += "?client_id="+appKey;
			url += "&redirect_uri=http://localhost:8888/finalProject/enrollForm.me?certification=1";
			url += "&response_type=code";
			
			location.href=url;
		}
	</script> 
</body>
</html>
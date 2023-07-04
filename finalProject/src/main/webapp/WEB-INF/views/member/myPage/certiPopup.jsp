<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	display: flex;
	justify-content: center;
	align-items: center;	
	background-color: #eee;
}
.container {
/* 	border: 1px solid black;  */
	height: 500px;
	width: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
.container button{
	height: 50px;
	width: 300px;
	margin-bottom: 20px;
	border: 0;
	border-radius: 10px;
	font-size: 15px;
	font-weight: 600;
}
.box{
/*  	border: 1px solid black;  */
	width: 400px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding-top: 20px;
	
}
.title{
/* 	border: 1px solid; */
	width: 89%;
	height: 100px;
	text-align: center;
	border-radius: 12px 12px 12px 12px;
/* 	background-image: linear-gradient(98deg,#022c6c,#4970dd); */
	background-color: #567ff2;
	color: white;
}
.outline{
/* 	border: solid 2px ; */
	border-radius: 12px 12px 0 0;
	width: 400px;
	height: 290px;
	position: fixed;
	top: 50px;
}
#naver{
	background-color: #03c75a;
	color: white;
	z-index: 1;
}
#kakao{
	background-color: #fae100;
	z-index: 1;
}

#naver:hover,#kakao:hover{cursor: pointer;}

</style>
</head>
<body>
	<div class="outline"></div>
	<div class="title" style="position: absolute; top: 50px;">
		<h1>동행 인증</h1>
	</div>
	
	<div class="container">
		<div class="box">
			<button id="naver" onclick="naverCerti();">네이버 인증</button>
			<button id="kakao" onclick="kakaoCerti();">카카오 인증</button>
<!-- 			<button id="naver" onclick="naverLogout();" style="z-index: 3;">네이버 로그아웃</button> -->
<!-- 			<button id="naver" onclick="kakaoLogout();" style="z-index: 3;">카카오 로그아웃</button> -->
		</div>
	</div>
</body>
<script type="text/javascript">
	
	//네이버 인증
	function naverCerti() {
		var client_Id = "xezYicDH1SzVKNokPSX2";
		var urlEnco = encodeURIComponent("http://localhost:8888/finalProject/enrollForm.me");
		
		var url = "https://nid.naver.com/oauth2.0/authorize";
			url += "?response_type=code";
			url += "&client_id="+client_Id;
			url += "&redirect_uri=http://localhost:8888/finalProject/certi.me?certification=2";
			url += "&state=test";
			
		location.href=url;
		
	}
	
	//카카오 인증
	function kakaoCerti() {
		//앱키
		appKey = "04c77a2f5ca75a521a0d0e08cbb740b3";
		
		var url = "https://kauth.kakao.com/oauth/authorize";
		url += "?client_id="+appKey;
		url += "&redirect_uri=http://localhost:8888/finalProject/certi.me?certification=1";
		url += "&response_type=code";
		location.href=url;
	}
	
	//네이버 로그아웃
	var testPopUp;
	function openPopUp() {
	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp(){
	    testPopUp.close();
	}

	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
	}
	
	//카카오 로그아웃
	var testPopUp;
	function kopenPopUp() {
	    testPopUp= window.open("https://kauth.kakao.com/oauth/logout?client_id=04c77a2f5ca75a521a0d0e08cbb740b3&logout_redirect_uri=http://localhost:8888/finalProject/");
	    
	}
	function kclosePopUp(){
	    testPopUp.close();
	}

	function kakaoLogout() {
		kopenPopUp();
		setTimeout(function() {
			kclosePopUp();
			}, 1000);
	}
	
	
</script>
</html>
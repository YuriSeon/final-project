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
			<button id="naver">네이버 인증</button>
			<button id="kakao">카카오 인증</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$("button").clcik
	});
</script>
</html>
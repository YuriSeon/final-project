<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
</body>
<script type="text/javascript">
	$(function() {
// 		naverLogout();
// 		kakaoLogout();
	});
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
	var test2PopUp;
	function kopenPopUp() {
// 	    test2PopUp= window.open("https://kauth.kakao.com/oauth/logout?client_id=04c77a2f5ca75a521a0d0e08cbb740b3&logout_redirect_uri=http://localhost:8888/finalProject/");
	    var popupWindow = window.open("https://kauth.kakao.com/oauth/logout?client_id=04c77a2f5ca75a521a0d0e08cbb740b3&logout_redirect_uri=http://localhost:8888/finalProject/");

	    popupWindow.addEventListener('load', function() {
	    	var buttons = popupWindow.document.getElementsByClassName('buttonClass'); // 버튼의 클래스로 선택 (여러 개의 버튼 중에서)
	    	  if (buttons.length >= 2) {
	    	    var secondButton = buttons[1]; // 두 번째 버튼 선택
	    	    secondButton.click(); // 두 번째 버튼 클릭
	    	  }
	    });
	    
	}
	function kclosePopUp(){
	    test2PopUp.close();
	}

	function kakaoLogout() {
		kopenPopUp();
// 		setTimeout(function() {
// 			kclosePopUp();
// 			}, 1000);
	}
    
		window.close();
	    window.opener.location.reload();
    
</script>
</html>
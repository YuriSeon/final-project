<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css?v=1">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>마이페이지</title>
    <style type="text/css">
    	#container{
    		margin-top: 50px;
    	}
		.account_box .title {
		    position: relative;
		    display: block;
		    padding: 15px 38px 13px 18px;
		    border-radius: 12px 12px 0 0;
		    background-image: linear-gradient(98deg,#022c6c,#4970dd);
		}
		.account_box .title_text {
		    font-size: 18px;
		    font-weight: 700;
		    line-height: 20px;
		    letter-spacing: -.19px;
		    color: #fff;
		}
		.account_box .account_row {
		    border-radius: 0 0 12px 12px;
		    border-top: 0;
		}
		.account_row {
		    padding: 0 17px;
		    border-radius: 12px;
		    box-shadow: 1px 1px 10px 0 rgba(72,75,108,.08);
		    border: solid 1px #e3e9ed;
		    background-color: #fff;
		    box-sizing: border-box;
		}
		ol, ul {
		    list-style: none;
		}
		div {
		    display: block;
		}
		a {
		    text-decoration: none;
		    cursor: pointer;
		}
		h2 {
		    display: block;
		    font-size: 1.5em;
		    margin-block-start: 0.83em;
		    margin-block-end: 0.83em;
		    margin-inline-start: 0px;
		    margin-inline-end: 0px;
		    font-weight: bold;
		}
		.row_item {
		    position: relative;
		    padding: 10px 0 10px 30px;
		    border-bottom: 1px solid #bdc9d1;
		    margin-bottom: 10px;
		}
		.row_item input{
		    width: 300px;
		}
		.check_item input{
		    width: 40px;
		}
		.form-control{
		    display: inline-block;
		    background-color: #fff;
		}
		.row_item .item_text {
		    font-size: 16px;
		    font-weight: 500;
		    line-height: 24px;
		    letter-spacing: -.8px;
		    color: #303038;
		    word-break: break-all;
		    display: inline-block;
		    width: 150px;
		}
		.check_item .item_text{
		    width: 135px;
		}
		.row_item .btn_accent, .row_item .btn_edit, .row_item .btn_logout {
		    float: right;
		}
		.btn_accent, .btn_edit, .btn_logout {
		    display: inline-block;
		    min-width: 44px;
		    padding: 2px 9px 3px;
		    border-radius: 4px;
		    border: solid 1px rgba(212,216,229,.5);
		    background-color: rgba(212,216,229,.25);
		    box-sizing: border-box;
		    text-align: center;
		}
		.btn_accent .text, .btn_edit .text, .btn_logout .text {
		    font-size: 14px;
		    font-weight: 500;
		    line-height: 17px;
		    letter-spacing: -.47px;
		    color: #7b8994;
		}
		
		
		#deleteBox{
		    padding-top: 50px;
		    padding-left: 20px;
		    line-height: 40px;
		    border:2px solid #005BA6;
		    text-align: center;    
		}
		#deleteBox h4{
		    font-weight: 600; 
		    color: #005BA6;
		}
		#deleteBox h5{
			margin: 30px 0;
		}
		#deleteBox ul{
		    list-style: square !important; 
		    text-align: left; 
		    margin-left: 200px; 
		    margin-top: 30px;
		}
		.submit-btn{
		    text-align: center;
		}
		.submit-btn button{
		    padding: 10px;
		    border-radius: 10px;
		    background-color:#4970dd;
		    font-size: 18px;
		    font-weight: 600;
		    color: #fff;
		    border: none;
		    margin-right: 50px;
		    width: 150px;
		}
		#check{
		    zoom: 1.5;
		    position: relative;
		    top: 2px;
		}
		.account_box{
		    text-align: center;
		}
		#inputBox{
		    display: inline-block; 
		    margin: 40px 0;;
		    text-align: left;
		}
		#inputBox span{
		    display: inline-block;
		    width: 80px;
		    margin-bottom: 10px;
		}
		#inputBox input{
		    display: inline-block; 
		    width: 200px;
		}
	</style>
</head>
<body>
 	<%@include file="../../common/menubar.jsp" %>
<div id="container" class="container">
<!-- container -->
    <div id="content" class="content">
        <div class="naverid_wrap" role="main">
        <!--개인정보 변경-->
            <div class="account_box" style="width: 1000px; margin: auto;">
                <a href="#" class="title" style="cursor: default;">
                    <h2 class="title_text">회원 탈퇴</h2>
                </a>
                <div id="deleteBox"> 
                    <h4>회원탈퇴를 신청하기 전 안내 사항을 꼭 확인해 주세요.</h4>
                    <ul>
                        <li>사용하고 계신 아이디(${loginUser.userId})는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</li>
                        <li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</li>
                        <li>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</li>
                    </ul>
                    <input type="checkbox" name="" id="check">
                    <label for="check"><h5>안내 사항을 모두 확인하였으며, 이에 동의합니다.</h5></label>
                </div>
                
                <div id="inputBox">
                    <span>성명</span>
                    <input type="text" class="form-control input-lg" name="" id="userName">
                    <br>
                    <span>비밀번호</span>
                    <input type="password" class="form-control input-lg pwd-input" name="" id="userPwd">
                </div>
            </div>
            <div class="submit-btn">
                <button type="button" onclick="InfoDelete();">탈퇴</button>
                <button type="button" onclick="history.back();">취소</button>
            </div>
			<!-- form 끝 -->
		</div>
	</div>
	<!-- Content - End  -->
</div>
<!-- container end -->        
    <script>
    //탈퇴
	function InfoDelete() {
		var $check = $("#check");
		
		//체크 유무 확인
		if ($check.is(":checked")) {
			
			$.ajax({
	    		type: "post",
	    		url: "myInfoDelete.me",
	    		data: {	
	    			userId : "${loginUser.userId}",
	    			userName : $("#userName").val(),
	    			userPwd : $(".pwd-input").val()
	    		},
				success: function(result) {
					if(result=="success"){
						window.location.href = "/finalProject/index.jsp";
					}else{
						alert("비밀번호를 확인해주세요.");
					}
				},
				error: function(result) {
					console.log("통신실패");
				}
	    	});	
		}else {
			alert("탈퇴 안내를 확인하고 동의해 주세요.");
		}
	}    
		
    		
    </script>
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
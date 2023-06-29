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
		    display: inline-block !important;
		}
		.check_item input{
		    width: 40px;
		}
		.form-control{
		    display: inline-block;
		    background-color: #fff !important;
		}
		.row_item .item_text {
		    font-size: 16px;
		    font-weight: 500;
		    line-height: 24px;
		    letter-spacing: -.8px;
		    color: #303038;
		    word-break: break-all;
		    display: inline-block !important;
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
		
		
		[include*="form-input-select()"] {
		  display: block;
		  padding: 0;
		  position: relative;
		  color: #005BA6;
		  display: inline-block;
		  border-radius: 0;
		  box-shadow: none;
		  font-size: 16px;
		  margin-top: 9px;
		  margin-bottom: 15px;
		  width: 300px;
		}
		[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
		  content: "";
		  display: block;
		  position: absolute;
		  pointer-events: none;
		  z-index: 2;
		}
		[include*="form-input-select()"] select {
		  -webkit-appearance: none;
		  -moz-appearance: none;
		       appearance: none;
		  background: none;
		  box-sizing: border-box;
		  width: 100%;
		  margin: 0;
		  border: 1px solid transparent;
		  font-size: 16px;
		  outline: none;
		  /* Focus style */
		}
		[include*="form-input-select()"] select:focus {
		  background-color: transparent;
		  outline: none;
		}
		[include*="form-input-select()"] option {
		  font-weight: normal;
		}
		[include*="form-input-select()"] x:-o-prefocus, [include*="form-input-select()"]::after {
		  display: none;
		}
		@media screen and (-ms-high-contrast: active), (-ms-high-contrast: none) {
			[include*="form-input-select()"] select::-ms-expand {
				display: none;
			}
			[include*="form-input-select()"] select:focus::-ms-value {
				background: transparent;
				color: #000;
			}
		}
		@-moz-document url-prefix() {
			[include*="form-input-select()"] {
				overflow: hidden;
			}
			[include*="form-input-select()"] select {
				width: 120%;
				width: calc(100% + 3em);
			}
			@supports (-moz-appearance: none) {
				[include*="form-input-select()"] select {
					width: 100%;
				}
			}
			[include*="form-input-select()"] select:-moz-focusring {
				color: transparent;
				text-shadow: 0 0 0 #000;
			}
		}
		@supports (-moz-appearance: none) {
			[include*="form-input-select()"] {
				width: 100%;
			}
		}
		[include*="form-input-select()"]::before, [include*="form-input-select()"]::after {
		  content: "";
		  display: block;
		  position: absolute;
		  pointer-events: none;
		  border: 1px solid transparent;
		  width: 0;
		  height: 0;
		  right: 16px;
		}
		[include*="form-input-select()"]::before {
		  bottom: 55%;
		  border-width: 0 6.5px 8px 6.5px;
		  border-bottom-color: #D6D6D6;
		}
		[include*="form-input-select()"]::after {
		  border-width: 8px 6.5px 0 6.5px;
		  border-top-color: #D6D6D6;
		  top: 55%;
		}
		@-moz-document url-prefix() {
			[include*="form-input-select()"] {
				border-right: 3px solid #E6E6E6;
			}
			[include*="form-input-select()"]:hover {
				border-right: 3px solid #005BA6;
			}
		}
		[include*="form-input-select()"]:hover select {
		  box-shadow: 0 2px 3px rgba(0, 91, 166, 0.1) inset;
		  border-color: #005BA6;
		}
		[include*="form-input-select()"]:hover select:focus {
		  outline-color: transparent;
		}
		[include*="form-input-select()"]:hover::before {
		  border-bottom-color: #005BA6;
		}
		[include*="form-input-select()"]:hover::after {
		  border-top-color: #005BA6;
		}
		[include*="form-input-select()"] select {
		  border: 3px solid #E6E6E6;
		  border-radius: 0;
		  font-weight: 400;
		  color: inherit;
		  padding: 11px 15px;
		  line-height: normal;
		  transition: border-color 0.2s ease, outline 0.2s ease;
		}
		[include*="form-input-select()"] select:focus {
		  box-shadow: 0 3px 4px rgba(0, 91, 166, 0.3) inset;
		  outline: 3px solid #005BA6;
		  outline-offset: -3px;
		}
		[include*="form-input-select()"] select[disabled], [include*="form-input-select()"] select:disabled {
		  opacity: 0.4;
		  cursor: not-allowed;
		}
		[include*="form-input-select()"] select:not(:focus):invalid {
		  color: #C7C7C7;
		}
		
		.submit-btn{
		    text-align: center;
		}
		.update-form button{
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
	</style>
</head>
<body>
 	<%@include file="../../common/menubar.jsp" %>
<div id="container" class="container">
<!-- container -->
    <div id="content" class="content">
 	<!-- Content - Start  -->
        <div class="naverid_wrap" role="main">
        	<!--개인정보 변경-->
	        <form action="myInfoUpdate.me" method="post" class="update-form" id="insertForm">
	        	<input type="text" name="userNo" value="${loginUser.userNo}" hidden="hidden">
	        	<input type="text" name="userId" value="${loginUser.userId}" hidden="hidden">
	            <div class="account_box" style="width: 700px; margin: auto;">
	                <a href="#" class="title" style="cursor: default;">
	                    <h2 class="title_text">개인정보 변경</h2>
	                </a>
	
	                <ul class="account_row">
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">이름</span>
	                            <input type="text" class="form-control input-lg" name="userName" id="" value="${loginUser.userName}" readonly>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">닉네임</span>
	                            <input type="text" class="form-control input-lg" name="nickname" id="nickname" value="${loginUser.nickname}">&nbsp;
	                            <div id="nick_check" style="display: inline-block; width: 160px; word-break: break-all;"></div>
	                            <br>
	                            <span style="display: inline-block; width: 150px;"></span>
	                            <div style="display: inline-block; font-size: 12px; color: grey;">2~8자의 한글,영문,숫자만 사용 가능합니다.</div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">비밀번호</span>
	                            <input type="password" class="form-control input-lg" name="userPwd" id="userPwdUp">
	                            <div id="pwd_Upcheck" style="display: inline-block; width: 160px; word-break: break-all;"></div>
	                            <br>
	                            <span style="display: inline-block; width: 150px;"></span>
	                            <div style="display: inline-block; font-size: 12px; color: grey;">8~16자 영문 대•소문자, 숫자, 특수문자(! . , ~만 사용 가능합니다.)</div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">비밀번호 확인</span>
	                            <input type="password" class="form-control input-lg" name="" id="userPwdCk" onblur="pwdChEvent()">
	                            <div id="pwdCk_check" style="display: inline-block; width: 160px; word-break: break-all;"></div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">이메일</span>
	                            <input type="text" class="form-control input-lg" name="email" id="email" value="${loginUser.email}" placeholder="email@email.com">
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">전화번호</span>
	                            <input type="text" class="form-control input-lg" name="phone" id="phone" value="${loginUser.phone}" maxlength="11">
	                            <div id="phone_check" style="display: inline-block; width: 160px; word-break: break-all;"></div>
	                            <br>
	                            <span style="display: inline-block; width: 150px;"></span>
	                            <div style="display: inline-block; font-size: 12px; color: grey;">(-제외) 번호 11자리를 입력해주십시오.</div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name">
	                            <span class="item_text">MBTI</span>
	                            <div include="form-input-select()">
	                                <select name="MBTI" id="MBTI">
	                                    <option value="" hidden>선택</option>
	                                    <!-- normal options -->
	                                    <option value="ENTJ">ENTJ</option>
	                                    <option value="ENTP">ENTP</option>
	                                    <option value="ENFJ">ENFJ</option>
	                                    <option value="ENFP">ENFP</option>
	                                    <option value="ESTJ">ESTJ</option>
	                                    <option value="ESFJ">ESFJ</option>
	                                    <option value="ESTP">ESTP</option>
	                                    <option value="ESFP">ESFP</option>
	                                    <option value="INTJ">INTJ</option>
	                                    <option value="INTP">INTP</option>
	                                    <option value="INFJ">INFJ</option>
	                                    <option value="INFP">INFP</option>
	                                    <option value="ISTJ">ISTJ</option>
	                                    <option value="ISFJ">ISFJ</option>
	                                    <option value="ISTP">ISTP</option>
	                                    <option value="ISFP">ISFP</option>
	                                </select>
	                              </div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name check_item">
	                            <span class="item_text">여행스타일</span>
	                            <input id="activity" value="액티비티" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="activity">액티비티</label>
	                            <input id="healing" value="힐링" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="healing">힐링</label>
	                            <input id="picture" value="인생샷" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="picture">인생샷</label>
	                            <input id="sea" value="바다" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="sea">바다</label>
	                            <input id="mountain" value="산" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="mountain">산</label>
	                            <br>
	                            <span style="display: inline-block; width: 135px;"></span>
	                            <input id="animal" value="반려동물" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="animal">반려동물</label>
	                            <input id="history" value="역사" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="history">역사</label>
	                            <input id="experience" value="체험활동" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="experience">체험활동</label>
	                            <input id="food" value="맛집탐방" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="food">맛집탐방</label>
	                            <br>
	                            <span style="display: inline-block; width: 135px;"></span>
	                            <input id="shoping" value="쇼핑" name="style" type="checkbox" onClick="check_count(this)"/>
					            <label for="shoping">쇼핑</label>
					            <br>
					            <span style="display: inline-block; width: 150px;"></span>
	                            <div style="display: inline-block; font-size: 12px; color: grey;">선호하는 여행 스타일(5개까지 입력 가능)</div>
	                        </div>
	                    </li>
	                    <li>
	                        <div class="row_item name check_item">
	                            <span class="item_text">관심사</span>
	                            <input id="theme" name="interestOp" value="테마여행" type="checkbox" onclick="inte(this)"/>
					            <label for="theme">테마여행</label>
	                            <input id="festival" name="interestOp" value="축제" type="checkbox" onclick="inte(this)"/>
					            <label for="festival">축제</label>
	                            <input id="sights" name="interestOp" value="명소/맛집" type="checkbox" onclick="inte(this)"/>
					            <label for="sights">명소 / 맛집</label>
	                            <input id="together" name="interestOp" value="동행구하기" type="checkbox" onclick="inte(this)"/>
					            <label for="together">동행구하기</label>
					            <span style="display: inline-block; width: 135px; margin-right: 10px;"></span>
	                            <div style="display: inline-block; font-size: 12px; color: grey;">관심 순서에 따라 메인페이지 화면이 바뀌어요!</div>
					            <br>
					            <span style="display: inline-block; width: 135px; margin-right: 10px;"></span>
					            <div id="inte_view" style="display: inline-block; font-size:16px; color: #4970dd; font-weight: bold;"></div>
					            <input type="hidden" name="interest" id="interest">
	                        </div>
	                    </li>
	                </ul>
	            </div>
	            <br>
	            <div class="submit-btn">
	                <button type="submit" onclick="return joinChk();">수정</button>
	                <button type="reset">초기화</button>
	                <button type="button" id="back">취소</button>
	            </div>
	        </form>
			<!-- form 끝 -->
		</div>
	</div>
	<!-- Content - End  -->
</div>
<!-- container end -->        
    <script>
    
    	//mbti랑 style 미리 체크
    	$(function() {
    		var mbti = "${loginUser.MBTI}";
    		var style = "${loginUser.style}";
    		var styleArr = style.split(','); 
    		var checkboxes = $("input[name=style]");
    		
    		checkboxes.each(function() {
				var checkbox = $(this);
				if ($.inArray(checkbox.val(), styleArr) !== -1) {
					checkbox.prop("checked", true);
				}
			});
    		
			$("#MBTI").val(mbti).prop("selected",true);
			
		});
    
    	//뒤로가기
    	$("#back").click(function() {
			window.history.back();
		});
    	
	    /* 닉네임 중복 및 유효성 검사 */
		var oldNick = $("#nickname").val();
	    var nickResult = "NNNNN";
		$("#nickname").keyup(function(){
			
			if($("#nickname").val().trim().length>=2){
				//console.log($inputNick.val().trim().length);
				$("#nick_check").show();
				
				$.ajax({
					url : "nickCheck.me",
					data : {checkNick : $("#nickname").val()},
					success : function(result){
						if(result=="NNNNN" && $("#nickname").val() != oldNick){//중복 있을때				
							$("#nick_check").css({"color":"red","font-size":"12px"}).text("중복된 닉네임이 존재합니다.");
							nickResult = result;
						}else{//닉네임 중복 없을때
							$("#nick_check").css({"color":"green","font-size":"12px"}).text("사용 가능한 닉네임 입니다.");
							nickResult = result;
						
							//닉네임 유효성 검사
							var regExp = /^[가-힣a-zA-Z0-9]+$/;
	
							if(!(regExp.test($("#nickname").val()))){
								$("#nick_check").css({"color":"red","font-size":"12px"}).text("닉네임 형식이 올바르지 않습니다.");
							} 
						}
					}
				})
			}else{ //2글자 미만일때
				$("#nick_check").hide();
			}
		});
		
		//비밀번호 유효성 검사
		var $userPwd = $("#userPwdUp");
		$userPwd.keyup(function(){
			if($userPwd.val().trim().length>=8){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
				$("#pwd_Upcheck").show();
				
				var regExp = /^[a-zA-Z0-9!.,~]+$/;
				
				if(!(regExp.test($userPwd.val()))){ //조건에 맞지 않으면
					$("#pwd_Upcheck").css({"color":"red","font-size":"12px"}).text("비밀번호 형식이 올바르지 않습니다.");
				}else{//조건에 맞으면
					$("#pwd_Upcheck").css({"color":"green","font-size":"12px"}).text("사용 가능한 비밀번호 입니다.");
				}
			}else{
				$("#pwd_Upcheck").css({"color":"red","font-size":"12px"}).text("8글자 이상 입력해주세요.");
			}
			if ($userPwd.val().trim().length === 0) {
				$("#pwd_Upcheck").hide();
			}
		});
		
		//비밀번호 확인 (키업으로 비밀번호 지울시 text없애주기)
		$("#userPwdCk").keyup(function(){
			$("#pwdCk_check").text("");
		});
		
		/* 비밀번호 확인(onblur이벤트로 포커스 해지시 발동... 비번,비번확인 일치하는지 ck) */
		function pwdChEvent(){
			if($("#userPwdUp").val()!=$("#userPwdCk").val()){
				$("#pwdCk_check").show();
				$("#pwdCk_check").css({"color":"red","font-size":"12px"}).text("비밀번호가 일치하지 않습니다.");
			}else{
				$("#pwdCk_check").css({"color":"green","font-size":"12px"}).text("비밀번호가 일치합니다.");
			}
			if ($("#userPwdCk").val().length === 0) {
				$("#pwdCk_check").hide();
			}
		}
		
		/* 휴대전화 */
		$("#phone").keyup(function(){
			
			if($("#phone").val().trim().length>=1){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
				
				$("#phone_check").show();
				
				var regExp = /^[0-9]+$/;
				
				if(!(regExp.test($("#phone").val()))){ //조건에 맞지 않으면
					$("#phone_check").css({"color":"red","font-size":"12px"}).text("번호만 입력해 주십시오. (-제외)");
				}else{//조건에 맞으면
// 					$("#phone_check").hide();
					$("#phone_check").css({"color":"green","font-size":"12px"}).text("사용가능한 번호입니다.");
				}
			}else {
				$("#phone_check").hide();
			}
		});
		
		//서브밋 버튼 유효성 검사
		function joinChk() {
			//닉네임
			//중복 검사 포커스
			var newNick = $("#nickname").val();
			if(nickResult == "NNNNN" && newNick != oldNick){//중복 닉네임 있으면 포커스 맞춤
				$("#nickname").focus();
				return false;
			};
			//유효성 검사 포커스
			var regExp = /^[가-힣a-zA-Z0-9]+$/;
			if(!(regExp.test($("#nickname").val()))){
				$("#nickname").focus();
				return false;
			}
			//2글자 아래시 포커스 맞춰주기
			if($("#nickname").val().trim().length<2){
				$("#nick_check").css({"color":"red","font-size":"12px"}).text("1글자 이상 입력해주세요.");
				$("#nick_check").show();
				$("#nickname").focus();
				return false;
			}
			
			//이메일
			var regEmail = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			if($("#email").val() === "") {             
				$("#email").focus();	
				return false;
			}   
			if(!(regEmail.test($("#email").val())))	{
				$("#email").focus();
				return false;
			}
			
			//휴대전화
			//숫자외 다른 글씨 눌렀을때
			var regPhone = /^[0-9]+$/;
			if(!(regPhone.test($("#phone").val()))){
				$("#phone").focus();
				return false;
			}
			if($("#phone").val() === "") {             
				$("#phone").focus();	
				return false;
			}
			
			//비밀번호
			var $userPwd = $("#insertForm input[name=userPwd]");
			if ($userPwd.val() === "") {
				return true;
			}
			
			//유효성 검사 포커스
			var regPwd = /^[a-zA-Z0-9!.,~]+$/;
			if(!(regPwd.test($userPwd.val()))){
				$userPwd.focus();
				return false;
			}
			
			//8자리 아래시 포커스 맞춰주기
			if($userPwd.val().trim().length<8){
				$("#pwd_Upcheck").css({"color":"red","font-size":"12px"}).text("8글자 이상 입력해주세요.");
				$("#pwd_Upcheck").show();
				$userPwd.focus();
				return false;
			} 
			
			//비밀번호 확인 != 비밀번호시
			if($userPwd.val()!=$("#userPwdCk").val()){
				$("#pwdCk_check").css({"color":"red","font-size":"12px"}).text("비밀번호와 일치하지 않습니다.");
				$("#pwdCk_check").show();
				$("#userPwdCk").focus();
				return false;
			}
		}
		
		
		/* 관심사 순서대로 넘기기 */
		var inteCheckArr = [];
		
		function inte(checkbox){
			
			if(checkbox.checked){//체크 하면
				inteCheckArr.push(checkbox.value);
			}else{//체크 안하면
				var index = inteCheckArr.indexOf(checkbox.value);
				if(index !== -1){//일치하는 요소가 있으면 (없을때 -1반환)
					inteCheckArr.splice(index,1); //값 제거
				}
			}
			//구분자 넣어주기
			$("#interest").val(inteCheckArr.join('-'));
			//div에 띄워주기
			$("#inte_view")[0].innerText = $('#interest').val();
		}
		
		/* 여행 스타일 5개로 제한하기  */
		function check_count(ch){
			
			var chkBox = document.getElementsByName("style");
			var count = 0;
			//console.log(chkBox)
			
			for(var i=0; i<chkBox.length; i++){
				if(chkBox[i].checked){
					count++;//체크하면 카운트 증가
					$("#style_check").hide(); //경고문구는 안보이게
				}
			}
			if(count>5){//체크 5개 이상되면 경고 문구와 체크 막기
				$("#style_check").show();
				$("#style_check").css("color","red").text("5개 이상은 체크할 수 없습니다.");
				ch.checked = false;
				return false;
			}
		}
    </script>
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
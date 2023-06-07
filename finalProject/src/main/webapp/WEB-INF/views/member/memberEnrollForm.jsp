<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		@import url("https://fonts.googleapis.com/css?family=Lato:300,400,700");
 		.container_1 *{
			box-sizing: border-box;
			display : inline-block;
			height:auto;
		}

		.container_1 *, .container_1 *::after, .container_1 *::before,
		.container_2 *, .container_2 *::after, .container_2 *::before{
  			box-sizing: inherit;
		}

		div.fancy-select ul.options li, div.fancy-select ul.options.overflowing.open, div.fancy-select ul.options.overflowing, div.fancy-select ul.options.open, div.fancy-select ul.options, div.fancy-select div.trigger, [type=checkbox]:not(:checked) + label:before,
		[type=checkbox]:checked + label:before, .container_1 button, .container_2 button, .auto-textarea, .field-bar, .float-label, input[type=text],
		input[type=email],input[type=password], input[type=number],
		textarea {
  			-webkit-transition: all 0.25s ease-out;
  			-moz-transition: all 0.25s ease-out;
  			transition: all 0.25s ease-out;
		}
		body {
  			background: #efefef;
  			box-sizing: border-box;
  			font-family: "Lato";
		}
		
		.container_1, .container_2 {
  			max-width: 600px;
  			margin-left: auto;
  			margin-right: auto;
  			margin: 2rem auto;
  			background: #fff;
 			padding: 3rem 2rem;
  			border-radius: 1rem;
			}
		.::after {
  			clear: both;
  			content: "";
  			display: block;
		}

		.field-wrapper {
  			float: left;
  			display: block;
  			margin-right: 2.3576520234%;
  			width: 100%;
  			position: relative;
  			margin-bottom: 2.5rem;
  			height: 35px;
		}
		.field-wrapper:last-child {
  			margin-right: 0;
		}

		.field-wrapper-half {
  			float: left;
  			display: block;
  			margin-right: 2.3576520234%;
			width: 48.8211739883%;
		}
		.field-wrapper-half:last-child {
  			margin-right: 0;
		}
		.field-wrapper-half:nth-child(2n+1) {
  			margin-right: 0;
		}

		.button-wrapper {
  			float: left;
  			display: block;
  			margin-right: 2.3576520234%;
  			width: 100%;
		}
		.button-wrapper:last-child {
  			margin-right: 0;
		}

		input[type=text],
		input[type=email],
		input[type=password],
		input[type=number],
		textarea {
  			border: 0;
  			border-bottom: 1px solid #929292;
  			box-shadow: 0px 1px 0px #fff;
  			color: #929292;
  			display: block;
  			font-size: 0.9rem;
  			font-weight: 300;
  			height: 30px;
  			vertical-align: middle;
  			width: 100%;
		}
		input[type=text]::placeholder,
		input[type=email]::placeholder,
		input[type=password]::placeholder,
		input[type=number]::placeholder,
		textarea::placeholder {
  			opacity: 0;
		}
		input[type=text]::-webkit-input-placeholder,
		input[type=email]::-webkit-input-placeholder,
		input[type=password]::-webkit-input-placeholder,
		input[type=number]::-webkit-input-placeholder,
		textarea::-webkit-input-placeholder {
  			color: #ddd;
  			font-family: "Lato";
  			opacity: 0;
		}
		input[type=text]:focus, input[type=text]:valid,
		input[type=email]:focus,
		input[type=password]:focus,
		input[type=number]:focus,
		input[type=email]:valid,
		input[type=password]:valid,
		input[type=number]:valid,
		textarea:focus,
		textarea:valid {
		  	outline: 0;
		}
		input[type=text]:focus::placeholder, input[type=text]:valid::placeholder,
		input[type=email]:focus::placeholder,
		input[type=password]:focus::placeholder,
		input[type=number]:focus::placeholder,
		input[type=email]:valid::placeholder,
		input[type=password]:valid::placeholder,
		input[type=number]:valid::placeholder,
		textarea:focus::placeholder,
		textarea:valid::placeholder {
		  	opacity: 1;
		}
		input[type=text]:focus::-webkit-input-placeholder, input[type=text]:valid::-webkit-input-placeholder,
		input[type=email]:focus::-webkit-input-placeholder,
		input[type=password]:focus::-webkit-input-placeholder,
		input[type=number]:focus::-webkit-input-placeholder,
		input[type=email]:valid::-webkit-input-placeholder,
		input[type=password]:valid::-webkit-input-placeholder,
		input[type=number]:valid::-webkit-input-placeholder,
		textarea:focus::-webkit-input-placeholder,
		textarea:valid::-webkit-input-placeholder {
		  	opacity: 1;
		}
		
		.float-label {
			color: #598c93;
			text-transform: uppercase;
			font-size: 0.75rem;
			font-weight: bold;
			position: absolute;
			pointer-events: none;
			top: 8px;
		}
		
		.field-bar {
			-webkit-transform: translateX(-50%);
			-moz-transform: translateX(-50%);
			-ms-transform: translateX(-50%);
			-o-transform: translateX(-50%);
			transform: translateX(-50%);
			position: relative;
			left: 50%;
			height: 2px;
			width: 0%;
			display: block;
			background: #598c93;
			top: -1px;
			z-index: 1;
		}
		
		/* active state */
		.float-field:focus ~ label,
		.float-field:valid ~ label,
		textarea:focus ~ label,
		textarea:valid ~ label,
		.fancy-select.selected ~ label,
		.fancy-select.open ~ label {
			top: -20px;
			font-size: 0.75rem;
			color: #009688;
		}
		
		.trigger ~ label {
		  	color: red;
		}
		
		input[type=text]:focus ~ .field-bar,
		input[type=text]:valid ~ .field-bar,
		input[type=email]:focus ~ .field-bar,
		input[type=password]:focus ~ .field-bar,
		input[type=number]:focus ~ .field-bar,
		input[type=email]:valid ~ .field-bar,
		input[type=password]:valid ~ .field-bar,
		input[type=number]:valid ~ .field-bar,
		.fancy-select.selected ~ .field-bar,
		.fancy-select.open ~ .field-bar,
		textarea:focus ~ .field-bar,
		textarea:valid ~ .field-bar {
		  	width: 100%;
		}
		
		select {
			appearance: none;
			-webkit-appearance: none;
			background: #fff;
			border: 0;
			border-bottom: 1px solid #929292;
			border-radius: 0;
			color: #598c93;
			font-family: "Lato";
			font-size: 0.75rem;
			font-weight: bold;
			height: 30px;
			position: relative;
			text-transform: uppercase;
			width: 100%;
		}
		select ~ label {
		  	opacity: 1;
		}
		select:focus {
		  	outline: none;
		}
		select:focus ~ .field-bar {
		  	width: 100%;
		}
		select:focus ~ label {
		  	opacity: 1;
		}
		
		.auto-textarea {
			resize: none;
			overflow: hidden;
			line-height: 1.6;
			height: 60px;
			padding-bottom: 0.5rem;
		}
		
		.container_1 button, .container_2 button {
		  	background: #598c93;
		  	border: 0;
		  	border-radius: 1.5rem;
		  	box-shadow: 4px 4px 5px rgba(146, 146, 146, 0.4);
		  	color: #fff;
		 	font-family: "Lato";
		  	font-size: 0.75rem;
		  	letter-spacing: 0.75px;
		  	padding: 0.5rem 2.5rem;
		  	text-transform: uppercase;
		  	font-weight: bold;
		}
		.container_1 button:hover, .container_2 button:hover {
		  	background: #466e73;
		}
		
		.checkbox-title {
		  	color: #598c93;
		  	text-transform: uppercase;
		  	font-size: 0.75rem;
		  	font-weight: bold;
		  	pointer-events: none;
		  	display: inline-block;
		  	margin-right: 1rem;
		}
		
		.checkbox-wrapper {
		  	display: inline-block;
		  	margin: 0 0.5rem;
		}
		
		[type=checkbox] + label {
		  	color: #929292;
		  	font-size: 0.75rem;
		}
		
		[type=checkbox]:not(:checked),
		[type=checkbox]:checked {
		  	position: absolute;
		  	left: -9999px;
		}
		
		[type=checkbox]:not(:checked) + label,
		[type=checkbox]:checked + label {
		  	position: relative;
		  	padding-left: 1.95em;
		  	cursor: pointer;
		}
		
		[type=checkbox]:not(:checked) + label:before,
		[type=checkbox]:checked + label:before {
		  	content: "";
		  	position: absolute;
		  	left: 2px;
		  	top: 0px;
		  	width: 1rem;
		  	height: 1rem;
		  	border: 2px solid #598c93;
		  	background: #fff;
		  	border-radius: 2px;
		}
		
		[type=checkbox]:checked + label:before {
		  	background: #598c93;
		}
		
		div.fancy-select {
		  	position: relative;
		  	font-weight: bold;
		  	text-transform: uppercase;
		  	font-size: 13px;
		  	color: #46565d;
		  	border-bottom: 1px solid #929292;
		}
		
		div.fancy-select.disabled {
		  	opacity: 0.5;
		}
		
		div.fancy-select select:focus + div.trigger {
		  	background: rgba(146, 146, 146, 0.1);
		}
		
		div.fancy-select select:focus + div.trigger.open {
		  	box-shadow: none;
		}
		
		div.fancy-select div.trigger {
		  	border-radius: 0;
		  	cursor: pointer;
		  	padding: 8px 24px 8px 0;
		  	white-space: nowrap;
		  	overflow: hidden;
		  	text-overflow: ellipsis;
		  	position: relative;
		  	background: #fff;
		  	color: #598c93;
		  	height: 30px;
		  	width: 100%;
		}
		
		div.fancy-select div.trigger:after {
		  	content: "";
		  	display: block;
		  	position: absolute;
		  	width: 0;
		  	height: 0;
		  	border: 5px solid transparent;
		  	border-top-color: #4b5468;
		  	top: 15px;
		  	right: 9px;
		}
		
		div.fancy-select div.trigger.open {
		  	background: #fff;
		  	color: #598c93;
		  	box-shadow: none;
		}
		
		div.fancy-select div.trigger.open:after {
		  	border-top-color: #7a8498;
		}
		
		div.fancy-select ul.options {
		  	list-style: none;
		  	border: 1px solid #eee;
		  	margin: 0;
		  	position: absolute;
		  	top: 32px;
		  	left: 0;
		  	padding-left: 0;
		  	visibility: hidden;
		  	opacity: 0;
		  	z-index: 50;
		  	max-height: 200px;
		  	overflow: auto;
		  	background: #fff;
		  	min-width: 100%;
		}
		
		div.fancy-select ul.options.open {
		  	visibility: visible;
		  	top: 32px;
		  	opacity: 1;
		  	/* have to use a non-visibility transition to prevent this iOS issue (bug?): */
		  	/*http://stackoverflow.com/questions/10736478/css-animation-visibility-visible-works-on-chrome-and-safari-but-not-on-ios*/
		}
		
		div.fancy-select ul.options.overflowing {
		  	top: auto;
		  	bottom: 40px;
		}
		
		div.fancy-select ul.options.overflowing.open {
		  	top: auto;
		  	bottom: 50px;
		}
		
		div.fancy-select ul.options li {
		  	padding: 8px 12px;
		  	color: #929292;
		  	cursor: pointer;
		  	white-space: nowrap;
		  	font-weight: normal;
		  	text-transform: none;
		  	transition: all 150ms ease-out;
		}
		
		div.fancy-select ul.options li.selected {
		  	background: #598c93;
		  	color: #fff;
		}
		
		div.fancy-select ul.options li.hover {
		  	background: #598c93;
		  	color: #fff;
		}
		#id_fail, #pwd_fail, #nick_fail{
			font-size: 12px;
			color: red;
		}
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
    		-webkit-appearance: none;
    		margin: 0;
		}
	</style>

</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<hr style="position:relative; top:-10px;">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

	<div class="container_1" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199);">
	<form action="">
		<div style="color:#598c93; font-size:14px; position:relative; top:-30px;">*필수 입력사항입니다.<br>(추후 입력사항과 인증정보가 다를시 게시판 이용이 제한될 수 있습니다.)</div>
		<!-- 아이디 -->
	  	<div class="field-wrapper">
	    	<input type="text" maxlength="12" name="userId" class="float-field" placeholder="5~12자의 영문(소문자), 숫자만 사용 가능합니다." required/>
	    	<label for="name" class="float-label">아이디</label>
	    	<div class="field-bar"></div>
	   		<!-- <div id="id_fail">사용할 수 없는 아이디입니다.</div> -->
	  	</div>
 		<!-- 닉네임 -->
 		<div class="field-wrapper">
	   		<input type="text" maxlength="8" name="nickname" class="float-field" placeholder="8자까지의 한글,영문(소문자),숫자만 사용 가능합니다." required/>
	   		<label for="nickname" class="float-label">닉네임</label>
	   		<div class="field-bar"></div>
	   		<!-- <div id="nick_fail">사용할 수 없는 닉네임입니다.</div> -->
 		</div>
  		<!-- 비밀번호 -->
 			<div class="field-wrapper">
    		<input type="password" maxlength="16" name="userPwd" placeholder="8~16자 영문 대•소문자, 숫자, 특수문자(! . , ~만 사용 가능합니다.)" class="float-field" required/>
    		<label for="userPwd" class="float-label">비밀번호</label>
    		<div class="field-bar"></div>
	   		<!-- <div id="pwd_fail">사용할 수 없는 비밀번호입니다.</div> -->
 		</div>
  		<!-- 비밀번호 확익 -->
	  	<div class="field-wrapper">
	    	<input type="password" maxlength="16" name="checkPwd" placeholder="비밀번호와 똑같이 입력해주십시오." class="float-field" required/>
	    	<label for="checkPwd" class="float-label">비밀번호 확인</label>
	    	<div class="field-bar"></div>
	    	<!-- <div id="pwd_fail">비밀번호가 다릅니다.</div> -->
	  	</div>
	  	<!-- 이름 -->
	  	<div class="field-wrapper">
	    	<input type="text" maxlength="12" name="userName" class="float-field" placeholder="성함을 입력해주십시오." required/>
	   		<label for="userName" class="float-label">이름</label>
	   		<div class="field-bar"></div>
	   		<!-- <div id="id_fail">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</div> -->
	  	</div>
	  	<!-- 생년월일 -->
	  	<div class="field-wrapper" style="height:23px;">
	   		<input type="number" name="birthDay" placeholder="생년월일 6자리를 입력해주십시오." class="float-field" required />
    		<label for="birthDay" class="float-label">생년월일</label>
	   		<div class="field-bar"></div>
	   		<!-- <div id="id_fail">숫자만 입력해주십시오.</div> -->
	  	</div>
	  	<!-- 성별 -->
	  	<div class="field-wrapper" style="font-size: 13px; color: #598c93; height: 3px;">
    		<div class="checkbox-title">성별</div>
		    <div class="checkbox-wrapper">
				<input type="radio" id="gender_1" name="gender" value="1"/>
			    <label for="gender_1">남자</label>
			</div>
			<div class="checkbox-wrapper">
				<input type="radio" id="gender_2" name="gender" value="2"/>
			    <label for="gender_2">여자</label>
			</div>
		</div>
	  	<!-- 휴대전화 -->
	  	<div class="field-wrapper" >
	    	<input type="number" name="phone" placeholder="(-제외) 핸드폰 번호 11자리를 입력해주십시오." class="float-field" required />
    		<label for="phone" class="float-label">휴대전화</label>
	    	<div class="field-bar"></div>
	    	<!-- <div id="id_fail">숫자만 입력해주십시오.</div> -->
	  	</div>
		<!-- 이메일 -->
	  	<div class="field-wrapper">
	    	<input type="email" name="email" placeholder="name@email.com" class="float-field" required style="width: 400px;"/>
	    	<label for="email" class="float-label">이메일</label>
	    	<div class="field-bar"></div>
	  		<button type="" style="position:relative; top: -35px; left:400px; font-size: 9px;">이메일 인증</button>
	  	</div>
	</form>
	</div>
		
	<div class="container_2" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199);">
	
		<div style="color:#598c93; font-size:14px; position:relative; top:-30px;">*약관 동의</div><br>
		
		<div style="color:#598c93; font-weight:600; font-size:12px; position:relative;">이용 약관</div>
		<textarea rows="100" cols="100" style="resize:none;" disabled></textarea>
	
		<!-- 아이디
		<div class="field-wrapper">
			<input type="text" maxlength="12" name="userId" class="float-field" placeholder="5~12자의 영문(소문자), 숫자만 사용 가능합니다." required/>
			<label for="name" class="float-label">아이디</label>
			<div class="field-bar"></div>
		</div> 	 -->	
		
	</div>





		<!-- <div class="container_2" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199);">
			<div style="color:#598c93; font-size:14px; position:relative; top:-30px;">*동의사항</div>
			아이디
		  	<div class="field-wrapper">
		    	<input type="text" maxlength="12" name="userId" class="float-field" placeholder="5~12자의 영문(소문자), 숫자만 사용 가능합니다." required/>
		    	<label for="name" class="float-label">아이디</label>
		    	<div class="field-bar"></div>
		   		<div id="id_fail">사용할 수 없는 아이디입니다.</div>
		  	</div>
	 		닉네임
	 		<div class="field-wrapper">
		   		<input type="text" maxlength="8" name="nickname" class="float-field" placeholder="8자까지의 한글,영문(소문자),숫자만 사용 가능합니다." required/>
		   		<label for="nickname" class="float-label">닉네임</label>
		   		<div class="field-bar"></div>
		   		<div id="nick_fail">사용할 수 없는 닉네임입니다.</div>
	 		</div>
	  		비밀번호
  			<div class="field-wrapper">
	    		<input type="password" maxlength="16" name="userPwd" placeholder="8~16자 영문 대•소문자, 숫자, 특수문자(! . , ~만 사용 가능합니다.)" class="float-field" required/>
	    		<label for="userPwd" class="float-label">비밀번호</label>
	    		<div class="field-bar"></div>
		   		<div id="pwd_fail">사용할 수 없는 비밀번호입니다.</div>
	 		</div>
	  		비밀번호 확익
		  	<div class="field-wrapper">
		    	<input type="password" maxlength="16" name="checkPwd" placeholder="비밀번호와 똑같이 입력해주십시오." class="float-field" required/>
		    	<label for="checkPwd" class="float-label">비밀번호 확인</label>
		    	<div class="field-bar"></div>
		    	<div id="pwd_fail">비밀번호가 다릅니다.</div>
		  	</div>
		  	이름
		  	<div class="field-wrapper">
		    	<input type="text" maxlength="12" name="userName" class="float-field" placeholder="성함을 입력해주십시오." required/>
		   		<label for="userName" class="float-label">이름</label>
		   		<div class="field-bar"></div>
		   		<div id="id_fail">한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)</div>
		  	</div>
		  	생년월일
		  	<div class="field-wrapper" style="height:23px;">
		   		<input type="number" name="birthDay" placeholder="생년월일 6자리를 입력해주십시오." class="float-field" required />
	    		<label for="birthDay" class="float-label">생년월일</label>
		   		<div class="field-bar"></div>
		   		<div id="id_fail">숫자만 입력해주십시오.</div>
		  	</div>
		  	성별
		  	<div class="field-wrapper" style="font-size: 13px; color: #598c93; height: 3px;">
	    		<div class="checkbox-title">성별</div>
			    <div class="checkbox-wrapper">
					<input type="radio" id="gender_1" name="gender" value="1"/>
				    <label for="gender_1">남자</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="radio" id="gender_2" name="gender" value="2"/>
				    <label for="gender_2">여자</label>
				</div>
			</div>
		  	휴대전화
		  	<div class="field-wrapper" >
		    	<input type="number" name="phone" placeholder="(-제외) 핸드폰 번호 11자리를 입력해주십시오." class="float-field" required />
	    		<label for="phone" class="float-label">휴대전화</label>
		    	<div class="field-bar"></div>
		    	<div id="id_fail">숫자만 입력해주십시오.</div>
		  	</div>
			이메일
		  	<div class="field-wrapper">
		    	<input type="email" name="email" placeholder="name@email.com" class="float-field" required style="width: 400px;"/>
		    	<label for="email" class="float-label">이메일</label>
		    	<div class="field-bar"></div>
		  		<button type="" style="position:relative; top: -35px; left:400px; font-size: 9px;">이메일 인증</button>
		  	</div>
		</div> -->
		
				
	  		
	  		
	  		
	  		
	
	  
	  
	 <!--  <div class="field-wrapper field-wrapper-half">
	    <select name="city" class="select-field" required>
	      <option value=""></option>
	      <option value="edmonton">Edmonton</option>
	      <option value="calgary">Calgary</option>
	      <option value="vancouver">Vancouver</option>
	    </select>
	      <label for="country" class="float-label">Your City</label>
	      <div class="field-bar"></div>
	  </div>
	  <div class="field-wrapper field-wrapper-half">
	    <select name="country" class="select-field" required>
	      <option value=""></option>
	      <option value="Select Your City">Canada</option>
	    </select>
	      <label for="country" class="float-label">Your Country</label>
	      <div class="field-bar"></div>
	    
	  </div>
	  <div class="field-wrapper">
	    <div class="checkbox-title">Membership</div>
	    <div class="checkbox-wrapper">
	      <input id="check1" type="checkbox" />
	      <label for="check1">option 1</label>
	    </div>
	    <div class="checkbox-wrapper">
	      <input id="check2" type="checkbox" />
	      <label for="check2">option 2</label>
	    </div>
	    <div class="checkbox-wrapper">
	      <input id="check3" type="checkbox" />
	      <label for="check3">option 3</label>
	    </div>
	    <div class="checkbox-wrapper">
	      <input id="check4" type="checkbox" />
	      <label for="check4">option 4</label>
	    </div>
	  </div> -->
	 
	  <!-- <div class="button-wrapper">
	    <button id="buttonlogintoregister" type="submit">Submit</button>
	  </div> -->
	
	<script>
	var textarea = document.querySelector('textarea');

	textarea.addEventListener('keydown', autosize);
	             
	function autosize(){
	  var el = this;
	  setTimeout(function(){
	    el.style.cssText = 'height:auto; padding:0';
	    // for box-sizing other than "content-box" use:
	    // el.style.cssText = '-moz-box-sizing:content-box';
	    el.style.cssText = 'height:' + el.scrollHeight + 'px';
	  },0);
	}


	// Generated by CoffeeScript 1.4.0
	(function() {
	  var $;

	  $ = window.jQuery || window.Zepto || window.$;

	  $.fn.fancySelect = function(opts) {
	    var isiOS, settings;
	    if (opts == null) {
	      opts = {};
	    }
	    settings = $.extend({
	      forceiOS: false,
	      includeBlank: false,
	      optionTemplate: function(optionEl) {
	        return optionEl.text();
	      },
	      triggerTemplate: function(optionEl) {
	        return optionEl.text();
	      }
	    }, opts);
	    isiOS = !!navigator.userAgent.match(/iP(hone|od|ad)/i);
	    return this.each(function() {
	      var copyOptionsToList, disabled, options, sel, trigger, updateTriggerText, wrapper, fancy;
	      sel = $(this);
	      if (sel.hasClass('fancified') || sel[0].tagName !== 'SELECT') {
	        return;
	      }
	      sel.addClass('fancified');
	      sel.css({
	        width: 1,
	        height: 1,
	        display: 'block',
	        position: 'absolute',
	        top: 0,
	        left: 0,
	        opacity: 0
	      });
	      sel.wrap('<div class="fancy-select">');
	      wrapper = sel.parent();
	      if (sel.data('class')) {
	        wrapper.addClass(sel.data('class'));
	      }
	      wrapper.append('<div class="trigger">');
	      if (!(isiOS && !settings.forceiOS)) {
	        wrapper.append('<ul class="options">');
	      }
	      
	      fancy = wrapper;
	      
	      trigger = wrapper.find('.trigger');
	      options = wrapper.find('.options');
	      disabled = sel.prop('disabled');
	      if (disabled) {
	        wrapper.addClass('disabled');
	      }
	      updateTriggerText = function() {
	        var triggerHtml;
	        triggerHtml = settings.triggerTemplate(sel.find(':selected'));
	        return trigger.html(triggerHtml);
	      };
	      sel.on('blur.fs', function() {
	        if (trigger.hasClass('open')) {
	          return setTimeout(function() {
	            return trigger.trigger('close.fs');
	          }, 120);
	        }
	      });
	      trigger.on('close.fs', function() {
	        trigger.removeClass('open');
	        fancy.removeClass('open');
	        return options.removeClass('open');
	      });
	      trigger.on('click.fs', function() {
	        var offParent, parent;
	        if (!disabled) {
	          trigger.toggleClass('open');
	          fancy.toggleClass('open');
	          if (isiOS && !settings.forceiOS) {
	            if (trigger.hasClass('open')) {
	              return sel.focus();
	            }
	          } else {
	            if (trigger.hasClass('open')) {
	              parent = trigger.parent();
	              offParent = parent.offsetParent();
	              if ((parent.offset().top + parent.outerHeight() + options.outerHeight() + 20) > $(window).height() + $(window).scrollTop()) {
	                options.addClass('overflowing');
	              } else {
	                options.removeClass('overflowing');
	              }
	            }
	            options.toggleClass('open');
	            if (!isiOS) {
	              return sel.focus();
	            }
	          }
	        }
	      });
	      sel.on('enable', function() {
	        sel.prop('disabled', false);
	        wrapper.removeClass('disabled');
	        disabled = false;
	        return copyOptionsToList();
	      });
	      sel.on('disable', function() {
	        sel.prop('disabled', true);
	        wrapper.addClass('disabled');
	        return disabled = true;
	      });
	      sel.on('change.fs', function(e) {
	        if (e.originalEvent && e.originalEvent.isTrusted) {
	          return e.stopPropagation();
	        } else {
	          return updateTriggerText();
	        }
	      });
	      sel.on('keydown', function(e) {
	        var hovered, newHovered, w;
	        w = e.which;
	        hovered = options.find('.hover');
	        hovered.removeClass('hover');
	        if (!options.hasClass('open')) {
	          if (w === 13 || w === 32 || w === 38 || w === 40) {
	            e.preventDefault();
	            return trigger.trigger('click.fs');
	          }
	        } else {
	          if (w === 38) {
	            e.preventDefault();
	            if (hovered.length && hovered.index() > 0) {
	              hovered.prev().addClass('hover');
	            } else {
	              options.find('li:last-child').addClass('hover');
	            }
	          } else if (w === 40) {
	            e.preventDefault();
	            if (hovered.length && hovered.index() < options.find('li').length - 1) {
	              hovered.next().addClass('hover');
	            } else {
	              options.find('li:first-child').addClass('hover');
	            }
	          } else if (w === 27) {
	            e.preventDefault();
	            trigger.trigger('click.fs');
	          } else if (w === 13 || w === 32) {
	            e.preventDefault();
	            hovered.trigger('mousedown.fs');
	          } else if (w === 9) {
	            if (trigger.hasClass('open')) {
	              trigger.trigger('close.fs');
	            }
	          }
	          newHovered = options.find('.hover');
	          if (newHovered.length) {
	            options.scrollTop(0);
	            return options.scrollTop(newHovered.position().top - 12);
	          }
	        }
	      });
	      options.on('mousedown.fs', 'li', function(e) {
	        var clicked;
	        clicked = $(this);
	        sel.val(clicked.data('raw-value'));
	        if (!isiOS) {
	          sel.trigger('blur.fs').trigger('focus.fs');
	        }
	        options.find('.selected').removeClass('selected');
	        clicked.addClass('selected');
	        trigger.addClass('selected');
	        fancy.addClass('selected');
	        return sel.val(clicked.data('raw-value')).trigger('change.fs').trigger('blur.fs').trigger('focus.fs');
	      });
	      options.on('mouseenter.fs', 'li', function() {
	        var hovered, nowHovered;
	        nowHovered = $(this);
	        hovered = options.find('.hover');
	        hovered.removeClass('hover');
	        return nowHovered.addClass('hover');
	      });
	      options.on('mouseleave.fs', 'li', function() {
	        return options.find('.hover').removeClass('hover');
	      });
	      copyOptionsToList = function() {
	        var selOpts;
	        updateTriggerText();
	        if (isiOS && !settings.forceiOS) {
	          return;
	        }
	        selOpts = sel.find('option');
	        return sel.find('option').each(function(i, opt) {
	          var optHtml;
	          opt = $(opt);
	          if (!opt.prop('disabled') && (opt.val() || settings.includeBlank)) {
	            optHtml = settings.optionTemplate(opt);
	            if (opt.prop('selected')) {
	              return options.append("<li data-raw-value=\"" + (opt.val()) + "\" class=\"selected\">" + optHtml + "</li>");
	            } else {
	              return options.append("<li data-raw-value=\"" + (opt.val()) + "\">" + optHtml + "</li>");
	            }
	          }
	        });
	      };
	      sel.on('update.fs', function() {
	        wrapper.find('.options').empty();
	        return copyOptionsToList();
	      });
	      return copyOptionsToList();
	    });
	  };

	}).call(this);

	$('.select-field').fancySelect();
	</script>
	
</body>
</html>
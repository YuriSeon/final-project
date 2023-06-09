<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		div.fancy-select ul.options li, div.fancy-select ul.options.overflowing.open, div.fancy-select ul.options.overflowing, div.fancy-select ul.options.open, div.fancy-select ul.options, div.fancy-select div.trigger, [type=checkbox]:not(:checked) + label:before,
		[type=checkbox]:checked + label:before, .container_1 button, .container_2 button, .container_3 button, .auto-textarea, .field-bar, .float-label, input[type=text],
		input[type=email],input[type=password], input[type=number],
		textarea {
  			-webkit-transition: all 0.25s ease-out;
  			-moz-transition: all 0.25s ease-out;
  			transition: all 0.25s ease-out;
		}
		.container_1, .container_2, .container_3 {
  			max-width: 600px;
  			margin-left: auto;
  			margin-right: auto;
  			margin: 2rem auto;
  			background: #fff;
 			padding: 3rem 2rem;
  			border-radius: 1rem;
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
		.field-wrapper-half {
  			float: left;
  			display: block;
  			margin-right: 2.3576520234%;
			width: 48.8211739883%;
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
  			/* height: 30px; */
  			vertical-align: middle;
  			width: 100%;
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
		
		.field-bar, .field-bar2 {
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
		
		.container_1 button, .container_2 button, .container_3 button {
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
		.container_1 button:hover, .container_2 button:hover, .container_3 button:hover {
		  	background: #466e73;
		  	cursor: pointer;
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
		input[type="number"]::-webkit-outer-spin-button,
		input[type="number"]::-webkit-inner-spin-button {
    		-webkit-appearance: none;
    		margin: 0;
		}
		
		/* 설명 말풍선 띄우기*/
		.interest-class{
			color: #598c93;
		  	text-transform: uppercase;
		  	font-size: 0.75rem;
		  	font-weight: bold;
		  	display: inline-block;
		  	margin-right: 1rem;
		}

		#textbox {
			background: #fff;
			background: -moz-linear-gradient(top, #dedede 0%, #ffffff 100%);
			background: -webkit-linear-gradient(top, #dedede 0%, #ffffff 100%);
			background: -webkit-gradient(
				linear,
				left top,
				left bottom,
				color-stop(0, #dedede),
				color-stop(1, #ffffff)
				);
			background: -o-linear-gradient(top, #2a2626 0%, #ffffff 100%);
			background: -ms-linear-gradient(top, #dedede 0%, #ffffff 100%);
			background: linear-gradient(top, #dedede 0%, #ffffff 100%);
			margin: 0 auto;
			width: 270px;
			padding: 10px;
			text-align: center;
			position: relative;
			box-shadow: rgba(0, 0, 0, 0.3) 2px 2px 2px;
			border-radius: 10px;
			font-size: 12px;
			font-weight: 100;
			color: #929292;
			position:absolute;
			opacity: 0;
        	transition: all ease 0.5s;
        	top: -68px;
		}
		#textbox:after {
			content: "";
			position: absolute;
			box-shadow: rgba(0, 0, 0, 0.3) 2px 2px 2px;
			-moz-transform: rotate(45deg);
			-webkit-transform: rotate(45deg);
			bottom: -10px;
			left: 30px;
			border-width: 10px;
			border-style: solid;
			border-color: transparent #fff #fff transparent;
		}
		#interQImg:hover + #textbox{
			opacity: 1;
		}
		
	</style>

</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<form action="insert.me" method="post" id="insertForm">
	<hr style="position:relative; top:-10px;">

		<div class="container_1" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199); height:730px;">
			<div style="color:#598c93; font-size:14px; position:relative; top:-30px;">*필수 입력사항입니다.<br>(추후 입력사항과 인증정보가 다를시 게시판 이용이 제한될 수 있습니다.)</div>
			<!-- 아이디 -->
		  	<div class="field-wrapper">
		    	<input type="text" maxlength="12" id="userId" name="userId2" class="float-field" placeholder="5~12자의 영문(소문자), 숫자만 사용 가능합니다." required/>
		    	<label for="userId" class="float-label">아이디</label>
		    	<div class="field-bar"></div>
		   		<div id="id_check"></div>
		  	</div>
	 		<!-- 닉네임 -->
	 		<div class="field-wrapper">
		   		<input type="text" minlength="1" maxlength="8" id="nickname" name="nickname" class="float-field" placeholder="2~8자의 한글,영문,숫자만 사용 가능합니다." required/>
		   		<label for="nickname" class="float-label">닉네임</label>
		   		<div class="field-bar"></div>
		   		<div id="nick_check"></div>
	 		</div>
	  		<!-- 비밀번호 -->
	 		<div class="field-wrapper">
	    		<input type="password" maxlength="16"  id="userPwd" name="userPwd" placeholder="8~16자 영문 대•소문자, 숫자, 특수문자(! . , ~만 사용 가능합니다.)" class="float-field" required/>
	    		<label for="userPwd" class="float-label">비밀번호</label>
	    		<div class="field-bar"></div>
		   		<div id="pwd_check"></div>
	 		</div>
	  		<!-- 비밀번호 확익 -->
		  	<div class="field-wrapper">
		    	<input type="password" maxlength="16" id="checkPwd" name="checkPwd" placeholder="비밀번호와 똑같이 입력해주십시오." class="float-field" onblur="pwdChEvent()" required/>
		    	<label for="checkPwd" class="float-label">비밀번호 확인</label>
		    	<div class="field-bar"></div>
		    	<div id="pwdCk_check"></div>
		  	</div>
		  	<!-- 이름 -->
		  	<div class="field-wrapper">
		    	<input type="text" minlength="1" maxlength="12" id="userName" name="userName" class="float-field" placeholder="성함을 입력해주십시오." required/>
		   		<label for="userName" class="float-label">이름</label>
		   		<div class="field-bar"></div>
		   		<div id="name_check"></div>
		  	</div>
		  	<!-- 생년월일 -->
		  	<div class="field-wrapper" style="height:23px;">
		   		<input type="number" id="birthDay" name="birthDay" placeholder="생년월일 8자리를 입력해주십시오.(예: 19940707)" class="float-field" required />
	    		<label for="birthDay" class="float-label">생년월일</label>
		   		<div class="field-bar"></div>
		   		<!-- <div id="id_fail">숫자만 입력해주십시오.</div> -->
		  	</div>
		  	<!-- 성별 -->
		  	<div class="field-wrapper" style="font-size: 13px; color: #598c93; height: 3px;">
	    		<div class="checkbox-title">성별</div>
			    <div class="checkbox-wrapper">
					<input type="radio" id="M" name="gender" value="M" checked/>
				    <label for="M">남자</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="radio" id="F" name="gender" value="F"/>
				    <label for="F">여자</label>
				</div>
			</div>
		  	<!-- 휴대전화 -->
		  	<div class="field-wrapper" >
		    	<input type="number" id="phone" name="phone" placeholder="(-제외) 핸드폰 번호 11자리를 입력해주십시오." class="float-field" required />
	    		<label for="phone" class="float-label">휴대전화</label>
		    	<div class="field-bar"></div>
		    	<div id="phone_check"></div>
		  	</div>
			<!-- 이메일 -->
		  	<div class="field-wrapper">
		    	<input type="email" id="email" name="email" maxlength="30" placeholder="email@email.com" class="float-field" required style="width: 400px;"/>
		    	<label for="email" class="float-label">이메일</label>
		    	<div class="field-bar"></div>
		  		<button type="button" onclick="emailCk()" style="position:relative; top: -35px; left:400px; font-size: 9px;">이메일 인증</button>
		  		<input type="text" id="emailNumCk" name="emailNumCk" maxlength="4" placeholder="인증번호 4자리를 입력해주세요." class="float-field" required style="width: 400px; margin-top: -20px;"/>
		    	<div id="email_check" style="position:relative; font-size: 12px;"></div>
		  	</div>
		  	<button type="submit" id="insertGo" style="position:relative; top:390px; left:125px;" onclick="return joinChk();">회원가입</button>
		  	<button type="button" id="form_open" style="position:relative; top:390px; left:130px;">정보 추가 입력</button>
		</div>
		
		<!-- 이용약관 -->
		<div class="container_2" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199); height:410px;">
			<div style="position:relative; top:-20px;">
				<div style="color:#598c93; font-weight:600; font-size:12px; position:relative;">이용 약관</div>
				<textarea rows="5" cols="50" style="resize:none; font-size:12px;" disabled>여러분을 환영합니다.
여행가보자고(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 서비스의 이용과 관련하여 서비스를 제공하는 여행가보자고 주식회사와 이를 이용하는 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.

서비스를 이용하시거나 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.

다양한 서비스를 즐겨보세요.
여행가보자고는 기본적으로 여러분 모두에게 동일한 내용의 서비스를 제공합니다. 다만, '청소년보호법' 등 관련 법령이나 기타 개별 서비스 제공에서의 특별한 필요에 의해서 연령 또는 일정한 등급을 기준으로 이용자를 구분하여 제공하는 서비스의 내용, 이용 시간, 이용 횟수 등을 다르게 하는 등 일부 이용을 제한하는 경우가 있습니다. 자세한 내용은 역시 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인하실 수 있습니다.

여행가보자고 서비스에는 기본적으로 본 약관이 적용됩니다만 여행가보자고가 다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우(예, 여행가보자고페이, V LIVE 등)가 있습니다. 그리고 여행가보자고 계열사가 제공하는 특정 서비스의 경우에도(예, LINE, SNOW등) 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.

회원으로 가입하시면 여행가보자고 서비스를 보다 편리하게 이용할 수 있습니다.
여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 여행가보자고는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 여행가보자고 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 여행가보자고 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 여행가보자고 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 여행가보자고 회원가입 방법 등에서 확인해 주세요.

여행가보자고는 단체에 속한 여러 구성원들이 공동의 계정으로 여행가보자고 서비스를 함께 이용할 수 있도록 단체회원 계정도 부여하고 있습니다. 단체회원 구성원들은 하나의 계정 및 아이디(ID)를 공유하되 각자 개별적으로 설정한 비밀번호를 입력하여 계정에 로그인하고 각종 서비스를 이용하게 됩니다. 단체회원은 관리자와 멤버로 구성되며, 관리자는 구성원 전부로부터 권한을 위임 받아 단체회원을 대표하고 단체회원 계정을 운용합니다.
따라서 관리자는 단체회원 계정을 통해 별도 약관 또는 기존 약관 개정에 대해 동의하거나 단체회원에서 탈퇴할 수 있고, 멤버들의 단체회원 계정 로그인 방법 및 이를 통한 게시물 게재 등 여행가보자고 서비스 이용을 관리(게시물 삭제 포함)할 수 있습니다. 본 약관에서 규정한 사항은 원칙적으로 구성원 모두에게 적용되며, 각각의 구성원은 다른 구성원들의 단체회원 계정 및 아이디(ID)를 통한 서비스 이용에 관해 연대책임을 부담합니다.

여행가보자고는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다.

한편, 여행가보자고 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.
게시물 게재로 여러분은 여행가보자고에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다.

여행가보자고는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 여행가보자고 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다.

또한 여러분이 제공한 소중한 콘텐츠는 여행가보자고 서비스를 개선하고 새로운 여행가보자고 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 여행가보자고 및 여행가보자고 계열사에서 사용될 수 있습니다. 여행가보자고는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다.

여행가보자고는 여러분이 자신이 제공한 콘텐츠에 대한 여행가보자고 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 여행가보자고 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
다만, 일부 여행가보자고 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다.

여러분의 개인정보를 소중히 보호합니다.
여행가보자고는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 여행가보자고가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다.

여행가보자고는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.

타인의 권리를 존중해 주세요.
여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 여행가보자고는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요.

여행가보자고 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.
여행가보자고는 여러분이 여행가보자고 서비스를 자유롭고 편리하게 이용할 수 있도록 최선을 다하고 있습니다. 다만, 여러분이 여행가보자고 서비스를 보다 안전하게 이용하고 여행가보자고 서비스에서 여러분과 타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리 보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 여행가보자고 서비스 이용이 제한될 수 있으므로, 이에 대한 확인 및 준수를 요청 드립니다.

여행가보자고는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.

여행가보자고는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 여행가보자고에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 여행가보자고로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다.

여행가보자고 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다.

본 약관은 한국어를 정본으로 합니다. 본 약관 또는 여행가보자고 서비스와 관련된 여러분과 여행가보자고와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 여행가보자고 서비스와 관련하여 여러분과 여행가보자고 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다.</textarea>

				<br>
			
				<div style="color:#598c93; font-weight:600; font-size:12px; position:relative;">개인정보 수집 및 동의</div>
				<textarea rows="5" cols="50" style="resize:none; font-size:12px;" disabled>개인정보보호법에 따라 여행가보자고에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.

1. 수집하는 개인정보
이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 여행가보자고 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 여행가보자고는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.

회원가입 시점에 여행가보자고가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원 가입 시 필수항목으로 아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호를, 선택항목으로 본인확인 이메일주소를 수집합니다. 실명 인증된 아이디로 가입 시, 암호화된 동일인 식별정보(CI), 중복가입 확인정보(DI), 내외국인 정보를 함께 수집합니다. 만14세 미만 아동의 경우, 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대전화번호)를 추가로 수집합니다.
- 비밀번호 없이 회원 가입 시에는 필수항목으로 아이디, 이름, 생년월일, 휴대전화번호를, 선택항목으로 비밀번호를 수집합니다.
- 단체 회원가입 시 필수 항목으로 단체아이디, 비밀번호, 단체이름, 이메일주소, 휴대전화번호를, 선택항목으로 단체 대표자명을 수집합니다.
서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
- 회원정보 또는 개별 서비스에서 프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가 별명으로 자동 입력됩니다.
- 여행가보자고 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.



서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다.
구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다.
서비스 이용 과정에서 위치정보가 수집될 수 있으며,
여행가보자고에서 제공하는 위치기반 서비스에 대해서는 '여행가보자고 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다.
이와 같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
2. 수집한 개인정보의 이용
여행가보자고 및 여행가보자고 관련 제반 서비스(모바일 웹/앱 포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.

- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
- 법령 및 여행가보자고 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
3. 개인정보의 보관기간
회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
이용자에게 개인정보 보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.
- 부정 가입 및 이용 방지
부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) : 탈퇴일로부터 6개월 보관
탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월 보관
- QR코드 복구 요청 대응
QR코드 등록 정보:삭제 시점으로부터6개월 보관
- 스마트플레이스 분쟁 조정 및 고객문의 대응
휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년
- 여행가보자고 플러스 멤버십 서비스 혜택 중복 제공 방지
암호화처리(해시처리)한DI :혜택 제공 종료일로부터6개월 보관
- 지식iN eXpert 재가입 신청 및 부정 이용 방지
eXpert 서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관
전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 여행가보자고는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
- 전자상거래 등에서 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
- 전자문서 및 전자거래 기본법
공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관
- 전자서명 인증 업무
인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관
- 통신비밀보호법
로그인 기록: 3개월

참고로 여행가보자고는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다.</textarea><br>
	
				<div class="field-wrapper" style="font-size: 13px; color: #598c93; height: 3px;">
			    <div class="checkbox-wrapper">
					<input type="radio" id="agree" name="use"/>
				    <label for="agree">동의합니다.</label>
				</div>
				<div class="checkbox-wrapper">
					<input type="radio" id="disagree" name="use" checked/>
				    <label for="disagree">동의하지 않습니다.</label>
				</div>
			</div>
		    </div>	
		</div>
		
		<!-- 추가 입력사항 -->
		<div class="container_3" style="box-shadow: 0px 0px 10px 10px rgb(199, 199, 199); height:360px;">
			<div style="color:#598c93; font-size:14px; position:relative; top:-30px;">※선택 입력사항입니다.<br>(마이페이지에서 추가로 작성 하실 수 있습니다.)</div>
			<!-- 관심사 -->
			<div class="field-wrapper" style="position:relative; top: -15px;">
				<!-- 설명 풍선 -->
			    <div class="interest-class" id="interQImg-class">관심사<img src="resources/images/question.png" alt="" id="interQImg" style="height:11px; width:11px; position:relative; top:-1px; background-color:rgb(239, 239, 239);">
					<div id="textbox">관심 순서에 따라 메인페이지 화면이 바뀌어요! 마이페이지에서 수정할 수 있습니다.</div>			    
			    </div> <br>
			    <div id="inte_view" style=" font-size:12px; color: #598c93; position:relative; left:50px; top:-19px;">: </div>
			    <div style="position:relative; top:-20px; left: -10px;">
				    <div class="checkbox-wrapper">
				      <input type="checkbox" name="interestOp" id="thema" value="테마여행" onclick="inte(this)"/>
				      <label for="thema">테마여행</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="festival" name="interestOp" value="축제" type="checkbox" onclick="inte(this)"/>
				      <label for="festival">축제</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="sights" name="interestOp" value="명소/맛집" type="checkbox" onclick="inte(this)"/>
				      <label for="sights">명소 / 맛집</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="together" name="interestOp" value="동행구하기" type="checkbox" onclick="inte(this)"/>
				      <label for="together">동행구하기</label>
				    </div>
			    </div>
			    <input type="hidden" name="interest" id="interest">
			</div>
	 		<!-- 선호하는 여행 스타일 -->
			<div class="field-wrapper" style="position:relative; top: -8px;">
			    <div class="checkbox-title" style="position:relative; top: -17px;">선호하는 여행 스타일(5개까지 입력 가능)</div> <br>
			    <div style="position:relative; left: -10px; top:-18px">
				    <div class="checkbox-wrapper">
				      <input id="activity" value="액티비티" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="activity">액티비티</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="healing" value="힐링" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="healing">힐링</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="picture" value="인생샷" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="picture">인생샷</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="sea" value="바다" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="sea">바다</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="mountain" value="산" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="mountain">산</label>
				    </div> <br>
				    <div class="checkbox-wrapper">
				      <input id="animal" value="반려동물" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="animal">반려동물</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="history" value="역사" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="history">역사</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="experience" value="체험활동" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="experience">체험활동</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="food" value="맛집탐방" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="food">맛집탐방</label>
				    </div>
				    <div class="checkbox-wrapper">
				      <input id="shoping" value="쇼핑" name="style" type="checkbox" onClick="check_count(this)"/>
				      <label for="shoping">쇼핑</label>
				    </div>
				    <div id="style_check" style="position:relative; font-size:12px; top: -79px; left:238px;"></div>
			    </div>
			</div>
		  	<div class="field-wrapper field-wrapper-half">
			    <select id="MBTI" name="MBTI" class="select-field">
					<option value=""></option>
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
			      <label for="MBTI" class="float-label">MBTI</label>
			      <div class="field-bar"></div>
			</div>
			<button type="submit" id="insertGo2" style="position:relative; top:-25px; width:530px;" onclick="return joinChk();">회원가입</button>
			<!-- 카카오인증 후 탈퇴시 필요한 카카오 정보 -->
			<input type="hidden" name="kakaoId" id="kakaoId" value="0">
			<input type="hidden" name="access_token" id="access_token" value="0">
			<input type="hidden" id="certification" name="certification" value="0">
		</div>
	</form>
	<script>
	var idResult = ""; //아이디 중복 검사 값 담을 변수
	var nickResult = ""; //닉네임 중복 검사 값 담을 변수
	
	$(function(){
		
		/* 아이디 중복 및 유효성 검사 */
		var $userId = $("#insertForm input[name=userId2]");
		
		$userId.keyup(function(){
			if($userId.val().trim().length>=5){
				$("#id_check").show();
				$.ajax({
					url : "idCheck.me",
					data : {checkId : $userId.val()},
					success : function(result){
						if(result=="NNNNN"){//중복 존재						
							$("#id_check").css({"color":"red","font-size":"12px"}).text("중복된 아이디가 존재합니다. 다시 입력해주세요.");
							idResult = result;
						}else{//아이디 중복 없을때
							$("#id_check").css({"color":"green","font-size":"12px"}).text("사용 가능한 아이디 입니다.");
							idResult = result;

							//아이디 유효성 검사
							var regExp = /^[a-zA-Z0-9]+$/;
							if(!(regExp.test($userId.val()))){
								$("#id_check").css({"color":"red","font-size":"12px"}).text("아이디 형식이 올바르지 않습니다.");
							}
						}
					}
				})
			}else{ //5글자 미만일때
				$("#id_check").hide();//에러 텍스트 숨기기
			}
		});
		
		/* 닉네임 중복 및 유효성 검사 */
		$("#nickname").keyup(function(){
			
			if($("#nickname").val().trim().length>=2){
				$("#nick_check").show();
				
				$.ajax({
					url : "nickCheck.me",
					data : {checkNick : $("#nickname").val()},
					success : function(result){
						if(result=="NNNNN"){//중복 있을때				
							$("#nick_check").css({"color":"red","font-size":"12px"}).text("중복된 닉네임이 존재합니다. 다시 입력해주세요.");
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
		var $userPwd = $("#insertForm input[name=userPwd]");
		$userPwd.keyup(function(){
			
			if($userPwd.val().trim().length>=1){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
				$("#pwd_check").show();
				
				var regExp = /^[a-zA-Z0-9!.,~]+$/;
				
				if(!(regExp.test($userPwd.val()))){ //조건에 맞지 않으면
					$("#pwd_check").css({"color":"red","font-size":"12px"}).text("비밀번호 형식이 올바르지 않습니다.");
				}else{//조건에 맞으면
					$("#pwd_check").hide();
				}
			}else{
				$("#pwd_check").hide();
			}
		});
		
		//비밀번호 확인 (키업으로 비밀번호 지울시 text없애주기)
		$("#checkPwd").keyup(function(){
			$("#pwdCk_check").text("");
		});
		
		/* 이름 */
		$("#userName").keyup(function(){
			
			if($("#userName").val().trim().length>=1){
				$("#name_check").show();
					
				var regExp = /^[가-힣a-zA-Z]+$/;
				
				if(!(regExp.test($("#userName").val()))){ //조건에 맞지 않으면
					$("#name_check").css({"color":"red","font-size":"12px"}).text("이름 형식이 올바르지 않습니다.");
				}else{
					$("#name_check").hide();
				}
			}else{
				$("#name_check").hide();
			}
		});
		
		/* 휴대전화 */
		$("#phone").keyup(function(){
			
			if($("#phone").val().trim().length>=1){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
				
				$("#phone_check").show();
				
				var regExp = /^[0-9]+$/;
				
				if(!(regExp.test($("#phone").val()))){ //조건에 맞지 않으면
					$("#phone_check").css({"color":"red","font-size":"12px"}).text("번호만 입력해 주십시오. (-제외)");
				}else{//조건에 맞으면
					$("#phone_check").hide();
				}
			}
			if($("#phone").val().trim().length>=12){
				$("#phone_check").css({"color":"red","font-size":"12px"}).text("11자리까지의 번호만 입력해 주십시오. (-제외)");
				$("#phone_check").show();
			}
		});
		
		//이메일 인증 칸 숨겨놓기
		$("#emailNumCk").hide();
		//이메일 경고 텍스트 숨기기
		$("#email").keyup(function(){
			$("#email_check").hide();
		});
		$("#emailNumCk").keyup(function(){
			$("#email_check").hide();
		});
		
		//카카오 회원번호 넘어오면 정보 담아주기
		if('${kakaoInfo.certification}'!=""){
			$("#kakaoId").val('${kakaoInfo.id}');
			$("#access_token").val('${kakaoInfo.access_token}');
			$("#certification").val('${kakaoInfo.certification}');
		}
		
		//네이버 정보 뿌려주기
		if('${naverInfo.name}'!=""){
	 		$("#userName").val('${naverInfo.name}');
			$("#birthDay").val("${naverInfo.birthDay}");
			if ('${naverInfo.gender}' === 'F') {
				$('#F').prop('checked', true);
			    } else {
			    	$('#M').prop('checked', true);
			    }
			$("#phone").val('${naverInfo.phone}');
			$("#email").val('${naverInfo.email}');
			$("#certification").val('${naverInfo.certification}');
			//네이버 토큰 정보 넣어주기
			$("#access_token").val('${naverInfo.access_token}');		
		}
	});
	
	/* 비밀번호 확인(onblur이벤트로 포커스 해지시 발동... 비번,비번확인 일치하는지 ck) */
	function pwdChEvent(){
		if($("#insertForm input[name=userPwd]").val()!=$("#checkPwd").val()){
			$("#pwdCk_check").show();
			$("#pwdCk_check").css({"color":"red","font-size":"12px"}).text("비밀번호가 일치하지 않습니다.");
		}
	}
	
	var ckNum = "";
	var ckEmail = "";
	//이메일 인증 클릭시
	function emailCk(){
		var email = $("#email").val();
		$.ajax({
			url : "emailCk.fe",
			data : {email : email},
			success : function(result){
				ckNum = result;
				ckEmail = email;
				alert("인증번호가 전송되었습니다.")
				$("#emailNumCk").show();
				$("#emailNumCk").focus();
			},error : function(){
				console.log("이메일 인증 보내기 에이젝스 에러");
			}
		});
	}
	
	/* 추가입력사항 슬라이드 */
	$('.container_3').hide(); //추가입력사항 숨겨놓기
	
	$('#form_open').click(function(){
		$('.container_3').slideToggle(); //토글
	})
	
	
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
		$("#inte_view")[0].innerText = ":" + $('#interest').val();
	}
	
	/* 여행 스타일 5개로 제한하기  */
	function check_count(ch){
		
		var chkBox = document.getElementsByName("style");
		var count = 0;
		
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
	
	//버튼 클릭시 회원가입 진행
	function joinChk(){
		
		//아이디
		var $userId = $("#insertForm input[name=userId2]");
		//중복 검사 포커스
		if(idResult == "NNNNN"){//중복 아이디 있으면 포커스 맞춤
			$userId.focus();
			return false;
		};
		//유효성 검사 포커스
		var regExp = /^[a-zA-Z0-9]+$/;
		if(!(regExp.test($userId.val()))){
			$userId.focus();
			return false;
		}
		//5글자 아래시 포커스 맞춰주기
		if($userId.val().trim().length<5){
			$("#id_check").css({"color":"red","font-size":"12px"}).text("5글자 이상 입력해주세요.");
			$("#id_check").show();
			$userId.focus();
			return false;
		}
		
		//닉네임
		//중복 검사 포커스
		if(nickResult == "NNNNN"){//중복 닉네임 있으면 포커스 맞춤
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
		
		//비밀번호
		var $userPwd = $("#insertForm input[name=userPwd]");
		//유효성 검사 포커스
		var regExp = /^[a-zA-Z0-9!.,~]+$/;
		if(!(regExp.test($userPwd.val()))){
			$userPwd.focus();
			return false;
		}
		//8자리 아래시 포커스 맞춰주기
		if($userPwd.val().trim().length<8){
			$("#pwd_check").css({"color":"red","font-size":"12px"}).text("8글자 이상 입력해주세요.");
			$("#pwd_check").show();
			$userPwd.focus();
			return false;
		}
		
		//비밀번호 확인 != 비밀번호시
		if($userPwd.val()!=$("#checkPwd").val()){
			$("#pwdCk_check").css({"color":"red","font-size":"12px"}).text("비밀번호와 일치하지 않습니다.");
			$("#pwdCk_check").show();
			$("#checkPwd").focus();
			return false;
		}
		
		//이름
		//유효성 검사 포커스
		var regExp = /^[가-힣a-zA-Z]+$/;
		if(!(regExp.test($("#userName").val()))){
			$("#userName").focus();
			return false;
		}
		
		//휴대전화
		//숫자외 다른 글씨 눌렀을때
		var regExp = /^[0-9]+$/;
		if(!(regExp.test($("#phone").val()))){
			$("#phone").focus();
			return false;
		}
		//자릿수 초과시
		if($("#phone").val().trim().length>=12){
			$("#phone").focus();
			return false;
		}
		
		//이메일 인증 안했을시
		if($("#emailNumCk").val().length<4){
			alert("이메일 인증을 진행해주세요.");
			return false;
		}
		//이메일 인증번호 다를시
		if($("#emailNumCk").val()!=ckNum){
			$("#email_check").css({"color":"red","font-size":"12px"}).text("인증번호가 일치하지 않습니다.");
			$("#email_check").show();
			$("#emailNumCk").focus();
			return false;
		}
		//이메일 주소 바꿀시
		if($("#email").val()!=ckEmail){
			$("#email_check").css({"color":"red","font-size":"12px"}).text("인증번호 발송한 메일주소와 입력하신 주소가 일치하지 않습니다.");
			$("#email_check").show();
			$("#email_check").focus();
			return false;
		}
		
		//인증시 인증값과 같은지 확인...
		//카카오(성별,생일,나이대 알 수 있음)
		if('${kakaoInfo.gender}'!=""){
			//성별 확인
			if('${kakaoInfo.gender}'!=$('input[name=gender]:checked').val()){
				alert("인증하신 정보와 성별이 일치하지 않습니다.");
				$("input[name=gender]").focus();
				return false;
			}
			//생일 확인
			var birthDay = $('input[name=birthDay]').val().substring(4,8);
			if('${kakaoInfo.birthday}'!=birthDay){
				alert("인증하신 정보와 생년월일이 일치하지 않습니다.");
				$('input[name=birthDay]').focus();
				return false;
			}
		}
		
		//네이버(이름,생년월일,폰,이메일,성별 알 수 있음);
		if('${naverInfo.name}'!=""){
			//이름 확인
	 		if('${naverInfo.name}'!=$("#userName").val()){
				alert("인증하신 정보와 성함이 일치하지 않습니다.");
				$('input[name=userName]').focus();
				return false;
			}
			//생년월일 확인
			if("${naverInfo.birthDay}"!=$("#birthDay").val()){
				alert("인증하신 정보와 생년월일이 일치하지 않습니다.");
				$('input[name=birthDay]').focus();
				return false;
			}
			//성별 확인
			if('${naverInfo.gender}'!=$('input[name=gender]:checked').val()){
				alert("인증하신 정보와 성별이 일치하지 않습니다.");
				$("input[name=gender]").focus();
				return false;
			}
			//폰 확인
			if('${naverInfo.phone}'!=$("#phone").val()){
				alert("인증하신 정보와 휴대전화 번호가 일치하지 않습니다.");
				$('input[name=phone]').focus();
				return false;
			}
			//이메일 확인
			if('${naverInfo.email}'!=$("#email").val()){
				alert("인증하신 정보와 메일이 일치하지 않습니다.");
				$('input[name=email]').focus();
				return false;
			}
		}
		
		//약관 동의
		if(!$("#agree").is(":checked")){//동의버튼 클릭 안되어있으면
			alert("이용약관 동의 버튼을 눌러주세요.");
			return false;
		};
	};
	
	/* 부트스트랩 */
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
	
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>
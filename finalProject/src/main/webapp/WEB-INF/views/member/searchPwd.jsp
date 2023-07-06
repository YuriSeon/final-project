<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#search_Id {
			height: auto;
		}
		.inquiry.non_sign {
			width: 670px !important;
			margin: 0 auto !important;
		}
		.content_header {
			border-bottom: 2px solid #e5e5e5;
		}
		.content_header h2 {
			position: relative;
			float: left;
			clear: both;
			height: 21px;
			margin-bottom: -2px;
			padding: 0 2px 0 1px;
			border-bottom: 2px solid #4d4d4d;
		}
		.section_find .btn_area {
			padding: 17px 0 15px;
		}
		#search_Id .btn_area,#idModal .btn_area {
			text-align: center;
		}
		.input_box2 .phold {
			position: absolute;
			top: 0;
			left: 4px;
			color: #888;
			line-height: 25px;
		}
		.box6 {
			position: relative;
			z-index: 100;
			padding: 39px 40px 60px;
			border: 1px solid #e5e5e5;
			width: 650px;
			margin: auto;
		}
		.box_inn .dsc {
			line-height: 18px;
			padding-top: 4px;
			color: #666;
		}
		.box_inn .label_rd {
			font-size: 14px;
			font-weight: 700;
			line-height: 18px;
			margin-left: -2px;
			letter-spacing: -1px;
			color: #333;
		}
		.box_inn dl {
			padding-top: 14px;
		}
		.box_inn dt {
			font-weight: 700;
			float: left;
			width: 80px;
			height: 25px;
			margin-top: 6px;
		}
		.box_inn dd {
			position: relative;
			float: left;
			width: 488px;
			height: 25px;
			margin-top: 6px;
			vertical-align: top;
		}
		.box_inn .label_txt {
			line-height: 25px;
			color: #333;
		}
		#search_Id label, #idModal label {
			cursor: pointer;
		}
		.box_inn .input_txt {
			line-height: 23px;
			height: 23px;
			padding-left: 3px;
			vertical-align: top;
			border: 1px solid #ccc;
		}
		#search_Id .blind, #idModal .blind {
			visibility: hidden;
			position: absolute;
			top: 0;
			left: 0;
			width: 0;
			height: 0;
			font-size: 0;
			line-height: 0;
		}
		.btn_ct {
			width: 97px;
			height: 25px;
			margin-left: 1px;
			background-position: 0 -210px;
		}
		.btn_next2 {
			width: 60px;
			height: 33px;
			background-position: 0 0;
		}
		.btn_next2{
			position: relative;
			display: inline-block;
			background: url(https://static.nid.naver.com/images/web/user/sp_find_idpw.png) no-repeat;
		}
		#search_Id, #search_Id button, #idModal, #idModal button{
			font-family: '돋움',Dotum,AppleGothic,sans-serif;
			font-size: 12px;
		}
		.content_header:after {
			font-size: 0;
			line-height: 0;
			display: block;
			clear: both;
			content: '';
		}
		.box_inn dl:after {
			display: block;
			clear: both;
			content: '';
		}
		#emailNm{
			margin-left: 50px;
		}
		#pwdId{
			margin-left: 50px;
		}
		#email{
			margin-left: 50px;
		}
		#search_Id button, .btn_next1, #search_Pwd_Modal button{
			background-color: #f8f8f8;
			border: 1px solid rgb(202, 202, 202);
			border-radius: 3px;
			height: 23px;
			position: relative;
			left: 5px;
		}
		#search_Pwd_Modal{
			display: none;
			position: fixed;
			top: 25%;
			left: 50%;
			height: 330px;
			transform: translate(-50%, -50%);
			box-shadow : rgba(0,0,0,0.5) 0 0 0 9999px;
		}
		
	</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"></jsp:include>
	
	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
	
	<div id="search_Id">
		<div id="id_container">
			<div id="id_content" class="non_sign inquiry">
				<div class="content_header">
					<h2 ><img src="https://static.nid.naver.com/images/web/user/h_find_pw2.gif" width="70" height="16" style="position: relative; top: -18px;" alt="아이디 찾기"></h2>
				</div>
				<div class="section section_find" style="margin-top: 30px;">
					<form id="fm" name="fm">
						<fieldset>	
							<div class="box6">
								<div id="div_email" class="box_inn selected">
									<div for="r_pn2" class="label_rd">본인확인 이메일로 인증</div>
									<div class="box_inn_sub">
										<p class="dsc" style="font-size: 12px; margin-top: 8px;">회원가입시 입력한 아이디, 이름, 이메일 주소가 같아야 인증번호를 받을 수 있습니다.</p>	
										<dl>
											<dt><label for="pwdId" class="label_txt">아이디</label></dt>
											<dd><input type="text" id="pwdId" name="pwdId" maxlength="40" class="input_txt" style="width:217px;" required></dd>
											<dt><label for="emailNm" class="label_txt">이름</label></dt>
											<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px" required></dd>
											<dt class="text_top"><label for="id_email" class="label_txt">이메일 주소</label></dt>
											<dd class="text_top">
												<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px" required>
												<button class="btn_next1" type="button" onclick="searchPwd();">인증번호 받기</button>
											</dd>
											<dd class="ct" style="margin-top: -10px;">
												<span class="input_box2">
													<span id="span_emailAuthNo" class="phold" style="margin-top: 15px; margin-left: 130px;"></span>
													<input type="text" id="emailAuthNo" name="emailAuthNo" maxlength="4" class="input_txt" placeholder="인증번호 4자리 숫자 입력" style="width:217px; margin-top: 15px; margin-left: 130px;" disabled>
													<p id="searchId_Text" style="font-size: 11px; color: red; margin-left: 129px;"></p>
												</span>								
											</dd>	
										</dl>
									</div>		
								</div>
							</div>
							<div class="btn_area">
								<button type="button" onclick="nextGo();">다음</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 비밀번호찾기 모달 -->
	<div class="modal modal-dialog modal-content" id="search_Pwd_Modal" >
		<div id="idModal">
			<div id="id_container">
				<div class="modal-header" style="border-bottom: 0;">
					<p style="font-weight: 600; font-size: 16px; position:relative;  left: 150px;">비밀번호 찾기 결과</p>
					<button type="button" class="close" data-dismiss="modal" id="closeModal" style="height: 100%;">&times;</button>
				</div>
				<div id="id_content" class="non_sign inquiry">
					<div class="section section_find">
						<fieldset>	
							<div class="box6" style="padding: 39px 40px 39px; width: 450px; left: -85px; height: 180px;">
								<div id="div_email" class="box_inn selected">
									<div class="box_inn_sub">
										<p class="dsc" style="font-size: 12px; margin-top: -10px;">변경하실 비밀번호를 입력해주세요.</p>	
										<dl style="position: relative; top: 10px;">
											<dt><label for="memPwd" class="label_txt">비밀번호</label></dt>
											<dd><input type="password" id="memPwd" name="memPwd" placeholder="8~16자 영문 대•소문자, 숫자 입력.)" class="input_txt" style="position: relative; width:217px; top: -30px; left: 100px;"><br></dd>
										</dl>
										<dl style="position: relative; top: -30px;">
											<dt><label for="memPwdCk" class="label_txt">비밀번호확인</label></dt>
											<dd><input type="password" id="memPwdCk" name="memPwdCk" placeholder="비밀번호와 똑같이 입력해주세요." class="input_txt" style="position: relative; width:217px; top: -30px; left: 100px;"><br></dd>
										</dl>
										<p id="pwd_check" style="font-size: 11px; color: red; margin-left: 102px; margin-top: -63px;"></p>
									</div>		
								</div>
							</div>
							<div class="btn_area" style="width: 450px; position:relative; left: 30px;">
								<button type="button" onclick="return pwdReGo();">확인</button>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$(function(){
			var $email = $("#fm input[name=email]");
			$email.keyup(function(){
				$("#searchId_Text").hide();
			})
			
			var $emailAuthNo = $("#fm input[name=emailNm]");
			$emailAuthNo.keyup(function(){
				$("#searchId_Text").hide();
			})
			
			var $pwdId = $("#fm input[name=pwdId]");
			$pwdId.keyup(function(){
				$("#searchId_Text").hide();
			})
		});
	
		var code = "";
		function searchPwd(){
			$.ajax({
				url : "searchPwd.me",
				data : {emailNm : $("#emailNm").val(),
						email : $("#email").val(),
						pwdId : $("#pwdId").val()
					},
				success : function(result){
					
					if(result != 0){
						code = result;
						alert("인증 번호가 발송되었습니다.");
						$("#emailAuthNo").prop("disabled",false);
						$("#emailAuthNo").focus();
						$("#searchId_Text").hide();
					}else if(result == 0){
						$("#searchId_Text").show();
						$("#searchId_Text").text("일치하는 회원 정보가 없습니다.");
					}
				}, error : function(){
					console.log("비밀번호 찾기1 에젝 실패");
				}
			});
		}
		
		//인증번호 안받거나 틀리면
 		function nextGo(){
			if($("#emailAuthNo").val().length ==0){
				$("#search_Pwd_Modal").modal('hide');
				alert("인증번호를 입력해주세요.");
			}else if($("#emailAuthNo").val() == code){
				$("#search_Pwd_Modal").modal('show');
			}else{
				$("#search_Pwd_Modal").modal('hide');
				alert("인증번호가 틀렸습니다.\n다시 입력해주세요.");
			}
		}
		
		function pwdReGo(){
			
			if($("#search_Pwd_Modal input[name=memPwd]").val()!=$("#memPwdCk").val()){
				$("#pwd_check").show();
				$("#pwd_check").text("비밀번호가 일치하지 않습니다.");
				return false;
			}
			
			var memPwd = $("#memPwd");
			console.log(memPwd);
			//유효성 검사 포커스
			var regExp = /^[a-zA-Z0-9]+$/;
			if(!(regExp.test(memPwd.val()))){
				memPwd.focus();
				return false;
			}
			
			//8자리 아래시 포커스 맞춰주기
			if($("#memPwd").val().trim().length<8){
				$("#pwd_check").css({"color":"red","font-size":"12px"}).text("8글자 이상 입력해주세요.");
				$("#pwd_check").show();
				memPwd.focus();
				return false;
			}
			
			//비밀번호 재설정
			$.ajax({
				url : "pwdRe.me",
				data : {memPwd : $("#memPwd").val(),
						emailNm : $("#emailNm").val(),
						email : $("#email").val(),
						pwdId : $("#pwdId").val()
						},
				success : function(result){
					console.log(result);
					if(result != 0){
						alert("비밀번호 재설정 성공!");
						location.href="index.jsp";							
					}else{
						alert("비밀번호 재설정에 실패하셨습니다.");
					}
				}, error : function(){
					console.log("비밀번호 찾기2 에젝 실패");
				}
			});
		};
		
		$(function(){
			//비밀번호 유효성 검사
			var $userPwd = $("#search_Pwd_Modal input[name=memPwd]");
			$userPwd.keyup(function(){
				
				if($userPwd.val().trim().length>=1){//비밀번호 입력시 1자리보다 크면 유효성 검사 진행
					$("#pwd_check").show();
					
					var regExp = /^[a-zA-Z0-9]+$/;
					
					if(!(regExp.test($userPwd.val()))){ //조건에 맞지 않으면
						$("#pwd_check").text("비밀번호 형식이 올바르지 않습니다.");
					}else{//조건에 맞으면
						$("#pwd_check").hide();
					}
				}else{
					$("#pwd_check").hide();
				}
			});
			
			//비밀번호 확인 (키업으로 비밀번호 지울시 text없애주기)
			$("#memPwdCk").keyup(function(){
				$("#pwdCk_check").text("");
			});
		});
	</script>
	
</body>
</html>
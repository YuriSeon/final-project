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
		#email{
			margin-left: 50px;
		}
		#search_Id button, .btn_next1, #search_Id_Modal button{
			background-color: #f8f8f8;
			border: 1px solid rgb(202, 202, 202);
			border-radius: 3px;
			height: 23px;
			position: relative;
			left: 5px;
		}
		#search_Id_Modal{
			display: none;
			position: fixed;
			top: 25%;
			left: 50%;
			height: 300px;
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
					<h2 ><img src="https://static.nid.naver.com/images/user/images/user/h_find_id.gif" width="70" height="16" style="position: relative; top: -18px;" alt="아이디 찾기"></h2>
				</div>
				<div class="section section_find" style="margin-top: 30px;">
					<form id="fm" name="fm">
						<fieldset>	
							<div class="box6">
								<div id="div_email" class="box_inn selected">
									<div for="r_pn2" class="label_rd">본인확인 이메일로 인증</div>
									<div class="box_inn_sub">
										<p class="dsc" style="font-size: 12px; margin-top: 8px;">회원가입시 입력한 이름과 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>	
										<dl>
											<dt><label for="emailNm" class="label_txt">이름</label></dt>
											<dd><input type="text" id="emailNm" name="emailNm" maxlength="40" class="input_txt" style="width:217px" required></dd>
											<dt class="text_top"><label for="id_email" class="label_txt">이메일 주소</label></dt>
											<dd class="text_top">
												<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px" required>
												<button class="btn_next1" type="button" onclick="searchId();">인증번호 받기</button>
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
								<button type="button" onclick="idGo();">다음</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디찾기 모달 -->
	<div class="modal modal-dialog modal-content" id="search_Id_Modal" >
		<div id="idModal">
			<div id="id_container">
				<div class="modal-header" style="border-bottom: 0;">
					<p style="font-weight: 600; font-size: 16px; position:relative;  left: 150px;">아이디 찾기 결과</p>
					<button type="button" class="close" data-dismiss="modal" id="closeModal" style="height: 100%;">&times;</button>
				</div>
				<div id="id_content" class="non_sign inquiry">
					<div class="section section_find">
						<fieldset>	
							<div class="box6" style="padding: 39px 40px 39px; width: 450px; left: -85px; height: 150px;">
								<div id="div_email" class="box_inn selected">
									<div class="box_inn_sub">
										<p class="dsc" style="font-size: 12px; margin-top: -10px;">고객님의 정보와 일치하는 아이디입니다.</p>	
										<dl style="position: relative; top: 10px;">
											<dt><label for="emailNm" class="label_txt">아이디</label></dt>
											<dd><input type="text" id="searchIdGo" name="searchIdGo" class="input_txt" style="position: relative; width:217px; top: -30px; left: 50px;" readonly><br></dd>
										</dl>
									</div>		
								</div>
							</div>
							<div class="btn_area" style="width: 450px; position:relative; left: 30px;">
								<button type="button" onclick="searchId_loginGo();">메인으로</button>
								<button type="button" onclick="searchPwdForm.me">비밀번호 찾기</button>
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
			
			var $emailAuthNo = $("#fm input[name=emailAuthNo]");
			$emailAuthNo.keyup(function(){
				$("#searchId_Text").hide();
			})
		});
	
		var code = "";
		function searchId(){
			$.ajax({
				url : "searchId.me",
				data : {emailNm : $("#emailNm").val(),
						email : $("#email").val()
					},
				success : function(result){
					
					if(result != 0){
						code = result;
						alert("인증 번호가 발송되었습니다.");
						$("#emailAuthNo").prop("disabled",false);
						$("#emailAuthNo").focus();
					}else if(result == 0){
						$("#searchId_Text").show();
						$("#searchId_Text").text("일치하는 회원 정보가 없습니다.");
					}
				}, error : function(){
					console.log("아이디 찾기 에젝 실패");
				}
			});
		}
		
		//인증번호 안받거나 틀리면
 		function idGo(){
			if($("#emailAuthNo").val().length ==0){
				console.log("test");
				$("#search_Id_Modal").modal('hide');
				alert("인증번호를 입력해주세요.");
			}else if($("#emailAuthNo").val() == code){
				$("#search_Id_Modal").modal('show');
				
				//아이디 가져오기
				$.ajax({
					url : "searchIdList.me",
					data : {emailNm : $("#emailNm").val(),
							email : $("#email").val()
						},
					success : function(result){
						console.log(result.userId);
						$("#searchIdGo").val(result.userId);
					}, error : function(){
						console.log("아이디 찾기 에젝 실패");
					}
				});
				
			}else{
				$("#search_Id_Modal").modal('hide');
				alert("인증번호가 틀렸습니다.\n다시 입력해주세요.");
			}
		}
		
		function searchId_loginGo(){
			$("#search_Id_Modal").hide();
			location.href="index.jsp";
		}
	</script>
	
</body>
</html>
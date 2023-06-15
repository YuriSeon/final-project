<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu button{
		font-size : 14px;
		background-color: white;
      	border: none;
	}
	.menu button:hover{
		color:#656c74;
	}
	.menu button:focus{
		outline: none;
	}
	
	.terms-header{
		background-color:#d1d1d1;
		height:70px;
		font-size: 15px;
		font-weight: 600;
		color: white;
      	line-height: 70px;
      	text-align: center;
	}
	#terms-body_1{
      text-align: center;
      padding: 20px 10px 10px 10px;
      font-size: 13px;
    }
</style>
</head>
<body>
    <footer>
    <hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sub-footer" style="border-top: 0; margin-top: 0; padding-top: 0;">
                        <div class="row" style="position:relative; left:130px;">
                            <div class="col-lg-3">
                                <div class="logo"><span>Art<em>Xibition</em></span></div>
                            </div>
                            <div class="col-lg-6">
                                <div class="menu">
                                    <ul>
                                        <li><a href="main.bo" class="active">Home</a></li>
                                        <li><button type="button" data-toggle="modal" data-target="#termsModal">이용약관</button></li>
                                        <li><button>개인정보취급방침</button></li>
                                        <li><button>광고문의</button></li>
                                        <li><button>고객센터</button></li> 
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- 이용약관 모달 -->
	<!-- The Modal -->
    <div class="modal" id="termsModal">
		<div class="modal-dialog">
			<div class="modal-content">
  
				<!-- Modal Header -->
				<div class="terms-header">'여행가보자고' 이용약관</div>
    
          		<!-- Modal body -->
        		<div class="terms-body">
          			<div id="terms-body_1">KH정보교육원의 이용약관은 다음과 같습니다.</div>
			        <div id="terms-body_2">
			            <textarea name="" id="" cols="30" rows="10"></textarea>
			        </div>
        		</div>
  
        	</div>
      	</div>
    </div>
  	
  	<!-- 개인정보취급방침 모달 -->
    <!-- The Modal -->
    <div class="modal" id="loginModal">
      <div class="modal-dialog">
        <div class="modal-content">
  
          <!-- Modal Header -->
          <div class="modal-header">
            <img src="" alt="" style="width: 200px; height:70px; display: block; margin:auto; position: relative; left: 48px;">
            <button type="button" id="termsBtn" class="close" data-dismiss="modal">&times;</button>
          </div>
    
          <!-- Modal body -->
          <div class="modal-body">
            <div id="id-pwd">
              <div id="id-input">
                <input type="text" id="userId" name="userId" placeholder="아이디" style="color: black;">
              </div>
              <div id="pwd-input">
                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="color: black;">
              </div>
            </div>
            <div id="cookie-ck">
              <input type="checkbox" id="saveId" name="saveId">
              <label for="saveId">아이디 저장</label>
            </div>
            <div id="login-fales">
              		<!-- *아이디 또는 비밀번호를 잘못 입력했습니다.<br>
              		&nbsp;&nbsp;입력하신 내용을 다시 확인해주세요. -->
            </div>
            <div>
              <button type="button" id="login-button" onclick="return loginGo();">로그인</button>
            </div>
          </div>
          
          <!-- Modal footer -->
          <div class="modal-footer">
            <a href="">아이디 찾기</a> |
            <a href="">비밀번호 찾기</a> |
            <a href="">회원가입</a>
          </div>
  
        </div>
      </div>
    </div>
  	
  	<!-- 광고문의 모달 -->
    <form action="login.me">
	    <!-- The Modal -->
	    <div class="modal" id="loginModal">
	      <div class="modal-dialog">
	        <div class="modal-content">
	  
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <img src="" alt="" style="width: 200px; height:70px; display: block; margin:auto; position: relative; left: 48px;">
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	    
	          <!-- Modal body -->
	          <div class="modal-body">
	            <div id="id-pwd">
	              <div id="id-input">
	                <input type="text" id="userId" name="userId" placeholder="아이디" style="color: black;">
	              </div>
	              <div id="pwd-input">
	                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="color: black;">
	              </div>
	            </div>
	            <div id="cookie-ck">
	              <input type="checkbox" id="saveId" name="saveId">
	              <label for="saveId">아이디 저장</label>
	            </div>
	            <div id="login-fales">
	              		<!-- *아이디 또는 비밀번호를 잘못 입력했습니다.<br>
	              		&nbsp;&nbsp;입력하신 내용을 다시 확인해주세요. -->
	            </div>
	            <div>
	              <button type="button" id="login-button" onclick="return loginGo();">로그인</button>
	            </div>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <a href="">아이디 찾기</a> |
	            <a href="">비밀번호 찾기</a> |
	            <a href="">회원가입</a>
	          </div>
	  
	        </div>
	      </div>
	    </div>
  	</form>
  	
  	<!-- 고객센터 모달 -->
    <form action="login.me">
	    <!-- The Modal -->
	    <div class="modal" id="loginModal">
	      <div class="modal-dialog">
	        <div class="modal-content">
	  
	          <!-- Modal Header -->
	          <div class="modal-header">
	            <img src="" alt="" style="width: 200px; height:70px; display: block; margin:auto; position: relative; left: 48px;">
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	          </div>
	    
	          <!-- Modal body -->
	          <div class="modal-body">
	            <div id="id-pwd">
	              <div id="id-input">
	                <input type="text" id="userId" name="userId" placeholder="아이디" style="color: black;">
	              </div>
	              <div id="pwd-input">
	                <input type="password" id="userPwd" name="userPwd" placeholder="비밀번호" style="color: black;">
	              </div>
	            </div>
	            <div id="cookie-ck">
	              <input type="checkbox" id="saveId" name="saveId">
	              <label for="saveId">아이디 저장</label>
	            </div>
	            <div id="login-fales">
	              		<!-- *아이디 또는 비밀번호를 잘못 입력했습니다.<br>
	              		&nbsp;&nbsp;입력하신 내용을 다시 확인해주세요. -->
	            </div>
	            <div>
	              <button type="button" id="login-button" onclick="return loginGo();">로그인</button>
	            </div>
	          </div>
	          
	          <!-- Modal footer -->
	          <div class="modal-footer">
	            <a href="">아이디 찾기</a> |
	            <a href="">비밀번호 찾기</a> |
	            <a href="">회원가입</a>
	          </div>
	  
	        </div>
	      </div>
	    </div>
  	</form>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <!-- 차트 링크 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>회원 편집</title>
</head>
<body>
<%@include file="adMenubar.jsp" %>
<!-- Content - Start  -->
<div id="content-wrapper">
    <div class="container-fluid">
        <div class="dash-title">
            <h1>&nbsp;편집 및 추가
                <button class="btn btn-danger" onclick="memberDelete();">삭제</button>
                <button class="btn btn-success" onclick="enrollSubmit();" disabled="disabled">저장</button>
            </h1>
        </div>
        <svg xmlns="http://www.w3.org/2000/svg" width="50" height="30" fill="currentColor" class="bi bi-arrow-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M15 8a.5.5 0 0 0-.5-.5H2.707l3.147-3.146a.5.5 0 1 0-.708-.708l-4 4a.5.5 0 0 0 0 .708l4 4a.5.5 0 0 0 .708-.708L2.707 8.5H14.5A.5.5 0 0 0 15 8z"/>
        </svg>
        <div class="member-container" id="memberCon">
            <!-- 회원정보수정 시작 -->
            <div class="member-update">
                <div class="profile-image">
                    <div id="p_img">
                        <img src="resources/images/person.png" alt="프로필사진">
                    </div>
                    <div class="profile-name">
                        ${m.userName}
                    </div>
                </div>
                <h3>회원정보</h3>
                
                <form action="memberUpdate.ad" class="member-enroll-form" method="post">
                	<input type="text" name="userNo" id="no" value="${m.userNo}" hidden="hidden">
	                <div class="update-box">
	                    <div class="info-input">
	                        <label for="id">아이디</label>
	                        <input type="text" class="form-control input-lg" name="userId" id="id" value="${m.userId}">
	                    </div>
	                    <div class="info-input">
	                        <label for="nick">닉네임</label>
	                        <input type="text" class="form-control input-lg" name="nickname" id="nick" value="${m.nickname}">
	                    </div>
	                    <div class="info-input">
	                        <label for="name">이름</label>
	                        <input type="text" class="form-control input-lg" name="userName" id="name" value="${m.userName}">
	                    </div>
	                    <div class="info-input">
	                        <label for="email">이메일</label>
	                        <input type="text" class="form-control input-lg" name="email" id="email" value="${m.email}">
	                    </div>
	                    <div class="info-input">
	                        <label for="phone">전화번호</label>
	                        <input type="text" class="form-control input-lg" name="phone" id="phone" value="${m.phone}">
	                    </div>
	                    <div class="info-input">
	                        <label for="pwd">비밀번호</label>
	                        <input type="button" class="btn btn-primary" id="pwd" value="비밀번호 초기화">
	                    </div>
	                </div>
                </form>
            </div>
            <!-- 회원정보수정 끝 -->

            <!-- 회원정보 시작 -->
            <div class="member-info">
                <h3>활동 정보</h3>
                <div class="info-container">
                    <div class="info-place">
                        <div class="info-title">가입일</div>
                        <div>${m.enrollDate}</div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">로그인</div>
                        <div>2023.06.03 (3회)</div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">최종 로그인 IP</div>
                        <div>192.169.11.11</div>
                        <br>
                        <div class="info-title">성별</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${m.gender == 'M'}">남자</c:when>
                        		<c:otherwise>여자</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">작성</div>
                        <div class="info-write">
                            <div>피드</div>
                            <div>0개</div>
                            <div>일정자랑</div>
                            <div>0개</div>
                            <div>함께가치</div>
                            <div>0개</div>
                        </div>
                    </div>
                    <!-- <div class="info-place"> -->
                        
                    <!-- </div> -->
                    <div class="info-place">
                        <div class="info-title">연령대</div>
                        <div>${m.age}대</div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">MBTI</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${empty m.MBTI}">미입력</c:when>
                        		<c:otherwise>${m.MBTI}</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">설문지 결과</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${empty m.survey}">미입력</c:when>
                        		<c:otherwise>
                        			<c:set var="survey" value="${m.survey}"/>
                        			본인 : ${fn:substring(survey,0,4)} <br>
                        			선호/비선호 : ${fn:substring(survey,5,9)} / ${fn:substring(survey,10,14)}
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">여행스타일</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${empty m.style}">미입력</c:when>
                        		<c:otherwise>${m.style}</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">관심사</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${empty m.interest}">미입력</c:when>
                        		<c:otherwise>${m.interest}</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">신고누적횟수</div>
                        <div>${m.report}회</div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">경고횟수</div>
                        <div>${m.warning}회</div>
                    </div>
                    <div class="info-place">
                        <div class="info-title">인증 여부</div>
                        <div>
                        	<c:choose>
                        		<c:when test="${m.certification eq 0}">미인증</c:when>
                        		<c:when test="${m.certification eq 1}">카카오</c:when>
                        		<c:otherwise>네이버</c:otherwise>
                        	</c:choose>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 회원정보 끝 -->

        </div><!--멤버  컨테이너-->

    </div><!-- container-fluid -->
</div>

<script>
	
	//수정사항이 있을때 저장버튼 활성화
	$(function() {
		$('#id, #nick, #name, #email, #phone').on('input', function() {
			var idVal = $("#id").val();
			var nickVal = $("#nick").val();
			var nameVal = $("#name").val();
			var emailVal = $("#email").val();
			var phoneVal = $("#phone").val();
			var $submitBtn = $(".dash-title>h1>.btn-success");
			
			if (idVal !== '' || nickVal !== '' || nameVal !== '' || emailVal !== '' || phoneVal !== '') {
				$submitBtn.prop('disabled', false);
			} else {
				$submitBtn.prop('disabled', true);
			}
		});
	});

	//폼 서브밋
	function enrollSubmit() {
		$(".member-enroll-form").submit();
	}
    
	//회원 탈퇴
	function memberDelete() {
		
    	$.ajax({
    		type: "post",
    		url: "memberDelete.ad",
    		data: {	userNo : "${m.userNo}" },
			success: function(result) {
				if(result=="success"){
					location.href="member.ad";
				}else{
					alertify.message("회원 탈퇴 실패");
				}
			},
			error: function(result) {
				console.log("통신실패");
			}
    	});
	}
	
    //뒤로가기
    $(function() {
		$("svg").click(function() {
			history.back();
		});
	});
    
</script>
</body>
</html>
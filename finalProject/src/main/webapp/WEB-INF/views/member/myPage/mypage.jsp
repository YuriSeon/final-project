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

    </style>
</head>
<body>

 	<%@include file="../../common/menubar.jsp" %>
 	
 	<hr style="position: relative; top: -16px; height:10px; border:0; box-shadow:0 10px 10px -10px #bbb inset;">
 	
    <div id="contents" class="subscribe2">
        <div class="tit_cont tit_my">
            <h2>
                <span class="ico">My</span>
                마이페이지
            </h2>
        </div>
        <div class="mapage_subscribe">
            <div class="inr">
                <div class="pabox">
                	<div class="profile_box"><!-- 여행가는 달 없을때 type1클래스 추가 -->
                    	<div class="inr">
                        	<div class="fix_wrap">
								<div class="box" id="followquick">
									<div class="tit_cont">
                                    	<span class="fas fa-bars" id="menubtn"></span>
										<div class="pop_subMenu pop_myPage" tabindex="0">
											<ul id="profileMenu">
												<li class="btn_info01"><a href="goInfoUpdate.me">개인정보 변경</a></li>
												<li class="btn_logout"><a href="javascript:removeRecentSession();">로그아웃</a></li>
												<li class="btn_out"><a href="goInfoDelete.me">회원탈퇴</a></li>
											</ul>
										</div>
									</div>
									<form name="pform" id="pform">
			                        	<div style="width: 100%; height: 100%;">
	                                        <div id="p_img">
	                                        	<c:choose>
	                                        		<c:when test="${not empty loginUser.profileImg}">
			                                            <!--프로필 있으면-->
			                                            <img src="${loginUser.profileImg}" alt="프로필사진">
	                                        		</c:when>
	                                        		<c:otherwise>
			                                            <!--프로필 없으면-->
			                                            <img src="resources/images/profile/person.png" alt="프로필사진">
	                                        		</c:otherwise>
	                                        	</c:choose>
	                                        </div>
	                                        <div id="p_nickname" align="center">
	                                            <span style="font-size: 30px; font-weight: 580;">${loginUser.nickname}</span>
	                                        </div>
	                                        <div id="p_age" align="center">
	                                            <span style="font-size: 20px; font-weight: 540;">${loginUser.age}대</span>
	                                        </div>
	                                        <div id="p_style" align="center">
		                                        <c:choose>
		                                        	<c:when test="${loginUser.style == null}"><span style="font-size: 20px; font-weight: 540;">여행스타일을 정해주세요.</span></c:when>
		                                        	<c:otherwise><span style="font-size: 20px; font-weight: 540;">${loginUser.style }</span></c:otherwise>
		                                        </c:choose>
	                                        </div>
                                    	</div>
				                        <div class="profile-update">
				                            <a href="javascript:void(0)" id="profileUpdate">프로필 이미지 설정&gt;</a>
				                        </div>
		                        	</form>
		                        	<!--프로필사진 바꾸기 모달-->
                                	<div class="modal fade" id="followModal" role="dialog"> 
                                    	<div class="modal-dialog">
	                                      	<!-- Modal content-->   
	                                      	<div class="modal-content">
	                                        	<div class="modal-header2">
	                                          		<h4 class="modal-title"></h4>
	                                          		<button type="button" class="close" data-dismiss="modal">×</button>
	                                        	</div>
	                                        	<div class="modal-body2">
	                                        		<div class="profile-image" id="p_img" style="position: relative; left: 0px;">
		                                            	<c:choose>
			                                        		<c:when test="${not empty loginUser.profileImg}">
					                                            <!--프로필 있으면-->
					                                            <img id="profileImg" src="${loginUser.profileImg}" alt="프로필사진">
			                                        		</c:when>
			                                        		<c:otherwise>
					                                            <!--프로필 없으면-->
					                                            <img id="profileImg" src="resources/images/profile/person.png" alt="프로필사진">
			                                        		</c:otherwise>
		                                        		</c:choose>
	                                        		</div>
	                                               	<form action="updateImg.me" method="post" enctype="multipart/form-data" id="imgForm">
		                                                <input type="file" class="form-control-file border" name="upfile" onchange="loadImg(this,1);" required="required">
		                                                <input type="hidden" name="writer" id="nickname" value="${loginUser.nickname}">
		                                                <button type="submit" class="btn btn-primary" id="imgChange">사진변경</button>
		                                                <button type="button" class="btn btn-danger" onclick="deleteImg()">사진삭제</button>
                                              		</form>
                                        		</div>
                                      		</div>
                                    	</div>
                                  	</div>
                                  	<!--프로필사진 바꾸기 모달 끝-->
							</div>
						</div>
                    </div>
                </div>

                <div class="subscribe_box">
                    <div class="active">
                        <h3>나의 활동</h3>
                        <div class="inr">
                            <ul>
                                <li>
                                    <a href="myWriting.me" class="icon1"><img src="resources/images/edit.png" alt="" width="50px" height="50px"></a>
                                    <span>작성글 보기</span>
                                </li>
                                <li>
                                    <a href="myChoice.me" class="icon2"><img src="resources/images/star.png" alt="" width="50px" height="50px"></a>
                                    <span>찜 목록</span>
                                </li>
                                <li>
                                    <a href="myChat.me" class="icon3"><img src="resources/images/email.png" alt="" width="50px" height="50px"></a>
                                    <span>쪽지</span>
                                </li>
                                <li>
                                    <a href="myFoot.me" class="icon4"><img src="resources/images/compass.png" alt="" width="50px" height="50px"></a>
                                    <span>발도장</span>
                                </li>
                                <li>
	                                <c:choose>
	                                	<c:when test="${loginUser.certification == 1}">
	                                		<a href="javascript:void(0);" class="icon5"><img src="resources/images/icon_kakao.png" alt="" width="50px" height="50px"></a>
	                                		<span>인증 완료</span>
	                                	</c:when>
	                                	<c:when test="${loginUser.certification == 2}">
	                                		<a href="javascript:void(0);" class="icon5"><img src="resources/images/icon_naver.png" alt="" width="50px" height="50px"></a>
	                                		<span>인증 완료</span>
	                                	</c:when>
	                                	<c:otherwise>
                                    		<a href="javascript:popup();" class="icon5"><img src="resources/images/padlock.png" alt="" width="50px" height="50px"></a>
                                    		<span>동행 인증</span>
	                                	</c:otherwise>
	                                </c:choose>
                                </li>
                                <li>
                                    <a href="survey.me" class="icon6"><img src="resources/images/check.png" alt="" width="50px" height="50px"></a>
                                    <span>설문지</span>
                                </li>
                                <li>
                                    <a href="mySchedule.me" class="icon7"><img src="resources/images/location.png" alt="" width="50px" height="50px"></a>
                                    <span>일정등록</span>
                                </li>
                                <li>
                                    <a href="myQna.me" class="icon8"><img src="resources/images/doubts-button.png" alt="" width="50px" height="50px"></a>
                                    <span>Q&amp;A</span>
                                </li>
                            </ul>
                        </div><!-- .inr -->
                        <hr style="border:1px solid #8390a3;">
                    </div><!-- .active -->
                </div><!-- .subscribe_box -->
            </div><!-- .pabox -->
            
				<div class="lately_cont">
					<h3>&nbsp;&nbsp;&nbsp;내가 최근 본 콘텐츠</h3>
					<div class="swiper-container swiper-container-initialized swiper-container-horizontal"><br>
	            	    <button class="swiper-button-next "><img src="resources/images/next.png" width="30px"></button>
	                	<button class="swiper-button-prev "><img src="resources/images/prev.png" width="30px"></button>
	
	                    <div class="swiper-wrapper" id="recentSwiper" >
<!-- 	                    	<div class="swiper-slide swiper-slide-active" style="margin-right: 20px;"> -->
<!-- 	                        	<a href=""> -->
<!-- 	                            	<img src="" alt="" width="200px" height="200px"><br> -->
<!-- 		                            <p> -->
<!-- 		                            	<strong>신당동 떡볶이 골목</strong> -->
<!-- 		                            </p> -->
<!-- 	                            </a> -->
<!-- 	                        </div> -->
<!-- 							<div class="swiper-slide swiper-slide-next" style="margin-right: 20px;"> -->
<!-- 	                            <a href=""> -->
<!-- 	                                <img src="" alt="" width="200px" height="200px"><br> -->
<!-- 	                                <p> -->
<!-- 	                                	<strong>[서울둘레길 4코스] 대모·우면산코스</strong> -->
<!-- 	                                </p> -->
<!-- 	                            </a> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="swiper-slide" style="margin-right: 20px;"> -->
<!-- 	                            <a href=""> -->
<!-- 	                                <img src="" alt="" width="200px" height="200px"><br> -->
<!-- 	                                <p> -->
<!-- 	                               		<strong>강강술래 당산점</strong> -->
<!-- 	                                </p> -->
<!-- 	                            </a> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="swiper-slide" style="margin-right: 20px;"> -->
<!-- 	                            <a href=""> -->
<!-- 	                                <img src="" alt="" width="200px" height="200px"><br> -->
<!-- 	                                <p> -->
<!-- 	                                	<strong>초막골생태공원느티나무야영장</strong> -->
<!-- 	                                </p> -->
<!-- 	                            </a> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="swiper-slide" style="margin-right: 20px;"> -->
<!-- 	                            <a href=""> -->
<!-- 	                                <img src="" alt="" width="200px" height="200px"><br> -->
<!-- 	                                <p> -->
<!-- 	                                	<strong>가온오토캠핑장</strong> -->
<!-- 	                                </p> -->
<!-- 	                            </a> -->
<!-- 	                        </div> -->
	                    </div><!-- #recentSwiper -->
	                </div><!-- .swiper-container -->
				</div><!-- .lately_cont -->
			</div> <!-- .inr -->
        </div><!-- .mapage_subscribe -->
    </div><!-- #contents -->
    <button onclick="naverLogout();" style="background-color: white; border: none; width: 50px; height: 50px; position: absolute; top: 130px;"></button>
    <button onclick="kakaoLogout();" style="background-color: white; border: none; width: 50px; height: 50px; float: right; position: relative; top: -1210px;"></button>
    <script>
    	
    	//최근 본 게시물 슬라이드
        const mySwiper = new Swiper('.swiper-container',{
            loop: false,
            speed: 500,
            slidesPerView: 3,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });

    	//프로필 박스 스크롤 따라오기
        $(window).scroll(function(){
            var scrollTop = $(document).scrollTop();
            
            if (scrollTop < 0) {
            scrollTop = 0;
            }
            if (scrollTop > 450) {
                scrollTop = 450;
            }
            $("#followquick").stop();
            $("#followquick").animate( { "top" : scrollTop });
        });
        
      	//프로필 변경 모달
        $('#profileUpdate').click(function(){
            $('#followModal').modal(); //id가 "followModal"인 모달창을 열어준다. 
            $('.modal-title').text("프로필 사진 변경"); //modal 의 header 부분에 값을 넣어준다.
            $('.modal-title').css("font-size","30px");
            $("#profileImg").attr("src","resources/images/profile/person.png");
        });
      	
      	//파일인풋 숨기기
        $(function() {
			$("input[name=upfile]").hide();
			$(".profile-image").click(function() {
				$("input[name=upfile]").click();
			});
		});
      	
      	//프로필 사진 미리보기
      	function loadImg(inputFile,num) {
			if(inputFile.files.length == 1){
				var reader = new FileReader();
				
				reader.readAsDataURL(inputFile.files[0]);
				
				reader.onload = function(e) {//e:이벤트 객체
					$("#profileImg").attr("src",e.target.result);
				}
			}else{
				$("#profileImg").attr("src","resources/images/profile/person.png");
			}
		}
		
      	//사진 안고르면 경고
        $(function() {
       		$('#imgChange').click(function(event) {
	       	    event.preventDefault(); // 폼 서브밋을 막음
	       	    var input = $('input[name=upfile]');
	       	    if (input[0].checkValidity()) {
	       	      $('#imgForm').submit(); // 폼 서브밋
	       	    } else {
	       	      alert("사진을 골라주세요.");
	       	    }
	       	  });
		});
      	
        //프로필 사진 삭제
        function deleteImg() {
        	var nickname = $("#nickname").val();
            
        	if (confirm("사진을 삭제하시겠습니까?")) {
				
	            $.ajax({
	                url: "deleteImg.me",
	                type: "POST",
	                data: { nickname : nickname },
	                success: function() {
	                	location.reload();
	                },
	                error: function() {
	                }
	            });
			}
		}

        //동행인증 팝업
        function popup() {
			let popOption = "width = 450px, height=550px, top=300, left=300px, scrollbars=yes";
			let openUrl = 'myCertification.me';
			window.open(openUrl,'pop',popOption);
		}
        
      //네이버 로그아웃
    	var testPopUp;
    	function openPopUp() {
    	    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1,left=-1000,top=-1000");
    	}
    	function closePopUp(){
    	    testPopUp.close();
    	}
    	
    	function naverLogout() {
    		openPopUp();
    		setTimeout(function() {
    			closePopUp();
    			}, 100);
    	}
    	
    	//카카오 로그아웃
    	var test2PopUp;
    	function kopenPopUp() {
    	    test2PopUp= window.open("https://kauth.kakao.com/oauth/logout?client_id=04c77a2f5ca75a521a0d0e08cbb740b3&logout_redirect_uri=http://localhost:8888/finalProject/");
    	    
    	}
    	function kclosePopUp(){
    	    test2PopUp.close();
    	}

    	function kakaoLogout() {
    		kopenPopUp();
    		setTimeout(function() {
    			kclosePopUp();
    			}, 1000);
    	}
    	
		function getRecentPageInfo() {
    		var recentPages = sessionStorage.getItem('recentPages');

    		if (recentPages) {
    			return JSON.parse(recentPages);
    		} else {
    			return [];
    		}
    	}

		$(function() {
			var recentPages = getRecentPageInfo();
			var str = "";
			
			for (var i = 0; i < recentPages.length; i++) {
				var pageInfo = recentPages[i];
	
			  	var thumbnail = pageInfo.thumbnail;
			  	var title = pageInfo.title;
			  	var url = pageInfo.url;
	
				// 최근 페이지 정보 사용 예시
				str += '<div class="swiper-slide" style="margin-right: 20px;">' 
				    + '<a href="' + url + '">'
				    + '<img src="' + thumbnail + '" alt="" width="200px" height="200px"><br>'
				    + '<p>'
				    + '<strong>' + title + '</strong>'
				    + '</p>'
				    + '</a>'
				    + '</div>';
			}
			
			$("#recentSwiper").html(str);
			mySwiper.update();
		});
		
		//로그아웃 최근 글 세션 삭제
    	function removeRecentSession() {
    		sessionStorage.removeItem('recentPages');
    		location.href='logout.me';
		}

    </script>
    
    <%@include file="../../common/footer.jsp" %>
</body>
</html>
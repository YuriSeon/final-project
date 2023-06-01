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
    <link rel="stylesheet" type="text/css" href="resources/css/mypage.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <title>Document</title>
</head>
<body>

 	<%@include file="../common/menubar.jsp" %>
 	
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
									<!-- <button type="button" title="열기" class="fas fasbars"></button> -->
                                    	<span class="fas fa-bars" id="menubtn"></span>
										<div class="pop_subMenu pop_myPage" tabindex="0">
											<ul id="profileMenu">
												<li class="btn_info01"><a href="#">개인정보 변경</a></li>
												<li class="btn_logout"><a href="javascript:showLogin(1);">로그아웃</a></li>
												<li class="btn_out"><a href="javascript:memberLeave();">회원탈퇴</a></li>
											</ul>
										</div>
									</div>
									<form name="pform" id="pform">
			                        	<div class="profile">
			                            	<img src="resources/images/person.png" alt="" width="100px" id="profileImg">
			                        	</div>
			                        	<p>반가워요!</p>
			                        	<strong class="userName">J*****E 님</strong>
				                        <div class="btn">
				                        	<input type="file" id="fileUp" name="fileUp" accept="image/*" onchange="fileChange(this)" style="display:none;">
				                            <a href="javascript:;" id="profileUpdate">프로필 이미지 설정&gt;</a>
				                            <a href="javascript:profileUpload();" id="profileSave" style="display:none;">변경 완료</a>
				                            <label for="fileUp" class="btn_fileUp"></label>
				                        </div>
		                        	</form>
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
                                    <a href="../mypage/mypage_list_fav.do" class="icon1"><img src="resources/images/edit.png" alt="" width="50px" height="50px"></a>
                                    <span>작성글 보기</span>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_list_fav.do" class="icon2"><img src="resources/images/star.png" alt="" width="50px" height="50px"></a>
                                    <span>찜 목록</span>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_list_reply.do" class="icon3"><img src="resources/images/email.png" alt="" width="50px" height="50px"></a>
                                    <span>쪽지</span>
                                </li>
                                <li>
                                    <a href="/mypage/mypage_list_stamp.do" class="icon4"><img src="resources/images/compass.png" alt="" width="50px" height="50px"></a>
                                    <span>발도장</span>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_list_cos.do" class="icon5"><img src="resources/images/padlock.png" alt="" width="50px" height="50px"></a>
                                    <span>동행 인증</span>
                                </li>
                                <li>
                                    <a href="/mypage/tourist_info_list.do" class="icon6"><img src="resources/images/check.png" alt="" width="50px" height="50px"></a>
                                    <span>설문지</span>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_list_qna.do" class="icon7"><img src="resources/images/location.png" alt="" width="50px" height="50px"></a>
                                    <span>일정등록</span>
                                </li>
                                <li>
                                    <a href="../mypage/mypage_list_qna.do" class="icon8"><img src="resources/images/doubts-button.png" alt="" width="50px" height="50px"></a>
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
	                    	<div class="swiper-slide swiper-slide-active" style="margin-right: 20px;">
	                        	<a href="">
	                            	<img src="background/forest.jpg" alt="" width="200px" height="200px"><br>
		                            <p>
		                            	<strong>신당동 떡볶이 골목</strong>
		                            </p>
	                            </a>
	                        </div>
	                        <div class="swiper-slide swiper-slide-next" style="margin-right: 20px;">
	                            <a href="">
	                                <img src="background/forest.jpg" alt="" width="200px" height="200px"><br>
	                                <p>
	                                	<strong>[서울둘레길 4코스] 대모·우면산코스</strong>
	                                </p>
	                            </a>
	                        </div>
	                        <div class="swiper-slide" style="margin-right: 20px;">
	                            <a href="">
	                                <img src="background/forest.jpg" alt="" width="200px" height="200px"><br>
	                                <p>
	                               		<strong>강강술래 당산점</strong>
	                                </p>
	                            </a>
	                        </div>
	                        <div class="swiper-slide" style="margin-right: 20px;">
	                            <a href="">
	                                <img src="background/forest.jpg" alt="" width="200px" height="200px"><br>
	                                <p>
	                                	<strong>초막골생태공원느티나무야영장</strong>
	                                </p>
	                            </a>
	                        </div>
	                        <div class="swiper-slide" style="margin-right: 20px;">
	                            <a href="">
	                                <img src="background/forest.jpg" alt="" width="200px" height="200px"><br>
	                                <p>
	                                	<strong>가온오토캠핑장</strong>
	                                </p>
	                            </a>
	                        </div>
	                    </div><!-- #recentSwiper -->
	                </div><!-- .swiper-container -->
				</div><!-- .lately_cont -->
			</div> <!-- .inr -->
        </div><!-- .mapage_subscribe -->
    </div><!-- #contents -->
    
    <script>
        const mySwiper = new Swiper('.swiper-container',{
            loop: false,
            speed: 500,
            slidesPerView: 3,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });

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

    </script>
    
    <%@include file="../common/footer.jsp" %>
</body>
</html>
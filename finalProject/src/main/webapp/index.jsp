<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
	<meta charset="UTF-8">
    <title>메인</title>
    <style>
     	@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
  #themeOuter{
  	height:700px;
  	background-image:linear-gradient(
        rgba(255, 255, 255, 0.7),
        rgba(255, 255, 255, 1)
      ), url("resources/images/자연.jpg");
  	background-size: cover;
  }
  #attractionOuter{
  height:700px;
  }
  #festivalOuter{
  height:700px;
  }
  #togetherOuter{
  height:700px;
  }
.swiper-slide{
	width:400px;
	height:400px;
	border-radius: 20px;
}
.swiper-slide>div{
	width:400px;
	height:400px;
	border-radius: 20px;
}
.swiper-slide img{
	width:100%;
	height:100%;
	cursor : pointer;
}
.swiper-slide img:hover{
	cursor : pointer;
}
	#ani:hover::after,#star:hover::after,#ko:hover::after,#hea:hover::after,#ping:hover::after,#art:hover::after {
    opacity: 1;
}
	#star::after{
	content: "   #별보러 가지 않을래?";
    position: absolute;
    top: 40%;
    left: 20%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#ko::after{
	content: "#전통 한옥";
    position: absolute;
    top: 40%;
    right: 40%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#hea::after{
	content: "#힐링";
    position: absolute;
    bottom: 10%;
    left: 19%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#ping::after{
	content: "#캠핑";
    position: absolute;
    bottom: 10%;
    right: 44%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
	#art::after{
	content: "#전시회";
    position: absolute;
    bottom: 10%;
    right: 12%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
#ani::after {
    content: "#평생 친구와 함께";
    position: absolute;
    top: 40%;
    right: 3%;
    transform: translate(-50%, -50%);
    color: white;
    font-weight: bold;
    opacity: 0;
    transition: opacity 0.5s ease;
    font-size: 25px;
	}
        #mainCalendar{
            width:80%;
            height:400px;
            border : 1px solid black;
            text-align: center;
        }
        #mainCalendar>thead>tr th{
            font-size: 30px;
            width: 12.8%;
        }
        #mainCalendar>tbody>tr td{
            font-size: 20px;
        }
        .dateTr{
            height:20px;
            background-color:#F6FFF8;
        }
/*         .dataTr td:hover{ */
/*         	background-color:lightgray; */
/*         } */
        .sun{
        	color : red;
        }
        .sat{
        	color:blue;
        }
        #mainMonth{
        	font-size:40px;
        	width:80%; 
        	height:100px; 
        	margin:auto;
        	margin-top : 15px;
        }
        .fesDiv{
        	width:100%;
        	height:10px;
        	margin : 6px 0px;
        }
        .fesNo0{
              background-color: red;
        }
        .fesNo1{
              background-color: orange;
        }
       .fesNo2{
              background-color: yellow;
        }
       .fesNo3{
              background-color: green;
        }
       .fesNo4{
              background-color: blue;
        }
        .fesNo5{
              background-color: darkblue;
        }
        .fesNo6{
              background-color: purple;
        }
        .fesImgDiv{
        	z-index:10;
        }
        .fesImgDiv img{
        	width:100px;
        	height:100px;
        	background-color:white;
        }
        #mainTogetherList{
        	width:1800px;
        	height:600px;
        	margin:auto;
        }
        #mainTogetherList>div{
        	float:left;
        	border : 1px solid black;
        	margin : 10px;
        	width : 400px;
        	height: 600px;
        	box-shadow:5px 5px 5px 5px gray;
        }
        #mainTogetherList>div:hover{
        	width:415px;
        	height:615px;
        }
        #mainTogetherList>div>img{
        	width:350px;
        	height:350px;
        	border-radius:50%;
        	margin : 25px;
        }
    </style>
</head>
    
    <body>
    <div id="js-preloader" class="js-preloader">
      <div class="preloader-inner">
        <span class="dot"></span>
        <div class="dots">
          <span></span>
          <span></span>
          <span></span>
        </div>
      </div>
    </div>
    <%@include file="WEB-INF/views/common/menubar.jsp" %>
    
 	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
	
    <div class="main-banner">
        <div class="counter-content">
        	<p id="festivalName"></p>
            <ul>
                <li>일<span id="days"></span></li>
                <li>시간<span id="hours"></span></li>
                <li>분<span id="minutes"></span></li>
                <li>초<span id="seconds"></span></li>
            </ul>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="main-content">
                        <div class="next-show">
                            <i class="fa fa-arrow-up"></i>
                            <span>가까운 축제 남은 날짜</span>
                        </div>
                        <h6>여행을 가고싶은 당신!</h6>
                        <h2>여행 정보가 필요한 당신!</h2>
                        <div class="main-white-button">
<!--                             <a class="btn btn-outline-secondary">가보자고</a> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script>
		$(function(){
			
			const second = 1000,
		      minute = second * 60,
		      hour = minute * 60,
		      day = hour * 24;

				$.ajax({
					url : "mainFesBanner.do",
					success : function(result){
							$("#festivalName").html("< "+result.boardTitle+" >");		

							let countDown = new Date(result.startDate).getTime(),
						    x = setInterval(function() {    
							
						      let daysElement = document.getElementById('days'),
						          hoursElement = document.getElementById('hours'),
						          minutesElement = document.getElementById('minutes'),
						          secondsElement = document.getElementById('seconds');

						      let now = new Date().getTime(),
						          distance = countDown - now;
						          
						      if (daysElement) {
						        daysElement.innerText = Math.floor(distance / (day));
						      }

						      if (hoursElement) {
						        hoursElement.innerText = Math.floor((distance % (day)) / (hour));
						      }

						      if (minutesElement) {
						        minutesElement.innerText = Math.floor((distance % (hour)) / (minute));
						      }

						      if (secondsElement) {
						        secondsElement.innerText = Math.floor((distance % (minute)) / second);
						      }

						      if (distance < 0) {
						       clearInterval(x);
						      	console.log("축제 시작!");
						      }
						      
						    }, second)								
							
					},
					error : function(){
						console.log("메인 가까운 축제 갱신 실패");						
					}
				});
		});
</script>

	<br><br><br>

	<div id="mainContentOuter">
			<div id="themeOuter" >
					   <div class="themeTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">다채로운 추천 테마 여행!</p>
		                	<a style="position:relative; left:1700px; bottom:50px;" class="btn" href="theme.bo" >더 알아보기 ></a>
		                </div>
				  <div class="swiper themeSwiper" style="width:100%; height:500px; margin-top : 100px; position:absolute;">
				    <div class="swiper-wrapper">
				      <div class="swiper-slide">
					      	<div id="star">
				                <img src="resources/images/밤하늘에별.jpg" alt="" style="border-radius: 20px;">
				            </div>
			           </div>
				      <div class="swiper-slide">
			            <div id="ko">
			                <img src="resources/images/한옥.jpg" alt="" style="border-radius: 20px;">
			            </div>
				      </div>
				      <div class="swiper-slide">
			            <div onclick="list();" id="ani">
			                <img src="resources/images/car-dog.jpg" alt="" style="border-radius: 20px;">
			            </div>
				      </div>
				      <div class="swiper-slide">
			            <div id="hea">
			                <img src="resources/images/힐링.jpg" alt="" style="border-radius: 20px;">
			            </div>
				      </div>
				      <div class="swiper-slide">
			            <div id="ping">
			                <img src="resources/images/캠핑.jpg" alt="" style="border-radius: 20px;"> 
			            </div>
				      </div>
				      <div class="swiper-slide">
			            <div id="art">
			                <img src="resources/images/전시회.jpg" alt="" style="border-radius: 20px;">
			            </div>
				      </div>				      
				    </div>
				  </div>
<!-- 				    <div class="swiper-pagination" style="position:relative; height:50px; top:550px;"></div> -->
				    <div class="swiper-button-next" style="position:relative; height:100px; top:220px; left:1850px;"></div>
				    <div class="swiper-button-prev" style="position:relative; height:100px; top:150px; "></div>
				    
			<script>
					var swiper = new Swiper(".themeSwiper", {
						    slidesPerView: 4,
						    spaceBetween: 20,
						    observer: true,
						    observeParents: true,
						    loop : true,
						    loopAdditionalSlides : 1,
						    autoplay: {
						        delay: 3000,
						        disableOnInteraction: false,
						    },
						    navigation: {
						      nextEl: ".swiper-button-next",
						      prevEl: ".swiper-button-prev",
						    }
// 						    ,
// 						    pagination: {
// 						      el: ".swiper-pagination",
// 						      clickable: true,
// 						    }
					  });
					
					$(".swiper-button-next").click(function(){
							swiper.slideNext();
					});
					
					function list(){
						location.href = "themaList.bo";
					}
			</script>

			</div>
			
			<br>
			
<div id="festivalOuter" >
					   <div class="festivalTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">구석구석 축제가는 날</p>
		                	<a style="position:relative; left:1700px; bottom:50px;" class="btn" href="festival.bo" >더 알아보기 ></a>
		                </div>
		                <br><br><br><br>
		                <div id="mainMonth" align="center"></div>
    <table id="mainCalendar" border="1" align="center" style="box-shadow:5px 5px 5px 5px gray;">
        <thead>
            <tr style="border-bottom: 1px solid black;">
                <th class="sun th">일</th>
                <th class="mon th">월</th>
                <th class="thus th">화</th>
                <th class="wen th">수</th>
                <th class="thur th">목</th>
                <th class="fri th">금</th>
                <th class="sat th">토</th>
            </tr>
        </thead>
        <tbody>
            <tr class="dateTr dateTr1" align="center">
            	<td></td>
            	<td></td>
            	<td></td>
            	<td></td>
            	<td></td>
            	<td></td>
            	<td></td>
            </tr>
            <tr class="dataTr dataTr1">
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
					<td></td>
					<td></td>            		
            </tr>
            <tr class="dateTr dateTr2" align="center">
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr class="dataTr dataTr2">
            	<td></td>
            	<td></td>
            	<td></td>
            	<td></td>
				<td></td>
				<td></td>
				<td></td>            	
            </tr>
        </tbody>
    </table>

    <script>
        var day = new Date().getDate(); // 6일
        var year = new Date().getFullYear();
	    var month = new Date().getMonth()+1;
        var today = new Date().getDay(); //0-일 1-월 ... 4>목요일

        $(function(){
        	$("#mainMonth").html(month+"월");
            var count = day-today;
            for(var i=0; i<7; i++){
                $(".dateTr1").children().eq(i).html(count);
                $(".dataTr1").children().eq(i).addClass("2023-0"+month+"-0"+count);
                var count2 = count+7;
                $(".dateTr2").children().eq(i).html(count2);
	                if(count2<10){
	                	$(".dataTr2").children().eq(i).addClass("2023-0"+month+"-0"+count2);
	                }else{
	                	$(".dataTr2").children().eq(i).addClass("2023-0"+month+"-"+count2);	
	                }
                if(count == day){
                    $(".dateTr1").children().eq(i).html("Today "+count).css("color","green");
                }
                count++;
            };
            
            $.ajax({
					url : "mainFesCalendar.do",
					success : function(result){
						console.log(result);
							$(".dataTr td").each(function(){
								for(var i in result){
									if(new Date($(this).prop("class")).getTime() - new Date(result[i].startDate).getTime() > 0 && new Date($(this).prop("class")).getTime() - new Date(result[i].endDate).getTime() < 0){
// 											var str = "";
// 											      				str += "<div class='swiper-slide' style='width:138px; height:142px;'><img style='width:90%; height:90%; margin:5% 5% 0% 5%;' src='"+result[i].filePath+"'><br><p style='width:100%; height:10%;'>"+result[i].boardTitle+"</p></div>";
// 											$(this).children().children().append(str);
									}
								}
							
							});					
					},
					error : function(){
						console.log("메인 축제 불러오기 실패");
					}
            });
            
        })
        
    </script>
			

</div>
			
			<br>
<div id="attractionOuter" >
					   <div class="attractionTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">전국 방방곡곡 관광 명소</p>
		                	<a style="position:relative; left:1700px; bottom:50px;" class="btn" href="attraction.bo" >더 알아보기 ></a>
		                </div>

</div>
			
			<br>
<div id="togetherOuter" >
					   <div class="togetherTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">혼자 여행하기 적적할 때는 ?</p>
		                	<a style="position:relative; left:1700px; bottom:50px;" class="btn" href="together.bo" >더 알아보기 ></a>
		                </div>
			<br><br><br>
			<div style="width:90%; margin:auto; height:60px; font-size:35px; text-align:center;">인증을 완료한 회원님들이에요 !!</div>
			<div id="mainTogetherList">
					<div align="center">
							<img src="resources/images/강아지 산책.png">
							<h3>멍멍왈왈그르릉</h3>
							<h4>20대</h4>
							<h5>여행 스타일 : 반려동물</h5>
							<h5>신고 누적 횟수 : 1</h5>
							<br>
							<button type="button" class="btn btn-outline-secondary">이 사람의 최신 글 보기</button>
					</div>
					<div align="center">
							<img src="resources/images/sung.JPEG">
							<h3>한성</h3>
							<h4>20대</h4>
							<h5>여행 스타일 : 자유, 테마, 음식</h5>
							<h5>신고 누적 횟수 : 10</h5>
							<br>
							<button type="button" class="btn btn-outline-secondary" onclick="goTogether();">이 사람의 최신 글 보기</button>
					</div>
					
					<script>
							function goTogether(){
								location.href="togetherDetail.bo?boardNo=";
							}
					</script>
					
					<div align="center">
							<img src="resources/images/산악회.jpeg">
							<h3>백슉묵자해쫘놔</h3>
							<h4>50대</h4>
							<h5>여행 스타일 : 산, 액티비티</h5>
							<h5>신고 누적 횟수 : 2</h5>
							<br>
							<button type="button" class="btn btn-outline-secondary">이 사람의 최신 글 보기</button>
					</div>
					<div align="center">
							<img src="resources/images/엄마프사.jpeg">
							<h3>선미 엄마</h3>
							<h4>50대</h4>
							<h5>여행 스타일 : 테마, 힐링, 쇼핑</h5>
							<h5>신고 누적 횟수 : 3</h5>
							<br>
							<button type="button" class="btn btn-outline-secondary">이 사람의 최신 글 보기</button>
					</div>															
			</div>

</div>
			
			<br>
			
</div>
	
	<%@include file="WEB-INF/views/common/footer.jsp" %>
    <script src="resources/js/custom.js"></script>

  </body>
</html>
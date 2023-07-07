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
  background-image:linear-gradient(
        rgba(255, 255, 255, 0.1),
        rgba(255, 255, 255, 1)
      ), url("resources/images/main-attraction.jpg");
  background-size: cover;
  }
  #festivalOuter{
  height:700px;
  background-image:linear-gradient(
        rgba(255, 255, 255, 0.7),
        rgba(255, 255, 255, 1)
      ), url("https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=1072c599-d65c-440c-ab62-db163e3a41d7");
  background-size: cover;
  }
  #togetherOuter{
  height:700px;
  background-image:linear-gradient(
        rgba(255, 255, 255, 0.7),
        rgba(255, 255, 255, 1)
      ), url('/finalProject/resources/images/함께가치배너.jpg');
  background-size: cover;
  
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
       #mainCalendar>tbody>tr td>div{
            background-color : lightgreen;
            border-radius:50%;
            width:180px;
            height:120px;
            font-size : 15px;
            padding-top : 43px;
            margin:auto;
            display:none;
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
        	background-color: white;
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
        #attractionDiv{
        	width:90%;
        	height:80%;
        	border-top : 2px solid black;
        	margin:auto;
        	background-color:rgba(255,255,255,0.5);
        }
        #attractionMenu{
        	height:10%;
        	border-bottom : 2px solid black;
        }
         #attractionMenu>div{
         	float:left;
         	text-align:center;
         }
        .attractionMenuText{
        	width:5.55%;
        	height:100%;
        	font-size:25px;
         	padding : 5px 0px; 
        }
        .attractionMenuText:hover{
			border : 2px solid blue;
			color : blue;
			height:80%;
			border-radius :30px;        
			margin : 5px 0px; 
			cursor : pointer;
        }
        #attractionImgArea{
        	height:90%;
        }
         #attractionImgArea>div{
         	float : left;
         }
         .attImg{
         	height:80%; 
         	width:23%; 
         	margin:5% 1% 0% 1%;
         }
        .attImg>img:hover{
        	transform: perspective(700px) translateZ(50px);
        	cursor : pointer;
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
	
	<c:if test="${not empty loginUser.interest }">
			<script>
					$(function(){
							var interest = "${loginUser.interest}";
							var first = interest.split("-")[0];
							var second = interest.split("-")[1];
							var third = interest.split("-")[2];
							var fourth = interest.split("-")[3];
							
							switch(first){
							case "동행구하기" : $("#mainContentOuter").append($("#togetherOuter")); break;
							case "테마여행" : $("#mainContentOuter").append($("#themeOuter")); break;
							case "축제" : $("#mainContentOuter").append($("#festivalOuter")); break;
							case "명소/맛집" : $("#mainContentOuter").append($("#attractionOuter")); break;
							}
							switch(second){
							case "동행구하기" : $("#mainContentOuter").append($("#togetherOuter")); break;
							case "테마여행" : $("#mainContentOuter").append($("#themeOuter")); break;
							case "축제" : $("#mainContentOuter").append($("#festivalOuter")); break;
							case "명소/맛집" : $("#mainContentOuter").append($("#attractionOuter")); break;
							}
							switch(third){
							case "동행구하기" : $("#mainContentOuter").append($("#togetherOuter")); break;
							case "테마여행" : $("#mainContentOuter").append($("#themeOuter")); break;
							case "축제" : $("#mainContentOuter").append($("#festivalOuter")); break;
							case "명소/맛집" : $("#mainContentOuter").append($("#attractionOuter")); break;
							}
							switch(fourth){
							case "동행구하기" : $("#mainContentOuter").append($("#togetherOuter")); break;
							case "테마여행" : $("#mainContentOuter").append($("#themeOuter")); break;
							case "축제" : $("#mainContentOuter").append($("#festivalOuter")); break;
							case "명소/맛집" : $("#mainContentOuter").append($("#attractionOuter")); break;
							}							
					});
			</script>
	</c:if>
	
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
	<br>
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

			<br>
			</div>
			
			
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
            		<td><div></div></td>
            		<td><div></div></td>
            		<td><div></div></td>
            		<td><div></div></td>
            		<td><div></div></td>
					<td><div></div></td>
					<td><div></div></td>            		
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
            	<td><div></div></td>
            	<td><div></div></td>
            	<td><div></div></td>
            	<td><div></div></td>
				<td><div></div></td>
				<td><div></div></td>
				<td><div></div></td>            	
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
							$(".dataTr td").each(function(){
										var count = 0;
									for(var i in result){
										if(new Date($(this).prop("class")).getTime() - new Date(result[i].startDate).getTime() > 0 && new Date($(this).prop("class")).getTime() - new Date(result[i].endDate).getTime() < 0){
											count ++;
										}
										if(count != 0){
											$(this).children().eq(0).html(count+"개의 <br> 축제가 개최중입니다.");
										}else{
											$(this).children().eq(0).html("개최중인 축제가 없습니다.");
										}
									}
							
							});					
					},
					error : function(){
						console.log("메인 축제 불러오기 실패");
					}
            });
            
            $("#mainCalendar>tbody>tr td").hover(function(){
            		if($(this).children().eq(0).css("display") == "block"){
            			$(this).children().eq(0).css("display","none");
            		}else{
            			$(this).children().eq(0).css("display","block");
            		}
            });
            
        })
        
    </script>
			
			<br>
</div>
			
<div id="attractionOuter" >
					   <div class="attractionTextOuter" style="position:absolute; width:100%;">
		                	<p style="padding:0; margin:16px; font-size: 40px; font-weight: 500; font-family: 'GmarketSansMedium';">전국 방방곡곡 관광 명소</p>
		                	<a style="position:relative; left:1700px; bottom:50px;" class="btn" href="attraction.bo" >더 알아보기 ></a>
		                </div>
		<br><br><br>
		<div id="attractionDiv">
				<div id="attractionMenu">
						<div class="attractionMenuText" style="color:blue; border-radius:30px; border:2px solid blue; height:80%; margin : 5px 0px;"><input type="checkbox" name="attrChk" style="display:none;" checked>전체</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">서울</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">인천</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">대전</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">대구</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">광주</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">부산</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">울산</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">세종</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">경기</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">강원</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">충북</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">충남</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">경북</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">경남</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">전북</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">전남</div>
						<div class="attractionMenuText"><input type="checkbox" name="attrChk" style="display:none;">제주</div>
				</div>
				
				<div id="attractionImgArea">
						<div class="attImg">
								<img class="attImg1" src="resources/images/mainImgs/남한산성.jpeg" style="width:100%; height:80%;">
								<br><br>
								<p class="attP1" style="font-size:25px; text-align:center; font-weight:500; color : black;">남한 산성</p>
						</div>
						<div class="attImg">
								<img class="attImg2" src="resources/images/mainImgs/롯데월드.jpeg" style="width:100%; height:80%;">
								<br><br>
								<p class="attP2" style="font-size:25px; text-align:center; font-weight:500; color : black;">롯데 월드</p>
						</div>
						<div class="attImg">
								<img class="attImg3" src="resources/images/mainImgs/석굴암.jpeg" style="width:100%; height:80%;">
								<br><br>
								<p class="attP3" style="font-size:25px; text-align:center; font-weight:500; color : black;">석굴암</p>
						</div>
						<div class="attImg">
								<img class="attImg4" src="resources/images/mainImgs/남산타워.jpeg" style="width:100%; height:80%;">
								<br><br>
								<p class="attP4" style="font-size:25px; text-align:center; font-weight:500; color : black;">남산 타워</p>
						</div>
				</div>
				
				<script>

					$(".attrChk").on("change",function(){
						if($(this).prop("checked")){
							$(this).parent().css("color","blue").css("border-radius","30px").css("border","2px solid blue").css("height","80%").css("margin","5px 0px");
						}else{
							$(this).parent().css("color","black").css("border-radius","0px").css("border","none").css("height","100%").css("margin","0px");
						}
					});
				
						$(".attractionMenuText").on("click",function(){
							if($(this).children().eq(0).prop("checked") == true){
									$(this).children().eq(0).click();
							}else{
									$('input[type="checkbox"][name="attrChk"]').each(function(){
										$(this).prop("checked",false);
									});
									$(this).children().eq(0).click();
							}
							var location = $(this).text();
							
							switch(location){
							case "제주" :  $(".attImg1").prop("src","resources/images/mainImgs/스누피가든.jpeg"); $(".attP1").html("스누피 가든");
													$(".attImg2").prop("src","resources/images/mainImgs/만장굴.jpeg"); $(".attP2").html("만장굴");
													$(".attImg3").prop("src","resources/images/mainImgs/제주카트.jpeg"); $(".attP3").html("윈드 1947 카트");
													$(".attImg4").prop("src","resources/images/mainImgs/판포포구.jpeg"); $(".attP4").html("판포포구");
													break;
							case "전남" :  $(".attImg1").prop("src","resources/images/mainImgs/선도.jpeg"); $(".attP1").html("선도");
													$(".attImg2").prop("src","resources/images/mainImgs/봉강 하조 오토캠핑장.jpeg"); $(".attP2").html("봉강 하조 오토캠핑장");
													$(".attImg3").prop("src","resources/images/mainImgs/지리산 국립공원.jpeg"); $(".attP3").html("지리산 국립공원");
													$(".attImg4").prop("src","resources/images/mainImgs/암태남강선착장.jpeg"); $(".attP4").html("암태남강선착장");
													break;	
							case "전북" :  $(".attImg1").prop("src","resources/images/mainImgs/성당포구마을.jpeg"); $(".attP1").html("성당포구마을");
													$(".attImg2").prop("src","resources/images/mainImgs/와룡자연휴양림야영장.jpeg"); $(".attP2").html("와룡자연휴양림야영장");
													$(".attImg3").prop("src","resources/images/mainImgs/나바위성당.jpeg"); $(".attP3").html("나바위 성당");
													$(".attImg4").prop("src","resources/images/mainImgs/완주상관편백숲.jpeg"); $(".attP4").html("완주상관편백숲");
													break;			
							case "경남" :  $(".attImg1").prop("src","resources/images/mainImgs/가섭암지 마애여래삼존입상.jpeg"); $(".attP1").html("가섭암지 마애여래삼존입상");
													$(".attImg2").prop("src","resources/images/mainImgs/서출동류 물길 트레킹길.jpeg"); $(".attP2").html("서출동류 물길 트레킹길");
													$(".attImg3").prop("src","resources/images/mainImgs/마산로봇랜드.jpeg"); $(".attP3").html("마산로봇랜드");
													$(".attImg4").prop("src","resources/images/mainImgs/미타암.jpeg"); $(".attP4").html("미타암");
													break;	
							case "경북" :  $(".attImg1").prop("src","resources/images/mainImgs/문경새재도립공원.jpeg"); $(".attP1").html("문경새재도립공원");
													$(".attImg2").prop("src","resources/images/mainImgs/삼사해상공원.jpeg"); $(".attP2").html("삼사해상공원");
													$(".attImg3").prop("src","resources/images/mainImgs/국립김천치유의숲.jpeg"); $(".attP3").html("국립김천치유의숲");
													$(".attImg4").prop("src","resources/images/mainImgs/폭풍속으로 촬영지.jpeg"); $(".attP4").html("폭풍속으로 촬영지");
													break;	
							case "충남" :  $(".attImg1").prop("src","resources/images/mainImgs/마정낚시터.jpeg"); $(".attP1").html("마정 낚시터");
													$(".attImg2").prop("src","resources/images/mainImgs/아미미술관.jpeg"); $(".attP2").html("아미 미술관");
													$(".attImg3").prop("src","resources/images/mainImgs/성주산자연휴양림.jpeg"); $(".attP3").html("성주산 자연 휴양림");
													$(".attImg4").prop("src","resources/images/mainImgs/용현자연휴양림야영장.jpeg"); $(".attP4").html("용현 자연 휴양림 야영장");
													break;		
							case "충북" :  $(".attImg1").prop("src","resources/images/mainImgs/새밭계곡.jpeg"); $(".attP1").html("새밭 계곡");
													$(".attImg2").prop("src","resources/images/mainImgs/영동 비단강숲마을.jpeg"); $(".attP2").html("영동 비단강 숲마을");
													$(".attImg3").prop("src","resources/images/mainImgs/밤별생각 낮달이야기.jpeg"); $(".attP3").html("밤별생각 낮달 이야기");
													$(".attImg4").prop("src","resources/images/mainImgs/충북알프스 자연휴양림.jpeg"); $(".attP4").html("충북알프스 자연 휴양림");
													break;			
							case "강원" :  $(".attImg1").prop("src","resources/images/mainImgs/바다열차.jpeg"); $(".attP1").html("바다 열차");
													$(".attImg2").prop("src","resources/images/mainImgs/춘천 명동 닭갈비 골목.jpeg"); $(".attP2").html("춘천 명동 닭갈비 골목");
													$(".attImg3").prop("src","resources/images/mainImgs/대청봉.png"); $(".attP3").html("대청봉");
													$(".attImg4").prop("src","resources/images/mainImgs/함백산.jpeg"); $(".attP4").html("함백산");
													break;		
							case "경기" :  $(".attImg1").prop("src","resources/images/mainImgs/호수공원.jpeg"); $(".attP1").html("호수 공원");
													$(".attImg2").prop("src","resources/images/mainImgs/서오릉.jpeg"); $(".attP2").html("서오릉");
													$(".attImg3").prop("src","resources/images/mainImgs/도라전망대.jpeg"); $(".attP3").html("도라 전망대");
													$(".attImg4").prop("src","resources/images/mainImgs/임진강.jpeg"); $(".attP4").html("임진강 평화누리 공원");
													break;	
							case "세종" :  $(".attImg1").prop("src","resources/images/mainImgs/조천연꽃공원.jpeg"); $(".attP1").html("조천 연꽃 공원");
													$(".attImg2").prop("src","resources/images/mainImgs/국립세종수목원.jpeg"); $(".attP2").html("국립 세종 수목원");
													$(".attImg3").prop("src","resources/images/mainImgs/쌍류포도정원협동조합.jpeg"); $(".attP3").html("쌍류 포도 정원 협동 조합");
													$(".attImg4").prop("src","resources/images/mainImgs/숲뜰근린공원.jpeg"); $(".attP4").html("숲뜰 근린 공원");
													break;	
							case "울산" :  $(".attImg1").prop("src","resources/images/mainImgs/태화강 국가정원.jpeg"); $(".attP1").html("태화강 국가 정원");
													$(".attImg2").prop("src","resources/images/mainImgs/나사해변.jpeg"); $(".attP2").html("나사 해변");
													$(".attImg3").prop("src","resources/images/mainImgs/와나스타.jpeg"); $(".attP3").html("와나스타");
													$(".attImg4").prop("src","resources/images/mainImgs/울산 큰애기 하우스.jpeg"); $(".attP4").html("울산 큰애기 하우스");
													break;	
							case "부산" :  $(".attImg1").prop("src","resources/images/mainImgs/척판암.png"); $(".attP1").html("척판암");
													$(".attImg2").prop("src","resources/images/mainImgs/남도해양관광열차 S-트레인(S-train).jpeg"); $(".attP2").html("남도해양관광열차 S-트레인(S-train)");
													$(".attImg3").prop("src","resources/images/mainImgs/신세계 사이먼 부산 프리미엄 아울렛.jpeg"); $(".attP3").html("신세계 사이먼 부산 프리미엄 아울렛");
													$(".attImg4").prop("src","resources/images/mainImgs/송도용궁구름다리.jpeg"); $(".attP4").html("송도 용궁 구름다리");
													break;	
							case "광주" :  $(".attImg1").prop("src","resources/images/mainImgs/광주호호수생태원.jpeg"); $(".attP1").html("광주호 호수 생태원");
													$(".attImg2").prop("src","resources/images/mainImgs/시리단길.jpeg"); $(".attP2").html("시리단길");
													$(".attImg3").prop("src","resources/images/mainImgs/양림동 선교사 묘지.jpeg"); $(".attP3").html("양림동 선교사 묘지");
													$(".attImg4").prop("src","resources/images/mainImgs/무등갤러리.jpeg"); $(".attP4").html("무등 갤러리");
													break;	
							case "대구" :  $(".attImg1").prop("src","resources/images/mainImgs/육신사.jpeg"); $(".attP1").html("육신사");
													$(".attImg2").prop("src","resources/images/mainImgs/군위전투전승기념공원.jpeg"); $(".attP2").html("군위 전투 전승 기념 공원");
													$(".attImg3").prop("src","resources/images/mainImgs/한밤마을.jpeg"); $(".attP3").html("한밤 마을");
													$(".attImg4").prop("src","resources/images/mainImgs/화원유원지.jpeg"); $(".attP4").html("화원 유원지");
													break;	
							case "대전" :  $(".attImg1").prop("src","resources/images/mainImgs/대동하늘공원.jpeg"); $(".attP1").html("대동 하늘 공원");
													$(".attImg2").prop("src","resources/images/mainImgs/천연기념물센터.jpeg"); $(".attP2").html("천연기념물 센터");
													$(".attImg3").prop("src","resources/images/mainImgs/대전트래블라운지.jpeg"); $(".attP3").html("대전 트래블 라운지");
													$(".attImg4").prop("src","resources/images/mainImgs/이응노 미술관.jpeg"); $(".attP4").html("이응노 미술관");
													break;	
							case "인천" :  $(".attImg1").prop("src","resources/images/mainImgs/석모도 자연휴양림.jpeg"); $(".attP1").html("석모도 자연 휴양림");
													$(".attImg2").prop("src","resources/images/mainImgs/영종대교.jpeg"); $(".attP2").html("영종 대교");
													$(".attImg3").prop("src","resources/images/mainImgs/용담바다낚시터.jpeg"); $(".attP3").html("용담 바다 낚시터");
													$(".attImg4").prop("src","resources/images/mainImgs/강화 원도심 스토리워크.jpeg"); $(".attP4").html("강화 원도심 스토리워크");
													break;	
							case "서울" :  $(".attImg1").prop("src","resources/images/mainImgs/이레빌딩.jpeg"); $(".attP1").html("KH 정보 교육원");
													$(".attImg2").prop("src","resources/images/mainImgs/.jpeg"); $(".attP2").html("");
													$(".attImg3").prop("src","resources/images/mainImgs/반포한강공원.jpeg"); $(".attP3").html("반포 한강 공원");
													$(".attImg4").prop("src","resources/images/mainImgs/서대문 형무소 역사관.jpeg"); $(".attP4").html("서대문 형무소 역사관");
													break;	
							}
						});
				</script>
				
		</div>

			<br>
</div>
			
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

			<br>
</div>
			
			
</div>
	
	<%@include file="WEB-INF/views/common/footer.jsp" %>
    <script src="resources/js/custom.js"></script>

  </body>
</html>
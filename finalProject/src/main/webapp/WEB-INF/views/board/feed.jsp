<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

  <style>
 .shows-events-tab {
  background-color: #f0f0f1;  
}
.tabs-content{
	margin-top: 50px;
	
}
.shows-events-tab .tabs-content .sidebar {
  background-color: #fff;
  padding: 30px;
}
 .col{
 	margin-bottom: 100px;
 }
 .prices{background-color: white; border:1px solid black;}
 .thumb img{
	// border:1px solid black; 
	 width:500px;
	 height: 400px;
	 
 }

 .price img{
 	width:20px;
 }
 .price div{
 	float: right;
 	margin-right: 10px;
 }
 .col .nicname{background-color: white; width:500px; border:1px solid black;height: 35px;}
 .nicname>span{margin: 10px; font-weight: bold; }
 
 .category1{
 	margin-top: 20px;
 	 border: 2px solid black;
     padding: 10px 20px;
     border-radius: 10px;
     height:100px;
     cursor: pointer;
 }
 .category1>svg{right: 0px;
            left: 0px;
            top: 0px;
            bottom: 0px;
            margin: auto;
            position: absolute;
 }
 #ul1{background-color: white; border:1px solid black;}
 #up {float: right; width: 80px;margin: 0; height: 200px;}
 i{float: right; font-size: 25px; cursor: pointer;}

 .bi-justify:hover+ul{
 	  display: block;
 }
 .bi-justify+ul:hover{
     display: block;         
}
 .city{
 	border-bottom: 2px dotted #d7dadc;
 	border-top: 2px dotted #d7dadc;
 	padding-bottom: 30px;
 	padding-top: 30px;	
 	height: 300px;
 }
 .city li{margin:5px; float: left;}
 .city>ul{height: 100%;}
 .city a{
 	color: black;
 }
 .nicname li>ul{
	
	background-color: white; 
	position: relative;
	top: 30px;	
	display: none;
	text-align: right;
	width: 100%;
	height: 80px;
	z-index:10;	
 }
 .nicname li>ul li{
 	border: 1px solid black;
 	box-sizing: border-box;
 	height: 50%;
 	text-align: center;
 	
 }
 
 #up a{
 	 color: black;
 	 text-align: center;
  	 width: 100px; 
  	 width: 100%; 
      height: 100%; 
     display:block;
 	 transform : scale(1);
 }
 #up a:hover{ 
 	font-size: 20px;
 	font-weight:bold;
 	width: 100%;
 	display: block;
	height: 100%;
 	background-color: rgb(190, 190, 194);
 	 transform : scale(1);
 }

 
 .heading-sidebar>ul button{
 	float: left;	
 	
 }
 
 
  .slider{
        width: 500px;
        height: 400px;
        position: relative;
        margin: 0 auto;
        overflow: hidden; /* 현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
    }
    .slider input[type=radio]{
        display: none;
        
    }
    ul.imgs{
        padding: 0;
        margin: 0;
        list-style: none;    
    }
    ul.imgs li{
        position: absolute;
        left: 640px;
        transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */   
        padding: 0;
        margin: 0;
    }
    .bullets{
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 370px;
        z-index: 2;
    }
    .bullets label{
        display: inline-block;
        border-radius: 50%;
        background-color: rgba(0,0,0,0.55);
        width: 20px;
        height: 20px;
        cursor: pointer;
    }
    /* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
    .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
        background-color: #fff;
    }
    .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
        background-color: #fff;
    }
    .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
        background-color: #fff;
    }
    .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
        background-color: #fff;
    }
    .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .fixed-area{
    	position:absolute;
    	width:100%;
    	padding-right:15px;
    	padding-left:15px;
    	-ms-flex:0 0 25%;
    	flex:0 0 25%;
    	max-width:25%;
		left: -50px;	
    }
  .col-l{
  		position:relative;
    	width:100%;
    	padding-right:500px;
    	padding-left:400px;
    	-ms-flex:0 0 75%;
    	flex:0 0 75%;
    	max-width:50%
  }
 
 
</style>

  <head>
    <title>피드</title>
    </head>
    
    <body>
    
    <!-- ***** Preloader Start ***** -->
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
    <!-- ***** Preloader End ***** -->
    <%@include file="../common/menubar.jsp" %>
    <!-- ***** Header Area End ***** -->
	<script>
		$(function(){
			$(".nav>li>a").each(function(){
				if($(this).text() == $("title").eq(0).text()){
					$(this).addClass("active");
				}
			});
		});
	</script>
    <!-- ***** About Us Page ***** -->
    <div class="page-heading-shows-events">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Our Shows & Events</h2>
                    <span>Check out upcoming and past shows & events.</span>
                </div>
            </div>
        </div>
    </div>

    <div class="shows-events-tab">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row" id="tabs">
                        
                        <div class="col-lg-12">
                            <section class='tabs-content'>
                                
                                    <div class="row">
                                        <div class="positioning fixed-area">
                                            <div class="sidebar">
                                                <div class="row">
                                                    <div class="col-lg-12">
                                                        <div class="heading-sidebar">
                                                           <ul>
				                                        		<li><button class="btn btn-info" style="margin-left:20px;">최신순</button></li>
				                                        		<li><button class="btn btn-warning">인기순</button></li>
				                                        	</ul>                     
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="city">                                                           
                                                            <ul>
                                                                <li><a href="#">#전체</a></li>
                                                                <li><a href="#">#서울</a></li>
                                                                <li><a href="#">#인천</a></li>
                                                                <li><a href="#">#부산</a></li>
                                                                <li><a href="#">#대구</a></li>
                                                                <li><a href="#">#광주</a></li>
                                                                <li><a href="#">#대전</a></li>
                                                                <li><a href="#">#울산</a></li>
                                                                <li><a href="#">#세종</a></li>
                                                                <li><a href="#">#경기</a></li>
                                                                <li><a href="#">#강원</a></li>
                                                                <li><a href="#">#충북</a></li>
                                                                <li><a href="#">#충남</a></li>
                                                                <li><a href="#">#경북</a></li>
                                                                <li><a href="#">#경남</a></li>
                                                                <li><a href="#">#전북</a></li>
                                                                <li><a href="#">#전남</a></li>
                                                                <li><a href="#">#제주</a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="category1">
                                                           <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
															  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
															</svg>
                                                            
                                                        </div>
                                                    </div>
                                                  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-l">
                                            <div class="row">
                                            
                                             <div class="col" >
							                    <div class="ticket-item" style="width: 400px;">
							                        <div class="thumb">
							                        	<div class="nicname">							                        		
							                        			<span>[닉네임]꼭 싸움을 잘해야지</span>							                        			
																<div id="up">
																	<ul>
																		<li>
										                        			<i class="bi bi-justify"></i>
																			<ul id="sild">
																				<li><a href="" >수정</a></li>
																				<li><a href="">삭제</a></li>
																			</ul>
																		</li>												
																	</ul>
																</div>	
							                        	</div>
							                     
							                             <div class="slider">
												            <input type="radio" name="slide" id="slide1" checked>
												            <input type="radio" name="slide" id="slide2">
												            <input type="radio" name="slide" id="slide3">
												            <input type="radio" name="slide" id="slide4">
												            <ul id="imgholder" class="imgs">
												                <li><img src="resources/images/Like-after.png"></li>
												                <li><img src="resources/images/3442323_s7l.jpg"></li>
												                <li><img src="resources/images/2.jpg"></li>
												                <li><img src="./img/slide4.jpg"></li>
												            </ul>
												            <div class="bullets">
												                <label for="slide1">&nbsp;</label>
												                <label for="slide2">&nbsp;</label>
												                <label for="slide3">&nbsp;</label>
												                <label for="slide4">&nbsp;</label>
												            </div>
												        </div>
        						                   
							                        </div>
							                            <div class="prices" style="width: 500px;">
									                            <div class="price">
									                                <span>좋아요 40개</span>
									                                <div><img src="resources/images/하트.png" alt="">	</div>
																	<div>			
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
																			  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
																		</svg>	
																	</div>	
									                              
									                            </div>
									                        <div class="down-content">
									                           
									                            <h5>내용</h5>
									                            <br>
									                            <ul>					                                
									                                <li><i class="fa fa-map-marker"></i>서울</li>
									                            </ul>
									                           
									                        </div>
							                            </div>
							                    </div>
							                </div>
                                            
                                                 
                                             <div class="col" >
							                    <div class="ticket-item" style="width: 400px;">
							                        <div class="thumb">
							                            <img src="/finalProject/resources/images/ticket-01.jpg" alt="">
							                        </div>
							                            <div class="prices" style="width: 500px;">
									                            <div class="price">
									                                <span>1 ticket<br>from <em>$25</em></span>
									                            </div>
									                        <div class="down-content">
									                            <span>There Are 150 Tickets Left For This Show</span>
									                            <h4>Wonderful Festival</h4>
									                            <ul>
									                                <li><i class="fa fa-clock-o"></i> Thursday: 05:00 PM to 10:00 PM</li>
									                                <li><i class="fa fa-map-marker"></i>908 Copacabana Beach, Rio de Janeiro</li>
									                            </ul>
									                            <div class="main-dark-button">
									                                <a href="ticket-details.html">Purchase Tickets</a>
									                            </div>
									                        </div>
							                            </div>
							                    </div>
							                </div>

                                            </div>
                                        </div>
                                    </div>
                                                 
                                
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- *** Subscribe *** -->
    <div class="subscribe">
        <div class="container">
            <div class="row">
                <div class="col-lg-4">
                    <h4>Subscribe Our Newsletter:</h4>
                </div>
                <div class="col-lg-8">
                    <form id="subscribe" action="" method="get">
                        <div class="row">
                          <div class="col-lg-9">
                            <fieldset>
                              <input name="email" type="text" id="email" pattern="[^ @]*@[^ @]*" placeholder="Your Email Address" required="">
                            </fieldset>
                          </div>
                          <div class="col-lg-3">
                            <fieldset>
                              <button type="submit" id="form-submit" class="main-dark-button">Submit</button>
                            </fieldset>
                          </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

   <jsp:include page="../common/footer.jsp"></jsp:include>
 
  </body>
 <script >
 $(window).scroll(function(){
	 var scrollTop = $(document).scrollTop();
	 if (scrollTop < 50) {
	  scrollTop = 50;
	 }else if(scrollTop > 800){
		 scrollTop = 800;
	 }
	 $(".fixed-area").stop();
	 $(".fixed-area").animate( { "top" : scrollTop });
 });
 </script>

</html>
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
 
 #category1{
 	margin-top: 20px;
 	 border: 2px dotted black;
     padding: 10px 20px;
     border-radius: 10px;
     height:120px;
     cursor: pointer;
     z-index:10;
     width: 170px;
     margin-left: 10px;
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
/*   		border:1px solid black; */
/*   		position:relative; */
    	width:100%;
    	padding-right:500px;
    	padding-left:400px;
    	-ms-flex:0 0 75%;
    	flex:0 0 75%;
    	max-width:50%
  }
 
 /* 이미지슬라이드 css */
 
 /* 첫 번째 슬라이드 가운데에 정렬하기위해
첫번째 슬라이드만 margin-left조정 */
.slides li:first-child{
  margin-left: px;
}
 /* 보여줄 구간의 높이와 넓이 설정 */
#slideShow{
  width: 500px;
  height: 300px;
  position: relative;
  margin: auto;
  overflow: hidden;   
  /*리스트 형식으로 이미지를 일렬로 
  정렬할 것이기 때문에, 500px 밖으로 튀어 나간 이미지들은
  hidden으로 숨겨줘야됨*/
}

.slides{
  position: absolute;
  left: 0;
  top: 0;
  width: 2500px; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
 
}

/* 슬라이드들 옆으로 정렬 */
.slides li:not(:last-child){
  float: left;
  margin-right: 100px;
}

.slides li{
  float: left;
  list-style-type: none;
}
.slides li>img{
  width: 500px;
  height: 300px;
  border: 1px solid black;
}

.controller span{
  position:absolute;
  background-color: rgba(255, 255, 255, 0.637);
  color: black;
  text-align: center;
  border-radius:50%;
  padding: 5px 10px;
  top: 50%;
  font-size: 1.3em;
  cursor: pointer;
}

/* 이전, 다음 화살표에 마우스 커서가 올라가 있을때 */
.controller span:hover{
  background-color: rgba(255, 255, 255, 0.637);
}

.prev{
  left: 0px;
}

/* 이전 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 왼쪽으로 이동하는 효과*/
.prev:hover{
  transform: translateX(-5px);
}

.next{
  right: 0px;
}

/* 다음 화살표에 마우스 커서가 올라가 있을때 
이전 화살표가 살짝 오른쪽으로 이동하는 효과*/
.next:hover{
  transform: translateX(5px);
}
 
 
</style>

  <head>
    <title>피드</title>
    </head>
    
    <body>
    
    
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
    <!-- <div class="page-heading-shows-events">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Our Shows & Events</h2>
                    <span>Check out upcoming and past shows & events.</span>
                </div>
            </div>
        </div>
    </div> -->

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
                                                       	
                                                        	
																<button type="button" id="category1" onclick="enrollerForm();">
																	<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-plus-lg" viewBox="0 0 16 16">
																	  <path fill-rule="evenodd" d="M8 2a.5.5 0 0 1 .5.5v5h5a.5.5 0 0 1 0 1h-5v5a.5.5 0 0 1-1 0v-5h-5a.5.5 0 0 1 0-1h5v-5A.5.5 0 0 1 8 2Z"/>
																	</svg>
																</button>                                                       
            
                                                       
                                                    </div>
                                                  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-l">
                                            <div class="row">
                                            
							                						                        		
                                             <div class="col" >
							                    <div class="ticket-item" style="width: 400px;">
							                        	<c:forEach var="f" items="${list}">
							                        <div class="thumb">
							                        	<div class="nicname">
							                        			<input type="hidden" value="${f.boardNo }">						                        			
							                        			<span> <a id="nicknameHover" onclick="whoareyou();">${f.boardWriter }</a></span>
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
							                     
							                             
							                              <div id="slideShow">
														    <ul class="slides" id="slides${f.boardNo}">
														    	
														    </ul>
														    <p class="controller">
														      
														      <!-- &lang: 왼쪽 방향 화살표
														      &rang: 오른쪽 방향 화살표 -->
														      <span class="prev">&lang;</span>  
														      <span class="next">&rang;</span>
														    </p>
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
									                          
									                            <h5>${f.boardContent }</h5>
									                            
									                            <br>
									                            <ul>					                                
									                                <li>${f.createDate }</li>
									                            </ul>
									                           
									                        </div>
							                            </div>
							                            <br><br><br><br><br>
							                         </c:forEach> 
							                         <script>
							                         	
							                         </script>
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
        
        <div id="pagingArea" align="center">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="list.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="list.bo?currentPage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
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
 
 $(function(){
	 
	 var size = ${size};
	 var alist = ${alist};
	 
	 console.log(alist);
	 
	 for(var i=0; i<size; i++){
		 if(alist[i].boardNo == alist[i+1].boardNo){
			 $("#slides"+alist[i].boardNo).append("<li><img src='"+alist[i].filePath+"' alt=''></li>");
		 }
	 }
 });
 
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
 
function enrollerForm(){
//console.log($(this));
 <c:choose>
		<c:when test="${loginUser != null}">
		 	location.href="enroll.fo";
	 </c:when>
	 <c:otherwise>
	 	alert("로그인 후 이용가능합니다.");
	 </c:otherwise>
</c:choose>
 }; 
 
 
 
 
 const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
 const slideImg = document.querySelectorAll('.slides li'); //모든 슬라이드들
 let currentIdx = 0; //현재 슬라이드 index
 const slideCount = slideImg.length; // 슬라이드 개수
 const prev = document.querySelector('.prev'); //이전 버튼
 const next = document.querySelector('.next'); //다음 버튼
 const slideWidth = 500; //한개의 슬라이드 넓이

 //전체 슬라이드 컨테이너 넓이 설정
 slides.style.width = slideWidth * slideCount + 'px';

 function moveSlide(num) {
   slides.style.left = -num * 600 + 'px';
   currentIdx = num;
 }

 prev.addEventListener('click', function () {
   /*첫 번째 슬라이드로 표시 됐을때는 
   이전 버튼 눌러도 아무런 반응 없게 하기 위해 
   currentIdx !==0일때만 moveSlide 함수 불러옴 */

   if (currentIdx !== 0) moveSlide(currentIdx - 1);
 });

 next.addEventListener('click', function () {
   /* 마지막 슬라이드로 표시 됐을때는 
   다음 버튼 눌러도 아무런 반응 없게 하기 위해
   currentIdx !==slideCount - 1 일때만 
   moveSlide 함수 불러옴 */
   if (currentIdx !== slideCount - 1) {
     moveSlide(currentIdx + 1);
   }
 });
    
 </script>

</html>
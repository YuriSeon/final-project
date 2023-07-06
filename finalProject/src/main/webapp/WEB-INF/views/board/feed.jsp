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
 .nicname>span{margin-top: 50px; font-weight: bold; line-height: 30px;}
 
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
.bi-list:hover+ul{display: block;}
.bi-list+ul:hover{display: block;}

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
  width: 100%; /* 슬라이드할 사진과 마진 총 넓이 */
  transition: left 0.5s ease-out; 
  /*ease-out: 처음에는 느렸다가 점점 빨라짐*/
  border: 1px solid black;
 
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
 
 #sild li>button {
  border: none;
  background-color: transparent;
  color: black;
  transition: background-color 0.3s, color 0.3s;
   white-space: normal; /* 줄 바꿈을 허용 */
   width: 100%;
   height: 100%;
}

#sild li button:hover {
  background-color: lightgray;
  color: white;
  font-size: 17px;
}
#updateBoard{transform: translateY(-100%);}
#heart-area{cursor: pointer;}
 #reply{margin-left: 30px; width: 400px; }
 #reply-text{padding: 10px; border-bottom: 1px solid; margin: 10px;}
 #reply-text>b{font-size: 14px; color: blue;}
 #btn{transform: translateY(-50%);}
 .circle {
  line-height: 30px;
  padding: 3px;

}

.circle:hover, .circle.active {
  background-color: #57667e;
  width: 100px;
  height: 50px;
  border-radius: 90%;
  position: relative;
  color: white;
  font-size: 17px;
  font-weight: bold;
}
 #head:hover, #head.active{border: 2px solid red;}
 .massge{cursor: pointer;}
 #reply-area{display: none;}
 #nicknameHover{cursor: pointer;}
 
 .pagination {
    justify-content: center !important;
}
#sild2{display: none;}

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
                                                           		<c:choose>
                                                           			<c:when test="${not empty city }">
                                                           				<li><button class="btn btn-outline-info" id="head" style="margin-left:20px;" onclick="newerList(1);">최신순</button></li>
						                                        		<li><button class="btn btn-outline-warning" id="head" onclick="ranking(1);">인기순</button></li>
                                                           			</c:when>
                                                           			<c:otherwise>
						                                        		<li><button class="btn btn-outline-info" id="head" style="margin-left:20px;" onclick="newerList(2);">최신순</button></li>
						                                        		<li><button class="btn btn-outline-warning" id="head" onclick="ranking(2);">인기순</button></li>
                                                           			</c:otherwise>
                                                           		</c:choose>
				                                        	</ul>                     
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="city">                                                           
                                                            <ul>
                                                                <li><a href="feed.bo" class="circle">#전체</a></li>
                                                                <li><a href="city.bo?city=11" class="circle">#서울</a></li>
                                                                <li><a href="city.bo?city=28" class="circle">#인천</a></li>
                                                                <li><a href="city.bo?city=26" class="circle">#부산</a></li>
                                                                <li><a href="city.bo?city=27" class="circle">#대구</a></li>
                                                                <li><a href="city.bo?city=29" class="circle">#광주</a></li>
                                                                <li><a href="city.bo?city=30" class="circle">#대전</a></li>
                                                                <li><a href="city.bo?city=31" class="circle">#울산</a></li>                                                                
                                                                <li><a href="city.bo?city=41" class="circle">#경기</a></li>
                                                                <li><a href="city.bo?city=42" class="circle">#강원</a></li>
                                                                <li><a href="city.bo?city=43" class="circle">#충북</a></li>
                                                                <li><a href="city.bo?city=44" class="circle">#충남</a></li>
                                                                <li><a href="city.bo?city=47" class="circle">#경북</a></li>
                                                                <li><a href="city.bo?city=48" class="circle">#경남</a></li>
                                                                <li><a href="city.bo?city=45" class="circle">#전북</a></li>
                                                                <li><a href="city.bo?city=46" class="circle">#전남</a></li>
                                                                <li><a href="city.bo?city=50" class="circle">#제주</a></li>                                                           
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
                                             	<c:choose>
                                             		<c:when test="${empty list }">
                                             			<div>
                                             				<h2>조회된 결과가 없습니다.</h2>
                                             			</div>
                                             		</c:when>
                                             		<c:otherwise>                                       
							                        	<c:forEach var="f" items="${list}">
							                    <div class="ticket-item" style="width: 400px;">
							                        <div class="thumb">
							                        	<div class="nicname">							                        	 
					                                            <img src="resources/images/profile/빈프로필.jpg" alt="" style="width:25px; height:25px; border-radius:50%; margin-left:5px;" id="profile">			                                        		
							                        			<span> <a id="nicknameHover" onclick="whoareyou();">${f.boardWriter }</a></span>
							                        			
																<div id="up" class="up">
																	<ul>
																		<li>
										                        			<input type="hidden" value="${f.boardNo }" class="boardNo" name="boardNo">
																			<c:choose>
							                        						<c:when test="${loginUser.nickname eq f.boardWriter }">
																				 <i class="bi bi-justify"></i>
										                        			
																				<ul id="sild">
																					<li><button class="custom-button" id="updateBoard" onclick="updateBoard(this);">수정</button></li>
																					<li><button class="custom-button" id="de" onclick="deletef(this);">삭제</button></li>													
																				</ul>
																			</c:when>
																			
																			</c:choose>
																		</li>												
																	</ul>
																</div>	
							                        	</div>
							                        	
							                             
							                              <div id="slideShow">
														    <ul class="slides" id="slides${f.boardNo}" style="width: 2400px">
														    	<li></li>
														    	<li></li>
														    	<li></li>
														    	<li></li>  														    
														    </ul>
														   
														    <p class="controller" id="controller">
														      
														      <!-- &lang: 왼쪽 방향 화살표
														      &rang: 오른쪽 방향 화살표 -->
															    <span class="prev" id="prev${f.boardNo }">&lang;</span>  
																<span class="next" id="next${f.boardNo }">&rang;</span>
														    </p>
														  </div>
														    
        						                   
							                        </div>
							                            <div class="prices" style="width: 500px;">
									                            <div class="price" style="margin-bottom: 5px;">
									                                <span id="count" style="margin-left: 3px;">좋아요 ${f.good }개</span>
									                                <input type="hidden" id="gcount" value="${f.good }">
									                                <div  id="heart-area">		                                
									                               		 <img src="resources/images/하트.png" alt="" id="heart">
									                                </div>
																	<div class="massge">			
																		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right" viewBox="0 0 16 16">
																			  <path d="M2 1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h9.586a2 2 0 0 1 1.414.586l2 2V2a1 1 0 0 0-1-1H2zm12-1a2 2 0 0 1 2 2v12.793a.5.5 0 0 1-.854.353l-2.853-2.853a1 1 0 0 0-.707-.293H2a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h12z"/>
																		</svg>	
																	</div>	
									                              
									                            </div>
									                        <div class="down-content">
									                          
									                            <h6 style="font-weight: bold;">${f.boardContent }</h6>
									                            
									                            <br>
									                            <ul id="address">
									                            	<li style="float: left;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
																		  <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"/>
																		</svg>
																	</li>
									                            	<li>${f.info.getInfoAddress() }</li> 
									                            </ul>									                            
										                        <p>${f.createDate }</p>
										                        <p style="color: gray;margin-left: 3px;" class="massge">댓글 ${f.reply.count }개</p>
										                        <button style='border: solid white; float: right;background-color: white;' onclick="report('${f.boardNo}', '${f.boardWriter}');">
																	<img alt='' src='resources/images/980829.png' style='width:15px; height:15px; float: right;'>
																</button>
									                        </div>
									                        <hr>
									                        <div id="reply-area">
									                        	<div>
										                        	<textarea rows="2" cols="1" id="reply" style="resize: none;"></textarea>
										                        	<button id="btn" class="btn btn-warning">댓글</button>
									                        	</div>
									                        	
									                        	<div id="replyBox">
										                        	  
										                        	
									                        	</div>
									                        	
									                       </div>
							                            </div>
							                            							                      
							                    	</div>
							                    	<br><br><br><br><br>
							                      </c:forEach> 
							                   </c:otherwise>
                                             </c:choose>
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
        
        <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title"></h4>
		        <input type="hidden" id="boardWriter">
		        <input type="hidden" id="boardNo">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <input type="text" name="content" id="content" placeholder="신고사유">
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button type="button" class="btn btn-info" onclick="return goReport()">등록</button>
		        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
		      </div>
		
		    </div>
		  </div>
		</div>
        
        <c:choose>
        	<c:when test="${not empty city }">
        		<div id="pagingArea" align="center">
	                <ul class="pagination">
	                	<c:choose>
	                		<c:when test="${pi.currentPage eq 1}">
	                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			 <li class="page-item"><a class="page-link" href="city.bo?currentPage=${pi.currentPage - 1 }&city=${city}&sort=${sort}">&lt;</a></li>
	                		</c:otherwise>
	                	</c:choose>
	                	
	                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
		                    <li class="page-item"><a class="page-link" href="city.bo?currentPage=${p}&city=${city}&sort=${sort}">${p}</a></li>
	                    </c:forEach>
	                    
	                    <c:choose>
	                    	<c:when test="${pi.currentPage eq pi.maxPage}">
			                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li class="page-item"><a class="page-link" href="city.bo?currentPage=${pi.currentPage + 1}&city=${city}&sort=${sort}">&gt;</a></li>
	                    	</c:otherwise>
	                    </c:choose>
	                </ul>
               </div> 
        
        	</c:when>
        	
        	<c:otherwise>
        	
		        <div id="pagingArea" align="center">
		                <ul class="pagination">
		                	<c:choose>
		                		<c:when test="${pi.currentPage eq 1}">
		                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
		                		</c:when>
		                		<c:otherwise>
		                			 <li class="page-item"><a class="page-link" href="feed.bo?currentPage=${pi.currentPage - 1 }&sort=${sort}">&lt;</a></li>
		                		</c:otherwise>
		                	</c:choose>
		                	
		                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
			                    <li class="page-item"><a class="page-link" href="feed.bo?currentPage=${p}&sort=${sort}">${p}</a></li>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    	<c:when test="${pi.currentPage eq pi.maxPage}">
				                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item"><a class="page-link" href="feed.bo?currentPage=${pi.currentPage + 1}&sort=${sort}">&gt;</a></li>
		                    	</c:otherwise>
		                    </c:choose>
		                </ul>
		            </div> 
        
        	</c:otherwise>
        </c:choose>
    </div>
    


   <jsp:include page="../common/footer.jsp"></jsp:include>
 
  </body>
 <script >
 
   
    var slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
   var slideImg = document.querySelectorAll('.slides>li'); //모든 슬라이드들
   let currentIdx = 0; //현재 슬라이드 index
   const slideCount = slideImg.length; // 슬라이드 개수
   const slideWidth = 500; //한개의 슬라이드 넓이

   //전체 슬라이드 컨테이너 넓이 설정
   slides.style.width = slideWidth * slideCount + 'px';

  //이미지 넣는 메소드
$(function(){
	
	 var size = ${size};
	 var alist = ${alist};
	var blist = ${blist};
	var bsize = ${bsize};
	 
	 for(var i=0; i<bsize; i++){
		 for(var j=0; j<size; j++){
			 
			 if(alist[j].boardNo == blist[i].boardNo){
				 $("#slides"+alist[j].boardNo).append("<li><img src='"+alist[j].filePath+"' alt=''></li>");
				
			 }
		 }
	 }
	 
	   
			// 사진 오른쪽버튼
			$(document).on("click",".controller .next",function(){		
				  
				var slideContainer = $(this).parents("#slideShow").children("ul");
				  var currentLeft = parseInt(slideContainer.css('left'));
				  /* var newLeft = currentLeft - 600; */
				  var images = $(this).parents(".thumb").children().eq(1).children().eq(0).children().children("img"); //이미지 위치
				  var imageCount = images.length;
				  var slideWidth = 600; // Assuming each slide has a fixed width of 600 pixels
				  var newLeft = currentLeft - slideWidth;
	
				    if (newLeft > -slideWidth * (imageCount-1)) {
				        slideContainer.css('left', newLeft + 'px');
				    } else {
				        slideContainer.css('left', -slideWidth * (imageCount-1) + 'px');
				    }			
			})
				 
			//사진 왼쪽 버튼
			$(document).on("click",".controller .prev",function(){
				
				 var slideContainer = $(this).parents("#slideShow").children("ul");
				  var currentLeft = parseInt(slideContainer.css('left'));
				  var newLeft = currentLeft + 600;
				  
				  if (newLeft < 0) {
				    slideContainer.css('left', newLeft + 'px');
				  } else {
				    slideContainer.css('left', '0px');
				  }
			})
			

 });

//스크롤
 $(window).scroll(function(){
	 var scrollTop = $(document).scrollTop();
	 var board = $(".ticket-item");
	 
	 if (scrollTop < 50) {
	  scrollTop = 50;
	 }else if(scrollTop > board){
		 scrollTop = 800;
	 }
	 $(".fixed-area").stop();
	 $(".fixed-area").animate( { "top" : scrollTop });
 });
 
 
 
function enrollerForm(){
//console.log($(this));\
var loginUser =  "${loginUser}";


	 if(loginUser != ""){
		location.href="enroll.fo";
	}else{
		alert("로그인 후 이용가능합니다.");
	}
 }; 

 // slideShow
 // thumb
 /* $("#de").on("click",function(){
	 console.log($(this));
 	 console.log($(this).parents(".thumb").children().eq(1).children().eq(0).children().children("img"));

 }) */
 
 //본문 삭제
 function deletef(e){
		$btn = e;
		var boardNo = $($btn).closest("#up").find(".boardNo").val(); //보드번호
		var writer = $($btn).closest(".nicname").find("#nicknameHover").text(); // 보드닉네임
		var isCurrentUser = "<c:out value='${loginUser.nickname}' />" === writer; // 본인인지 구별하기 위해
		var images = $($btn).parents(".thumb").children().eq(1).children().eq(0).children().children("img"); //이미지 위치
		var filePath = "";//이미지의 src를 담을 리스트
		console.log(boardNo);
		
		images.each(function(index) {
			var currentImg = $(this);
	        var src = currentImg.attr("src");
	        filePath += src + ",";
		  
		  });

		console.log(filePath);
		    if (isCurrentUser) {
		    	var chk = confirm("게시글을 삭제하시겠습니까?");
		        if (chk === true){
		        	
				   $.ajax({
			            url: "delete.fo",
			            type: "POST",
			            data: {
			                boardNo: boardNo,
			                filePath: filePath
			            },
			            success: function(result) {
	
			            	location.reload();
			            },
			            error: function() {
			                // Handle the error response if needed
			                console.log("error");
			            }
			        });
		        }
		   	
			   
		  } else {
		    alert("본인만 이용가능합니다.");
		  }   
		  
	}
 

 //좋아요
 $(".col > .ticket-item").on("click", "#heart-area", function () {

	 var heartImage = $(this).closest(".ticket-item").find("#heart");	 
	  var boardNo = $(this).closest(".ticket-item").find("#up").find(".boardNo").val(); 
	  boardNo = parseInt(boardNo);
	  var count = $(this).closest(".ticket-item").find("#count");
	 var list = ${blist};
	 var writer =  "${loginUser.nickname}";		 
	      if (writer !== ""){ 		 
	 	$.ajax({
	 		url: "heart.bo",
	 		type: "POST",
	 		data:{boardNo : boardNo,writer : writer},
	 		success: function(result){
	 			
	 			if (result > 0) {
	 				heartImage.attr("src", "resources/images/free-icon-heart-833472좋아요후.png");
	 				for(var i =0; i<list.length; i++){
	 					var b = list[i];
	 					/* console.log(b); */
	 					if(b.boardNo === boardNo){
	 						b.good++;
	 						count.text("좋아요 "+b.good+"개");
	 					}
	 				}
                } else {
                	heartImage.attr("src", "resources/images/하트.png");
                	for(var i =0; i<list.length; i++){
	 					var b = list[i];
	 					if(b.boardNo === boardNo){	 						
	 						count.text("좋아요 "+b.good+"개");
	 					}
	 				}
                }
                 
	 		},	 			 				 		
	 		error : function(){
	 			console.log("error");
	 		}
	 	});
	 	
	  } else {
		    alert("로그인시 이용가능합니다.");
	  }        
	 	
 });
 
	 
	//리스트 이치문
	 $(".col > .ticket-item").each(function () {
		 
		 //좋아요이미지 바꾸는 메소드
		    var boardNo = $(this).find("#up .boardNo").val();//리스트에 있는 모든 보드넘버
		    boardNo = parseInt(boardNo);
		    /*  console.log(boardNo);  */
		    var heartImage = $(this).find("#heart");
		    /* console.log(heartImage); */
		    var writer = "${loginUser.nickname}";		    		   
		    var isLiked = false; 
		    var glist = ${glist};
		    for (var i = 0; i < glist.length; i++){
		    	 var g = glist[i];
		    	 /* console.log(typeof g.boardNo); */
		    	 if (g.boardNo === boardNo && g.writer === writer) {
		             isLiked = true;
		         }
		    }	 
			     if (writer === "") {
		            heartImage.attr("src", "resources/images/하트.png");
		        } else if (isLiked) {
		            heartImage.attr("src", "resources/images/free-icon-heart-833472좋아요후.png");
		        } else {
		            heartImage.attr("src", "resources/images/하트.png");
		        } 	 
			     
		//프로필 사진
			var mlist = ${mlist};
			var nickname = $(this).find("#nicknameHover").text();
			var profile = $(this).find("#profile");
		 	var m = []; 
			 /* console.log(mlist);  */
			 for (var i = 0; i<mlist.length; i++){
				 m = mlist[i];
				  
				 if(m.nickname === nickname){
					 profile.attr("src",m.profileImg);
				 }else if(m.profileImg === ""){
					 profile.attr("src","resources/images/profile/빈프로필.jpg");
					 
				 }
			 } 

			 //댓글삽입			
			 var replyBox = $(this).find("#replyBox");//댓글 넣을 div
			 
			/*  function selectReplyList(){ */
				 
				 $.ajax({
					 url:"selectReplyList.fo",
					 data:{refQno:boardNo},
					 success:function(list){
						 if (list != ""){
							 
							 var str ="";
							
							 for(i in list){

								 str +="<div id='reply-text'>"
								if(!list[i].profileImg){		    			 
						    		str+="<img src='resources/images/profile/빈프로필.jpg' style='width:20px; height:20px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"
						    	}else{
						    		str+="<img src='"+list[i].profileImg+"' alt='프로필사진' style='width:20px; height:20px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"		    			 
						    	}
								 	 
			             		 str+="<b style='margin-bottom: 3px;'>"+list[i].replyWriter+"</b>"
			             			 +"<button style='border: solid white; float: right;background-color: white;' id='report' onclick='replyReport(\"" + list[i].replyWriter + "\",\"" + list[i].replyNo + "\")'>"
			             			 +"<img alt='' src='resources/images/980829.png' style='width:15px; height:15px; float: right;'>"
			             			 +"</button>"
			             			 +"<p style='font-size: 12px;font-weight: bold;line-height: 15px;'>"+list[i].content+"</p>"   
			             		if (writer === list[i].replyWriter) {	 
			             		 str +="<button  onclick='deleteReply(\"" + list[i].replyNo + "\")' style='color: black;font-size: 11px;padding: 3px;float: right;border: solid white;'>삭제</button>"
									 +"<button onclick='updateReplyForm(\"" + list[i].replyNo + "\",\"" + list[i].content + "\",\"" + list[i].replyWriter + "\",this)' style='color: black;font-size: 11px;padding: 3px;float: right;border-right: 1px solid;border: solid white;'>수정</button>"
			             		   }
								 str +="<p style='font-size: 11px'>"+list[i].createDate+"</p>"
								 	 +"<button onclick='rere(\"" + list[i].replyNo + "\",\"" + list[i].refQno + "\",this);' style='color: black;font-size: 11px;padding: 3px;border: solid white;'>답글"+list[i].count+"</button>"	
									 +"<div id='rreply-box'>"								 	
								 	 +"</div>"																				
			             			 +"</div>"
			             			 
							 }
							 
							 replyBox.html(str);
							 
						 }
					 },
					 error:function(){
						 console.log("error");
					 }
				 });
			/*  }
	
			 selectReplyList(); */
		});
	//------------------------------------------------------------------------------------------------------------
	 
	 //댓글
	  $(".col > .ticket-item").on("click", "#btn", function (){
		 /*   console.log($(this).closest(".ticket-item").find("#up").find(".boardNo").val());   */
		 var loginUser = "${loginUser}";
		 var btn = $(this);
		 if(loginUser !==""){
			 
			  $.ajax({
				  url:"reply.fo",
				  data:{content:$(this).prev().val(),
					  refQno:$(this).closest(".ticket-item").find("#up").find(".boardNo").val(),
					  replyWriter:"${loginUser.nickname}"
					  },
				success:function(result){
					if(result =="success"){						
						  /* selectReplyList();   */
						 btn.prev("#reply").val("");
						location.reload(); 
					}
				},
				error:function(){
					console.log("error");
				}
			  });
			  
		 }else{
			 alert("로그인시 이용가능합니다.");
		 }
		 
		 
	  });
	 
	//댓글 삭제
	function deleteReply(replyNo){
		$.ajax({
			url:"deleteReply.fo",
			data:{replyNo:replyNo},
			success: function(result){
				if(result == "success"){
					alert("삭제 되었습니다.")
					location.reload();
				}
			},
			error:function(){
				console.log("error");
			}
		})
	}
	
	//댓글 수정업데이트폼
	function updateReplyForm(replyNo,content,replyWriter,tg){
		   
		/*  console.log($(tg).parents("#reply-text")); */
		
		 var form ="";
			 form +="<b style='color:blue;top:-55px;position: relative;right:-30px;'>"+replyWriter+"</b>"
				  +"<textarea rows='2' cols='50' style='margin-left: 20px' id='upcontent' style='resize: none;''>"+content+"</textarea>"
   		          +"<button class='btn btn-warning' style='margin-left: 200px' onclick='updateReply("+replyNo+")'>수정</button>"
				  		    
   		       $(tg).parents("#reply-text").html(form);
		}
	 
	//댓글 업데이트폼에 있는 수정하기 클릭이벤트
	 function updateReply(replyNo){
		
		 var content = $("#upcontent").val();
		
		$.ajax({
			url:"updateReply.fo",
			data:{
				replyNo:replyNo,
				content:content
			},
			success:function(result){
				if(result== "success"){
					alert("댓글이 수정되었습니다.");
					location.reload();
				}
			},
			error:function(){
				console.log("error");
			}
		})
	};
	
	//댓글신고
	function replyReport(replyWriter,replyNo){
		console.log(replyNo);
		 var loginUser = "${loginUser.nickname}";

		 if(loginUser !==""){
			var content = prompt("정말 "+replyWriter+"님을 신고하실 건가요?\r신고사유를 입력해 주세요");
		if(content !== null){
			
			$.ajax({
				url:"report.fo",
				data:{nickname:replyWriter, writer:loginUser, replyNo:replyNo,reportReason:content},
				success:function(result){
					if(result == "success"){
						alert("댓글 신고되었습니다.");
						location.reload();
					}/* else if(result == "alreadyReported"){
						alert("이미 신고한 댓글입니다.");
						location.reload();
					}					 */
				},
				error:function(){
					console.log("error");
				}				
			});
		}
		
	 }else{
		 alert("로그인시 이용가능합니다.");
	 }
	}
	
	//대댓글폼
	function rere(replyNo,refQno,aw){
		 /* console.log($(aw).next("#rreply-box").children("#rereply"+replyNo)); */ 					 
				var rreplyBox = $(aw).next("#rreply-box");
				var form ="";
				
					form +="<i class='bi bi-arrow-return-right' style='float: left;margin-left: 10px;'></i>"
						  +"<textarea rows='2' cols='40' style='margin-left: 20px' id='rereply-content' style='resize: none;'></textarea>"
						  +"<button  class='btn btn-warning' style='margin-left: 200px' onclick='answer("+replyNo+","+refQno+");'>답글</button>"
				
			
						  
		 
		 $(aw).next("#rreply-box").html(form);
			selectAnswer(replyNo, function(result) {
	            $(aw).next("#rreply-box").append(result);
	        });
			
		//대댓글 로그인 안했을 시
		$(aw).next("#rreply-box").on("click", "#rereply-content", function() {
			  var loginUser = "${loginUser}";
			  if (loginUser === "") {
			      alert("로그인 후 이용 가능합니다.");
			      return false;
			     }
			});
		//답글누르면 답글박스 올라오게 하기
		$(aw).on("click", function() {	        
	          rreplyBox.slideUp();	        
	    });
		  
		
	}
	
	
	//대댓글입력
	function answer(replyNo,refQno){
		var writer = "${loginUser.nickname}";	
		var content = $("#rereply-content").val();
		   /* console.log($("#rereply-content").val());  */  
		$.ajax({
			url:"answer.fo",
			data:{
				replyNo:replyNo,
				content:content,
				replyWriter:writer,
				refQno:refQno
			},
			success:function(result){
				if(result == "success"){
					alert("답글 작성 완료");
					location.reload();
				}
			},
			error:function(){
				console.log("error");
			}
		})
	}
	
	//대댓글삽입
	 function selectAnswer(replyNo, callback){
		/* console.log(replyNo); */
		var writer = "${loginUser.nickname}";
				 var rstr = "";
		
		$.ajax({
			url:"selectAnswer.fo",
			data: {
				replyNo:replyNo
				},
			success:function(list){
				
				for(i in list){
					  rstr +="<div style='margin-top:10px;' id='rere-text'>"
						 +"<i class='bi bi-arrow-return-right' style='float: left;margin-left: 10px;'></i>"		
					if(!list[i].profileImg){		    			 
			    		rstr+="<img src='resources/images/profile/빈프로필.jpg' style='width:17px; height:17px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"
			    	}else{
			    		rstr+="<img src='"+list[i].profileImg+"' alt='프로필사진' style='width:17px; height:17px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"		    			 
			    	}          		
						rstr+="<b style='margin-bottom: 3px;font-size: 6px;'>"+list[i].replyWriter+"</b>"
	        		     +"<button style='border: solid white; float: right;background-color: white;' id='rere-report' onclick='rereport(\"" + list[i].replyWriter + "\",\"" + list[i].refRno + "\")'>"
	            		 +"<img alt='' src='resources/images/980829.png' style='width:13px; height:13px; float: right;'>"
	        		     +"</button>"
	        		     +"<p style='font-size: 11px;font-weight: bold;line-height: 15px;margin-left: 25px;'>"+list[i].content+"</p>"
	        		     if (writer === list[i].replyWriter) {
					rstr +="<button style='color: black;font-size: 11px;padding: 3px;float: right;border: solid white;' onclick='deleteRere(\"" + list[i].refRno + "\");'>삭제</button>"
						 +"<button style='color: black;font-size: 11px;padding: 3px;float: right;border: solid white;' onclick='updateRereForm(\"" + list[i].refRno + "\",\"" + list[i].content + "\",\"" + list[i].replyWriter + "\",this);'>수정</button>"				
	        		     }
	        		rstr +="<p style='font-size: 11px;margin-left: 25px;'>"+list[i].createDate+"</p>"  
					     +"</div>"
				     
				} 	
				callback(rstr);
			},
			error:function(){
				console.log("error");
			}
		});
	}

	//대댓글 삭제
	function deleteRere(refRno){
		$.ajax({
			url:"deleteRere.fo",
			data:{refRno:refRno},
			success: function(result){
				if(result == "success"){
					alert("삭제 되었습니다.")
					location.reload();
				}
			},
			error:function(){
				console.log("error");
			}
		})
	}
	
	//대댓글 수정폼
	function updateRereForm(refRno,content,replyWriter,tg){
		var form ="";
		 form +="<b style='font-size: 10px; color:blue;top:-55px;position: relative;right:-30px;'>"+replyWriter+"</b>"
			  +"<textarea rows='2' cols='40' style='margin-left: 20px;' id='recontent'>"+content+"</textarea>"
		      +"<button class='btn btn-warning' style='margin-left: 200px' onclick='updateRereply("+refRno+")'>수정</button>"
			  		    
		       $(tg).parents("#rere-text").html(form);
	}
	
	//대댓글 수정
	function updateRereply(refRno){
		var content = $("#recontent").val();
		/* console.log(content); */
		$.ajax({
			url:"updateRere.fo",
			data:{
				refRno:refRno,
				content:content
			},
			success:function(result){
				if(result == "success"){
					alert("댓글이 수정되었습니다.");
					location.reload();
				}
			},
			error:function(){
				
			}
		})
	}
	
	//대댓글 신고
	function rereport(replyWriter,refRno){
		 var loginUser = "${loginUser.nickname}";

		 if(loginUser !==""){
			var content = prompt("정말 "+replyWriter+"님을 신고하실 건가요?\r신고사유를 입력해 주세요");
		if(content !== null){
			
			$.ajax({
				url:"rereport.fo",
				data:{nickname:replyWriter, writer:loginUser, rereplyNo:refRno,reportReason:content},
				success:function(result){
					if(result == "success"){
						alert("댓글 신고되었습니다.");
						location.reload();
					}					
				},
				error:function(){
					console.log("error");
				}				
			});
		}
		
	 }else{
		 alert("로그인시 이용가능합니다.");
	 }
	}
	
	//게시물 수정
	 function updateBoard(e){
	
 	 $btn = e;
 	var boardNo = $($btn).closest("#up").find(".boardNo").val(); //보드번호
	

			location.href="updateEnroll.fo?boardNo="+boardNo;
 }
	
	//city호버스타일 그대로하기		 
	 $(document).ready(function() {
		  // 현재 URL에서 city 매개변수 값을 가져옵니다.		  
		  var city = "${city}";
		  /* console.log(city); */
		  
		  // 가져온 city 값으로 해당 링크에 .active 클래스를 추가합니다.
		  if (city) {
		    $('.circle[href="city.bo?city=' + city + '"]').addClass('active');
		  }
		  
		  // 링크를 클릭했을 때의 동작을 정의합니다.
		  $('.circle').click(function() {
		    // 모든 링크에서 .active 클래스를 제거합니다.
		    $('.circle').removeClass('active');
		    
		    // 클릭한 링크에 .active 클래스를 추가합니다.
		    $(this).addClass('active');
		  });
		});

	 
	 //최신순
	 function newerList(num){
		 var city= "${city}";
		 if(num ===1){
			 location.href="city.bo?sort=1&city="+city;
		 }else{			 
		 	location.href ="feed.bo";
		 }
	 }
	 //인기순
	 function ranking(num){
		 var city= "${city}";
		 if(num ===1){
			 location.href="city.bo?currentPage=1&sort=2&city="+city;
		 }else{			 
		 	location.href = "feed.bo?currentPage=1&sort=2";
		 }
	 }
	 
	 //메세지버튼 누르면 밑으로 나오게 하기
	 $(".massge").click(function(){
		 /* console.log($(this).parents(".prices").children("#reply-area")); */
		 var $mass = $(this).parents(".prices").children("#reply-area");
		 
		 if($mass.css("display") == "none"){
			 $(this).siblings("#reply-area").slideUp();
             $mass.slideDown(0);
		 }else{
			 $mass.slideUp(0);
		 }
	 });
	 
	 //게시글 신고 모달1
	 function report(boardNo,boardWriter){
		 var loginUser = "${loginUser.nickname}";
		 
		 if(loginUser !== ""){
			 $(".modal-title").text("정말 " + boardWriter + " 님을 신고하시겠습니까?");
		        $("#boardWriter").val(boardWriter);
		        $("#boardNo").val(boardNo); 
		        $("#myModal").modal('show');
		 }else{
			 alert("로그인 후 신고 가능합니다.");
		 }
	 }

	 //게시글 신고 모달2
	 function goReport(){
		 var content = $("#content").val();
		 console.log(content);
		 if(content !==""){
			 $.ajax({
				 url:"report",
				 data:{
					 boardNo: $("#boardNo").val(),
					 nickname: $("#boardWriter").val(),
					 reportReason: content,
					 writer:"${loginUser.nickname}"
				 },
				 success : function(result){
					 if(result == "success"){
						 alert("신고되었습니다.");
						 $("#myModal").modal('hide');
					 }
				 },
				 error : function(){
					 console.log("error");
				 }
			 });
		 }else{
			 alert("신고내용을 입력해 주세요");
		 }
		 
	 }
 </script>

</html>
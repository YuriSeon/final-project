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
  background-color: #dddcdc;
  width: 100px;
  height: 50px;
  border-radius: 90%;
  position: relative;
  color: rgb(60, 59, 59);
  font-size: 17px;
  font-weight: bold;
}
 .massge{cursor: pointer;}
 #reply-area{display: none;}
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
				                                        		<li><button class="btn btn-info" style="margin-left:20px;" onclick="newerList();">최신순</button></li>
				                                        		<li><button class="btn btn-warning" onclick="ranking();">인기순</button></li>
				                                        	</ul>                     
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="city">                                                           
                                                            <ul>
                                                                <li><a href="feed.bo" class="circle">#전체</a></li>
                                                                <li><a href="city.bo?city=11" class="circle">#서울</a></li>
                                                                <li><a href="city.bo?city=23" class="circle">#인천</a></li>
                                                                <li><a href="city.bo?city=21" class="circle">#부산</a></li>
                                                                <li><a href="city.bo?city=22" class="circle">#대구</a></li>
                                                                <li><a href="city.bo?city=24" class="circle">#광주</a></li>
                                                                <li><a href="city.bo?city=25" class="circle">#대전</a></li>
                                                                <li><a href="city.bo?city=26" class="circle">#울산</a></li>                                                                
                                                                <li><a href="city.bo?city=31" class="circle">#경기</a></li>
                                                                <li><a href="city.bo?city=32" class="circle">#강원</a></li>
                                                                <li><a href="city.bo?city=33" class="circle">#충북</a></li>
                                                                <li><a href="city.bo?city=34" class="circle">#충남</a></li>
                                                                <li><a href="city.bo?city=37" class="circle">#경북</a></li>
                                                                <li><a href="city.bo?city=38" class="circle">#경남</a></li>
                                                                <li><a href="city.bo?city=35" class="circle">#전북</a></li>
                                                                <li><a href="city.bo?city=36" class="circle">#전남</a></li>
                                                                <li><a href="city.bo?city=39" class="circle">#제주</a></li>                                                           
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
										                        			<i class="bi bi-justify"></i>
																			<c:choose>
							                        						<c:when test="${loginUser.nickname eq f.boardWriter }">
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
									                            <div class="price">
									                                <span>좋아요 ${f.good }개</span>
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
									                          
									                            <h5>${f.boardContent }</h5>
									                            
									                            <br>
									                            <ul>					                                
									                                <li>${f.createDate }</li>
									                            </ul>
									                           
									                        </div>
									                        <hr>
									                        <div id="reply-area">
									                        	<div>
										                        	<textarea rows="2" cols="1" id="reply" ></textarea>
										                        	<button id="btn" class="btn btn-warning">댓글</button>
									                        	</div>
									                        	
									                        	<div id="replyBox">
										                        	  
										                        	
									                        	</div>
									                        	
									                       </div>
							                            </div>
							                            							                      
							                    	</div>
							                    	<br><br><br><br><br>
							                      </c:forEach> 
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
                			 <li class="page-item"><a class="page-link" href="feed.bo?currentPage=${pi.currentPage - 1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="feed.bo?currentPage=${p}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="feed.bo?currentPage=${pi.currentPage + 1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div> 
        
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
	  /* console.log(boardNo);  */
	 var writer =  "${loginUser.nickname}";
		 
	      if (writer !== ""){ 
		 
	 	$.ajax({
	 		url: "heart.bo",
	 		type: "POST",
	 		data:{boardNo : boardNo,writer : writer},
	 		success: function(result){
	 			
	 			if (result > 0) {
	 				heartImage.attr("src", "resources/images/free-icon-heart-833472좋아요후.png");
	 				location.reload();
                } else {
                	heartImage.attr("src", "resources/images/하트.png");
                	location.reload();
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
										
				 $.ajax({
					 url:"selectReplyList.fo",
					 data:{refQno:boardNo},
					 success:function(list){
						 if (list != ""){
							 
							 var str ="";
							
							 for(i in list){
								/*   console.log(list[i].replyWriter); */

								 str +="<div id='reply-text'>"
								 	 +"<img src='resources/images/profile/빈프로필.jpg' alt='' style='width:20px; height:20px; border-radius:50%; margin-left:5px;margin-bottom: 4px;' id='profile'>"
			             			 +"<b style='margin-bottom: 3px;'>"+list[i].replyWriter+"</b>"
			             			 +"<button style='border: solid white; float: right;background-color: white;' id='report' onclick='report(\"" + list[i].replyWriter + "\",\"" + list[i].replyNo + "\")'>"
			             			 +"<img alt='' src='resources/images/980829.png' style='width:15px; height:15px; float: right;'>"
			             			 +"</button>"
			             			 +"<p style='font-size: 12px;font-weight: bold;line-height: 15px;'>"+list[i].content+"</p>"   
			             		if (writer === list[i].replyWriter) {	 
			             		 str +="<button  onclick='deleteReply(\"" + list[i].replyNo + "\")' style='color: black;font-size: 11px;padding: 3px;float: right;border: solid white;'>삭제</button>"
									 +"<button onclick='updateReplyForm(\"" + list[i].replyNo + "\",\"" + list[i].content + "\",\"" + list[i].replyWriter + "\",this)' style='color: black;font-size: 11px;padding: 3px;float: right;border-right: 1px solid;border: solid white;'>수정</button>"
			             		   }
								 str +="<p style='font-size: 11px'>"+list[i].createDate+"</p>"
								 	 +"<button onclick='rere(\"" + list[i].replyNo + "\",\"" + list[i].refQno + "\",this);' style='color: black;font-size: 11px;padding: 3px;border: solid white;'>답글</button>"	
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
				
				
				

			 
	     
		});
	//------------------------------------------------------------------------------------------------------------
	 
	 //댓글
	  $(".col > .ticket-item").on("click", "#btn", function (){
		 /*   console.log($(this).closest(".ticket-item").find("#up").find(".boardNo").val());   */
		 var loginUser = "${loginUser}";

		 if(loginUser !==""){
			 
			  $.ajax({
				  url:"reply.fo",
				  data:{content:$(this).prev().val(),
					  refQno:$(this).closest(".ticket-item").find("#up").find(".boardNo").val(),
					  replyWriter:"${loginUser.nickname}"
					  },
				success:function(result){
					if(result =="success"){					
						 /* selectReplyList();  */
						$(this).prev().val("");
						location.reload();
					}
				},
				error:function(){
					console.log("error");
				}
			  });
			  
		 }else{
			 alert("로그인시 이용가능합니다.");
			 location.reload();
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
			 form +="<b>"+replyWriter+"</b>"
				  +"<textarea rows='2' cols='50' style='margin-left: 20px' id='upcontent'>"+content+"</textarea>"
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
	function report(replyWriter,replyNo){
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
		var loginUser = "${loginUser}";
		 if(loginUser !==""){
			 
				$(aw).hide();
				var form ="";
				
					form += "<i class='bi bi-arrow-return-right' style='float: left;margin-left: 10px;'></i>"
						  +"<textarea rows='2' cols='40' style='margin-left: 20px' id='rereply-content'></textarea>"
						  +"<button  class='btn btn-warning' style='margin-left: 200px' onclick='answer("+replyNo+","+refQno+");'>답글</button>"
				
			
						  
		 }else{
			 alert("로그인 후 이용가능합니다.");
		 }
		 $(aw).hide();
		 $(aw).next("#rreply-box").html(form);
			selectAnswer(replyNo, function(result) {
	            $(aw).next("#rreply-box").append(result);
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
	            		 +"<img src='resources/images/profile/빈프로필.jpg' alt='' style='width:17px; height:17px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"
	        		     +"<b style='margin-bottom: 3px;font-size: 6px;'>"+list[i].replyWriter+"</b>"
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
	 var circles = document.getElementsByClassName("circle");

	 for (var i = 0; i < circles.length; i++) {
	   circles[i].addEventListener("click", function() {
	     this.classList.toggle("active");
	   });
	 }
	 
	 //최신순
	 function newerList(){
		 location.href ="feed.bo";
	 }
	 //인기순
	 function ranking(){
		 location.href = "feed.bo?currentPage=1&sort=2";
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

 </script>

</html>
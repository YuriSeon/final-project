<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70b23e382202cfd2baa230e5f3a37f59&libraries=services"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
	.images{
		/*  border: 1px solid;  */
		height: 700px;
		background: linear-gradient(to bottom, rgb(241, 230, 70), #ffffff);
		
	}
	.images>img{
		margin-top: 100px;
		float: left;
		width: 400px;
		height: 400px;
		padding: 0;
		
	}
	.content{ 
		margin-top: 20px;
		margin-left: 250px;
		margin-right: 250px;
		white-space: normal;
		font-family: '돋움체';
		margin-bottom: 30px;
	}
	#map{
		border: 1px solid;
		margin-left: 250px;
		margin-right: 250px;
		height: 400px;
	}
	.title{
		margin-left: 250px;
		margin-right: 250px;
		padding: 70px;
	}
	.info{
		margin-left: 300px;

		margin-top: 50px;
		padding-bottom: 200px;
	}
	.title>b{		
		font-size: 40px;
		padding: 10px;
	}
	.info strong {
		font-size: 20px;
		width: 200px;
		display: inline-block;
		
	}
	.info li{
		width: 45%;
		float: left;
		margin: 5px;		 
	}
	.bii li{
		float: left;	
		margin: auto;
		margin-right: 40px;
	}
	.bii{
		border-top: 1px solid;
		margin-left: 250px;
		margin-right: 250px;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 10px;
		border-bottom: 1px solid;
	}
	.reply-area{
		margin-left: 400px;
		margin-right: 400px;
		padding: 70px;
	}
	.reply-area button{transform: translateY(-45%);}
	#replyBox{
		margin-left: 50px;
		margin-right: 100px;
	}
	#content {
      	margin-left: 20px;
      	width: 400px;
      	height: 50px;
     }
     .cont2{
     	margin-left: 250px;
		margin-right: 250px;
		float: right;
		margin-top: 10px;
     }
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="images">		
		<img alt="" src="${at[0].filePath}" style="margin-left: 150px;">
		<img alt="" src="${at[1].filePath}" style="margin-top: 200px;">
		<img alt="" src="${at[2].filePath}">
		<img alt="" src="${at[3].filePath}" style="margin-top: 200px;">
	</div>
	
	 <div class="title">
		<b style="display: block; text-align: center;text-decoration: underline; text-decoration-color: rgb(244, 215, 162);">" ${b.boardTitle } "</b>
		<b style="display: block; text-align: center;font-size: 20px;">${b.zone.getZoneName() }</b>
	</div> 
	
	<p class="content">
	${b.boardContent }
	</p>
	<div id="map"></div>
	<div class="cont2">
         <c:if test="${loginUser.status ne 'A' }">
            <button class="btn_modify" onclick="pageLoad();" style="background-color: white;">관광정보 수정요청</button>
         </c:if>
    </div>
	<div class="info">
		<ul>
			<li>
				<strong>문의 및 안내</strong>
				<span>${b.info.getInfoCall() }</span>
			</li>
			<li>
				<strong>주소</strong>
				<span>${b.info.getInfoAddress() }</span>
			</li>
			<li>
				<strong>영업시간</strong>
				<span>${b.info.getInfoTime() }</span>
			</li>
			<li>
				<strong>휴일</strong>
				<span>${b.info.getDayOff() }</span>
			</li>
			<li>
				<strong>홈페이지</strong>
				<span>${b.info.getInfoHomepage() }</span>
			</li>			
		</ul>
	
	</div>
	
	<div class="bii">
		<ul>
			<li>
				<button type="button" style="border: solid white; background-color: white;" onclick="goChoice();">																		
					<img alt="" src="resources/images/star-before.png" style="width: 50px;height: 50px;" id="star">							
				</button>
				<b>찜하기</b>
			</li>
			<li>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
				  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
				  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
				</svg>
				<b>${b.count }</b>
			</li>
		</ul>
	</div>
	
	<div class="reply-area">
		<b style="font-size: 20px;">댓글(${reply })</b>
		<div style="margin: 10px;">
			<textarea rows="3" cols="100" id="replyContent" placeholder="로그인 후 이용가능합니다."></textarea>
			<button id="btn" class="btn btn-warning" style="height: 80px;">댓글</button>
		</div>
						                        	
		<div id="replyBox">
			
			
		</div>
									                        	
	</div>	
	
		<!-- The Modal -->
		
			<div class="modal" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h5 class="modal-title"></h5>
			        <input type="hidden" id="replyWriter">
			        <input type="hidden" id="replyNo">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>
			
			      <!-- Modal body -->
			      <div id="modal-body">
			      	<div>
			         	<input type="text" name="content" id="content" placeholder="신고사유">
			      	</div>
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-info" onclick="return goReport()">등록</button>
			        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>						                        	
		
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
<script >
	
	 var mapContainer = document.getElementById('map'), // 지도를 표시할 div
     mapOption = {
         center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level: 5 // 지도의 확대 레벨
     };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	    
	    //우편api를 활용
	    $(function(){
	    	geocoder.addressSearch("${b.info.getInfoAddress()}", function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)

                }
            });
	    });
	    
	    //로그인닉네임변수처리
	    var nickname = "${loginUser.nickname}";
	    /*  console.log(nickname);  */
	    
	    //로그인안하고 댓글쓰려고 할때
	    $(".reply-area").on("click","#replyContent",function(){
	    	if(nickname === ""){
	    		alert("로그인 후 가능합니다.");
	    	}
	    });
	    //댓글 입력
	    $(".reply-area").on("click","#btn",function(){
	    		
		    	$.ajax({
		    		url:"insertReply.mo",
		    		data:{replyWriter:nickname,
		    			  content:$("#replyContent").val(),	
		    			  refQno:"${b.boardNo}"
		    		},
		    		success:function(result){
		    			if(result == "success"){
		    				selectReply();
		    				$("#replyContent").val("");
		    			}
		    		},
		    		error:function(){
		    			console.log("error");
		    		}
		    	})	    	
	    })
	    
	    //댓글 불러오기
	    function selectReply(){	
	    	console.log("test");
		    $.ajax({
		    	url:"selectReply.mo",
		    	data:{boardNo:"${b.boardNo}"},
		    	success:function(list){
		    		var str = "";
		    		
		    		for(i in list){		    			
		    		 str +="<div id='reply-text'>"
		    		 if(!list[i].profileImg){		    			 
		    			 str+="<img src='resources/images/profile/빈프로필.jpg' style='width:30px; height:30px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"
		    		 }else{
		    			 str+="<img src='"+list[i].profileImg+"' alt='프로필사진' style='width:30px; height:30px; border-radius:50%; margin-left:5px;margin-bottom: 4px;'>"		    			 
		    		 }
               		     str+="<b style='margin-bottom: 3px;'>"+list[i].replyWriter+"</b>"
             			 +"<button style='border: solid white; float: right;background-color: white;' onclick='report(\"" + list[i].replyWriter + "\",\"" + list[i].replyNo + "\")'>"
             			 +"<img alt='' src='resources/images/980829.png' style='width:17px; height:17px; float: right;'>"
             			 +"</button>"
             			 +"<p style='font-size: 20px;'>"+list[i].content+"</p>"   
             		if (nickname === list[i].replyWriter) {	 
             		 str +="<button  onclick='deleteReply(\"" + list[i].replyNo + "\")' style='color: black;font-size: 11px;padding: 3px;float: right;border: solid white;'>삭제</button>"
						 +"<button onclick='updateReplyForm(\"" + list[i].replyNo + "\",\"" + list[i].content + "\",\"" + list[i].replyWriter + "\",this)' style='color: black;font-size: 11px;padding: 3px;float: right;border-right: 1px solid;border: solid white;'>수정</button>"
             		   }
					 str +="<p style='font-size: 15px; margin-top: 5px;'>"+list[i].createDate+"</p>"
					 	 +"<button onclick='rere(\"" + list[i].replyNo + "\",\"" + list[i].refQno + "\",this);' style='color: black;font-size: 11px;padding: 3px;border: solid white;margin-top: 8px;'>답글</button>"	
						 +"<div id='rreply-box'>"								 	
					 	 +"</div>"		
					 	 +"</div>"	
		    		}
		    		
					$("#replyBox").html(str);
		    	},
		    	error:function(){
		    		console.log("error");
		    	}
		    })
	    }
	    $(function(){
	    	selectReply();
	    })
	    
	    function deleteReply(replyNo){
	    	var chk = confirm("정말 댓글 삭제 하실건가요?");
	    	if(chk === true){
	    		
		    	$.ajax({
		    		url:"deleteReply.mo",
		    		data:{replyNo:replyNo},
		    		success:function(result){
		    			if(result == "success"){
		    				alert("댓글을 삭제하였습니다.");
		    			}
		    		},
		    		error:function(){
		    			console.log("error");
		    		}
		    	})
	    	}
	    }
	    
	    //댓글수정폼
	     function updateReplyForm(replyNo,content,replyWriter,tg){
	    	 var form ="";
			 form +="<b style='display: block; margin-bottom: 1px; margin-left:7px;'>"+replyWriter+"</b>"
				  +"<textarea rows='3' cols='90'  id='upcontent'>"+content+"</textarea>"
   		          +"<button class='btn btn-warning' style='height: 80px;' onclick='updateReply("+replyNo+")'>수정</button>"
				  		    
   		       $(tg).parents("#reply-text").html(form);
	     }
	     
	    //댓글수정업데이트
	    function updateReply(replyNo){
	    	$.ajax({
	    		url:"updateReply.mo",
	    		data:{replyNo:replyNo,
	    			 content:$("#upcontent").val()
	    			},
	    		success:function(result){
	    			if(result =="success"){
	    				selectReply();
	    			}
	    		},
	    		error:function(){
	    			console.log("error");
	    		}
	    	});
	    }
	    
	   
	    
	    //신고모달
	function report(replyWriter, replyNo) {
		//신고리스트
	    var rlist = ${rlist};
			
		var alreadyReported = false;
	    
	    for (var i = 0; i < rlist.length; i++) {
	        if (nickname !== "" && rlist[i].replyNo == replyNo && rlist[i].writer == nickname) {
	            alreadyReported = true;
	            break;
	        }
	    }
	    
	    if (alreadyReported) {
	        alert("이미 신고한 댓글입니다.");
	    } else if (nickname === "") {
	        alert("로그인 후 신고 가능합니다.");
	    } else {
	        $(".modal-title").text("정말 " + replyWriter + " 님을 신고하시겠습니까?");
	        $("#replyWriter").val(replyWriter);
	        $("#replyNo").val(replyNo);
	        $("#myModal").modal('show'); //모달열기
	    }
	    }
	    //신고모달-2
		function goReport() {

			var content = $("#content").val();
			console.log(content);
			if (content !== "") {

				$.ajax({
					url : "report.mo",
					data : {
						replyNo : $("#replyNo").val(),
						nickname : $("#replyWriter").val(),
						reportReason : content,
						writer:nickname
					},
					success : function(result) {
						if (result == "success") {
							alert("신고되었습니다.");
							$("#myModal").modal('hide');	//모달닫기	
							
						}
					},
					error : function() {
						console.log("error");
					}
				})
			}else{
				alert("신고내용을 입력해 주세요");
			}
		}
	    
	    //찜하기
	    function goChoice(){
	    	
	    	if(nickname !== ""){
	    		
	    		$.ajax({
	    			url:"choice.mo",
	    			data:{
	    				boardNo:"${b.boardNo}",
	    				writer: nickname
	    			},
	    			success:function(result){
	    				if(result>0){
	    					$("#star").attr("src", "resources/images/star-after.png");
	    				}else{
	    					$("#star").attr("src", "resources/images/star-before.png");
	    				}
	    			},
	    			error:function(){
	    				console.log("error");
	    			}
	    		});
	    	}else{
	    		alert("로그인 후 이용 가능합니다.");
	    	}
	    }
	    
	    //찜하기 보여주기
	    $(function(){
	    	var boardNo = "${b.boardNo}";
	    		boardNo = parseInt(boardNo);
	    	var img = $("#star");
	    	var writer = "${loginUser.nickname}";
	    	var like = false;
	    	var clist = ${clist};
	    	
	    	for(var i=0; i<clist.length; i++){
	    		var c=clist[i];
	    		
	    		if(c.boardNo === boardNo && c.writer === writer){
	    			like = true;
	    		}
	    	}
	    	
	    	if(like){
	    		img.attr("src","resources/images/star-after.png");
	    	}else{
	    		img.attr("src","resources/images/star-before.png");
	    	}
	    });
	    	    	    
	   
	    //사용자 정보수정 요청
	    function pageLoad(){
	    	boardNo = "${b.boardNo}";
	    	location.href = "askUpdate.mo?boardNo="+boardNo;
	    }
	
</script>
</body>
</html>
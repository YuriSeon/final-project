<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.schedule-detail img {
		width : 45px;
	}
	.schedule-detail {
	height: auto;
}

.schedule-detail * {
	margin: auto;
	left: 0;
	right: 0;
	border:1px solid;
}

.schedule-detail #title-area {
	width: 85%;
	height: 200px;
	border: 2px solid gray;
}

.schedule-detail #title-area {
	width: 100%;
	border: 0;
	height: 3px;
	background: gray;
}

.schedule-detail #title-area div {
	float: left;
}

.schedule-detail #main-title {
	width: 100%;
	height: 70%;
}

.schedule-detail #main-title div {
	float: left;
}

.schedule-detail #title1 {
	width: 100%;
	height: 65%;
}

.schedule-detail #title2 {
	width: 100%;
	height: 35%;
}

.schedule-detail #total-path {
	width: 100%;
	height: 30%;
}

.schedule-detail #content-area {
	width: 85%;
	height: 600px;
}

.schedule-detail #content-area div {
	float: left;
	margin-left: 3%;
	margin-top: 2%;
}

.schedule-detail #map-area {
	width: 50%;
	height: 90%;
}

.schedule-detail #img-path {
	width: 40%;
	height: 90%;
}

.schedule-detail #img-path div {
	margin-left: 5%;
}

.schedule-detail #img-area {
	width: 90%;
	height: 55%;
}

.schedule-detail #path-area {
	width: 90%;
	height: 38%;
}

.schedule-detail #pay {
	width: 90%;
	height: 15%;
}

.schedule-detail #path {
	overflow: scroll; /* 일정이 여러개일경우 스크롤*/
	width: 90%;
	height: 65%;
}

.schedule-detail hr {
	width: 85%;
	margin-top: 3%;
	margin-bottom: 2%;
}

.schedule-detail #reply-area {
	margin-top: 1%;
	width: 70%;
}

.schedule-detail #reply-area>div {
	margin-bottom: 2%;
}

.schedule-detail #reply-title {
	font-size: 22px;
}

.schedule-detail #reply-back {
	background-color: lightgray;
	width: 100%;
	height: 50px;
}

.schedule-detail #reply-back input {
	width: 80%;
	height: 60%;
	margin-top: 1%;
	margin-left: 2%;
}

.schedule-detail button {
	width: 90px;
	height: 34px;
}

.schedule-detail #reply-content {
	width: 100%;
}

.schedule-detail .reply {
	width: 100%;
	height: 150px;
}

.schedule-detail .reply div {
	float: left;
}

.schedule-detail .reply .pro {
	width: 10%;
	height: 100%;
}

.schedule-detail .reply .con {
	width: 90%;
	height: 70%;
}
/* 여기 나중에 확인해서 수정 필요함  */
.schedule-detail .reply .date, .btn-type {
	width: 90%;
	height: 15%;
}

.schedule-detail #reply-area #btn {
	text-align: center;
}

.schedule-detail #btn button {
	margin-left: 2%;
}

.schedule-detail .marcker-area {
	position: relative;
	width: 45px;
}

.schedule-detail .marcker {
	width: 100%;
}

.schedule-detail .color {
	width: 50%;
	height: 50%;
	border-radius: 50%;
	/* border: 5px solid pink; */
	position: absolute;
	margin: auto;
	top: 0;
	left: 0;
	right: 0;
	bottom: 11px;
}

.schedule-detail .color span {
	font-size: 20px;
	font-weight: 800;
	margin-top: 60%;
	margin-bottom: 40%;
	margin-left: 35%;
	margin-right: 65%;
	width: 100%;
	height: 100%;
}

}
#mapwrap{posision:absolute;overflow:hidden; width: 100%; height: 100%;}
#map {
	width: auto;
	height: 100%;
	max-height: 538px;
}
.category, .category *{margin:0;padding:0;color:#000;}   
.category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_coffee {background-position:-10px 0;}  
.category .ico_store {background-position:-10px -36px;}   
.category .ico_carpark {background-position:-10px -72px;} 
.attracDetail .img_area {
	position: relative;
	width: 100%;
	height: 450px;
}

.attracDetail #wrapSlide {
	width: 100%;
	height: 100%;
}

.attracDetail #float {
	width: 100%;
	height: 90%;
}

.attracDetail #slideArea {
	width: 60%;
	height: 100%;
}

.attracDetail #slideImage {
	width: auto;
	height: 100%;
}

.attracDetail #float>div {
	float: left;
}

.attracDetail .float-img {
	width: 20%;
	height: 100%;
}

.attracDetail #prev, .attracDetail #next {
	position: relative;
	opacity: 0.3;
	width: 60%;
	height: auto;
	margin-top: 65%;
	opacity: calc(0.1);
	cursor: pointer;
}

.attracDetail #dotArea {
	position: relative;
	margin-top: 5px;
	height: 5%;
}

.attracDetail #dotArea * {
	margin-right: 10px;
}

</style>
</head>
<body>
<!-- 지도, 마커 반복문 추가, 마커 클릭시 데일리 일정 나오도록하고 그 후에... 지도 마커 클릭시 info 보여주기 나중에 대댓글 넣는거 하기 -->
<%@ include file="../../common/menubar.jsp" %>
<div class="main-schedule">
  <div class="container">
	  <div class="row">
		  <div class="col-lg-12">
			</div>
		</div>
	</div>
</div>
<div class="schedule-detail">
	<div id="title-area">
		<div id="main-title">
			<div id="title1">title</div>
			<div id="title2">
				<!-- 여행기간 -->
				<img src="resources/images/calendar.png"> <span><%-- ${plan.startDate } ~ ${plan.endDate } (${plan.totalDate }) --%></span>
				<!-- 여행스타일 -->
				<img src="resources/images/ticket.png"> <span><%-- ${plan.concept } --%></span>
				<!-- 조회수 -->
				<img src="resources/images/view.png"> <span><%-- ${board.count } --%></span>
				<div id="btn-type">
					<span class="icon"><img src="resources/images/view.png"></span>
                    <span class="num">${dataMap.board.count }</span>
                    <span class="ico">
                        <img class="good" src="resources/images/Like-before.png" onclick="iconChange('good');">
                    </span>
                    <span class="num goodNum"></span>
                    <span class="ico">
                        <img class="choice" src="resources/images/star-before.png" onclick="iconChange('chioce');">
                    </span>
                    <span class="num chioceNum"></span>
                    <span class="ico">
	                    <img class="report" src="resources/images/bell-after.png">
                    </span>
				</div>
			</div>
		</div>
		<hr>
		<!-- 총 여행경로 -->
		<div id="total-path">
		</div>
	</div>
	<div id="content-area">
		<!-- 경로 전체 위치 마커 표시된 지도 -->
		<div id="map-area">
			<div id="mapwrap"> 
    <!-- 지도가 표시될 div -->
    <div id="map"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="coffeeMenu" onclick="changeMarker('coffee')">
                <span class="ico_comm ico_coffee"></span>
                커피숍
            </li>
            <li id="storeMenu" onclick="changeMarker('store')">
                <span class="ico_comm ico_store"></span>
                편의점
            </li>
            <li id="carparkMenu" onclick="changeMarker('carpark')">
                <span class="ico_comm ico_carpark"></span>
                주차장
            </li>
        </ul>
    </div>
</div>
		</div>
		<div id="img-path">
			<!-- info에 저장된 여행지 사진들 -->
			<div class="img_area">
                  <div id="wrapSlide">
                      <div id="float">
                          <div class="float-img">
                              <img src="resources/images/left.png" id="prev" onclick="prev()">
                          </div>
                          <div id="slideArea">
                              <img id="slideImage"/>
                          </div>
                          <div class="float-img">
                              <img src="resources/images/right.png" id="next" onclick="next()">
                          </div>
                      </div>
                      <div id="dotArea"></div>
                  </div>
              </div>
			<div id="path-area">
				<!-- 전체 예상 비용 -->
				<div id="pay">total : ${plan.totalPay }</div>
				<!-- 데일리 일정 묶음 -->
				<div id="path">
					<!-- <c:forEach varStatus="i" begin="1" end="${plan.totalDate }">
						<div class="marcker-area">
							<img class="marcker" src="resources/images/marker2.png">
							<div class="color"></div>
						</div>
					</c:forEach> -->
				</div>
			</div>
		</div>
	</div>
	<hr size="3">
	<div id="reply-area">
		<div id="reply-title">일정톡(<span>%{rlist.size()}</span>)</div>
		<div>
			<div id="reply-back">
				<input type="text" name="reply-content" placeholder="지금 보고계신 일정에 대해 댓글을 작성해주세요!">
				<button type="submit">작성</button>
			</div>
		</div>
		<div id="reply-content"></div>
		<div id="btn">
			<button type="button" onclick="history.back();">목록</button>
				<!-- 로그인유저가 관리자가 아니거나 작성가자 아닐때 동행버튼 활성  -->
			<c:choose>
				<c:when test="${!(loginUser.userId eq board.writer) or !(loginUser.status eq 'A') }">
					<!-- 동행버튼 클릭시 이동하도록 연결하기 -->
					<button type="button" onclick="form(3)">동행하러가기</button>
				</c:when>
				<c:otherwise>
					<button type="button" onclick="form(1)">수정</button>
					<button type="button" onclick="form(2);">삭제</button>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
  </div>
  <div class="modal" id="reportModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">정말로 신고하시겠습니까?</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<textarea id="reportReason" name="reportReason" placeholder="신고사유를 작성해주세요"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" id="reportSubmit" class="btn btn-outline-danger" data-dismiss="modal">제출</button>
					<button type="button" class="btn btn-outline-success" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
  <%@include file="../../common/footer.jsp" %>
    <!-- 작성해둔 함수 넣은 파일 불러와서 사용 -->
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282"></script>
    <script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = {
			center : new kakao.maps.LatLng(37.498004414546934, 127.02770621963765), // 지도의 중심좌표 (아래 좌표들의 중심좌표 구해서 넣기)
			level : 3 // 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		$(function(){
			//1. 댓글조회해오기
			selectReplyList();

			/* 데일리 일정 표시하는 마커 출력 */
            var colors = ['red', 'orange', 'yellow', 'green', 'blue', 'purple', 'pink', 'skyblue']; // 일정 수 증가시 컬러만 추가해서 사용하도록 설정
            var circle = document.querySelectorAll('.color');
            
            for(var i=0; i < circle.length; i++){
                var list = circle[i];
                $("#path").append(makeTag("div", {"class":"marcker-area"+(i+1)}));
               	$(".marcker-area"+(i+1)).append(makeTag("img",{"class":"marcker"+(i+1),"src":"resources/images/marker2.png"})).append(makeTag("div",{"class":"color"}).append("span",{"text":i+1}));
                $(list).css("background-color", colors[i]);
            }
        });
		/* 댓글 조회 */
        function selectReplyList(){
            var replyDiv = $("#reply-content"); // 댓글 넣을 영역
            $.ajax({
                url : "selectReplyList.attr",
                data : { boardNo : "${dataMap.board.boardNo}" },
                success : function(result){
                	replyDiv.empty(); // 기존 생성해놓은 것들 지워주기
                	/* 
	                    <div class="reply">
	                        <input type="hidden" name="replyNo" value="번호넣기">
	                        <div class="pro">프로필</div>
	                        <div class="nick">
	                            <a id="nicknameHover" onclick="whoareyou();">닉네임</a>
	                            <img class="report" src="resources/images/bell-before.png">
	                        </div>
	                        <div class="con">댓글내용</div>
	                        <span class="ico">
	                            <span>댓글작성일</span>
	                            <button type="button" onclick="rereplyToggle();">답글달기</button>
	                        </span>
	                        <div>
	                            <input type="text" name="rereplyInput" id="reinput"><button type="button" onclick="replyinsert(2);">작성</button>
	                        </div>
	                        <div class="rereply">
	                            <input type="hidden" name="replyNo" value="번호넣기">
	                            <div class="pro">프로필</div>
	                            <div class="nick">
	                                <a id="nicknameHover" onclick="whoareyou();">닉네임</a>
	                                <img class="report" src="resources/images/bell-before.png">
	                            </div>
	                            <div class="con">댓글내용</div>
	                            <span class="ico">
	                                <span>댓글작성일</span>
	                            </span>
	                        </div>
	                    </div>
	                */
	                for(var i in result){
                        var r = {
                            reply : makeTag("div",{"class":"reply"}),
                            reReply : makeTag("div",{"class":"rereply"}),
                            replyNo : makeTag("input",{"type":"hidden", "id":"replyNo","value":result[i].replyNo}),
                            pro : makeTag("div",{"class":"pro"}),
                           	nick : makeTag("div",{"class":"nick"}),
                            name : makeTag("a",{"id":"nicknameHover","onclick":"whoareyou();"}).text(result[i].replyWriter),
                            report : makeTag("span",{"class":"ico"}).append(makeTag("img",{"id":"reply","class":"report","src":"resources/images/bell-after.png"})),
                            recon : makeTag("div", {"class": "con"}).append(makeTag("textarea",{"class":"replycontent"}).text(result[i].content)),
                            redate : makeTag("div",{"class":"date"}).text(result[i].createDate),
                            reReplyinput : makeTag("input",{"type":"text","class":"reReplyContent","placeholder":"이 댓글에 대한 생각을 적어주세요!"}),
                            reReplyBtn : makeTag("button", {"class":"replyInsert"}).text("작성")
                        }
                        var nickName = r.nick.append(r.name.append(makeTag("img",{"src":result[i].profileImg})), r.report);
                        var replyarea = r.reply.append(r.replyNo, r.pro, nickName, r.recon, r.redate, $("<div>").append(r.reReplyinput, r.reReplyBtn));
                        replyDiv.append(replyarea);
                        if(result[i].refRno!= 0){
                        	$(".reply").each(function(){
                        		if($(this).children().eq(0).val() == result[i].refRno){
		                            nickName = r.nick.append(r.name.append(makeTag("img",{"src":result[i].profileImg})));
		                            r.reReply.append(r.replyNo.attr("value",result[i].refRno), r.pro, nickName, r.recon,r.redate);
                        		}
                        	});
                        }
                        r= null;
	                }
                        
                }
            });
        }
		/* 댓글 등록 */
        $(document).on("click",".replyInsert", function(){
        	var replyNo = $(this).parents().eq(1).children().eq(0).val();
        	var refRno = 0;
        	if(replyNo!=''){ // 대댓글
                refRno = replyNo;
            }
            $.ajax({
                url : "insertReply.sc",
                data : {
                    content : $(this).prev().val(),
                    replyWriter : "${loginUser.nickname}",
                    refQno : "${dataMap.board.boardNo}",
	                refRno : refRno
                },
                success : function(result){
                    if(result>0){
                        alert("댓글 등록 성공");
                        selectReplyList(); // 리스트 추가됐으니 다시 조회
                        $(this).prev().val() = ""; // 댓글 등록됐으니 비워주기 
                    } else {
                        alert("댓글 등록 실패")
                    }
                }
            });
        })
        /* 댓글 삭제 */ // 확인하고 수정필요
        function replydelete(type, no){
            var refRno = 0;
            var replyNo = $(this).parents.eq(0).val();
            if(type=='rereply'){
                refRno = no;
            }
            $.ajax({
                url : "deleteReply.attr",
                data : {
                    refQno : "${dataMap.board.boardNo}",
	                refRno : refRno,
                    replyNo : replyNo
                },
                success : function(result){
                    if(result>0){
                        alert("댓글 삭제 성공");
                        selectReplyList(); // 리스트 추가됐으니 다시 조회
                    } else {
                        alert("댓글 삭제 실패")
                    }
                }
            });
        }
		
		/* 페이지 이동 이벤트 */
        function pageLoad(num){
            var obj = $(".schedule-detail"); 
            var form = makeTag("form", {"method":"get"});
            var boardNo = makeTag("input", {"type":"hidden", "name":"boardNo", "value":"${dataMap.board.boardNo}"}); // 게시물 번호
            var at = makeTag("input", {"type":"hidden", "name":"at", "value":"${dataMap.at})"}); // 파일경로
            switch(num){
                case 1 : form.attr("action", "update.sc"); break; // 게시물 수정
                case 2 : form.attr("action", "delete.sc"); break; // 게시물 삭제
                case 3 : form.attr("action", "together.sc"); break; // 동행위한 함께가치 페이지로 이동
            }
            obj.append(form.append(boardNo, at));
            form.submit();
        }
        /* 신고 이벤트 */
        $(document).on("click",".report", function(){
         	$("#reportModal").show(); // 신고누르면 모달 보여주기
         	var type = $(this).parents().eq(2).attr("class");
         	console.log(type);
         	var replyNo = 0;
         	var rereplyNo = 0;
         	var num = $(this).parents().eq(2).children().eq(0).val();
         	console.log($("#reportReason").text())
 	        /* 신고사유 제출 */
 	        $("#reportSubmit").click(function(){
 	        	if(type=='reply'){ //댓글
 	        		replyNo = num;
 	        	} else if(type=='rereply'){ // 대댓글
 	        		rereplyNo = num;
 	        	}
 	        	$.ajax({
 	        		url : "report.sc",
 	        		data : {
 	        			writer : "${loginUser.nickname}",
 	        			boardNo : "${dataMap.board.boardNo}",
 	        			replyNo : replyNo,
 	        			rereplyNo : rereplyNo,
 	        			reportReason : $("#reportReason").text()
 	        		},
 	        		success : function(result){
 	        			if(result>0){
 	        				alert("신고에 성공하셨습니다.");
 	        			} else {
 	        				alert("신고에 실패하셨습니다.");
 	        			}
 	        		}
 	        	});
 	        })
        });
        
        /* 좋아요 찜 여부 조회 */
       function iconCheck(){
        	$.ajax({
        		url : "iconCheck.sc",
        		data : {
        			boardNo : $("#boardNo").val(),
        			writer : "${loginUser.nickname}"
        		},
        		success : function(result){
        			changeSrc(result);
        		}
        	});
        }

        /* 좋아요 찜 아이콘 변경 */  
        function iconChange(type){ // 이벤트 대상 객체 매개변수로 받음
            $.ajax({
                url : "iconChange.sc",
                data : {
                    btnType : type,
                    no : "${dataMap.board.boardNo}",
                    writer : "${loginUser.nickname}"
                },
                success : function(result){
                	// 조회할때 사용했던 함수 사용하기위해 값 반대로 넣어줌
                	if(result[type]>0){ // 수 증가해서 아이콘 변경해주기
                		result[type] = 0;
                	} else {
                		result[type] = 1;
                	}
                	changeSrc(result);
                }
            });
            
        }
        
        // 아이콘 src 변경 함수
        function changeSrc(result){
        	
        	var goodSrc = $(".good").attr("src");
        	var choiceSrc = $(".choice").attr("src");
        	if(result.goodCheck>0){
        		$(".good").attr("src",goodSrc.replace("before","after"));
        	}else{
        		$(".good").attr("src",goodSrc.replace("after","before"));
        	}
        	if(result.choiceCheck>0){
        		$(".choice").attr("src",choiceSrc.replace("before","after"));
        	}else{
        		$(".choice").attr("src",choiceSrc.replace("after","before"));
        	}
        	$(".goodNum").text(result.goodCount);
        	$(".choiceNum").text(result.choiceCount);
        }
		 /* 사진 슬라이더 */
		const slideIndex = ["resources/images/attr1.png","resources/images/attr2.png","resources/images/attr3.png"];
		 
	   /*  // 텍스트 형식으로 넘어오니 객체로 바꿔주기위한 작업
	   	const atTextArr = ("${dataMap.at}").replace(/Attachment/g, '').replace(/\(/g, '{').replace(/\)/g, '}').replace(/=/g, ':')
	   										.replace(/(\w+):/g, '"$1":').replace(/:([^,{}\[\]]+)/g, ':"$1"');
	    // 객체로 바꿔준것을 json화
	   	const at = JSON.parse(atTextArr); 
	    // 슬라이드에 사용할 배열에 파일경로 추출해서 넣어주기
	   	for(var i in at){
	   		slideIndex.push(at[i].filePath);
	   	} */
	    let currentIndex = slideIndex[0];
	    const dotPath = 'resources/images/dot.png';
	    
	    $(function(){
	        $("#slideImage").prop("src", slideIndex[0]);
	        slideIndex.forEach(function(item, index, array){
	            let img = document.createElement("img");
	            img.setAttribute("src", dotPath);
	            img.setAttribute("width", "15px");
	            img.setAttribute("height", "15px");
	            img.setAttribute("id", "dotImage" + index);
	            img.setAttribute("class", "dotImage");
	            img.setAttribute("onclick", "dotClickEvent(" + index + ")");
	            document.querySelector("#dotArea").appendChild(img);
	        });
	    });
	    function dotClickEvent(index){
	        $("#slideImage").attr("src", slideIndex[index]);
	        currentIndex = slideIndex[index];
	    }
    
	    $("#prev").on("click", function(){
	        slideIndex.some(function(item, index, array){
	            if(index != 0){
	                if(item == currentIndex){
	                    $("#slideImage").attr("src", slideIndex[index - 1]);
	                    currentIndex = slideIndex[index - 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").attr("src", slideIndex[slideIndex.length - 1]);
	                    currentIndex = slideIndex[slideIndex.length - 1];
	                    return true;
	                }
	            }
	        });
	    });
	    $("#next").on("click", function(){
	        slideIndex.some(function(item, index, array){
	            if(index != slideIndex.length - 1){
	                if(item == currentIndex){
	                    $("#slideImage").attr("src", slideIndex[index + 1]);
	                    currentIndex = slideIndex[index + 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").attr("src", slideIndex[0]);
	                    currentIndex = slideIndex[0];
	                    return true;
	                }
	            }
	        });
	    });
    </script>
</body>
</html>
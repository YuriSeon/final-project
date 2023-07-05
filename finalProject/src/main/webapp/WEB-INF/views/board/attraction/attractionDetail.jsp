<%@page import="java.util.HashMap"%>
<%@page import="com.kh.finalProject.board.model.vo.Info"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/attraction.css?after">
<title>Insert title here</title>
<style type="text/css">
#content-pack *{
	border:1px solid;
}
.attracDetail #reply-area {
	margin-top: 1%;
	width: 70%;
}

.attracDetail #reply-area>div {
	margin-bottom: 2%;
}

.attracDetail #reply-title {
	font-size: 22px;
}

.attracDetail #reply-back {
	background-color: lightgray;
	width: 100%;
	height: 50px;
}

.attracDetail #reply-back input {
	width: 80%;
	height: 60%;
	margin-top: 1%;
	margin-left: 2%;
}

.attracDetail #reply-area button {
	width: 90px;
	height: 34px;
}

.attracDetail #reply-content {
	width: 100%;
}

.attracDetail .reply {
	width: 100%;
	height: auto;
    min-height: 120px;
}
.attracDetail .reply *{
    text-align: left;
    padding: 1px;
}

.attracDetail .reply div {
	float: left;
}

.attracDetail .reply .pro {
	width: 10%;
	height: 100%;
    min-height: 120px;
}
.attracDetail .reply .pro img{
    width: 95%;
    max-height: 50px;
    height: auto;
    margin: 2.5%;
}
.attracDetail .reply .con {
	width: 90%;
	height: auto;
    min-height: 55px;
    padding: 10px;
}
/* 여기 나중에 확인해서 수정 필요함  */
.attracDetail .reply .date, .attracDetail .reply-btn {
	width: 90%;
	height: 20%;
}

.attracDetail #reply-area #btn {
	text-align: center;
}

.attracDetail #btn button {
	margin-left: 2%;
}
.attracDetail #reply-area .ico {
    width: 35px;
    min-height: 37px
}
.attracDetail #reply-area .ico img{
	width: auto;
    max-height: 35px;
}
.attracDetail .reply-btn input {
    height: 100%;
    width: 75%;
    box-sizing: border-box;
}
.attracDetail .reply-btn button {
    text-align: center;
}

</style>
<body>
<%@include file="../../common/menubar.jsp" %>
<!-- 맛집 추천 상세정보 출력구문작성, 댓글조회 원래 양식 확인하고 지우기 -->
<!-- 좋아요 찜 되는데 두번 클릭하면 아이콘이 다시 안바뀌는것만 수정 -->
    <div class="attracDetail">
        <div id="contents">
            <!-- 상단 -->
            <div class="titleType">
                <h2 id="topTitle">${dataMap.board.boardTitle}</h2>
                <div class="area_address" id="topAddr">
                    <span>${fn:split(dataMap.info.infoAddress, ' ')[0]} ${fn:split(dataMap.info.infoAddress, ' ')[1]}</span>
                </div>
                <div class="titTypeWrap">
                    <span>
                    	${fn:split(dataMap.board.boardContent, '||')[1] }
                    </span>
                </div>
                <div class="board-area">
                    <span class="icon"><img src="resources/images/view.png"></span>
                    <span class="num">${dataMap.board.count }</span>
                    <span class="ico">
                        <img class="good" src="resources/images/Like-before.png" onclick="iconChange('good');">
                    </span>
                    <span class="num goodNum">${dataMap.board.good }</span>
                    <span class="ico">
                        <img class="choice" src="resources/images/star-before.png" onclick="iconChange('chioce');">
                    </span>
                    <span class="num chioceNum">${dataMap.board.choice }</span>
                    <span class="ico">
	                    <img class="report" src="resources/images/bell-after.png">
                    </span>
                </div>
                <input type="hidden" id="boardNo" name="boardNo" value="${dataMap.board.boardNo}"> 
            </div>
            <hr>
            <!-- 내용 -->
            <div class="db_cont_detail">
                <!-- 사진보기 -->
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
                <div id="detailGo">
                    <div class="wrap_contView">
                        <div class="contView">
                            <div class="cont1">
                                <span id="detailInfo">상세정보</span>
                            </div>
                            <div class="cont2">
                            	<c:if test="${loginUser.status ne 'A' }">
                                	<button class="btn_modify" onclick="pageLoad(1);">관광정보 수정요청</button>
                                </c:if>
                            </div>
                        </div>
                        <hr>
                        <div class="inr_wrap">
                            <div class="inr text">
                                ${fn:split(dataMap.board.boardContent, '||')[0] }
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 주변정보 지도 -->
                <div class="surroundingsMap" id="detailGo">
                    <div id="map" style="width:100%;height:350px;"></div>
                </div>
                <div class="wrap_contView" id="detailinfoview">
                    <!-- 세부 정보 -->
                    <div class="inr">
                    	<table id="infoDetail">
                    	</table>
                    </div>
                </div>
            </div>
        </div>
        <div class="contView">
            <div class="cont1">
                <span id="detailInfo">주변 맛집 추천</span>
            </div>
        </div>
        <hr>
        <div class="foodReco">
            <div class="cont1">
                <div class="food">
                    <div class="foodImg">이미지영역</div>
                    <div class="foodInfo">
                        <div class="board-foodTitle">맛집이름</div>
                        <div class="foodAddress">주소</div>
                    </div>
                </div>
            </div>
            <div class="cont2">
                <div class="food">
                    <div class="foodImg">이미지영역</div>
                    <div class="foodInfo">
                        <div class="board-foodTitle">맛집이름</div>
                        <div class="foodAddress">주소</div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div id="reply-area">
            <div id="reply-title">여행톡<span> 1</span></div>
            <div>
                <div id="reply-back">
                    <input type="text" id="reply-content" placeholder="지금 보고계신 명소에 대해 댓글을 작성해주세요!">
                    <button class="replyInsert">작성</button>
                </div>
            </div>
            <div id="content-pack">
            <!-- 댓글 들어갈 영역 -->
            </div>
        </div>
        <div class="btn-area">
            <button onclick="history.back();">목록</button>
            <c:if test="${loginUser.status eq 'A' }">
	            <button onclick="pageLoad(2);">수정하기</button>
	            <button onclick="pageLoad(3);">삭제하기</button>
            </c:if>
        </div>
    </div>
    <!-- 맛집 클릭시 상세정보 나오는 모달 -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <div id="modal-title">
                            <h3>주변 맛집 상세 정보</h3>
                    </div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div id="modal-body">
                    <div id="body-size">
                        <div class="info-area">
                            <div class="float">
                                <h4 id="topTitle">장소이름</h4>
                                <div class="board-food-area">
                                    <span class="ico">
                                        <img class="good" src="resources/images/Like-before.png">
                                    </span>
                                    <span class="ico">
                                        <c:if test="${choice.userNo eq loginUser.userNo }">
                                            <img class="choice" src="resources/images/star-before.png">
                                        </c:if>
                                    </span>
                                </div>
                            </div>
                            <div class="area_address" id="topAddr">
                                <span>지역정보</span>
                            </div>
                            <div class="titTypeWrap">
                                <span>
                                    한줄설명내용 영역
                                </span>
                            </div>
                        </div>
                        <div class="photo-area">
                            <div class="cont1">
                                <img src="">
                            </div>
                            <div class="cont2">
                                <div id="map"></div>
                            </div>
                        </div>
                        <div class="detailInfo">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="modal" id="reportModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">신고하시겠습니까?</h4>
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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script>
        $(function(){
            /* 페이지로드되면 바로 실행해야 할 부분 */ 
            // 1. 숨길영역 숨기기
            $("#myModal").modal('hide'); 
            $("#reportModal").modal('hide');
//             $(".text").hide(); 
            // 2. 댓글 조회
            selectReplyList(); 
            // 3. 좋아요 신고 아이콘 조회
            iconCheck();
            // 4. 로그인 확인 후 댓글 비활성화
//             if("${empty loginUser}"){
//                 $("#reply-back").children().siblings().attr("disabled", "true"); // 비활성화 시키기
//             	$("#reply-back input").attr("placeholder", "로그인하셔야 댓글작성이 가능합니다.");
//             }
            // 5. 장소 상세정보 출력
            var list = ['infoAddress','infoTime','infoHomepage','infoCall','parking','infoType','dayOff']; // 출력할 내용 배열에 담기
            	// key로 꺼내 사용할 수 있도록 객체형식으로 변경
            	// 처음과 마지막 ()만 변경되도록/ =은 :로 변경/ :의 앞 뒤 ""로 감싸주는데 http:는 추가로 감싸지 않도록 설정
           	var info =("${dataMap.info}").replace(/Info/g, '').replace(/^./, '{').replace(/.$/, '}').replace(/=/g, ':')
										.replace(/(\w+):/g, '"$1":').replace(/:([^,{}\[\]]+)/g, ':"$1"').replace('"http"', 'http');
            var infoObj = JSON.parse(info);
            for(var i in list){
            	switch(list[i]){
	            	case 'infoAddress' : label = '주소 (도로명 주소)'; break;
	            	case 'infoTime' : label = '이용시간'; break;
	            	case 'infoHomepage' : label = '홈페이지주소'; break;
	            	case 'infoCall' : label = '대표 번호 (고객문의용)'; break;
	            	case 'infoType' : label = '장소 종류'; break;
	            	case 'parking' : label = '주차장'; break;
	            	case 'dayOff' : label = '휴무일';
            	}
            	if(infoObj[list[i]]!="null"){ // 정규표현식으로 ""전부 감싸줬기에 이렇게 비교
		            $("#infoDetail").append($("<tr>").append($("<th>").append(label),$("<td>").append(infoObj[list[i]])));
            	}
            }
            /* 장소 종류에 맞춰서 숫자에서 값으로 바꿔주기 */
            $("#infoDetail tbody tr th").each(function(){
                var thisText = $(this).siblings().text();
            	if($(this).text()== '장소 종류'){
                    var changeText = "";
                    switch(thisText){
                        case '1' : changeText = '여행'; break;
                        case '2' : changeText = '맛집'; break;
                        case '3' : changeText = '기타'; 
                    }
            	} else if($(this).text()== '주차장'){
                    if(thisText=='Y'){
                        changeText = '주차 가능';
                    } else {
                        changeText = '주차 불가능';
                    }
                }
                $(this).siblings().text(changeText); 
            });
            
            /* 맛집추천 게시글 조회해오기 */
            $.ajax({
                url : "foodSearch.attr",
                data : {
                    // 해당지역 데이터 넘겨서 조회
                    zoneName : $("#topAddr").children().text()
                },
                success : function(list){
                    var boardAddr = $("#detailinfoview span[name=infoAddress]").text(); // 게시물의 주소
                    var boardCoord = coordCalculator(boardAddr);
                    var listCoords = {} // 좌표계산한것 담을 변수
                   
                    for(var i in list){
                        listCoords += coordCalculator(list[i].infoAddress); // 좌표 계산한것 담음
                    }
                    // 주어진 좌표와의 거리를 계산하여 객체에 추가(카카오맵 내부적으로 계산하는 메소드 사용)
                    var distances = listCoords.map(function(coord) {
                        var distance = kakao.maps.geometry.distance(boardCoord, coord);
                        return {
                            coord: coord,
                            distance: distance
                        };
                    });

                    // 거리를 기준으로 정렬
                    distances.sort(function(a, b) {
                    return a.distance - b.distance;
                    });

                    // 정렬완료 후 가까운 1,2순위 기존에 받았던 list에서 값 추출
                    // listCoords의 좌표랑 distances [0],[1]의 좌표값이 같은지 확인 후 같은걸 보여주면 됨
                    for(var i=0; i<listCoords.length; i++){
                        if(listCoords[i]==distances[0].coord || listCoords[i]==distances[1].coord){ 
                            // 값이 같을때만 조건문에 들어오니까 매개변수로 받았던 list의 i번째의 데이터 뿌려주기
                            for(var j=0; j<2; j++){
                                $($(".foodImg")[j]).append(makeTag("img",{"src":"/*여기에 사진파일 경로 넣어주기*/"}))
                                $($(".board-foodTitle")[j]).text(list[i].infoName);
                                $($(".foodAddress")[j]).text(list[i].infoAddress);
                                $($(".food")[j]).append(makeTag("input",{"type":"hidden", "name":"infoNo","value":list[i].infoNo}));
                            }
                        }
                    }
                }
            });
        });
            
        /* 맛집추천게시글 상세정보 모달 */
        $(".food").on("click", function(){ 
            var obj = $(this).children().last().val(); // hidden으로 숨겨놓은 infoNo 추출
            $.ajax({
                url : "foodRecommend.attr",
                data : {
                    infoNo : obj,
                },
                success : function(result){
                    // info테이블에서 조회해서 뿌려주기만 하면 될 듯?
                    // 받은거 뿌려줄때 좋아요 아이콘영역 상위의 마지막인덱스에 boardNo 넣기 
                    // 좋아요 찜 조회하기
                },
                error : function(){
                    console.log("실패");
                },
                complete : function(){
                    console.log("실행만 됨")
                }
            });
            $("#myModal").modal('show');
        });

        /* 댓글 조회 */
        function selectReplyList(){
            var replyDiv = $("#content-pack"); // 댓글 넣을 영역
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
                url : "insertReply.attr",
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
        /* 댓글 삭제 */
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
        
        
        /* 신고 이벤트 */ /* 댓글부분 정리해서 다시 넣고 이벤트 부분에 매개변수 넣어주기 */
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
	        		url : "report.attr",
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

        /* 페이지 이동 이벤트 */
        function pageLoad(num){
            var obj = $(".attracDetail"); 
            var form = makeTag("form", {"method":"get"});
            var boardNo = makeTag("input", {"type":"hidden", "name":"boardNo", "value":"${dataMap.board.boardNo}"}); // 게시물 번호
            var at = makeTag("input", {"type":"hidden", "name":"at", "value":"${dataMap.at})"}); // 파일경로
            switch(num){
                case 1 : form.attr("action", "modify.attr"); break; // 관리자에게 정보수정요청
                case 2 : form.attr("action", "update.attr"); break; // 게시물 수정
                case 3 : form.attr("action", "delete.attr"); break; // 게시물 삭제
            }
            obj.append(form.append(boardNo, at));
            form.submit();
        }
        
        /* 좋아요 찜 여부 조회 */
       function iconCheck(){
        	$.ajax({
        		url : "iconCheck.attr",
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
                url : "iconChange.attr",
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

        /* kakao map api 내 주소 좌표로 바꾸는 부분 호출해 사용하기위해 함수처리 */
        function coordCalculator(address){
            var coord; // return용 변수 선언
            var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성
            // 주소로 좌표 검색
            geocoder.addressSearch(address, function(result, status) {
                if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색 완료
                    coord = new kakao.maps.LatLng(result[0].y, result[0].x);
                }
            });
            return coord;
        }
        
	    /* 사진 슬라이더 */
		const slideIndex = [];
	    // 텍스트 형식으로 넘어오니 객체로 바꿔주기위한 작업
	   	const atTextArr = ("${dataMap.at}").replace(/Attachment/g, '').replace(/\(/g, '{').replace(/\)/g, '}').replace(/=/g, ':')
	   										.replace(/(\w+):/g, '"$1":').replace(/:([^,{}\[\]]+)/g, ':"$1"');
	    // 객체로 바꿔준것을 json화
	   	const at = JSON.parse(atTextArr); 
	    // 슬라이드에 사용할 배열에 파일경로 추출해서 넣어주기
	   	for(var i in at){
	   		slideIndex.push(at[i].filePath);
	   	}
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
	    
        /* 지도 영역 */
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
        var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('${dataMap.info.infoAddress}', function(result, status) {
            if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색 완료

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({ // 결과값으로 받은 위치 마커로 표시
                    map: map,
                    position: coords
                });
                var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우로 장소 설명 표시
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">${dataMap.info.infoName}</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(coords);// 지도의 중심 결과값으로 받은 위치로 이동
            } 
        });    
    </script>
</body>
</html>
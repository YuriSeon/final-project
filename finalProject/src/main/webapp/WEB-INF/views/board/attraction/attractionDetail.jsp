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
<style type="text/css"></style>
<body>
<%@include file="../../common/menubar.jsp" %>
<!-- 맛집 추천 상세정보 출력구문작성, 댓글조회 원래 양식 확인하고 지우기 -->
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
                    <span class="ico"><img src="resources/images/view.png"></span>
                    <span class="num" id="conRead">${dataMap.board.count }</span>
                    <span class="ico">
                        <img class="good" src="resources/images/Like-before.png">
                    </span>
                    <span class="num" id="conLike">${dataMap.board.good }</span>
                    <span class="ico">
                        <img class="choice" src="resources/images/star-before.png">
                    </span>
                    <!-- 스크립트 부분에서 사용하기위해서 숨겨둠 -->
                    <input type="hidden" name="boardNo" value="${dataMap.board.boardNo}"> 
                </div>
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
                            <div class="cont_more">
                                <button type="button" id="btn_more" title="내용더보기">+ 더보기</button>
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
                    <button onclick="insertReply();">작성</button>
                </div>
            </div>
            <div id="content-pack"></div>
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
    
    <%@include file="../../common/footer.jsp" %>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script>
        $(function(){
            /* 페이지로드되면 바로 실행해야 할 부분 */ 
            // 1. 숨길영역 숨기기
            $("#myModal").modal('hide'); 
//             $(".text").hide(); 
            // 2. 댓글 조회
            selectReplyList(); 
            // 3. 좋아요 신고 아이콘 변경
            $(".ico").each(function(){
                iconChange(this);
            });
            // 4. 로그인 확인 후 댓글 비활성화
            if("${empty loginUser}"){
                $("#reply-back").children().siblings().attr("disabled", "true"); // 비활성화 시키기
            	$("#reply-back input").attr("placeholder", "로그인하셔야 댓글작성이 가능합니다.");
            }
            // 5. 장소 상세정보 출력
            var list = ['infoAddress','infoTime','infoHomepage','infoCall','parking','infoType','dayOff']; // 출력할 내용 배열에 담기
            	//key로 꺼내 사용할 수 있도록 객체형식으로 변경
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
            	console.log(infoObj[list[i]]);
            	if(infoObj[list[i]]!="null"){ // 정규표현식으로 ""전부 감싸줬기에 이렇게 비교
            		$("#infoDetail").append($("<tr>").append($("<th>").append(label),$("<td>").append(infoObj[list[i]])));
            	}
            }
            
            /* 상세정보 더보기 버튼 슬라이드 이벤트 */
            $("#btn_more").click(function(){
                $(".text").slideToggle();
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
                url : "replyList.attr",
                data : { boardNo : "${board.boardNo}" },
                success : function(result){
                 /*     <div class="reply">
                            <div class="pro">프로필</div>
                            <div class="con">댓글내용</div>
                            <div class="date"><a id="nicknameHover" onclick="whoareyou();">닉네임</a>/작성일</div>
                            <div class="reply-btn">
                                <span class="ico">
                                    <img class="good" src="resources/images/Like-before.png">
                                </span>
                                <span class="ico">
                                    <img class="choice" src="resources/images/bell-before.png">
                                </span>
                                <input type="text" id="reReply-content" placeholder="댓글을 작성해주세요!">
                                <button onclick="reReplyinsert();"></button>
                                <input type="hidden" id="replyNo" value="">
                            </div>
                            대댓글 영역 조건문 걸기 있을때만 생성
                            <div class="reply re">
                                <div class="pro">프로필</div>
                                <div class="con">댓글내용</div>
                                <div class="date"><a id="nicknameHover" onclick="whoareyou();">닉네임</a>/작성일</div>
                                <span class="ico">
                                    <img class="good" src="resources/images/Like-before.png">
                                </span>
                                <span class="ico">
                                    <img class="choice" src="resources/images/bell-before.png">
                                </span>
                            </div>
                        </div>
                    원래 넣으려고 했던 형태. 추후 코드작성 끝나면 지우기 
                */ 
                    for(var i in result){
                        // 넣을 태그 생성해서 key:value 
                        var r = {
                            reply : makeTag("div",{"class":"reply"}),
                            pro : makeTag("div",{"class":"pro"}).append(makeTag("img",{"src":"/*프로필사진경로*/"})),
                            date : makeTag("div",{"class":"date"}).text("/*댓글 작성일 들어갈 부분*/").append(makeTag("a",{"id":"nicknameHover","onclick":"whoareyou();"}).text("/*닉네임들어갈부분*/")),
                            good : makeTag("span",{"class":"ico"}).append(makeTag("img",{"class":"good","src":"resources/images/Like-before.png"})),
                            choice : makeTag("span",{"class":"ico"}).append(makeTag("img",{"class":"choice","src":"resources/images/star-before.png"})),
                            reReplyinput : makeTag("intup",{"type":"text","id":"reReply-content","placeholder":"댓글을 작성해주세요!"}),
                            reReplyBtn : makeTag("button", {"onclick":"reReplyinsert();"}),
                            replyNo : makeTag("input",{"type":"hidden","class":"replyNo","value":"/*댓글번호넣어주기*/"}),
                            reReplyNo : makeTag("input",{"type":"hidden","class":"reReplyNo","value":"/*댓글번호넣어주기*/"})
                        }
                        var replyBtn = makeTag("div",{"class":"reply-btn"}).append(r.good, r.choice, r.reReplyinput, r.reReplyBtn, r.replyNo);
                        var reply_re = makeTag("div",{"class":"reply re"}).append(r.pro, r.con, r.date, r.good, r.choice,r.reReplyNo);
                        if(result[i].refRno==null){ // 대댓글이 아닌경우
                            $("#content-pack").append(r.reply.append(r.pro, r.con, r.date, replyBtn));
                        } else { // 대댓글인경우
                            $(".replyNo").each(function(){
                                if($(this).val()==result[i].refRno){
                                    $(this).parent().after(reply_re);
                                }
                            });
                        }
                        // 태그 재성성 할 수 있도록 초기화시키기
                        r = null;
                        replyBtn = null;
                        reply_re = null;
                    }
                },
                error : function(){
                    console.log("실패");
                },
                complete : function(){
                    console.log("되기는 함");
                }
            });
        }

        /* 댓글 등록 */
        function insertReply(){
            $.ajax({
                url : "insertReply.attr",
                data : {
                    content : $("#reply-content"),
                    replyWriter : "${loginUser.nickName}",
                    refQno : $("#boardNo")
                },
                success : function(result){
                    if(result>0){
                        alert("댓글 등록 성공");
                        selectReplyList(); // 리스트 추가됐으니 다시 조회
                        $("#reply-content").val() = ""; // 댓글 등록됐으니 비워주기 
                    } else {
                        alert("댓글 등록 실패")
                    }
                },
                error : function(){
                    console.log("등록 실패");
                }
            });
        }

         /* 좋아요 찜 버튼 클릭 이벤트 */
         $(".ico").click(function(){
            iconChange(this);
        });
        
        /* 페이지 이동 이벤트 */
        function pageLoad(num){
            
            var obj = $(".attracDetail"); 
            var form = makeTag("form", {"method":"get"});
            // var boardNo = makeTag("input", {"type":"hidden", "name":"boardNo", "value":"${b.boardNo}"}); // 게시물번호 변수처리
            switch(num){
                case 1 : form.attr("action", "modify.attr"); break; // 관리자에게 정보수정요청
                case 2 : form.attr("action", "update.attr"); break; // 게시물 수정
                case 3 : form.attr("action", "delete.attr"); break; // 게시물 삭제
            }
            obj.append(form/*.append(boardNo)*/);
            form.submit();
        }

        /* 좋아요 신고 아이콘 변경 */
        function iconChange(obj){ // 이벤트 대상 객체 매개변수로 받음
            var btnType = $(obj).children().attr("class");
            var realClass = $(obj).parent().attr("class"); // 아이콘이 들어있는 실제 태그 class명
            var tableName = realClass.split("-")[0]; // 부모 클래스값에서 - 앞까지만 값 추출 
            var no = $(obj).parent().last().val();
            var imgsrc = ($(obj).children().attr("src"));
            $.ajax({
                url : "iconChange.attr",
                data : {
                    btnType : btnType,
                    tableName : tableName,
                    no : no,
                    writer : "${loginUser.nickName}"
                },
                success : function(result){
                    var changeSrc = ""; 
                    if(result!=null){ // 좋아요 신고 찜을 눌렀다
                        if(imgsrc.find("before")!=-1){
                            changeSrc = imgsrc.replace("before","after");
                        }
                    } else {
                        if(imgsrc.find("after")!=-1){
                            changeSrc = imgsrc.replace("after","before");
                        }
                    }
                    $(obj).children().attr("src", changeSrc);
                }
            });
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
	        $("#slideImage").prop("src", slideIndex[index]);
	        currentIndex = slideIndex[index];
	    }
    
	    $("#prev").on("click", function(){
	        slideIndex.some(function(item, index, array){
	            if(index != 0){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", slideIndex[index - 1]);
	                    currentIndex = slideIndex[index - 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", slideIndex[slideIndex.length - 1]);
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
	                    $("#slideImage").prop("src", slideIndex[index + 1]);
	                    currentIndex = slideIndex[index + 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", slideIndex[0]);
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
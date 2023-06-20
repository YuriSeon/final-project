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
    <div class="attracDetail">
        <div id="contents">
            <!-- 상단 -->
            <div class="titleType">
                <h2 id="topTitle">장소이름</h2>
                <div class="area_address" id="topAddr">
                    <span>지역정보</span>
                </div>
                <div class="titTypeWrap">
                    <span>
                        한줄설명내용 영역
                    </span>
                </div>
                <div class="post_area">
                    <span class="ico"><img src="resources/images/Like-before.png"></span>
                    <span class="num" id="conLike">좋아요 수</span>
                    <span class="ico"><img src="resources/images/view.png">
                    <span class="num" id="conRead">조회수 수</span></span>
                    <span class="ico"><img src="resources/images/star.png"></span>
                </div>
            </div>
            <!-- //상단 -->
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
                            <div id="slideArea" onmouseover="opacityIn(this)" onmouseout="opacityOut(this)">
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
                            <div class="inr">
                                강원도 평창 고랭지 청정지역에서 유기농 허브와 유기농 블루베리를 재배하고 있는 대한민국 스타팜 농장입니다. 2009년 8월에 국립농산물품질관리원에서 농장 전체를
                                유기농인증을 받은 농장이다. 평창라벤다팜은 삼면이 산으로 둘러싸여 있어 더욱 청정지역을 유지할 수 있는 환경이며, 고랭지 해발 700m에 위치하여 큰 일교차, 비옥한
                                토양, 일조량 등의 환경에서 자란 유기농허브와 유기농블루베리는 맛이 뛰어나다.2015년부터는 체험장을 오픈하여 더 많은 소비자들과 소통을
                                하기위해 노력하고 있으며,십 수 년간 허브를 연구해 오신 대표님과 원장님이 각 허브와 블루베리에 맞는 천연비료를 직접 조제하셔서 적절한 시기에 주기 때문에 맛과 향이
                                오래간다. 다양한 허브와 블루베리를 이용한 체험프로그램을 진행하고 있고 중.고등학교 진로체험을 위한 프로그램도 진행하고 있다.<br>
                            </div>
                            <div class="cont_more">
                                <button type="button" class="btn_more" title="내용더보기">더보기</button>
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
                        장소 세부 정보 들어가는 영역
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
                    <div class="foodImg"></div>
                    <div class="foodInfo">
                        <div class="foodTitle"></div>
                        <div class="foodAddress"></div>
                    </div>
                </div>
            </div>
            <div class="cont2">
                <div class="food">
                    <div class="foodImg"></div>
                    <div class="foodInfo">
                        <div class="foodTitle"></div>
                        <div class="foodAddress"></div>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div id="reply-area">
            <div id="reply-title">여행톡<span> 1</span></div>
            <div>
                <form action="insert.re" id="reply-form">
                    <div id="reply-back">
                        <input type="text" name="reply-content" placeholder="지금 보고계신 명소에 대해 댓글을 작성해주세요!">
                        <button type="submit">작성</button>
                    </div>
                </form>
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
                                <div class="icon-area">
                                    <span class="ico"><img src="resources/images/Like-before.png"></span>
                                    <span class="ico"><img src="resources/images/star.png"></span>
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
            $("#myModal").modal('hide'); // 페이지로드되면 먼저 모달 숨기기
            
            /* 맛집추천게시글 상세정보 모달 */
            $(".food").on("click", function(){ 
                $("#myModal").modal('show');
            });
            
            /* 페이지 이동 이벤트 */
            function pageLoad(num){
                var obj = $(".attracDetail"); 
                var form = makeTag("form", {"method":"get"});
                // var boardNo = makeTag("input", {"type":"hidden", "name":"boardNo", "value":"${b.boardNo}"}); // 게시물번호 변수처리
                switch(num){
                    case "1" : form.attr("action", "modify.attr"); break; // 관리자에게 정보수정요청
                    case "2" : form.attr("action", "update.attr"); break; // 게시물 수정
                    case "3" : form.attr("action", "delete.attr"); break; // 게시물 삭제
                }
                (obj.append(form)).append(boardNo);
                form.submit();
            }
            
        });
	    /* 사진 슬라이더 */
		const slideIndex = ['ticket.png', '하트.png', 'star.png'];
	    let currentIndex = slideIndex[0];
	    const imagePath = 'resources/images/';
	    const dotPath = 'resources/images/dot.png';
	    $(function(){
	        $("#slideImage").prop("src", imagePath + slideIndex[0]);
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
	    function prev(){
	        slideIndex.some(function(item, index, array){
	            if(index != 0){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index - 1]);
	                    currentIndex = slideIndex[index - 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[slideIndex.length - 1]);
	                    currentIndex = slideIndex[slideIndex.length - 1];
	                    return true;
	                }
	            }
	        });
	    }
	    function next(){
	        slideIndex.some(function(item, index, array){
	            if(index != slideIndex.length - 1){
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[index + 1]);
	                    currentIndex = slideIndex[index + 1];
	                    return true;
	                }
	            }else{
	                if(item == currentIndex){
	                    $("#slideImage").prop("src", imagePath + slideIndex[0]);
	                    currentIndex = slideIndex[0];
	                    return true;
	                }
	            }
	        });
	    }
	    function dotClickEvent(index){
	        $("#slideImage").prop("src", imagePath + slideIndex[index]);
	        currentIndex = slideIndex[index];
	    }

        /* 지도 영역 */
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
        var geocoder = new kakao.maps.services.Geocoder(); // 주소-좌표 변환 객체를 생성
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
            if (status === kakao.maps.services.Status.OK) { // 정상적으로 검색 완료

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({ // 결과값으로 받은 위치 마커로 표시
                    map: map,
                    position: coords
                });
                var infowindow = new kakao.maps.InfoWindow({ // 인포윈도우로 장소 설명 표시
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">+장소이름넣기+</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(coords);// 지도의 중심 결과값으로 받은 위치로 이동
            } 
        });    
    </script>
</body>
</html>
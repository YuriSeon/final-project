<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/schedule.css?after">
<link rel="stylesheet" type="text/css" href="resources/css/map.css?after">
<title>schedule enroll form</title>
<style type="text/css"></style>
</head>
<body>
<!-- 동행구하는거 바로 작성하러갈지 아니면 작성하기 끝난 후에 연결할지 고민, iframe 클릭이벤트 잘되는지 확인하기-->
	<%@ include file="../common/menubar.jsp" %>
	<div class="main-schedule">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>
	<div class="enroll-sc">
		<form action="insert.sc">
	        <div class="content">
	            <h1><center>일정 공유하기</center></h1>
	        </div>
	        <div class="enroll">
	        <div class="timeline">
	            <div class="container left">
	            <div class="content">
	                <input type="text" name="board-title" class="write" style="width: 80%; height: 40px; font-size: 18px; font-weight: 400;" placeholder="일정 이름을 작성해주세요">
	            </div>
	            </div>
	            <div class="container right">
	                <div class="content">
	                    <p>여행 스타일(중복가능)</p>
	                    <div id="sort">
	                        <input type="checkbox" name="concept" value="액티비티" id="액티비티"><label for="액티비티">액티비티</label>
	                        <input type="checkbox" name="concept" value="힐링" id="힐링"><label for="힐링">힐링</label>
	                        <input type="checkbox" name="concept" value="인생샷" id="인생샷"><label for="인생샷">인생샷</label><br>
	                        <input type="checkbox" name="concept" value="바다" id="바다"><label for="바다">바다</label>
	                        <input type="checkbox" name="concept" value="산" id="산"><label for="산">산</label>
	                        <input type="checkbox" name="concept" value="반려동물" id="반려동물"><label for="반려동물">반려동물</label><br>
	                        <input type="checkbox" name="concept" value="역사" id="역사"><label for="역사">역사</label>
	                        <input type="checkbox" name="concept" value="체험" id="체험"><label for="체험">체험</label>
	                        <input type="checkbox" name="concept" value="음식" id="음식"><label for="음식">음식</label>
	                        <input type="checkbox" name="concept" value="쇼핑" id="쇼핑"><label for="쇼핑">쇼핑</label>
	                    </div>
	                </div>
	            </div>
	            <div class="container left">
	            <div class="content">
	                <p>동행을 구하시겠습니까?</p>
	                <input type="checkbox" name="together-check" id="together-yes"><label for="together-yes">예</label> &nbsp;
	                <input type="checkbox" name="together-check" id="together-no"><label for="together-no">아니오</label> <br>
	                <c:if test="$('#together-yes').is('checked')">
	                    <button type="button" onclick="">바로 작성하러 가기</button> 
	                </c:if>
	            </div>
	            </div>
	            <div class="container right">
	                <div class="content">
	                    <label for="start-date" class="date">시작일 </label> <input type="date" name="start-date" id="start-date" onchange="total();"><br>
	                    <label for="end-date" class="date">마지막일</label> <input type="date" name="end-date" id="end-date" onchange="total();">
	                </div>
	            </div>
	        </div>
	        </div>
	        <div class="block"></div>
	        <div class="enroll" id="plan-area"></div>
	        <div class="btn-area">
	            <button type="button" onclick="history.back();">돌아가기</button>
	            <button type="submit">작성완료</button>
	        </div>
        </form>
    </div>
    <div class="modal">
        <div id="title">
            여행지 검색
            <button id="close">X</button>
        </div>
        <div id="map">
        	<div class="map_wrap">
				<div id="map" style="width:100%;height:382.5px;position:relative;overflow:hidden;z-index:4;"></div>
				<div id="menu_wrap" class="bg_white" style="z-index:5;">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
        </div>
    </div>
    
    <!-- 작성해둔 함수 넣은 파일 불러와서 사용 -->
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
    <script>
        // 달력에 날짜 체크시 일정추가하는 영역 생기는 함수
        function total(){
            var plan = $("#plan-area *").remove(); // 함수 재실행시 기존 생성된 영역 지워주기
                plan = $("#plan-area"); // 일정 넣을 영역 변수처리
            var totalDate =(new Date($("#end-date").val()) - new Date($("#start-date").val()))/86400000; 
            /* date로 변환 후 millisecond단위로 나오기 때문에 나누기 해야 일 수 나옴 */
            
            if(totalDate!=0 && !isNaN(totalDate)){// 당일여행아니면 일정 영역 양쪽으로 나누는 태그 추가
                plan = plan.append(makeTag("div","class", "timeline line"));
            }
            for(var i=0; i<=totalDate; i++){
                if(totalDate==0){ // 당일여행
                    plan.append(makeTag("div", "id","center").append((makeTag("div","class","content plan").append(makeTag("span","class", "date").text("당일여행 계획")))));
                } else if(i%2==0){ //0과 짝수날
                    plan.children().append(makeTag("div", "class", "container left").append(makeTag("div","class","content plan")));
                } else { // 홀수날
                	plan.children().append(makeTag("div", "class", "container right").append(makeTag("div","class","content plan")));
                }
                if(i==totalDate){ // 전체 반복문 마지막에만 생성된 영역에 아이콘 추가되도록 조건문 후 반복실행해 아이콘 넣음
                    for(var j=0; j<=totalDate;j++){
                        $(".plan").eq(j).append(makeTag("img","src", "resources/images/+.png","class","plus plus"+(j+1))).append(makeTag("label","for","plus","class","plus plus"+(j+1)).text("일정추가"));
                        if(j != totalDate){ // 마지막날엔 숙박 추가 아이콘 안생기도록 조건처리
                            $(".plan").eq(j).append(makeTag("img", "src", "resources/images/+-pink.png", "class"," plus plus"+(j+1))).append(makeTag("label","for","plus","class","plus plus"+(j+1)).text("숙박추가"));
                        }
                    }
                }
            }
        }

        // 일정과 숙박 추가 아이콘 클릭시 지도생성, 여행지 검색 후 일정 추가하는 이벤트
        $(function(){
            $(".modal").hide(); // 클릭전까지 모달 숨기기
            $(document).on("click",".plus", function(){
                var daily = $(this).attr("class").slice(-1); // 클릭이벤트 대상의 class name 마지막 번호 추출(N일차)
                
                // 모달 생성 후 지도 띄워주기
                $(document).ready(function(){
                    $(".modal").css("display", "block");
                    window.setTimeout(function() {
                    	relayout();
                    }, 0); 
                });

                // 검색목록 리스트 클릭시
                $("#placesList").on("click","li", function(){
                    // 이벤트 대상 객체 매개변수로 넘겨줘서 검색하려는 대상 조회
                    var infoName = infoFind(this, "div", 0); 
                    var infoAddress = infoFind(this, "div", 1);
                    $(".modal").css("display","none"); // 선택시 모달 닫기
                    // 지도에서 가져온 장소이름, 주소 태그생성해서 각 일정영역에 맞춰서 추가 
                    var name = makeTag("pre","name", "infoName").text(infoName);
                    var address = makeTag("pre","name","infoAddress").text(infoAddress);
                    var input = makeTag("input", "type","text", "name","pay");
                    try{Number(daily); // daily가 숫자일때
                    	// 여기 수정하기 여러개 나오는것만!
                    	var obj = $($(".plus"+daily)[3]);
                    	obj.append(makeTag("div", "name", daily).append(name,address,input));
                    }catch(e){ // daily가 숫자가 아닐때(당일일정)
                    	var addObj =$($(".plus0")[1])
                    	addObj.append(makeTag("div", "name", "1").append(name,address,input));
                    }
                 });
            });
        });
   
	    // 모달창 닫아주는 함수 
	    $(document).on("click", "#close", function() {
	       $(".modal").css("display","none");
	    });
	    
	    /* 지도 */
	   var markers = []; // 마커를 담을 배열입니다
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({ zIndex : 5 });
		// 키워드로 장소를 검색합니다
		searchPlaces();
		
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			var keyword = document.getElementById('keyword').value;
			if (!keyword.replace(/^\s+|\s+$/g, '')) {
				alert('키워드를 입력해주세요!');
				return false;
			}
			// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
			ps.keywordSearch(keyword, placesSearchCB);
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}

		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'), 
				menuEl = document.getElementById('menu_wrap'), 
				fragment = document.createDocumentFragment(), 
				bounds = new kakao.maps.LatLngBounds(), 
				listStr = '';
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,places[i].x), 
					marker = addMarker(placePosition, i), 
					itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',function() {
						displayInfowindow(marker, title);
					});
					kakao.maps.event.addListener(marker, 'mouseout',function() {
						infowindow.close();
					});
					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};
					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);
				fragment.appendChild(itemEl);
			}
			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
		}

		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
			var el = document.createElement('li'),
				itemStr = '<span class="markerbg marker_'+ (index + 1)+ '"></span>'
						+ '<div class="info">'
						+ '   <h5>' + places.place_name + '</h5>';
			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}
			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';
			el.innerHTML = itemStr;
			el.className = 'item';
			return el;
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, 
			markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions), 
			marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;
			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}
			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;
				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}
				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}

		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:5;">' + title + '</div>';
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}

		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
    </script>
</body>
</html>
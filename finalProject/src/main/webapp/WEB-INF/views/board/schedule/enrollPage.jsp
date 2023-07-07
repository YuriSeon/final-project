<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/schedule.css?after">
<link rel="stylesheet" type="text/css" href="resources/css/listMap.css?v=1">
<title>schedule enroll form</title>
<style type="text/css">
	.logo{
		background-color: light-gray;
		text-decoration: none;
		width : 100%;
		height : 40px;
		margin :0;
		padding :0;
	}
	#t {
		font-size : 30px;
		font-weight: 600;
		color: gray;
	}
</style>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
    <img alt="" src="resources/images/mm.png" style="width:100%">
	<div class="enroll-sc" >
		<form action="insert.sc" method="post" id="insertForm">
	        <div>
	            <h1><center>일정 공유하기</center></h1>
	        </div>
	        <div class="enroll">
	        <div class="timeline">
	            <div class="container left">
	            <div class="content">
	            	<p>제목</p>
	                <input type="text" name="boardTitle" class="write" style="width: 80%; height: 40px; font-size: 18px; font-weight: 400;" placeholder="일정 이름을 작성해주세요" required>
	            </div>
	            </div>
	            <div class="container right">
	            	<div class="content">
		                <p>어떤 일정인가요?</p>
		                <textarea name="boardContent" placeholder="일정에 대해 설명해주세요" required></textarea>
		            </div>
	            </div>
	            <div class="container left">
	           		<div class="content">
	                    <p>여행 스타일(중복가능)</p>
	                    <div id="sort">
	                        <input type="checkbox" name="style" value="액티비티" id="액티비티"><label for="액티비티">액티비티</label>
	                        <input type="checkbox" name="style" value="힐링" id="힐링"><label for="힐링">힐링</label>
	                        <input type="checkbox" name="style" value="인생샷" id="인생샷"><label for="인생샷">인생샷</label><br>
	                        <input type="checkbox" name="style" value="바다" id="바다"><label for="바다">바다</label>
	                        <input type="checkbox" name="style" value="산" id="산"><label for="산">산</label>
	                        <input type="checkbox" name="style" value="반려동물" id="반려동물"><label for="반려동물">반려동물</label><br>
	                        <input type="checkbox" name="style" value="역사" id="역사"><label for="역사">역사</label>
	                        <input type="checkbox" name="style" value="체험" id="체험"><label for="체험">체험</label>
	                        <input type="checkbox" name="style" value="음식" id="음식"><label for="음식">음식</label>
	                        <input type="checkbox" name="style" value="쇼핑" id="쇼핑"><label for="쇼핑">쇼핑</label>
	                    </div>
	                </div>
	            </div>
	            <div class="container right">
	                <div class="content">
	                	<p>현재 일정의 예상 인원수?</p>
						<select id="count">
							<option value="1" selected>1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
	                </div>
	            </div>
	            <div class="container left">
		            <div class="content">
		                <p>이동수단</p>
		                <div id="trans">
			                <input type="radio" name="transport" id="none" value="0" checked><label for="none">미정</label>
			                <input type="radio" name="transport" id="trans" value="1"><label for="trans">대중교통</label>
			                <input type="radio" name="transport" id="car" value="2"><label for="car">자가용</label>
		                </div>
		            </div>
	            </div>
	            <div class="container right">
	                <div class="content">
	                	<p>여행 기간</p>
	                    <label for="start-date" class="date">시작일 </label> <input type="date" name="startDate" id="start-date" onchange="total();" required><br>
	                    <label for="end-date" class="date">마지막일</label> <input type="date" name="endDate" id="end-date" onchange="total();" required>
	                </div>
	            </div>
	        </div>
	        </div>
	        <div class="block"></div>
	        <div class="enroll" id="plan-area"></div>
	        <input type="hidden" name="totalDate">
			<input type="hidden" name="totalPay">
			<input type="hidden" name="writer" value="${loginUser.nickname }">
	        <div class="btn-area">
	            <button type="button" onclick="history.back();">돌아가기</button>
	            <button type="button" onclick="insertForm();">작성완료</button>
	        </div>
		</form>
	    <div id="modal">
	        <div id="title">
	            여행지 검색
	            <button id="close">X</button>
	        </div>
	        <div class="map">
	        	<div class="map_wrap">
					<div id="map" style="width:100%;height:382.5px;position:relative;overflow:hidden;z-index:4;"></div>
					<div id="menu_wrap" class="bg_white" style="z-index:5;">
				        <div class="option">
				            <div>
				                <form onsubmit="searchPlaces(); return false;">
				                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
				                    <button type="submit" id="map-btn">검색하기</button> 
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
    </div>
    
    <!-- 작성해둔 함수 넣은 파일 불러와서 사용 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
    <script type="text/javascript" src="resources/js/function.js"></script>
    <script type="text/javascript" src="resources/js/listmap.js?after"></script> 
    <script>
        // 달력에 날짜 체크시 일정추가하는 영역 생기는 함수
        function total(){
            var plan = $("#plan-area *").remove(); // 함수 재실행시 기존 생성된 영역 지워주기
                plan = $("#plan-area"); // 일정 넣을 영역 변수처리
            var totalDate =(new Date($("#end-date").val()) - new Date($("#start-date").val()))/86400000;
            /* date로 변환 후 millisecond단위로 나오기 때문에 나누기 해야 일 수 나옴 */
            $("input[name=totalDate]").prop("value", totalDate+1); // 계산한 여행일정 input에 담아주기
            
            if(totalDate!=0 && !isNaN(totalDate)){// 당일여행아니면 일정 영역 양쪽으로 나누는 태그 추가
                plan = plan.append(makeTag("div",{"class": "timeline line"}));
            }
            for(var i=0; i<=totalDate; i++){
                if(totalDate==0){ // 당일여행
                    plan.append(makeTag("div", {"id":"center"}).append((makeTag("div",{"class":"content plan"}).append(makeTag("span",{"class":"date"}).text("당일여행 계획")))));
                } else if(i%2==0){ //0과 짝수날
                    plan.children().append(makeTag("div", {"class":"container left"}).append(makeTag("div",{"class":"content plan"})));
                } else { // 홀수날
                	plan.children().append(makeTag("div", {"class":"container right"}).append(makeTag("div",{"class":"content plan"})));
                }
                if(i==totalDate){ // 전체 반복문 마지막에만 생성된 영역에 아이콘 추가되도록 조건문 후 반복실행해 아이콘 넣음
                    for(var j=0; j<=totalDate;j++){
                        $(".plan").eq(j).append(makeTag("img",{"src": "resources/images/+.png","class":"plus plus"+(j+1)})).append(makeTag("label",{"for":"plus","class":"plus plus"+(j+1)}).text("일정추가"));
                        if(j != totalDate){ // 마지막날엔 숙박 추가 아이콘 안생기도록 조건처리
                            $(".plan").eq(j).append(makeTag("img", {"src": "resources/images/+-pink.png", "class":" plus plus"+(j+1)})).append(makeTag("label",{"for":"plus","class":"plus plus"+(j+1)}).text("숙박추가"));
                        }
                    }
                }
            }
        }

        // 일정과 숙박 추가 아이콘 클릭시 지도생성, 여행지 검색 후 일정 추가하는 이벤트
        $(function(){
            $("#modal").css("display","none"); // 클릭전까지 모달 숨기기
            $(document).on("click",".plus", function(){
            	var sort = $(this).text();
               	var daily = $(this).attr("class").slice(-1); // 클릭이벤트 대상의 class name 마지막 번호 추출(N일차)
                // 모달 생성 후 지도 띄워주기
                $(document).ready(function(){
                	if(sort=='일정추가'){
                		$("#keyword").attr("value","여행추천");
                	} else {
                		$("#keyword").attr("value","숙박");
                	}
                    $("#modal").css("display", "block");
                    window.setTimeout(function() {
                    	relayout();
                    }, 0); 
                });

                // 검색목록 리스트 클릭시
                $("#placesList").on("click","li", function(){
                    // 이벤트 대상 객체 매개변수로 넘겨줘서 검색하려는 대상 조회
                    var infoName = infoFind(this, "div", 0); 
                    var infoAddress = infoFind(this, "div", 1);
                    // 지도에서 가져온 장소이름, 주소 태그생성해서 각 일정영역에 맞춰서 추가 
                    if(Number(daily)){ // daily가 숫자일때
                    	var obj = "";
                    	obj = $($(".plus"+daily).parent());
                    	obj.append(makeTag("div", {"name": daily,"class":"day"})
                    			.append(makeTag("button",{"type":"button", "class":"path-delete"}).text("X")
                    					,makeTag("pre",{"name": "infoName"}).text(infoName)
                    					,makeTag("pre",{"name":"infoAddress"}).text(infoAddress)
                    					,makeTag("input", {"type":"number","name":"pay","placeholder":"예상비용을 입력해주세요"})));
                    } else if(daily=='e'){ /* daily가 숫자가 아닐때(당일일정) */
                    	var addObj ="";
                    	addObj = $(".plan");
                    	addObj.append(makeTag("div", {"name": "1","class":"day"})
                    			.append(makeTag("pre",{"name": "infoName"}).text(infoName)
                    					,makeTag("pre",{"name":"infoAddress"}).text(infoAddress)
                    					,makeTag("input",{"type":"number","name":"pay","placeholder":"예상비용을 입력해주세요"})));
                    }
                    daily = ""; // 추가하고 나면 변수 비워줘야 다시 호출되었을때 누적이 안됨
                    $("#modal").css("display","none"); // 선택시 모달 닫기
                    $("#keyword").attr("value"," ");// 인풋창 비워주기
                 });
            });
        });
   
	    // 모달창 닫아주는 함수 
	    $(document).on("click", "#close", function() {
	       $("#modal").css("display","none");
	    });
	    
	    // 선택한 일정영역 삭제하는 이벤트
	    $(document).on("click",".path-delete", function(){
	    	console.log($(this));
	    	$(this).siblings().remove(); // 동위요소들 삭제
	    	$(this).unwrap(); // 선택된 이벤트 대상의 부모요소 삭제
	    	$(this).remove(); // 버튼까지 삭제
	    });
	    
	    // 제출하기 이벤트
	   	function insertForm(){
	    	var totalPay = Number(0); // 계산한 값 담을 변수 및 number type으로 초기화
	    	var pay = $("input[name=pay]");
	    	var formTag = $("#insertForm");
	    	for(var i = 0; i < pay.length; i++) { 
	    		totalPay += Number($(pay[i]).val());
	    	}
	    	$("input[name=totalPay]").prop("value",totalPay); // 반복문으로 계산한 값 넣어줌
	    	
	    	var	day = $(".day"); // path정보 들어있는 div 선택
	    	// 반복문으로 일차별 정보 담기
	    	for(var i=0; i<day.length; i++){
			    var path = makeTag("input", {"type":"hidden", "name":"path"});
	    		// pathVO(infoName, daily, pathNo, infoAddress, pay) 순서로 담음
	    		if($(day[i]).attr("name")!=null){
			    	path.prop("value",($($(day[i]).children()).eq(1).text()
				    					+","+$(day[i]).attr("name")
				    					+","+i
				    					+","+$($(day[i]).children()).eq(2).text()
				    					+","+$($(day[i]).children()).eq(3).val()));
// 	    		} else {
// 	    			path.prop("value", $($(day[i]).children()).eq(1).text()
// 	    								+","+1
// 	    								+","+$(day[i]).attr("name")
// 	    								+","+
	    		}
	    		console.log(path);
		    	// 담은 정보 폼태그에 넣어주기
		    	formTag.append(path);
		    	path = "";
	    	}
			// 컨셉 구분자로 구분해서 넣기위한 작업해서 넘기기
			var concepts = "";
			$("input[name=style]:checked").each(function(){
				concepts += $(this).val()+'/';
			});
			// 맨 뒤 구분자 하나 제거 후 input value에 담아서 폼태그에 넣기
			var concept = makeTag("input",{"type":"hidden","name":"concept","value":concepts.slice(0,-1)}); 
			formTag.append(concept);
			// 동행 구하는지 confirm 받아서 컬럼명에 맞게 태그 생성
			var count = $("#count option:selected").val();
			var together = makeTag("input", {"name":"together"});
			var togetherCount = makeTag("input", {"name":"togetherCount"});
			if(confirm('작성을 완료하셨습니까?')){
			var withConfirm= confirm('동행을 구하시겠습니까? 확인을 누르시면 작성 후 함께가치 작성 페이지로 넘어갑니다');
				if(confirm){
					formTag.append(together.attr("value", count), togetherCount.attr("value",0));
				} else {
					formTag.append(together.attr("value", 0), togetherCount.attr("value",count));
				}
			}
	    	formTag.submit(); // 제출
	    }	
	 	
		
    </script>
</body>
</html>
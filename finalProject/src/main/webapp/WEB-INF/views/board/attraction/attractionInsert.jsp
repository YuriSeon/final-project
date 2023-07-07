<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/listMap.css?after">
<link rel="stylesheet" href="resources/css/attraction.css?after">
<title>Insert title here</title>
</head>
<style type="text/css">
	#upfile{
		height: 28px;
	}
</style>
<body>
    <%@include file="../../common/menubar.jsp" %>
    <div class="attrInsert">
        <div class="title-area">
            <div class="float">
                <h2>관광정보 신규 등록</h2> 
                <img src="resources/images/attr3.png">
                <img src="resources/images/attr2.png">
                <img src="resources/images/attr1.png">
            </div>
            <pre> 아래에 검색하여 정보를 먼저 가져온 뒤 비어있는 입력사항을 채워넣어주세요 <br><mark>!! 정보를 검색해오는데 시간이 걸리니까 지도 클릭 후 조금만 기다려주세요 !!</mark></pre>
        </div>
        <div class="serach-area">
            <input type="search" name="title" id="search-input" placeholder="등록을 원하는 관광지를 입력해주세요">
            <button onclick="mapSearch();">검색</button>
        </div>
        <hr>
        <form action="insert.attr" method="post" id="insert-form" enctype="multipart/form-data" onsubmit="submitForm();">
        	<input type="hidden" name="boardWriter" value="${loginUser.nickname }">
            <table>
                <thead>
                    <tr>
                        <th colspan="4"> ※ 관광지 내용 입력란 </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>관광지명</th>
                        <td colspan="3"><input type="text" name="infoName" id="infoName" placeholder="장소 이름을 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>핵심 소개 문구</th>
                        <td colspan="3"><input type="text" id="boardContent1" placeholder="30자까지만 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>상세 설명 문구</th>
                        <td colspan="3" id="boardContent2"><textarea name="boardContent" id="boardContent" placeholder="게시글에 넣을 세부 내용을 작성해주세요 "></textarea></td>
                    </tr>
                    <tr>
                        <th>주소 (도로명 주소)</th>
                        <td colspan="3"><input type="text" name="infoAddress" id="infoAddress" placeholder="도로명 주소로 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>홈페이지 주소</th>
                        <td colspan="3"><input type="text" name="infoHomepage" id="infoHomepage" placeholder="홈페이지 주소 또는 SNS 주소를 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>이용시간</th>
                        <td colspan="3"><input type="text" name="infoTime" id="infoTime" placeholder="이용가능한 시간을 확인해서 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>휴무일</th>
                        <td><input type="text" name="dayOff" id="dayOff" placeholder="휴무일을 작성해주세요"></td>
                        <th>대표 번호 (고객문의용)</th>
                        <td><input type="text" name="infoCall" id="infoCall" placeholder="'-'포함해서 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>주차장 여부</th>
                        <td><input type="text" name="parking" id="parking" placeholder="주차장 여부(Y/N)를 작성해주세요"></td>
                        <th>장소의 분류</th>
                        <td><input type="number" name="infoType" id="infoType" placeholder="장소종류(1.여행, 2.맛집, 3.기타) - 숫자로 작성해주세요"></td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td id="img-area" colspan="3">
                        <input type="file" name="fileUpload" id="upfile"> <!-- 여기 수정하거나 빼거나 하면 됨 -->
	                        <div id="wrapSlide">
		                        <div id="float">
		                            <div class="float-img">
		                                <img src="resources/images/left.png" id="prev" >
		                            </div>
		                            <div id="slideArea">
		                                <img id="slideImage" name="upfile"/>
		                            </div>
		                            <div class="float-img">
		                                <img src="resources/images/right.png" id="next" >
		                            </div>
		                        </div>
		                        <div id="dotArea"></div>
		                    </div>
                        </td>
                    </tr>
                    <tr>
                        <th>대표이미지 번호</th>
                        <td colspan="3"><input type="number" name="mainImg" placeholder="대표이미지로 설정할 이미지의 번호를 써주세요"></td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button onclick="history.back();">목록으로</button>
                <button type="submit">등록하기</button>
            </div>
        </form>
    </div>
        <div class="modal fade" id="myMap">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">관광지 등록 검색</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modalBody">
                        <div class="map_wrap">
                            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                            <div id="menu_wrap" class="bg_white">
                                <div class="option">
                                    <div>
                                        <form id="map-submit" onsubmit="searchPlaces(); return false;">
                                            키워드 : <input type="text" id="keyword" size="15"> 
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
            </div>
        </div>
    <%@include file="../../common/footer.jsp" %>
    <script type="text/javascript" src="resources/js/function.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
    <script type="text/javascript" src="resources/js/listmap.js"></script>  
        <script>
	    	// 사진 슬라이더 사용 위해서 먼저 변수 지정
	       	var slideIndex = [];
	    	$("hr").css("display", "none");
            $("#insert-form").css("display", "none");
        
            /* 지도로 검색어 넘기는 이벤트 */
            function mapSearch(){
                $("#keyword").prop("value", $('#search-input').val());
                $("#map-submit").submit();
                $("#myMap").modal('show');
                window.setTimeout(function() {
                    relayout();
                }, 0); 
            }
            /* 지도에서 리스트 클릭시 */
            $("#placesList").on("click", "li", function(){
                // 이벤트 대상 객체 매개변수로 넘겨줘서 검색하려는 대상 조회
                var infoName = infoFind(this, "div", 0); 
                var infoAddress = infoFind(this, "div", 1);
                $(".close").click();
                // 가져온 값으로 셀레니움으로 조회 후 값 넣어주기 
                $.ajax({
                    url : "searchInfo.attr",
                    data : {
                        infoName : infoName,
                        infoAddress : infoAddress
                    },
                   	method: "POST",
                    success : function(result){
                        if(result.boardContent=='오류'){ // 셀레니움 정보 조회 오류시 ck 위해 값 넣어둠
                        	alert("오류로 정보를 가져오지 못했습니다 직접 작성해서 게시물을 작성해주세요");
                        } else if(result != null) {
                        	var boardContent = result.boardContent.split("~~~~"); // img src와 boardContent분리
                        	var img = boardContent[0].split("~~~"); // img src배열
                            $("#infoName").prop("value",result.infoName);
                            $("#boardContent").prop("value",boardContent[1]);
                            $("#infoAddress").prop("value", result.infoAddress);
                            $("#infoHomepage").prop("value", result.infoHomepage);
                            $("#infoTime").prop("value", result.infoTime);
                            $("#dayOff").prop("value", result.dayOff);
                            $("#infoCall").prop("value",result.infoCall);
                            $("#parking").prop("value",result.parking);
                            for(var i in img){
                            	slideIndex.push(img[i]);
                            }
                            /* 사진 슬라이더로 보여주기 */
                            let currentIndex = slideIndex[0];
            	    	    const dotPath = 'resources/images/dot.png';
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
                        } else {
                        	alert("이미 등록된 정보가 있습니다.");
                        	return; // 아래 표를 보여줄필요가 없기에 리턴
                        }
                        $("hr").css("display", "block");
                        $("#insert-form").css("display", "block");
                    }
                });
            });
		        
	        	/* 사진 슬라이더 */
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
    	    
    	 	/* 게시물 등록전 할 작업 */ 
            function submitForm(){ 
	            // 사진 경로가 웹주소라면 이미지 url 컨트롤러로 넘겨주기
            	var imageURL = slideIndex;
				for(var i in imageURL){
	            	if(imageURL[i].includes("https:")){ 
	            		var hidden = makeTag("input",{"type":"hidden","name":"imageURL","value":imageURL[i]});
		            	$("#insert-form").append(hidden);
	            	}
				}
				// boardConten에 소개문구 더해넣어주기(상세설명||소개문구)
				var boardContent = $("#boardContent2").text()+'~~~~'+$("boardContent1").val();
				$("#boardContent2").attr("value", boardContent);
            }
        </script>
    </body>
</html>
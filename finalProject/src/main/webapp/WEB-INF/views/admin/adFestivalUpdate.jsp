<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글관리-축제</title>
<!-- 제이쿼리 cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- 우편번호 검색 서비스 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도띄우기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=944eea4bf318a38d2df62b60e838db52&libraries=services"></script>
	<style>
		.fes_wrap{
            background-color: rgb(239, 239, 239);
            width: 900px;
            border-radius: 50px;
            min-height: 1150px;
            padding-top: 50px;
			margin-top: 70px;
			margin-left: auto;
			margin-right: auto;
			box-shadow: 0px 0px 5px 5px rgb(199, 199, 199);            
        }
        .fes_title{
            width: 900px;
            height: 50px;
            background-color: rgb(3, 78, 141);
            text-align: center;      
            font-size: 25px;
            font-weight: 500;
            display: flex;
            align-items: center; /* 수직 가운데 정렬 */
            justify-content: center; /* 수평 가운데 정렬 */
            color: white;
        }
        .fes_input{
            padding: 10px;
            color: rgb(92, 92, 92);
            margin-left: 25px;
        }
        .fes_text select{
            height: 25px;
            width: 300px;
        }
        .fes_text input{
            height: 20px;
            width: 293px;
            margin-left: 25px;
        }
        /* 전화번호에 화살표 없애기 */
        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none; /* Chrome, Safari, Edge 등에서 화살표를 숨김 */
            appearance: none; /* Firefox에서 화살표를 숨김 */
            margin: 0; /* 기본 마진 제거 */
        }
        .fes_input img{
            width: 170px;
            height: 150px;
        }
        #fes_btn button{
            width: 70px;
            height: 30px;
            position: relative;
            left: 330px;
        }
        #map{
            width: 370px;
            height: 250px;
            border: 1px solid black;
            margin-top: 20px;
            margin-left: 118px;
        }
        #titleImg, #contentImg1, #contentImg2, #contentImg3, #contentImg4{
        	background-color: white;
        }
</style>
</head>
<body>
	<%@include file="../admin/adMenubar.jsp" %>
	<form action="festivalUpdate.ad" method="post" enctype="multipart/form-data" class="festival-form">
        <div class="fes_wrap" >
            <div class="fes_title">축제 등록</div>
            <div class="fes_text">
                <div class="fes_input" style="margin-top: 10px;">
                    <label for="fesCategory">카테고리</label>
                    <select name="fesCategory" id="fesCategory" style="margin-left: 47px;">
                    	<option value="0">카테고리</option>
                    	<c:choose>
                    		<c:when test="${f.fesCategory eq 1}"><option value="1" selected>공연</option></c:when>
                    		<c:otherwise><option value="1">공연</option></c:otherwise>
                    	</c:choose>
                        <c:choose>
                    		<c:when test="${f.fesCategory eq 2}"><option value="1" selected>문화관광</option></c:when>
                    		<c:otherwise><option value="2">문화관광</option></c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    		<c:when test="${f.fesCategory eq 3}"><option value="3" selected>자연</option></c:when>
                    		<c:otherwise><option value="3">자연</option></c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    		<c:when test="${f.fesCategory eq 4}"><option value="4" selected>환경</option></c:when>
                    		<c:otherwise><option value="4">환경</option></c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    		<c:when test="${f.fesCategory eq 5}"><option value="5" selected>꽃</option></c:when>
                    		<c:otherwise><option value="5">꽃</option></c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    		<c:when test="${f.fesCategory eq 6}"><option value="6" selected>가족과함께</option></c:when>
                    		<c:otherwise><option value="6">가족과함께</option></c:otherwise>
                    	</c:choose>
                    </select>
                </div>
                <div class="fes_input">
                    <label for="boardTitle">축제이름</label>
                    <input type="text" name="boardTitle" id="boardTitle" style="margin-left: 47px;" required value="${b.boardTitle}">
                </div>
                <div class="fes_input">
                    <label for="boardContent" style="position: relative; top: -140px;">축제 설명</label>
                    <textarea name="boardContent" id="boardContent" cols="40" rows="10" style="margin-left: 41px; resize: none;" required>${b.boardContent}</textarea>
                </div>
                <div class="fes_input">
                    <label for="startDate">축제 시작일</label>
                    <input type="text" id="startDate" name="startDate" placeholder="ex)2023-02-02" required value="${f.startDate}">
                </div>
                <div class="fes_input">
                    <label for="endDate">축제 종료일</label>
                    <input type="text" id="endDate" name="endDate" placeholder="ex)2023-02-02" required value="${f.endDate}">
                </div>
                <div class="fes_input">
                    <label for="infoCall">전화번호</label>
                    <input type="text" name="infoCall" id="infoCall" style="margin-left: 47px;" value="${i.infoCall}">
                </div>
                <div class="fes_input">
                    <label for="infoHomepage">홈페이지</label>
                    <input type="text" id="infoHomepage" name="infoHomepage" style="margin-left: 47px;" value="${i.infoHomepage}">
                </div>
                <div class="fes_input">
                    <label for="infoType">이용시간</label>
                    <input type="text" id="infoTime" name="infoTime" style="margin-left: 47px;" value="${i.infoTime}">
                </div>
                <div class="fes_input">
                    <label for="fesMoney">이용요금</label>
                    <input type="text" id="fesMoney" name="fesMoney" style="margin-left: 47px;" value="${f.fesMoney}">
                </div>
                <div class="fes_input">
                    <label for="address">주소</label>
                    <input type="text" id="address" onclick="postcode();" style="margin-left: 79px;" value="${i.infoAddress}">
                    <button type="button" onclick="postcode();" style="height: 25px;">주소검색</button>
                    <button type="button" onclick="postReset();" style="height: 25px;">취소</button>
                    <div id="map"></div>
                    <input type="hidden" name="zoneNo" id="zone_no" value="${i.zoneNo}">
                    <input type="hidden" name="infoAddress" id="infoAddress" value="${i.infoAddress}">
                </div>
                <div class="fes_input">
                    <label for="" class="photo-label">사진 등록</label><br>
                    <label for="" style="margin-right: 28px;">대표 이미지</label>
                    <img id="titleImg">
                </div>
                <div class="fes_input">
                    <label for="" style="margin-right: 28px;">상세 이미지</label>
                    <img id="contentImg1">
                    <img id="contentImg2">
                    <img id="contentImg3">
                    <img id="contentImg4">
                </div>
                
				<!-- 파일 첨부 영역 -->
                <div id="file_area">
                    <input type="file" name="upfile" id="file1" onchange="LoadImg(this,1);">
                    <input type="file" name="upfile" id="file2" onchange="LoadImg(this,2);">
                    <input type="file" name="upfile" id="file3" onchange="LoadImg(this,3);">
                    <input type="file" name="upfile" id="file4" onchange="LoadImg(this,4);">
                    <input type="file" name="upfile" id="file5" onchange="LoadImg(this,5);">
                   	<input type="text" name="boardNo" value="${b.boardNo}">
                   	<c:forEach var="alist" items="${a}">
                   		<input type="text" class="fileNo" value="${alist.fileNo}">	
                   		<input type="text" class="filePath" value="${alist.filePath}">	
                   	</c:forEach>
                </div>
            </div>
            <div class="fes_input" id="fes_btn" style="margin-bottom: 60px; ">
                <button type="button" onclick="updateSubmit();">수정</button>
                <button type="reset">초기화</button>
                <button type="button" onclick="history.back()">취소</button>
            </div>
        </div>
    </form>

    <script>
        $(function(){
            $("#file_area").hide(); //파일 첨부 영역은 숨기기
            $("#titleImg").click(function(){
                $("#file1").click();
            });
            $("#contentImg1").click(function(){
                $("#file2").click();
            });
            $("#contentImg2").click(function(){
                $("#file3").click();
            });
            $("#contentImg3").click(function(){
                $("#file4").click();
            });
            $("#contentImg4").click(function(){
                $("#file5").click();
            });
        });

        //파일 미리 보기
        function LoadImg(inputFile,num){
            //console.log(inputFile.files.length);
            //파일 있으면 1, 없으면 0
            if(inputFile.files.length == 1){ //파일이 있으면
                var reader = new FileReader();
                reader.readAsDataURL(inputFile.files[0]);
                //FileReader : 파일 읽어줄 객체
                //readAsDataURL : 파일 읽어줄 메소드 -> 읽어들이는 순간 url부여

                reader.onload = function(e){
                    //url
                    console.log(e.target.result);
                    //src에 url을 부여하면 미리보기 가능
                    switch(num){
                        case 1 : $("#titleImg").attr("src",e.target.result); break;
                        case 2 :$("#contentImg1").attr("src",e.target.result); break;
						case 3 :$("#contentImg2").attr("src",e.target.result); break;
						case 4 :$("#contentImg3").attr("src",e.target.result); break;
                        case 5 :$("#contentImg4").attr("src",e.target.result); break;
                    }
                }
            }else{
                switch(num){
                    case 1 :$("#titleImg").attr("src",null); break;
					case 2 :$("#contentImg1").attr("src",null); break;
					case 3 :$("#contentImg2").attr("src",null); break;
					case 4 :$("#contentImg3").attr("src",null); break;
                    case 5 :$("#contentImg4").attr("src",null); break;
                }
            }
        }
        
        /* 지도 */
        var mapContainer = document.getElementById('map'),
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도 중심좌표
	            level: 5 // 지도 확대 레벨
	        };

	    //지도 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	    
	    $("#map").hide();
        
        function postcode(){
	        /* 우편번호 서비스  API*/
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	var addr = data.address; // 검색한 주소 정보
	                document.getElementById("address").value = addr;
	            	
	                // 주소로 좌표 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 위치 변경
	                        map.setCenter(coords);
	                        // 마커 다시 잡기
	                        marker.setPosition(coords)
	                        
	                        $("#map").show();
	                        $("#zone_no").val(data.sigunguCode);
	                        $("#infoAddress").val(data.address);
	                    }
	                });
	            }
	        }).open();
        }
        
        function postReset(){
        	$("#address").val("");
        	$("#map").hide();
        }
        
        //수정 서브밋
        function updateSubmit() {
        	var fileNo = [];
        	$('.fileNo').each(function() {
				var value = $(this).val();
				fileNo.push(value);
			});
        	
        	var filePath = [];
        	$('.filePath').each(function() {
				var value = $(this).val();
				filePath.push(value);
			});
        	
        	var fileData = {
        			fileNo : fileNo,
        			filePath : filePath
        	};
        	
        	$.ajax({
	   		 	url: 'festivalFileDel.ad', 
	   		  	type: 'POST', 
	   		  	contentType: 'application/json', 
	   		  	data: JSON.stringify(fileData),
	   		  	success: function(result) {
		   		  	if(result=="success"){
						$(".festival-form").submit();
					}else{
						alertify.message("파일 삭제 실패");
					}
	   		  	},
	   		  	error: function(result) {
	   		    	console.log("통신실패");
	   		  	}
   			});
        	
		}
    </script>
	
</body>
</html>
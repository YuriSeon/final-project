<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 cdn -->
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<!-- 우편번호 검색 서비스 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도띄우기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70b23e382202cfd2baa230e5f3a37f59&libraries=services"></script>
	<style>
		.the-area{
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
        .the_title{
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
        .the_input{
            padding: 10px;
            color: rgb(92, 92, 92);
            margin-left: 25px;
        }
        .the_text select{
            height: 25px;
            width: 300px;
        }
        .the_text input{
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
        .the_input img{
            width: 300px;
            height: 200px;
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
        #contentImg3{
        	margin-left: 106px;
        }
</style>
</head>
<body>
	<%@include file="../admin/adMenubar.jsp" %>
	<form action="insertThema.bo" method="post" enctype="multipart/form-data">
	<input type="hidden" name="boardWriter" value="${loginUser.nickname }">
        <div class="the-area" >
            <div class="the_title">테마 등록</div>
            <div class="the_text">
                <div class="the_input" style="margin-top: 10px;">
                    <label for="themaCategory">카테고리</label>
                    <select name="themeNo" id="themaCategory" style="margin-left: 47px;">
                        <option value="0">카테고리</option>
                        <option value="1">별보러 가지 않을래?</option>
                        <option value="2">소원을 말해봐</option>
                        <option value="3">힐링</option>
                        <option value="4">계곡</option>
                        <option value="5">평생 친구와 함께</option>
                        <option value="6">전시회</option>
                    </select>
                </div>
                <div class="the_input">
                    <label for="boardTitle">장소이름</label>
                    <input type="text" name="boardTitle" id="boardTitle" style="margin-left: 47px;" required>
                </div>
                <div class="the_input">
                    <label for="infoCall">전화번호</label>
                    <input type="text" name="infoCall" id="infoCall" style="margin-left: 47px;" >
                </div>
                <div class="the_input">
                    <label for="infoHomepage">홈페이지</label>
                    <input type="text" id="infoHomepage" name="infoHomepage" style="margin-left: 47px;">
                </div>
                <div class="the_input">
                    <label for="infoType">이용시간</label>
                    <input type="text" id="infoTime" name="infoTime" style="margin-left: 47px;">
                </div>
                <div class="the_input">
                    <label for="infoType">휴무일</label>
                    <input type="text" id="infoTime" name="dayOff" style="margin-left: 60px;">
                </div>
                
                <div class="the_input">
                    <label for="address">주소</label>
                    <input type="text" id="address" onclick="postcode();" style="margin-left: 72px;" name="infoAddress">
                    <button type="button" onclick="postcode();" style="height: 25px;">주소검색</button>
                    <button type="button" onclick="postReset();" style="height: 25px;">취소</button>
                    <div id="map"></div>
                    <input type="hidden" name="zoneNo" id="zone_no">
                    
                </div>
                <div class="the_input">
                    <label for="boardContent" style="position: relative; top: -140px;">장소 설명</label>
                    <textarea name="boardContent" id="boardContent" cols="70" rows="10" style="margin-left: 41px; resize: none;" required></textarea>
                </div>
                <div class="the_input" style="border-top: 3px solid gray; margin-top: 40px;margin-bottom: 20px;">
                    <label for="" class="photo-label" style="margin-top:10px; margin-left: 350px;font-size: 20px;margin-bottom: 20px;" >사진 등록</label><br>
                    <label for="" style="margin-right: 28px;">대표 이미지</label>
                    <img id="titleImg">
                </div>
                <div class="the_input">
                    <label for="" style="margin-right: 28px;" >상세 이미지</label>
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
                </div>
            </div>
            <div class="the_input" id="fes_btn" style="margin-bottom: 60px; ">
                <button type="submit">등록</button>
                <button type="reset">취소</button>
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
	    
	    $("#map").hide();
        
        //우편번호 api
        function postcode(){
        	new daum.Postcode({
        	    oncomplete: function(data) {
        	    	 var addr = data.address; // 최종 주소 변수

                     // 주소 정보를 해당 필드에 넣는다.
                     document.getElementById("address").value = addr;
                     // 주소로 상세 정보를 검색
                     geocoder.addressSearch(data.address, function(results, status) {
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
                             
                             $("#map").show();
                             $("#zone_no").val(data.sigunguCode);
                             
                         }
                     });
        	    	
        	    }
        	}).open();
        }
        
        //우편 취소
        function postReset(){
        	$("#address").val("");
        	$("#map").hide();
        }
      
    </script>
	
</body>
</html>
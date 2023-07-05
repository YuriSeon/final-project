<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="slide.css">
<script defer src="slide.js"></script>
<!-- 우편번호 검색 서비스 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 지도띄우기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70b23e382202cfd2baa230e5f3a37f59&libraries=services"></script>
<title>Insert title here</title>
<style>
	.suel{		
		 background-color: #f0f0f1; 
		 height: 100%;
		 border:1px solid white;
	}
	
	#enroll-form>table{
		margin-top: 70px;		
		width: 1000px;
		height: 1000px;
		margin-bottom: 50px;
		text-align: center;
		border-radius: 30px ;
		padding: 10px 20px;
		background-color: white;
	}
	#enroll-form>div{
		margin-bottom: 50px;
	}
	#enroll-form input{
		float :left;
		box-sizing:border-box;
		margin-left: 60px;
		color: black;
		border: 1px solid black;
		width: 300px;
	}
	#enroll-form textarea{
		 white-space: pre;
		
	}
	/* #enroll-form img{
		border: 1px solid black;
		margin: 10px;
	} */
	#enroll-form th{
		border-right: 1px dotted black;
	}
	#tr1{
		border-top: 1px dotted black;
		border-bottom: 1px dotted black;  
	}
	.slider{
        width: 500px;
        height: 400px;
        position: relative;
        margin-left: 60px;
        
         overflow: hidden; /*현재 슬라이드 오른쪽에 위치한 나머지 슬라이드 들이 보이지 않도록 가림 */
    }
    .slider input[type=radio]{
        display: none;
        
    }
    ul.imgs{
        padding: 0;
        margin: 0;
        list-style: none;    
    }
    ul.imgs li{
        position: absolute;
        left: 640px;
        transition-delay: 1s; /* 새 슬라이드가 이동해 오는 동안 이전 슬라이드 이미지가 배경이 보이도록 지연 */   
        padding: 0;
        margin: 0;
    }
    .bullets{
        position: absolute;
        left: 50%;
        transform: translateX(-50%);
        margin-top: 370px;
        z-index: 2;
    }
    .bullets label{
        display: inline-block;
        border-radius: 50%;
        background-color: rgba(0,0,0,0.55);
        width: 20px;
        height: 20px;
        cursor: pointer;
    }
    /* 현재 선택된 불릿 배경 흰색으로 구분 표시 */
    .slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
        background-color: #f0b8b8;
    }
    .slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
        background-color: #f0b8b8;
    }
    .slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
        background-color: #f0b8b8;
    }
    .slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
        background-color: #f0b8b8;
    }
     .slider input[type=radio]:nth-child(5):checked~.bullets>label:nth-child(5){
        background-color: #f0b8b8;
    }
    .slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    .slider input[type=radio]:nth-child(5):checked~ul.imgs>li:nth-child(5){
        left: 0;
        transition: 0.5s;
        z-index:1;
    }
    #imgholder img{
    	border:1px solid black;
    }
    b{ margin-left:30px; float :left;}
	#btn{margin-right: 450px;}
    #map{
            width: 370px;
            height: 250px;
            border: 1px solid black;
            margin-top: 20px;
            margin-left: 60px;
        }
</style>
</head>
<body>

	<%@include file = "../common/menubar.jsp" %>
	<br><br>
	
	<div class="suel" align="center">
		<form action="updatefeed.fo" method="post" id="enroll-form" enctype="multipart/form-data" onsubmit="return imgcheck()">
			<input type="hidden" name="boardNo" value="${b.boardNo }">
			<table>
				<thead>
					<tr height="20"> </tr>
					<tr>
						<th>닉네임</th>
						<td><b>${b.boardWriter }</b> </td>
					</tr>
					<tr height="10"></tr>
					<tr>
						<th>지역</th>
						<td>	
							<input type="text" id="address" onclick="postcode();"  name="infoAddress" value="${b.info.getInfoAddress() }" required>
			                  <button type="button" onclick="postcode();" class="btn btn-primary btn-sm" id="btn">검색</button>
			  
			                  <div id="map"></div>
			                  <input type="hidden" name="zoneNo" id="zone_no">                                      					
						</td>
					</tr>
					<tr height="20"></tr>
					<tr id="tr1">
						<th>상세이미지 넣기</th>
						<td>
							 <div class="slider">
                                <input type="radio" name="slide" id="slide1" checked>
                                <input type="radio" name="slide" id="slide2">
                                <input type="radio" name="slide" id="slide3">
                                <input type="radio" name="slide" id="slide4">
                               
                                <ul id="imgholder" class="imgs">    
                                                       
                                    <li><img id="contentImg1" width="500" height="350" ></li>
                                    <li><img id="contentImg2" width="500" height="350" ></li>
                                    <li><img id="contentImg3" width="500" height="350" ></li>
                                    <li><img id="contentImg4" width="500" height="350" "></li>    
                                                           
                                </ul>
                               <div class="bullets">
                                    <label for="slide1">&nbsp;</label>
                                    <label for="slide2">&nbsp;</label>
                                    <label for="slide3">&nbsp;</label>
                                    <label for="slide4">&nbsp;</label>
                                    
                                </div> 
                            </div>
						</td>						
					</tr>
					
					<tr height="20"></tr>
					<tr>
						<th>내용</th>
						<td colspan="2">
							<textarea rows="10" cols="90" name="boardContent" style="resize: none;">${b.boardContent }</textarea>
						</td>
					</tr>
					<tr height="20"></tr>
					
					
				</thead>
			</table>
			<!-- 파일 첨부 영역 -->
			<div id="file-area" align="center">
				<input type="file" id="file1" name="upfile" onchange="loadImg(this,1);"> <!-- 대표이미지 -->
				<input type="file" id="file2" name="upfile" onchange="loadImg(this,2);"> <br>
				<input type="file" id="file3" name="upfile" onchange="loadImg(this,3);"><br>
				<input type="file" id="file4" name="upfile" onchange="loadImg(this,4);"><br>				
			</div>
			<c:forEach var="at" items="${list}">
					<input type="hidden" name="originName" value="${at.originName }">
	    	        <input type="hidden" name="changeName" value="${at.changeName }">
	    	        <input type="hidden" name="filePath" value="${at.filePath }">  
				</c:forEach>
			<div align="center">
				<button type="submit" class="btn btn-warning">수정하기</button>
				<button class="btn btn-danger" onclick="javascript:history.go(-1);">뒤로가기</button>
			</div>
		</form>
	</div>
</body>

<script>
	$(function(){
		$("#file-area").hide();
		$("#contentImg1").click(function(){
			$("#file1").click();
		});
		$("#contentImg2").click(function(){
			$("#file2").click();
		});
		$("#contentImg3").click(function(){
			$("#file3").click();
		});
		$("#contentImg4").click(function(){
			$("#file4").click();
		});
	});
	
	//이미지 미리보기
	function loadImg(inputFile,num){

				if(inputFile.files.length ==1){
					
					var reader = new FileReader();
					
					
					reader.readAsDataURL(inputFile.files[0]);
					
					reader.onload = function(e){//e:이벤트 객체
						
						
						switch(num){
						case 1: $("#contentImg1").attr("src",e.target.result); break;
						case 2: $("#contentImg2").attr("src",e.target.result); break;
						case 3: $("#contentImg3").attr("src",e.target.result); break;
						case 4: $("#contentImg4").attr("src",e.target.result); break;
								
						}
						
					}
				}else{
					switch(num){
					case 1: $("#contentImg1").attr("src",null); break;
					case 2: $("#contentImg2").attr("src",null); break;
					case 3: $("#contentImg3").attr("src",null); break;
					case 4: $("#contentImg4").attr("src",null); break;
							
					}
				}
			}
	
	/*이미지 없을시*/
    function imgcheck(){
		var fileCheck = document.getElementById("file1").value;
    	if(!fileCheck){
    		alert("이미지를 넣어해주세요");
    		return false;
    	}
    	}
	
    
    
   /*  $(function(){
    	   var city = document.getElementById("zone");
    	    var zoneNo = "${b.zoneNo}"; // "${b.zoneNo}" 값을 변수로 저장

    	    $(city).val(zoneNo); // zoneNo 값을 기준으로 옵션 선택  \
    	    var idx = $("#zone option").index($("#zone option:selected"));
    	    change(idx);
    	    
    	    }) */
    	    
    $(function(){
	   var alist = ${alist};
	   var size = ${size};
	   var images = document.getElementById("imgholder");
	   var files = document.getElementById("file-area");
	   var fileInputs = $(files).children("input");
	   var image = $(images).children().children();
	   /* console.log(file); */
	   for(var i=0; i<size; i++){		   			   
			$(image[i]).attr("src",alist[i].filePath);
			  $("#file"+[i]+1).val(alist[i].filePath);  
	   }
   }) 
	
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
                          
                          $("#zone_no").val(data.sigunguCode);
                         
                      }
                  });
     	    	
     	    }
     	}).open();
     }
   
	
</script>
</html>
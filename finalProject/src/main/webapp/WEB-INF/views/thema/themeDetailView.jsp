<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=70b23e382202cfd2baa230e5f3a37f59&libraries=services"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
<style>
	.images{
		/*  border: 1px solid;  */
		height: 700px;
		background: linear-gradient(to bottom, rgb(241, 230, 70), #ffffff);
		
	}
	.images>img{
		margin-top: 100px;
		float: left;
		width: 400px;
		height: 400px;
		padding: 0;
		
	}
	.content{ 
		margin-top: 20px;
		margin-left: 250px;
		margin-right: 250px;
		white-space: normal;
		font-family: '돋움체';
		margin-bottom: 30px;
	}
	#map{
		border: 1px solid;
		margin-left: 250px;
		margin-right: 250px;
		height: 400px;
	}
	.title{
		margin-left: 250px;
		margin-right: 250px;
		padding: 70px;
	}
	.info{
		margin-left: 300px;

		margin-top: 50px;
		padding-bottom: 200px;
	}
	.title>b{		
		font-size: 40px;
		padding: 10px;
	}
	.info strong {
		font-size: 20px;
		width: 200px;
		display: inline-block;
		
	}
	.info li{
		width: 45%;
		float: left;
		margin: 5px;		 
	}
	.bi li{
		float: left;		
	}
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<div class="images">
		
		<img alt="" src="${at[0].filePath}" style="margin-left: 150px;">
		<img alt="" src="${at[1].filePath}" style="margin-top: 200px;">
		<img alt="" src="${at[2].filePath}">
		<img alt="" src="${at[3].filePath}" style="margin-top: 200px;">
	</div>
	
	 <div class="title">
		<b style="display: block; text-align: center;text-decoration: underline; text-decoration-color: rgb(244, 215, 162);">" ${b.boardTitle } "</b>
		<b style="display: block; text-align: center;font-size: 20px;">${b.zone.getZoneName() }</b>
	</div> 
	
	<p class="content">
	${b.boardContent }
	</p>
	<div id="map"></div>
	<div class="info">
		<ul>
			<li>
				<strong>문의 및 안내</strong>
				<span>${b.info.getInfoCall() }</span>
			</li>
			<li>
				<strong>주소</strong>
				<span>${b.info.getInfoAddress() }</span>
			</li>
			<li>
				<strong>영업시간</strong>
				<span>${b.info.getInfoTime() }</span>
			</li>
			<li>
				<strong>휴일</strong>
				<span>${b.info.getDayOff() }</span>
			</li>
			<li>
				<strong>홈페이지</strong>
				<span>${b.info.getInfoHomepage() }</span>
			</li>			
		</ul>
	
	</div>
	
	<div class="bi">
		<ul>
			<li>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
				  <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
				</svg>
			</li>
			<li>
				<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
				  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
				  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
				</svg>
			</li>
		</ul>
	</div>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
<script >
	/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var marker = new kakao.maps.Marker();
	
	//타일 로드가 완료되면 지도 중심에 마커를 표시합니다
	kakao.maps.event.addListener(map, 'tilesloaded', displayMarker);
	
	function displayMarker() {
	
	// 마커의 위치를 지도중심으로 설정합니다 
	marker.setPosition(map.getCenter()); 
	marker.setMap(map); 
	
	// 아래 코드는 최초 한번만 타일로드 이벤트가 발생했을 때 어떤 처리를 하고 
	// 지도에 등록된 타일로드 이벤트를 제거하는 코드입니다 
	// kakao.maps.event.removeListener(map, 'tilesloaded', displayMarker);
	} */
	
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
	    
	    //우편api를 활용
	    $(function(){
	    	new daum.Postcode({
        	    oncomplete: function(data) {        	    	     
                     // 주소로 상세 정보를 검색
                     geocoder.addressSearch("${b.info.getInfoAddress()}", function(results, status) {
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

                         }
                     });
        	    	
        	    }
        	}).open();
	    })

</script>
</body>
</html>
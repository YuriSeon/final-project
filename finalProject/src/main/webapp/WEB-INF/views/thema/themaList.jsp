<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	.special_box .bg {
	     height: 350px; 
	}
			
	.special_box {
	    position: relative;
	    color: #333;
	    margin: 0 0 80px;
	}
	.zone{
		margin: auto;
	}
	.zone button{
		background-color: white;
	}
	table {
		width: 1200px;
		/* border: 1px solid; */
	}
	img{
		width:300px;
		height: 200px;
	}
	tbody td {
		/*  border: 1px solid;  */
		padding: 20px;
		width: 350px;
	}
	tbody th{
		 /* border: 1px solid;  */
	}
	
</style>
<head>
<meta charset="UTF-8">
<title>테마리스트뷰</title>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	
	<!-- 맨위 사진 -->
	
    <div class="special_box">
         <div class="bg" style="background-color: purple;">	               
          </div>
    </div>
    
    <!-- 지역찾기 -->
    <div class="zone" align="center">
    	<form action="search.mo" method="get">
    		<select name='zoneNo' onchange="change(this.selectedIndex);"  class=input id="zone" style="width: 200px;height: 50px;margin-right: 50px;">
    			<option value='00'>전체</option>
		        <option value='11'>서울특별시</option>
		        <option value='21'>부산광역시</option>
		        <option value='22'>대구광역시</option>
		        <option value='23'>인천광역시</option>
		        <option value='24'>광주광역시</option>
		        <option value='25'>대전광역시</option>
		        <option value='26'>울산광역시</option>
		        <option value='31'>경기도</option>
		        <option value='32'>강원도</option>
		        <option value='33'>충청북도</option>
		        <option value='34'>충청남도</option>
		        <option value='35'>전라북도</option>
		        <option value='36'>전라남도</option>
		        <option value='37'>경상북도</option>
		        <option value='38'>경상남도</option>
		        <option value='39'>제주도</option>		                       
		     </select>  
		         
		     <select name='country'  class=select id="country" style="width: 200px;height: 50px;margin-right: 50px;">
		        <option value=''>전체</option>
		     </select>           
		     <button>
                 <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                      <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                 </svg>
             </button>               
    	</form>
    	
    </div>
    <br><br><br><br><br><br>
    	<!-- 리스트뷰 -->
    <table align="center">
    	<thead>
    		<tr style="border-bottom: 2px solid gray; padding-bottom: 30px;">
    			<th style="padding-left: 20px;">총(22,220)건</th>
    			<td style="float: right;padding-right: 30px;">
    				<a href="" style="font-weight: bold;color: black;font-size: 20px;">최신순 </a>|
    				<a href="" style="font-weight: bold;color: black;font-size: 20px;">인기순 </a>
    			</td>
    		</tr>    		
    	</thead>
    	<tbody>
    		<tr>
    			<td>
    				<img alt="" src="" >
    			</td>
    			<th style="border-bottom: 2px solid gray;">   				
    				<ul>
    					<li><b style="font-size: 20px;">게시판 제목이 들어갈 자리</b></li>
    					<li style="height: 130px;padding-top: 10px;">전라남도 공석군</li>
    					<li>TEL)032-456-7894</li>
    					<li style="float: right;padding-right: 30px;">
    						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							</svg> 20
    					</li>
    				</ul>
    			</th>
    		</tr>
    		<tr>
    			<td>
    				<img alt="" src="" >
    			</td>
    			<th style="border-bottom: 2px solid gray;">   				
    				<ul>
    					<li><b style="font-size: 20px;">게시판 제목이 들어갈 자리</b></li>
    					<li style="height: 130px;padding-top: 10px;">전라남도 공석군</li>
    					<li>TEL)032-456-7894</li>
    					<li style="float: right;padding-right: 30px;">
    						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							</svg> 20
    					</li>
    				</ul>
    			</th>
    		</tr>
    		<tr>
    			<td>
    				<img alt="" src="" >
    			</td>
    			<th style="border-bottom: 2px solid gray;">   				
    				<ul>
    					<li><b style="font-size: 20px;">게시판 제목이 들어갈 자리</b></li>
    					<li style="height: 130px;padding-top: 10px;">전라남도 공석군</li>
    					<li>TEL)032-456-7894</li>
    					<li style="float: right;padding-right: 30px;">
    						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							</svg> 20
    					</li>
    				</ul>
    			</th>
    		</tr>
    		<tr>
    			<td>
    				<img alt="" src="" >
    			</td>
    			<th style="border-bottom: 2px solid gray;">   				
    				<ul>
    					<li><b style="font-size: 20px;">게시판 제목이 들어갈 자리</b></li>
    					<li style="height: 130px;padding-top: 10px;">전라남도 공석군</li>
    					<li>TEL)032-456-7894</li>
    					<li style="float: right;padding-right: 30px;">
    						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							</svg> 20
    					</li>
    				</ul>
    			</th>
    		</tr>
    	</tbody>
    </table>
   
   
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
<script>

//지역 찾는 카테고리
	var cnt = new Array();
	cnt[0] = new Array('전체');
	cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
	cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
	cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
	cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
	cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
	cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
	cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
	cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
	cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
	cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
	cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
	cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
	cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
	cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
	cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
	cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
	function change(add) {
	  /* 옵션메뉴삭제 */
	  $("#country").children().remove();
	  /* 옵션박스추가 */
	  for (i=0; i < cnt[add].length;i++){                     
	       $("#country").append("<option>"+cnt[add][i]+"</option>");
	    }         
	}
</script>
</html>
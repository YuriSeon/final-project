<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="slide.css">
<script defer src="slide.js"></script>
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
		margin-left: 30px;
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
        margin: 0 auto;
        
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
    #zone{
    	float :left;
    	margin-left:30px;
    } 
    b{ margin-left:30px; float :left;}
	
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
						<th>지역태그</th>
						<td>	
							 <select name='zoneNo' onchange="change(this.selectedIndex);"  class=input id="zone">
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
		                    
		                     <select name='country'  class=select id="country">
		                       <option value=''>전체</option>
		                    </select>                                                					
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
							<textarea rows="10" cols="90" name="boardContent">${b.boardContent }</textarea>
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
    
    $(function(){
    	   var city = document.getElementById("zone");
    	    var zoneNo = "${b.zoneNo}"; // "${b.zoneNo}" 값을 변수로 저장

    	    $(city).val(zoneNo); // zoneNo 값을 기준으로 옵션 선택  \
    	    var idx = $("#zone option").index($("#zone option:selected"));
    	    change(idx);
    	    
    	    })
    	    
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
	
	
</script>
</html>
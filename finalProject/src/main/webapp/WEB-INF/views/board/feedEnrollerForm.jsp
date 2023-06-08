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
	}
	#enroll-form textarea{
		
		
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
	
	.slide{ /**이만큼의 크기로 보이겠다는 의미**/
	  width:350px; height:333px;/**사진보다 크면 다음 사진까지 표시되어 img와 slide크기를 맞춘다.**/
 	//  overflow: hidden;/**이미지는 내장이라 overflow:hidden을 사용해 넘친 사진들을 안보이게 한다.**/ 
	 border:1px solid black;
	  position: relative;
	  left: 250px;
	}
	.images{
	  height:333px; /**slide와 images의 높이가 다르면 부자연스럽게 표시돼 slide의 높이에 맞게 높이를 바꾼다.**/
	  transition: transform 0.5s; 
	/**어떤 속성에 대해 애니메이션 효과를 주는 속성이다. 
	tranform속성에 0.5초의 듀레이션(동작의 시작해서 끝나는 시간)을 준다.**/
	}
	img{
	  width:300px; height:333px;/**slide 크기에 맞춘다.**/
	}
	
	/**버튼위치**/
	.back{
	  position:relative;
	  left:-200px;
	  bottom: 170px; right: 0px;
	}
	.next{
	  position:relative;
	  
	  bottom: 170px; left: 220px;
	}
	
	/**버튼디자인**/
	#tr1 button{		
	  width: 30px; height: 30px;
	  color: rgb(19, 1, 1);
	  background: white;
	
	}
	button:active{/**버튼을 클릭하는 동안 색을 바꾼다.**/
	  background:#3e3e3e;
	}
	button:disabled{/**버튼 속성이 disabled되면 색을 바꾼다.**/
	  background: #cbcaca;
	}
	
</style>
</head>
<body>

	<%@include file = "../common/menubar.jsp" %>
	<br><br>
	
	<div class="suel" align="center">
		<form action="insert.fo" method="post" id="enroll-form" enctype="multipart/form-data">
			<table>
				<thead>
					<tr height="20"> </tr>
					<tr>
						<th>닉네임</th>
						<td>꼭 싸움을 잘해야지</td>
					</tr>
					<tr height="10"></tr>
					<tr>
						<th>지역태그</th>
						<td>	
							<input type="text" placeholder="ex) 서울,부산,인천">					
						</td>
					</tr>
					<tr height="20"></tr>
					<tr id="tr1">
						<th rowspan="2">상세이미지 넣기</th>
						<td>
							 <div class="slide" align="center"> <!--배치된 img들을 하나의 img만 보이게 가리기 위한 태그-->
			                    <div class="images"> <!--img들을 좌우배치할 태그-->
			                        <img id="contentImg1" src="/finalProject/resources/images/check.png">
			                        <img id="contentImg2" src="/finalProject/resources/images/compass.png">
			                        <img id="contentImg3" src="/finalProject/resources/images/edit.png">
			                        <img id="contentImg4" src="/finalProject/resources/images/eye.png">
			                    </div>
			                </div>
			                  <button class="back">❮</button>
			                  <button class="next">❯</button>
						</td>						
					</tr>
					
					<tr height="20"></tr>
					<tr>
						<th>내용</th>
						<td colspan="2">
							<textarea rows="10" cols="90" ></textarea>
						</td>
					</tr>
					<tr height="20"></tr>
					
					
				</thead>
			</table>
			<!-- 파일 첨부 영역 -->
			<div id="file-area" align="center">
				<input type="file" id="file1" name="file1" onchange="loadImg(this,1);" required> <!-- 대표이미지 -->
				<input type="file" id="file2" name="file2" onchange="loadImg(this,2);"> <br>
				<input type="file" id="file3" name="file3" onchange="loadImg(this,3);"><br>
				<input type="file" id="file4" name="file4" onchange="loadImg(this,4);"><br>
				
			</div>
			<div align="center">
				<button type="submit">작성하기</button>
				<button type="">뒤로가기</button>
			</div>
		</form>
	</div>
</body>

<script>
// 	$(function(){
// 		$("#file-area").hide();
// 		$("#contentImg1").click(function(){
// 			$("#file1").click();
// 		});
// 		$("#contentImg2").click(function(){
// 			$("#file2").click();
// 		});
// 		$("#contentImg3").click(function(){
// 			$("#file3").click();
// 		});
// 		$("#contentImg3").click(function(){
// 			$("#file4").click();
// 		});
// 	});
	
	
	
	
	let pages = 0;//현재 인덱스 번호
	let positionValue = 0;//images 위치값
	const IMAGE_WIDTH = 250;//한번 이동 시 IMAGE_WIDTH만큼 이동한다.
	//DOM
	const backBtn = document.querySelector(".back")
	const nextBtn = document.querySelector(".next")
	const images = document.querySelector(".images")
	
	
	function next() {
	  if (pages< 3) {
	    backBtn.removeAttribute('disabled')//뒤로 이동해 더이상 disabled가 아니여서 속성을 삭제한다.
	    positionValue -= IMAGE_WIDTH;//IMAGE_WIDTH의 증감을 positionValue에 저장한다.
	    images.style.transform = `translateX(250px)`;
			//x축으로 positionValue만큼의 px을 이동한다.
	    pages += 1; //다음 페이지로 이동해서 pages를 1증가 시킨다.
	  }
	  if (pages === 3) { //
	    nextBtn.setAttribute('disabled', 'true')//마지막 장일 때 next버튼이 disabled된다.
	  }
	}
	
	function back() {
	  if (pages > 0) {
	    nextBtn.removeAttribute('disabled')
	    positionValue += IMAGE_WIDTH;
	    images.style.transform = `translateX(-250px)`;
	    pages -= 1; //이전 페이지로 이동해서 pages를 1감소 시킨다.
	  }
	  if (pages === 0) {
	    backBtn.setAttribute('disabled', 'true')//마지막 장일 때 back버튼이 disabled된다.
	  }
	}
	
	function init() {  //초기 화면 상태
	  backBtn.setAttribute('disabled', 'true'); //속성이 disabled가 된다.
	  backBtn.addEventListener("click", back); //클릭시 다음으로 이동한다.
	  nextBtn.addEventListener("click", next);//클릭시 이전으로 이동한다.
	}
	init();
</script>
</html>
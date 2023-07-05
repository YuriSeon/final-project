<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>함께 가치 글쓰기</title>
    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/font-awesome.css">

    <link rel="stylesheet" type="text/css" href="/finalProject/resources/css/owl-carousel.css">

    <link rel="stylesheet" href="/finalProject/resources/css/tooplate-artxibition.css">
<style>
	#outer{
		margin:auto;
		margin-top:20px;
/* 		border: 1px solid black; */
		width:80%;
		height:1000px;
	}
	#outer>div{
		float:left;
	}
	#previewDiv{
		width:29%;
		height:644px;
		border:1px solid black;
		margin-right:1%;
	}
	#enrollFormDiv{
		width:70%;
		height:644px;
		border: 1px solid black;
	}
	.thumb>img{
		width:350px;
		height:255px;
	}
	#optionIcons>li>img{
		width: 12px;
		height:14px;
		margin-right:10px;
	}
	#optionIcons>li{
		margin-bottom:5px;
	}
	#writeTitle{
		border-bottom : 1px solid black;
		width: 80%;
		margin : auto;
		margin-top : 30px;
		padding : 10px 0px 10px 20px;
		font-size : 55px;
		font-weight : 500;
	}
	#enrollTable{
		width: 90%;
		margin-top : 20px;
		text-align : center;
	}
	#checkBox>input{
		margin-left : 5px;
	}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
</style>
</head>
<body>
	<%@include file="../../common/menubar.jsp" %>
		<div id="writeTitle">
				함께 가치 글쓰기
		</div>
		<div id="outer">
				
				<div id="previewDiv">
						<p style="margin-left:35%; font-size:15px; font-weight:400;">&lt; 내 글 미리보기 &gt;</p>
						<div class="col-lg-4">
	                    <div class="ticket-item" align="center">
	                        <div class="thumb" style="margin-top:10px;">
	                            <img src="" alt="" id="upfile">
	                        </div>
	                        <div class="down-content" style="width:290px;" align="center"> <br>
	                            <h4 id="dateConcept"></h4>
	                           	<h4 id="previewTitle"></h4> <br>
	                            <ul id="optionIcons">
	                                <li id="previewDate"><i class="fa fa-clock-o"></i><i id="previewDateIn"></i> ~ <i id="previewDateOut"></i></li>
	                                <li><i class="fa fa-map-marker"></i><i id="previewLocation"></i></li>
	                                <li><img src="/finalProject/resources/images/together_won.png"><i id="previewPay"></i></li> 
	                                <li><img src="${loginUser.profileImg}" style="border-radius:50%;"> ${nickname }</li> 
	                            </ul>
	                            <div class="main-dark-button">
	                                <a href="#" id="previewBtn" disabled>참여하기 0 / <i id="previewBtn1"></i></a>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</div>
	                
	             <div id="enrollFormDiv">
						<form id="enrollForm" method="post" action="togetherInsert.bo" enctype="multipart/form-data">
							<input type="hidden" name="nickname" value="${loginUser.nickname }">
							<input type="hidden" name="totalDate" id="totalDate">
									<table id="enrollTable" border="1" align="center">
											<tr>
													<td style="width:100px;">제목 </td>
													<td colspan="3"><input type="text" name="boardTitle" id="boardTitle" style="width:800px;"></td>
											</tr>
											<tr>
													<td style="width:100px;">기간  </td>
													<td  style="width:400px;"><input type="date" name="dateIn" id="dateIn" style="width:180px; text-align:center;"> ~ <input type="date" name="dateOut" id="dateOut" style="width:180px; text-align:center;"></td>
													<td style="width:100px;">지역  </td>
													<td>
															<select name='city' id="city" onchange="change(this.selectedIndex);"  style="width:130px;">
										                            <option value="">시/도</option>
										                            <option value='전체'>전체</option>
										                            <option value='서울'>서울특별시</option>
										                            <option value='부산'>부산광역시</option>
										                            <option value='대구'>대구광역시</option>
										                            <option value='인천'>인천광역시</option>
										                            <option value='광주'>광주광역시</option>
										                            <option value='대전'>대전광역시</option>
										                            <option value='울산'>울산광역시</option>
										                            <option value='경기'>경기도</option>
										                            <option value='강원'>강원도</option>
										                            <option value='충북'>충청북도</option>
										                            <option value='충남'>충청남도</option>
										                            <option value='전북'>전라북도</option>
										                            <option value='전남'>전라남도</option>
										                            <option value='경북'>경상북도</option>
										                            <option value='경남'>경상남도</option>
										                            <option value='제주'>제주도</option>
										                        </select> 
										                        <select name='country' id="country" style="width:140px;">
										                            <option value=''>구/군</option>
										                        </select>
													</td>
											</tr>
											<tr>
													<td style="width:100px;">경비 </td>
													<td style="width:400px;">
														 <select id="pay" name="pay" style="width:300px; text-align:center;">
				                                                <option>경비를 선택해주세요.</option>
				                                                <option value="100000">100,000원 이하</option>
				                                                <option value="200000">200,000원 이하</option>
				                                                <option value="300000">300,000원 이하</option>
				                                                <option value="400000">400,000원 이하</option>
				                                                <option value="500000">500,000원 이하</option>
				                                                <option value="1000000">1,000,000원 이하</option>
		                                            	</select>
													</td>
													<td style="width:100px;">동행 인원 수  </td>
													<td><input type="number" id="togetherCount" name="togetherCount" style="text-align:center;" placeholder="최대 6명까지 가능" max="6"></td>
											</tr>
											<tr>
													<td>컨셉  </td>
													<td colspan="3" id="checkBox">
															<input type="checkbox" class="check" name="concept" id="free" value="자유">&nbsp;<label for="free">자유</label>
															<input type="checkbox" class="check" name="concept" id="theme" value="테마">&nbsp;<label for="theme">테마</label>
															<input type="checkbox" class="check" name="concept" id="activity" value="액티비티">&nbsp;<label for="activity">액티비티</label>
															<input type="checkbox" class="check" name="concept" id="healing" value="힐링">&nbsp;<label for="healing">힐링</label>
															<input type="checkbox" class="check" name="concept" id="photo" value="인생샷">&nbsp;<label for="photo">인생샷</label>
															<input type="checkbox" class="check" name="concept" id="pet" value="반려동물">&nbsp;<label for="pet">반려동물</label>
															<input type="checkbox" class="check" name="concept" id="food" value="음식">&nbsp;<label for="food">음식</label>
															<input type="checkbox" class="check" name="concept" id="history" value="역사">&nbsp;<label for="history">역사</label>
															<input type="checkbox" class="check" name="concept" id="shopping" value="쇼핑">&nbsp;<label for="shopping">쇼핑</label>
															<input type="checkbox" class="check" name="concept" id="ocean" value="바다">&nbsp;<label for="ocean">바다</label>
															<input type="checkbox" class="check" name="concept" id="mountain" value="산">&nbsp;<label for="mountain">산</label>
													</td>
											</tr>
											<tr>
													<td style="width:100px; height:350px;">내용 </td>
													<td colspan="3"><textarea name="boardContent" style="height:370px; width:800px; resize:none;" required></textarea></td>
											</tr>
											<tr>
													<td>사진  </td>
													<td colspan="3" align="left"><input type="file" id="upfile" name="upfile"  onchange="loadImg(this,1);" required></td>
											</tr>
									</table>
									<br>
										<div id="btn-area" align="center">
												<button type="submit" class="btn btn-info">작성 완료</button>
												<button type="reset" class="btn btn-warning">작성 취소</button>
										</div>
									 <script>
										                            var cnt = new Array();
										                            cnt[0] = new Array('구/군')
										                            cnt[1] = new Array('전체');
										                            cnt[2] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
										                            cnt[3] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
										                            cnt[4] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
										                            cnt[5] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
										                            cnt[6] = new Array('전체','광산구','남구','동구','북구','서구');
										                            cnt[7] = new Array('전체','대덕구','동구','서구','유성구','중구');
										                            cnt[8] = new Array('전체','남구','동구','북구','중구','울주군');
										                            cnt[9] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
										                            cnt[10] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
										                            cnt[11] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
										                            cnt[12] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
										                            cnt[13] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
										                            cnt[14] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
										                            cnt[15] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
										                            cnt[16] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
										                            cnt[17] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
										                            
										                            function change(add) {
										                            	/*옵션 박스 삭제*/
										                                  $("#country").children().remove();
										                                  
										                                  /* 옵션 박스 추가 */
										                                  
										                                  for (i=0; i < cnt[add].length;i++){              
										                                	  	$("#country").append("<option>"+cnt[add][i]+"</option>");
										                                    }         
										                                }              
								</script>
						</form>
	             </div>
	            <script>
	            
	            	$("#boardTitle").keyup(function(){
	            		$("#previewTitle").html("<"+$(this).val()+">");
	            	});
	            	
	            	$("#dateIn").on("change",function(){
	            		$("#previewDateIn").html($(this).val());
	            	});
	            	
	            	$("#dateOut").on("change",function(){
	            		if($("#dateIn").val() < $(this).val()){
		            			$("#previewDateOut").html($(this).val());
	            		}else{
	            			alert("여행 시작 날짜 이후의 날짜를 골라주세요.");
	            				$(this).val("");
	            		}
	            	});
	            	
	            	$("#country").on("change",function(){
	            		$("#previewLocation").html($("#city").val() + " " +$(this).val());
	            	});
	            	
	            	$("#pay").on("change",function(){
	            		$("#previewPay").html($(this).val());
	            	});
	            	
	            	var totalDate = $("#dateIn").val() - $("#dateOut").val();
	            	console.log(totalDate);
	            	
	            	$("#checkBox>input").on("change",function(){
	            		if($(this).prop("checked")){
							$("#checkBox").children("input").attr("disabled",true); 
							$(this).attr("disabled",false);
							let totalDate = (new Date($("#dateOut").val()).getTime() - new Date($("#dateIn").val()).getTime()) / (1000 * 60 * 60 * 24);
							$("#totalDate").val(totalDate);
							$("#dateConcept").html("<"+totalDate+"박 "+(totalDate+1)+"일 "+$("#country").val()+" "+$(this).val()+" 여행>");
	            		}else{
	            			$("#checkBox").children("input").attr("disabled",false);
	            		}
	            	});
	            	
	            	$("#togetherCount").on("change",function(){
	            		if($(this).val() != 0){
	            			$("#previewBtn1").html($(this).val());
	            		}else{
	            			$("#previewBtn").html("동행을 구하지 않습니다.");
	            		}
	            		if($(this).val()>6){
	            			$(this).val("");
	            			alert("동행 인원 수는 6명을 넘을 수 없습니다. \n다시 입력해주세요.");
	            		}
	            	});
	            	
	            	function loadImg(inputFile,num){
						if(inputFile.files.length == 1){
							var reader = new FileReader();
							reader.readAsDataURL(inputFile.files[0]);
							reader.onload = function(e){
								$("#upfile").attr("src",e.target.result);
								}
						}else{
								$("#upfile").attr("src",null);
							}
						}
	            </script>
	             
		</div>
	<br><br>
</body>
</html>
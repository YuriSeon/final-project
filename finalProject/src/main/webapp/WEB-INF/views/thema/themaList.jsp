<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
	.special_box .bg {
	     height: 550px; 
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
	
	.pagination {
		margin-top: 100px;
    	justify-content: center !important;
	}
	.link:hover ,.link.active{
        font-weight: bold;
    }
    tbody>tr:hover{
    	cursor: pointer;
    	background-color: rgb(154, 154, 154, 0.3);
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
         <div class="bg" style="background-image: url('resources/images/강아지 산책.png');background-size: cover;">	               
          </div>
    </div>
    
    <!-- 지역찾기 -->
    <div class="zone" align="center">
    	<form action="search.mo" method="get">
    		<select name='zone' onchange="change(this.selectedIndex);"  class=input id="zone" style="width: 200px;height: 50px;margin-right: 50px;" >
    			<option>전체</option>
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
    <br><br><br><br>
    	<!-- 리스트뷰 -->
    <!-- 카테고리 그대로 -->
    <c:if test="${not empty zone and not empty country }">
			<script>
				$(function(){
					$("#zone").val('${zone}').attr("selected",true);
					$("#country").children().eq(0).html('${country}').attr("selected",true);
				})
			</script>    
    </c:if>	
    	
    <table align="center">
    	<thead>
    		<tr style="border-bottom: 2px solid gray; padding-bottom: 30px;">
    			<th style="padding-left: 20px;">총${count }건</th>
    			<td style="float: right;padding-right: 30px;">
    				<a href="themaList.bo?sort=1" style="color: black;font-size: 20px;" class="link">전체 </a>|
    				<c:choose>
    					<c:when test="${not empty zone and not empty country}">   						
    						<a href="search.mo?zone=${zone}&country=${country}&sort=1" style="color: black;font-size: 20px;" class="link">최신순 </a>|
    						<a href="search.mo?zone=${zone}&country=${country}&sort=2" style="color: black;font-size: 20px;" class="link">인기순 </a>
    					</c:when>
    					<c:otherwise>
    						<a href="themaList.bo?sort=1" style="color: black;font-size: 20px;" class="link">최신순 </a>|
    						<a href="themaList.bo?sort=2" style="color: black;font-size: 20px;" class="link">인기순 </a>
    					</c:otherwise>
    				</c:choose>
    				
    			</td>
    		</tr>    		
    	</thead>
    	<tbody>
    	<c:forEach var="b" items="${list}">
    		<tr>
    			<td>
    				<input type="hidden" name="boardNo" value="${b.boardNo} ">
    				<img alt="" src="${b.attachment.getFilePath() }" >
    			</td>
    			<th style="border-bottom: 2px solid gray;">   				
    				<ul>
    					<li><b style="font-size: 20px;">${b.boardTitle }</b></li>
    					<li style="height: 110px;padding-top: 10px;">${b.zone.getZoneName() }</li>
    					<li>홈페이지: ${b.info.getInfoHomepage() }</li>
    					<li>TEL) ${b.info.getInfoCall() }</li>
    					<li style="float: right;padding-right: 30px;">
    						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
							  <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
							  <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8zm8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7z"/>
							</svg> ${b.count }
    					</li>
    				</ul>
    			</th>
    		</tr>
    	</c:forEach>
    	</tbody>
    </table>
   
   <c:choose>
   		<c:when test="${not empty zone and not empty country}">
   			<div id="pagingArea" align="center">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="search.mo?currentPage=${pi.currentPage - 1 }&zone=${zone}&country=${country}&sort=${sort}">&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="search.mo?currentPage=${p}&zone=${zone}&country=${country}&sort=${sort}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="search.mo?currentPage=${pi.currentPage + 1}&zone=${zone}&country=${country}&sort=${sort}">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div> 
   		</c:when>
   		
   		<c:otherwise>
   			<div id="pagingArea" align="center">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1}">
                   			 <li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
                		</c:when>
                		<c:otherwise>
                			 <li class="page-item"><a class="page-link" href="themaList.bo?currentPage=${pi.currentPage - 1 }&sort=${sort}">&lt;</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage}">
	                    <li class="page-item"><a class="page-link" href="themaList.bo?currentPage=${p}&sort=${sort}">${p}</a></li>
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${pi.currentPage eq pi.maxPage}">
		                    <li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
                    	</c:when>
                    	<c:otherwise>
                    		<li class="page-item"><a class="page-link" href="themaList.bo?currentPage=${pi.currentPage + 1}&sort=${sort}">&gt;</a></li>
                    	</c:otherwise>
                    </c:choose>
                </ul>
            </div> 
   		</c:otherwise>
   </c:choose>
    
   
	
	
	<jsp:include page="../common/footer.jsp"/>
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
	       $("#country").append("<option value='"+cnt[add][i]+"'>"+cnt[add][i]+"</option>");
	    }         
	}
	
	//디테일로 
	$(function(){
		$("tbody>tr").click(function(){
			var bno = $(this).children().eq(0).children("input").val();
			/* console.log($(this).children().eq(0).children("input").val()); */
// 			location.href="detailTheme.bo?boardNo="+bno;
			handlePostClick(bno, this);
		});
	});

	//전체,최신순,인기순 호버 그대로		 
	 $(document).ready(function(){
		 var zone = "${zone}";
		 var country = "${country}";
		 var sort = "${sort}";
		 
		 if (zone && country && (sort === '1' || sort === '2')) {
			    $('.link[href="search.mo?zone='+zone+'&country='+country+'&sort='+sort+'"]').addClass('selected-link');
			  } else if (!zone && !country && (sort === '1' || sort === '2')) {
			    $('.link[href="themaList.bo"]').addClass('selected-link');
			  }
		 
		// 링크를 클릭했을 때의 동작을 정의합니다.
		  $('.link').click(function() {
		    // 모든 링크에서 .selected-link 클래스를 제거합니다.
		    $('.link').removeClass('selected-link');
		    
		    // 클릭한 링크에 .selected-link 클래스를 추가합니다.
		    $(this).addClass('selected-link');
		  });
	 });
	 
	//최근 본 페이지 세션에 저장
	function setRecentPageInfo(thumbnail, title, url) {
		// 세션에서 이전에 저장된 최근 페이지 정보 배열 가져오기
		var recentPages = sessionStorage.getItem('recentPages');

		if (recentPages) {
			// 이미 저장된 최근 페이지 정보 배열이 있을 경우 파싱하여 가져옴
		    recentPages = JSON.parse(recentPages);
		} else {
		    // 저장된 최근 페이지 정보 배열이 없을 경우 빈 배열로 초기화
		    recentPages = [];
		}

		// 새로운 페이지 정보 객체 생성
		var pageInfo = {
		    thumbnail: thumbnail,
		    title: title,
		    url: url
		};

		// 배열 맨 앞에 새로운 페이지 정보 추가
		recentPages.unshift(pageInfo);

		// 최대 5개까지만 유지하기 위해 배열 길이 조정
		if (recentPages.length > 5) {
		    recentPages = recentPages.slice(0, 5);
		}

		// 최근 페이지 정보 배열을 세션에 저장
		sessionStorage.setItem('recentPages', JSON.stringify(recentPages));
	}

	//게시물 클릭시 저장 후 이동
	function handlePostClick(bno, post) {
		var loginUser = '${loginUser}';
		var thumbnail = post.querySelector('img').src;
		var title = post.querySelector('b').innerText;
		var url = "http://localhost:8888/finalProject/detailTheme.bo?boardNo=" + bno;
		
		//로그인 한 경우에만 세션스토리지 생성
		if (loginUser) {
			setRecentPageInfo(thumbnail, title, url);
		}

		location.href = url;
	}

</script>
</html>
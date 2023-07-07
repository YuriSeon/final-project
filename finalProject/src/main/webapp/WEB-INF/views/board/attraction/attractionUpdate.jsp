<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/listMap.css">
<link rel="stylesheet" href="resources/css/attraction.css">
<title>Insert title here</title>
</head>
<style type="text/css">
.attrUpdate table textarea {
	width: 100%;
	height: 97%;
	border: none;
	resize: none;
}

.attrUpdate table #img-area {
	height: 300px;
	position: relative;
}

.attrUpdate table #img-area * {
	border: none;
}

.attrUpdate #wrapSlide {
	width: 100%;
	height: 90%;
}
.attrUpdate #upfile{
	width: 80%;
	height: 28px;

}
.attrUpdate #float {
	width: 100%;
	height: 90%;
}

.attrUpdate #slideArea {
	width: 60%;
	height: 100%;
	text-align: center;
}

.attrUpdate #slideImage {
	width: auto;
	max-height: 240px;
	height: 100%;
}

.attrUpdate #float>div {
	float: left;
}

.attrUpdate .float-img {
	width: 20%;
	height: 100%;
}

.attrUpdate #prev, .attrUpdate #next {
	position: relative;
	opacity: 0.3;
	width: 60%;
	height: auto;
	margin-top: 50%;
	opacity: calc(0.1);
	cursor: pointer;
	margin-left: 25%;
}

.attrUpdate #dotArea {
	position: relative;
	margin-top: 1px;
	height: 5%;
	text-align: center;
}

.attrUpdate #dotArea * {
	margin-right: 10px;
}

.attrUpdate table #boardContent2 {
	height: 200px;
}

.attrUpdate .btn-area {
	text-align: center;
	margin-top: 20px;
}

.attrUpdate .btn-area button {
	width: 100px;
	height: 35px;
	margin-left: 15px;
	margin-right: 15px;
}
.attrUpdate tr td>input{
	width:100%;
	height: 100%;
	box-sizing: border-box;
	border : none;
}
.attrUpdate #removeImg {
	float:right; 
	width:19%;
	font-size: 15px;
	margin-top: 5px;
	margin-right: 7px;
}
#upfile{
		height: 28px;
		width :
	}
</style>
<body>
    <%@include file="../../common/menubar.jsp" %>
    <div class="attrUpdate">
        <div class="title-area">
            <div class="float">
                <h2>관광정보 수정</h2> 
                <img src="resources/images/attr3.png">
                <img src="resources/images/attr2.png">
                <img src="resources/images/attr1.png">
            </div>
            <pre> <mark>정보를 새롭게 업데이트 해주세요</mark> </pre>
        </div>
        <hr>
        <form action="update.attr" method="post" id="update-form" enctype="multipart/form-data">
            <table>
                <thead>
                    <tr>
                        <th colspan="4"> ※ 관광지 내용 입력란 </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>관광지명</th>
                        <td colspan="3"><input type="text" name="infoName" id="infoName" placeholder="장소 이름을 작성해주세요" value="${dataMap.info.infoName}"></td>
                    </tr>
                    <tr>
                        <th>핵심 소개 문구</th>
                        <td colspan="3"><input type="text" name="introduce" id="introduce" placeholder="30자까지만 작성해주세요" value="${fn:split(dataMap.board.boardContent, '~~~~')[1] }"></td>
                    </tr>
                    <tr>
                        <th>주소 (도로명 주소)</th>
                        <td colspan="3"><input type="text" name="infoAddress" id="infoAddress" placeholder="도로명 주소로 작성해주세요" value="${dataMap.info.infoAddress}"></td>
                    </tr>
                    <tr>
                        <th>홈페이지 주소</th>
                        <td colspan="3"><input type="text" name="infoHomepage" id="infoHomepage" placeholder="홈페이지 주소 또는 SNS 주소를 작성해주세요" value="${dataMap.info.infoHomepage}"></td>
                    </tr>
                    <tr>
                        <th>이용시간</th>
                        <td colspan="3"><input type="text" name="infoTime" id="infoTime" placeholder="이용가능한 시간을 확인해서 작성해주세요" value="${dataMap.info.infoTime}"></td>
                    </tr>
                    <tr>
                        <th>휴무일</th>
                        <td><input type="text" name="dayOff" id="dayOff" placeholder="휴무일을 작성해주세요" value="${dataMap.info.dayOff}"></td>
                        <th>대표 번호 (고객문의용)</th>
                        <td><input type="text" name="infoCall" id="infoCall" placeholder="'-'포함해서 작성해주세요" value="${dataMap.info.infoCall}"></td>
                    </tr>
                    <tr>
                        <th>주차장 여부</th>
                        <td><input type="text" name="parking" id="parking" placeholder="주차장 여부(Y/N)를 작성해주세요" value="${dataMap.info.parking}"></td>
                        <th>장소의 분류</th>
                        <td><input type="number" name="infoType" id="infoType" placeholder="장소종류(1.여행, 2.맛집, 3.기타) - 숫자로 작성해주세요" value="${dataMap.info.infoType}"></td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td id="img-area" colspan="3">
                            <input type="file" name="upfile" id="upfile">
	                        <button type="button" id="removeImg">현재이미지삭제</button>
                            <div id="wrapSlide">
		                        <div id="float">
		                            <div class="float-img">
		                                <img src="resources/images/left.png" id="prev" >
		                            </div>
		                            <div id="slideArea">
		                                <img id="slideImage"/>
		                            </div>
		                            <div class="float-img">
		                                <img src="resources/images/right.png" id="next" >
		                            </div>
		                        </div>
		                        <div id="dotArea"></div>
		                    </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button onclick="history.back();">목록으로</button>
                <button type="button" id="submitBefore">수정하기</button>
            </div>
            <input type="hidden" name="boardContent" value="${dataMap.board.boardContent }">
            <input type="hidden" name="boardNo" value="${dataMap.board.boardNo }">
            <input type="hidden" name="infoNo" value="${dataMap.info.infoNo }">
        </form>
    </div>
    <%@include file="../../common/footer.jsp" %>
        <script type="text/javascript" src="resources/js/function.js"></script>
        <script>
            /* 사진 슬라이더로 보여주기 */
            var slideIndex = []; // 이미지경로 담을 배열 선언
         	// 텍스트 형식으로 넘어오니 객체로 바꿔주기위한 작업
    	   	const atTextArr = ("${dataMap.at}").replace(/Attachment/g, '').replace(/\(/g, '{').replace(/\)/g, '}').replace(/=/g, ':')
    	   										.replace(/(\w+):/g, '"$1":').replace(/:([^,{}\[\]]+)/g, ':"$1"');
    	    // 객체로 바꿔준것을 json화
    	   	const at = JSON.parse(atTextArr); 
    	    // 슬라이드에 사용할 배열에 파일경로 추출해서 넣어주기
    	   	for(var i in at){
    	   		slideIndex.push(at[i].filePath);
    	   	}
	    	$("hr").css("display", "none");
            $("#insert-form").css("display", "none"); 
            imgchange();
            
            /* 사진 슬라이더 */
            function imgchange(){
            	$("#dotArea").empty();
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
		        if(slideIndex.length==0){ // 사진이 없다면 영역 숨기기
		        	$("#slideImage").removeAttr("src");
		        	$("#removeImg").hide();
		        	$("#next").hide();
		        	$("#prev").hide();
		        }
            }
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
		    $("#removeImg").on("click", function(){
		    	var removeSrc = $("#slideImage").attr("src");
		    	var i = slideIndex.indexOf(removeSrc); // 이미지 src 들어있는 배열에서 존재하는지 확인
		    	if (i > -1) {
		    		slideIndex.splice(i, 1); // 해당 src배열만 제거
		    		imgchange(); // 도트랑 인덱스지정하는 부분 함수 호출
		    	}
		    });
		    $("#submitBefore").click(function(){
		    	var form = $("#update-form");
		    	
		    	var changeImg = makeTag("input",{"name":"changeImg", "value":JSON.stringify(slideIndex)});
		    	
		    	form.append(changeImg);
		    	form.submit();
		    })
        </script>
</body>
</html>
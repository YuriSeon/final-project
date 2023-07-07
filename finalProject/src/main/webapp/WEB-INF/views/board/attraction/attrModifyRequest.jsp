<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/attraction.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="css/text"></style>
</head>
<body>
    <%@include file="../../common/menubar.jsp" %>
	<div class="modifyRequest">
        <div class="title-area">
            <div class="float1">
                <h2>정보수정 요청 보내기</h2>
            </div>
            <div class="float2"> 
                <img src="resources/images/modify.png">
            </div>
        </div>
        <div class="checkbox-area">
            <div class="fieldset">
                <h6>수정요청을 원하는 항목을 체크해보세요!</h6>
                <table>
                    <tr>
                        <td>
                            <input type="checkbox" id="allCheck"><label for="allCheck">전체 선택</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="infoName"><label for="infoName">관광지명</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="introduce"><label for="introduce">소개 문구</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="infoAddress"><label for="infoAddress">주소(도로명 주소)</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="infoHomepage"><label for="infoHomepage">홈페이지 주소</label><br>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" name="info" id="infoTime"><label for="infoTime">이용시간</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="dayOff"><label for="dayOff">휴무일</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="infoCall"><label for="infoCall">대표번호(고객문의용)</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="parking"><label for="parking">주차장 여부</label>
                        </td>
                        <td>
                            <input type="checkbox" name="info" id="infoType"><label for="infoType">카테고리</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
        <form action="modifyRequest.attr" method="post" id="form">
            <input type="hidden" name="boardNo" value="${param.boardNo}">
            <input type="hidden" name="boardWriter" value="${loginUser.nickname}">
            
            <div class="modify-area">
                <div class="title">※ 요청사항 작성 </div>
            </div>
            <div class="btn-area">
                <button type="button" onclick="history.back();">뒤로가기</button>
                <button type="button" id="submit" onclick="submitBefore();">전송하기</button>
            </div>
        </form>
    </div>

    <%@include file="../../common/footer.jsp" %>
    <script type="text/javascript" src="resources/js/function.js"></script> 
    <script>
        // 여러번 사용할 것  변수처리
        var hr = $(".modifyRequest hr");
        var form = $(".modifyRequest form");
        var btn = $("#submit");
        var allCheck = $("#allCheck");
        var checkbox = $("input[name=info]");
        var boxLength = checkbox.length; // checkbox 총 개수
        
        // 체크전까지 숨기기
        hr.hide(); 
        form.hide();
        btn.hide();
        
        $(function(){
            /* 체크박스 전체 선택 여부 확인 */
            allCheck.click(function(){
                if(allCheck.is(":checked")){
                    checkbox.prop("checked", true);
                    for(var i=0; i<checkbox.length; i++){
                        createModifyArea($(checkbox[i]).attr("id"), $("input[name=info]:checked").length);
                    }
                } else {
                    checkbox.prop("checked", false);
                    for(var i=0; i<checkbox.length; i++){
                        removeModifyArea($(checkbox[i]).attr("id"), $("input[name=info]:checked").length);
                    }
                }
            });
            
            $(checkbox).on("change",function(){
                var id = $(this).attr("id") // 이벤트 대상의 id값
                var checkedLength = $("input[name=info]:checked").length; // checkbox 선택된 개수

                /* 체크 개수로 전체선택 체크 여부 확인*/
                if(boxLength==checkedLength){
                    allCheck.prop("checked", true);
                } else {
                    allCheck.prop("checked", false);
                }

                /* 체크박스 하나씩 선택됐을 경우 영역 추가 및 삭제 */
                if ($(this).is(":checked")){
                   createModifyArea(id, checkedLength);
                } else {
                    console.log("remove check"); 
                    removeModifyArea(id, checkedLength);
                }
            });

            /* 작성영역 keyup 이벤트 */
            var input = ".conwrap .after";
            $(document).on("keyup",input, function(){
                var changeImg = $(this).parents().eq(3).children().eq(0).children(); // 변경할 이미지 변수처리
                /* 수정사항 null 아닐시 체크아이콘 색상 변경 */
                if($(this).val()){
                    changeImg.css("content", "url('resources/images/check-green.png')");
                } else {
                    changeImg.css("content", "url('resources/images/check-red.png')");
                }
            });

            /* 제출버튼 인풋창 모두 작성됐을때만 나오도록 설정 */
            $(document).on("input", input, function(){
            	var allInputsFilled = true; // 모든 인풋창
                // 비어있는지 확인
                $(".modifyRequest input.after").each(function() {
                  if ($(this).val() === "") {
                    allInputsFilled = false;
                    return false; // 하나라도 비어있으면 루프 종료
                  }
                });
             	// 인풋창 비었는지 확인 후 제출버튼 숨김 or 보이기
                if (allInputsFilled) {
                    btn.show();
                } else {
                    btn.hide();
                }
            });
        });

        /* checkbox 선택시 영역생성 함수 */
        function createModifyArea(id, checkedLength){
            // 조회해온 값 넣어주기위해 객체 생성
            var sort = {
                infoName : "${info.infoName}",
                introduce : "${fn:split(dataMap.board.boardContent,'~~~~')[1] }",
                infoAddress : "${info.infoAddress}",
                infoHomepage : "${info.infoHomepage}",
                infoTime : "${info.infoTime}",
                dayOff : "${info.dayOff}",
                infoCall : "${info.infoCall}",
                parking : "${info.parking}",
                infoType : "${info.infoType}"
            }
            var modifyArea = makeTag("div",{"class":"modify"})
                                    .append(makeTag("div",{"class":"name"}).text("기존정보")
                                            , makeTag("div",{"class":"input-area"}).append(makeTag("input",{"type":"text","class":"before","readonly":"true","value":sort[id]}))
                                            , makeTag("div",{"class":"name"}).text("수정사항")
                                            , makeTag("div",{"class":"input-area"}).append(makeTag("input",{"type":"text","class":"after","name":"answer"})));
            var column = makeTag("div",{"class":"column"}).text($("#"+id).siblings().text()); // checked label
            var conArea = makeTag("div",{"class":"con"}).append(column,modifyArea);
            var checkImgArea = makeTag("div", {"class":"checkImg"}).append(makeTag("img",{"src":"resources/images/check-red.png"}));
            var conwrap = makeTag("div", {"class":"conwrap"}).append(checkImgArea,conArea); // 필요한 영역 전부 생성 후 담은 변수 
            $(".modify-area").append(conwrap); // form태그 안에 생성한 태그들 추가

            
            conwrap = ""; // 변수 비워주기 (중복생성막기)
            // 숨겼던 영역 보여주기
            hr.show();
            form.show();
        }

        /* checkbox 해제시 영역삭제 함수 */
        function removeModifyArea(id, checkedLength){
            if(checkedLength==0){  /* checkbox 전체 해제시 영역 삭제 함수 */
                $(".conwrap").remove(); // 클래스명으로 선택해 전체 삭제
                // 다시 숨기기
                hr.hide();
                form.hide();
            } else { 
                $(".conwrap .after").each(function(){ 
                    if($(this).attr("name")==id){ // input의 name값과 같다면 지워주기
                        $(this).parents().eq(3).eq(0).remove(); 
                    }
                });
            }
        }
        // 제출 전 작업
        function submitBefore(){
            $("input[name=answer]").each(function(){
                $(this).val = $(this).attr("class")+$(this).val();
                form.submit();
            })
        }
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/listMap.css?after">
<link rel="stylesheet" href="resources/css/attraction.css?after">
<title>Insert title here</title>
</head>
<style type="text/css"></style>
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
            <pre> 새롭게 업데이트 된 정보를 조회하고싶다면 검색해주세요 </pre>
        </div>
        <div class="serach-area">
            <input type="search" name="title" id="search-input" placeholder="조회를 원하는 관광지를 입력해주세요">
            <button onclick="mapSearch();">검색</button>
        </div>
        <hr>
        <form action="update.attr" method="post" id="update-form">
            <table>
                <thead>
                    <tr>
                        <th colspan="4"> ※ 관광지 내용 입력란 </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>관광지명</th>
                        <td colspan="3"><input type="text" name="infoName" id="infoName" placeholder="장소 이름을 작성해주세요" value="${info.infoName}"></td>
                    </tr>
                    <tr>
                        <th>핵심 소개 문구</th>
                        <td colspan="3"><input type="text" name="introduce" id="introduce" placeholder="30자까지만 작성해주세요" value="${introduce}"></td>
                    </tr>
                    <tr>
                        <th>주소 (도로명 주소)</th>
                        <td colspan="3"><input type="text" name="infoAddress" id="infoAddress" placeholder="도로명 주소로 작성해주세요" value="${info.infoAddress}"></td>
                    </tr>
                    <tr>
                        <th>홈페이지 주소</th>
                        <td colspan="3"><input type="text" name="infoHomepage" id="infoHomepage" placeholder="홈페이지 주소 또는 SNS 주소를 작성해주세요" value="${info.infoHomepage}"></td>
                    </tr>
                    <tr>
                        <th>이용시간</th>
                        <td colspan="3"><input type="text" name="infoTime" id="infoTime" placeholder="이용가능한 시간을 확인해서 작성해주세요" value="${info.infoTime}"></td>
                    </tr>
                    <tr>
                        <th>휴무일</th>
                        <td><input type="text" name="dayOff" id="dayOff" placeholder="휴무일을 작성해주세요" value="${info.dayOff}"></td>
                        <th>대표 번호 (고객문의용)</th>
                        <td><input type="text" name="infoCall" id="infoCall" placeholder="'-'포함해서 작성해주세요" value="${info.infoCall}"></td>
                    </tr>
                    <tr>
                        <th>주차장 여부</th>
                        <td><input type="text" name="parking" id="parking" placeholder="주차장 여부(Y/N)를 작성해주세요" value="${info.parking}"></td>
                        <th>장소의 분류</th>
                        <td><input type="number" name="infoType" id="infoType" placeholder="장소종류(1.여행, 2.맛집, 3.기타) - 숫자로 작성해주세요" value="${info.infoType}"></td>
                    </tr>
                    <tr>
                        <th>이미지</th>
                        <td id="img-area" colspan="3">
                            <input type="file" name="upfile">
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="btn-area">
                <button onclick="history.back();">목록으로</button>
                <button type="submit">수정하기</button>
            </div>
        </form>
    </div>
        <div class="modal fade" id="myMap">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title">관광지 등록 검색</h3>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modalBody">
                        <div class="map">
                            <div class="map_wrap">
                                <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                                <div id="menu_wrap" class="bg_white">
                                    <div class="option">
                                        <div>
                                            <form id="map-submit" onsubmit="searchPlaces(); return false;">
                                                키워드 : <input type="text" id="keyword" size="15"> 
                                                <button type="submit">검색하기</button> 
                                            </form>
                                        </div>
                                    </div>
                                    <hr>
                                    <ul id="placesList"></ul>
                                    <div id="pagination"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <%@include file="../../common/footer.jsp" %>
        <script type="text/javascript" src="resources/js/function.js"></script>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3f6edea42e65caf1e4e0b7f49028f282&libraries=services"></script>
        <script type="text/javascript" src="resources/js/listmap.js"></script>  
        <script>
            /* 지도로 검색어 넘기는 이벤트 */
            function mapSearch(){
                $("#keyword").prop("value", $('#search-input').val());
                $("#map-submit").submit();
                $("#myMap").modal('show');
                window.setTimeout(function() {
                    relayout();
                }, 0); 
            }
            /* 지도에서 리스트 클릭시 */
            $("#placesList").on("click", "li", function(){
                // 이벤트 대상 객체 매개변수로 넘겨줘서 검색하려는 대상 조회
                var infoName = infoFind(this, "div", 0); 
                var infoAddress = infoFind(this, "div", 1);
                $(".close").click();

                // 가져온 값으로 셀레니움으로 조회 후 값 넣어주기 
                $.ajax({
                    url : "searchInfo.attr",
                    data : {
                        infoName : infoName,
                        infoAddress : infoAddress
                    },
                    success : function(result){
                        console.log("성공");
                        if(result!=null){
                            $("#infoName").prop("value",result.infoName);
                            $("#introduce").prop("value",result); // 여기 가져오는 키값 작성하기
                            $("#infoAddress").prop("value", result.infoAddress);
                            $("#infoHomepage").prop("value", result.infoHomepage);
                            $("#infoTime").prop("value", result.infoTime);
                            $("#dayOff").prop("value", result.dayOff);
                            $("infoCall").prop("value",result.infoCall);
                            $("#parking").prop("value",result.parking);
                            $("#infoType").prop("value", result.infoType);
                            $("#img-area").append(makeTag("img", {"src":""})); // 이미지 가져오는거 마저작성하기
                        } else {
                            alert("맞는 정보가 없어서 가져오지 못했습니다 직접 작성해서 정보를 제공해주세요");
                        }
                    },
                    complete : function(){
                        console.log("일단 되긴 함");
                    }
                });
            });
        </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="main-schedule">
      <div class="container">
          <div class="row">
              <div class="col-lg-12">
                </div>
            </div>
        </div>
    </div>
    <div class="schedule-detail">
        <div id="title-area">
            <div id="main-title">
                <div id="title1">title 들어갈 부분</div>
                <div id="title2">일정날짜 테마 좋아요 뷰 즐겨찾기 신고</div>
            </div>
            <hr>
            <div id="total-path">
                여행 전체 경로 출력
            </div>
        </div>
        <div id="content-area">
            <div id="map-area">지도</div>
            <div id="img-path">
                <div id="img-area">사진 여러개면 넘기는 방식 버튼 만들기</div>
                <div id="path-area">
                    <div id="pay">total : total pay</div>
                    <div id="path">daily path a태그 반복문으로 출력</div>
                </div>
            </div>
        </div>
        <hr size="3">
        <div id="reply-area">
            <div id="reply-title">일정톡(댓글개수)</div>
            <div id="">
                <form action="" id="reply-form">
                    <div id="reply-back">
                        <input type="text" name="reply-content" placeholder="지금 보고계신 일정에 대해 댓글을 작성해주세요!">
                        <button type="submit">작성</button>
                    </div>
                </form>
            </div>
            <div id="reply-content">
                <div id="content-pack">
                    <div class="reply">
                        <div class="pro">프로필<img src="" alt=""></div>
                        <div class="con">댓글내용</div>
                        <div class="date">닉네임/작성일</div>
                        <div class="btn-type">
                            좋아요 신고
                        </div>
                    </div>
                    <div>
                        <div>
                            대댓글 영역 조건문 걸기 있을때만 생성
                            <div class="reply">
                                <div class="pro">프로필</div>
                                <div class="con">댓글내용</div>
                                <div class="date">닉네임/작성일</div>
                                <div class="btn-type">
                                    좋아요 신고
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="btn">
                <button>목록</button>
                <button>동행하기</button>
                <button>수정</button>
                <button>삭제</button>
            </div>
        </div>

    </div>
</body>
</html>
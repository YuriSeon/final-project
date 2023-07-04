package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.admin.model.vo.Visit;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

public interface AdminService {

	//대시보드 방문자 통계
	HashMap<String, Integer> countVisit();
	
	//대시보드 게시판 별 조회수
	ArrayList<Board> countList();
	
	//대시보드 여행지 방문 횟수
	HashMap<String, Integer> countMap();
	
	//대시보드 최근 신고 5개
	ArrayList<Report> currentReportList();
	
	//대시보드 최근 작성글 5개
	ArrayList<Board> currentBoardList();

	//대시보드 최근 문의글 5개
	ArrayList<Notice> currentQnatList();

	//==================================================공지사항===========================================================
	
	//공지사항 등록
	int insertNotice(Notice n, Attachment a);

	//공지사항 리스트 개수
	int noticeListCount();

	//공지사항 리스트
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	//공지사항 수정 페이지 이동
	Notice noticeSelect(int serviceNo);

	//공지사항 수정 파일 조회
	Attachment noticeFileSelect(int serviceNo);
	
	//공지사항 수정
	int noticeUpdate(Notice n, Attachment a);

	//공지사항 파일이 없을때 수정
	int noticeNewFileUpdate(Notice n, Attachment a);
	
	//공지사항 삭제
	int noticeDelete(int serviceNo);

	//공지사항 파일 삭제
	int noticeFileDelete(int serviceNo);

	//공지사항 검색 개수
	int noticeSearchCount(HashMap<String, String> map);

	//공지사항 검색 리스트
	ArrayList<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pi);
	
	//==================================================FAQ===========================================================
	
	//FAQ 등록
	int insertFAQ(Notice n);

	//FAQ 리스트 개수
	int faqListCount();

	//FAQ 리스트
	ArrayList<Notice> selectFAQList(PageInfo pi);
	
	//FAQ 수정 페이지 이동
	Notice faqSelect(int serviceNo);

	//FAQ 수정
	int faqUpdate(Notice n);

	//FAQ 삭제
	int faqDelete(int serviceNo);

	//FAQ 검색 개수
	int faqSearchCount(HashMap<String, String> map);

	//FAQ 검색 리스트
	ArrayList<Notice> faqSearchList(HashMap<String, String> map, PageInfo pi);

	
	//==================================================Q&A===========================================================

	//Q&A 리스트 개수
	int qnaListCount();

	//Q&A 리스트 조회
	ArrayList<Notice> selectQnaList(PageInfo pi);

	//Q&A 파일 조회
	ArrayList<Attachment> qnaFileSelect(int serviceNo);

	//Q&A 답변 조회
	ArrayList<Reply> qnaReplyList(int serviceNo);
	
	//Q&A 답변 등록
	int qnaReplyInsert(Reply r);

	//Q&A 답변 수정
	int qnaReplyUpdate(Reply r);
	
	//Q&A 답변 삭제
	int qnaReplyDelete(Reply r);

	//Q&A 검색 개수
	int qnaSearchCount(HashMap<String, String> map);

	//Q&A 검색 리스트
	ArrayList<Notice> qnaSearchList(HashMap<String, String> map, PageInfo pi);
	
	//==================================================신고관리===========================================================
	
	//신고관리 리스트 개수
	int reportListCount();

	//신고관리 리스트 조회
	ArrayList<Report> selectReportList(PageInfo pi);

	//신고 삭제
	int reportDelete(int reportNo);

	//신고 검색 개수
	int reportSearchCount(HashMap<String, String> map);

	//신고 검색 리스트 조회
	ArrayList<Notice> reportSearchList(HashMap<String, String> map, PageInfo pi);
	
	//신고 게시물 이동
	int boardChk(int boardNo);

	//신고 댓글 조회
	Reply replyChk(int replyNo);
	
	//신고 대댓글 조회
	Rereply rereplyChk(int replyNo);
	//==================================================회원관리===========================================================
	
	//회원 리스트 개수
	int memberListCount();

	//회원 리스트 조회
	ArrayList<Member> selectMemberList(PageInfo pi);

	//회원 탈퇴
	int memberDelete(int userNo);

	//회원 검색 개수
	int memberSearchCount(HashMap<String, String> map);

	//회원 검색 리스트 조회
	ArrayList<Member> memberSearchList(HashMap<String, String> map, PageInfo pi);

	//회원 관리 페이지 이동
	Member memberSelect(int userNo);

	//회원 수정
	int memberUpdate(Member m);

	//회원 정보 엑셀
	ArrayList<Member> memberExcelList();

	//회원 정보조회 게시물 개수
	List<Integer> boardCount(String nickname);

	//회원 프로필이미지 삭제
	int delProfileImg(String nickname);

	//회원 프로필 이미지 수정
	int memberUpdateImg(Attachment a);

	//회원 비밀번호 초기화
	void pwdUpdate(Member m);
	
	//회원 편집 접속기록 조회
	ArrayList<Visit> visitSelect(String nickname);
	
	//회원 계정 복구
	int memberRestore(int userNo);

	//회원 관리자 전환
	int changeAdmin(int userNo);
	
	//==================================================게시판관리===========================================================

	//게시글 축제 리스트 개수
	int festivalListCount();

	//게시글 축제 리스트 조회
	ArrayList<Board> selectFestivalList(PageInfo pi);

	//게시글 축제 검색 개수
	int festivalSearchCount(HashMap<String, String> map);
	
	//게시글 축제 검색 리스트 조회
	ArrayList<Board> festivalSearchList(HashMap<String, String> map, PageInfo pi);

	//게시글 축제 축제 삭제
	int festivalDel(Integer boardNo);

	//게시글 축제 수정 페이지 조회
	Board festivalSelect(int boardNo);

	//게시글 축제 수정 페이지 파일 조회
	ArrayList<Attachment> festivalFileSelect(int boardNo);

	//게시글 축제 수정 페이지 축제 조회
	Festival festivalFesSelect(int boardNo);

	//게시글 축제 수정 페이지 인포 조회
	Info festivalInfoSelect(int boardNo);

	//게시글 축제 수정
	int festivalUpdate(Board b, Info in, ArrayList<Attachment> list, Festival f);

	//게시글 축제 수정 파일 삭제
	int festivalFileDel(Integer fileNo);

	//게시글 테마 리스트 개수
	int themeListCount();

	//게시글 테마 리스트 조회
	ArrayList<Board> selectThemeList(PageInfo pi);

	//게시글 명소 리스트 개수
	int attractionListCount();

	//게시글 명소 리스트 조회
	ArrayList<Board> selectAttractionList(PageInfo pi);

	//게시글 피드 리스트 개수
	int feedListCount();
	
	//게시글 피드 리스트 조회
	ArrayList<Board> selectFeedList(PageInfo pi);

	//게시글 일정자랑 리스트 개수
	int scheduleListCount();

	//게시글 일정자랑 리스트 조회
	ArrayList<Board> selectScheduleList(PageInfo pi);

	//게시글 함께가치 리스트 개수
	int togetherListCount();

	//게시글 함께가치 리스트 조회
	ArrayList<Board> selectTogetherList(PageInfo pi);

	//게시글 축제 검색 개수
	int themeSearchCount(HashMap<String, String> map);

	//게시글 축제 검색 리스트 조회
	ArrayList<Board> themeSearchList(HashMap<String, String> map, PageInfo pi);

	//게시글 테마 보드 삭제
	int themeBoardDel(Integer boardNo);

	//게시글 테마 파일 조회
	ArrayList<Attachment> themeFilePath(Integer boardNo);
	
	//게시글 테마 파일 삭제
	int themeFileDel(Integer boardNo);

	//게시글 테마 테마 삭제
	int themeDel(Integer boardNo);

	//게시글 테마 인포 삭제
	int themeInfoDel(Integer boardNo);

	//게시글 테마 수정 테마 조회
	Theme themeSelect(int boardNo);

	//게시글 테마 수정
	int themeUpdate(Board b, Info in, ArrayList<Attachment> list, Theme m);

	//게시글 명소 검색 개수
	int attractionSearchCount(HashMap<String, String> map);

	//게시글 명소 검색 리스트 조회
	ArrayList<Board> attractionSearchList(HashMap<String, String> map, PageInfo pi);

	//게시글 피드 검색 개수
	int feedSearchCount(HashMap<String, String> map);

	//게시글 피드 검색 리스트 조회
	ArrayList<Board> feedSearchList(HashMap<String, String> map, PageInfo pi);

	//게시글 피드 사진 출력
	ArrayList<Attachment> feedSelectFile(int boardNo);



	


}

package com.kh.finalProject.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Repository
public class AdminDao {

	//대시보드 최근 신고 5개
	public ArrayList<Report> currentReportList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.currentReportList");
	}
	
	//==================================================공지사항===========================================================
	
	//공지사항 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertNotice",n);
	}

	//파일 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("adminMapper.insertAttachment",a);
	}

	//공지사항 리스트 개수
	public int noticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.noticeListCount");
	}

	//공지사항 리스트 조회
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectNoticeList",null,rowBounds);
	}

	//공지사항 수정 페이지 이동
	public Notice noticeSelect(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.selectOne("adminMapper.noticeSelect",serviceNo);
	}

	//공지사항 수정 파일 조회
	public Attachment noticeFileSelect(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.selectOne("adminMapper.noticeFileSelect",serviceNo);
	}

	//공지사항 수정
	public int noticeUpdate(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("adminMapper.noticeUpdate",n);
	}

	//공지사항 파일 수정
	public int attachmentUpdate(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.update("adminMapper.noticeFileUpdate",a);
	}

	//공지사항 수정 파일 추가
	public int noticeNewFileUpdate(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("adminMapper.noticeNewFileUpdate",a);
	}

	//공지사항 삭제
	public int noticeDelete(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("adminMapper.noticeDelete",serviceNo);
	}
	
	//공지사항 파일 삭제
	public int noticeFileDelete(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("adminMapper.noticeFileDelete",serviceNo);
	}

	//공지사항 검색 개수
	public int noticeSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.noticeSearchCount",map);
	}

	//공지사항 검색 리스트
	public ArrayList<Notice> noticeSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.noticeSearchList",map,rowBounds);
	}

	//==================================================FAQ===========================================================
	
	//FAQ 등록
	public int insertFAQ(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertNotice",n);
	}

	//FAQ 리스트 개수
	public int faqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.faqListCount");
	}

	//FAQ 리스트 조회
	public ArrayList<Notice> selectFAQList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectFAQList",null,rowBounds);
	}

	//FAQ 수정 페이지 이동
	public Notice faqSelect(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.selectOne("adminMapper.noticeSelect",serviceNo);
	}

	//FAQ 수정
	public int faqUpdate(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("adminMapper.noticeUpdate",n);
	}

	//FAQ 삭제
	public int faqDelete(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("adminMapper.noticeDelete",serviceNo);
	}

	//FAQ 검색 개수
	public int faqSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.faqSearchCount",map);
	}

	//FAQ 검색 리스트 조회
	public ArrayList<Notice> faqSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.faqSearchList",map,rowBounds);
	}

	//==================================================Q&A===========================================================
	
	//Q&A 리스트 개수
	public int qnaListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.qnaListCount");
	}

	//Q&A 리스트 조회
	public ArrayList<Notice> selectQnaList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectQnaList",null,rowBounds);
	}

	//Q&A 파일 조회
	public ArrayList<Attachment> qnaFileSelect(SqlSessionTemplate sqlSession, int serviceNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.noticeFileSelect",serviceNo);
	}
	
	//Q&A 답변 조회
	public ArrayList<Reply> qnaReplyList(SqlSessionTemplate sqlSession, int serviceNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.qnaReplyList",serviceNo);
	}

	//Q&A 답변 등록
	public int qnaReplyInsert(SqlSessionTemplate sqlSession, Reply r) {
		sqlSession.update("adminMapper.qnaAnswerStatus",r);
		return sqlSession.insert("adminMapper.qnaReplyInsert",r);
	}

	//Q&A 답변 수정
	public int qnaReplyUpdate(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("adminMapper.qnaReplyUpdate",r);
	}

	//Q&A 답변 삭제
	public int qnaReplyDelete(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("adminMapper.qnaReplyDelete",r);
	}

	//Q&A 검색 개수
	public int qnaSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.qnaSearchCount",map);
	}

	//Q&A 검색 리스트
	public ArrayList<Notice> qnaSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.qnaSearchList",map,rowBounds);
	}

	//=================================================신고관리===========================================================
	
	//신고관리 리스트 개수
	public int reportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.reportListCount");
	}

	//신고관리 리스트 조회
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectReportList",null,rowBounds);
	}

	//신고 삭제
	public int reportDelete(SqlSessionTemplate sqlSession, int reportNo) {
		return sqlSession.delete("adminMapper.reportDelete",reportNo);
	}

	//신고 검색 개수
	public int reportSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.reportSearchCount",map);
	}

	//신고 검색 리스트 조회
	public ArrayList<Notice> reportSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.reportSearchList",map,rowBounds);
	}

	//=================================================회원관리===========================================================
	
	//회원 리스트 개수
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.memberListCount");
	}

	//회원 리스트 조회
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList",null,rowBounds);
	}

	//회원 탈퇴
	public int memberDelete(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("adminMapper.memberDelete",userNo);
	}

	//회원 검색 개수
	public int memberSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.memberSearchCount",map);
	}

	//회원 검색 리스트 조회
	public ArrayList<Member> memberSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.memberSearchList",map,rowBounds);
	}

	//회원 관리 페이지 이동
	public Member memberSelect(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("adminMapper.memberSelect",userNo);
	}

	//회원 수정
	public int memberUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper.memberUpdate",m);
	}

	//회원 정보 엑셀
	public ArrayList<Member> memberExcelList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.memberExcelList");
	}

	//회원 정보 게시물 개수
	public List<Integer> boardCount(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectList("adminMapper.boardCount",nickname);
	}

	//회원 프로필 이미지 삭제
	public int delProfileImg(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.delete("adminMapper.delProfileImg", nickname);
	}
	
	//=================================================게시글관리===========================================================

	//게시글 축제 리스트 개수
	public int festivalListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.festivalListCount");
	}
	
	//게시글 축제 리스트 조회
	public ArrayList<Board> selectFestivalList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectFestivalList",null,rowBounds);
	}

	//게시글 축제 검색 개수
	public int festivalSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.festivalSearchCount",map);
	}
	
	//게시글 축제 검색 리스트 개수
	public ArrayList<Board> festivalSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.festivalSearchList",map,rowBounds);
	}

	//게시글 축제 수정 조회
	public Board festivalSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.festivalSelect",boardNo);
	}

	//게시글 축제 수정 파일 조회
	public ArrayList<Attachment> festivalFileSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.festivalFileSelect",boardNo);
	}

	//게시글 축제 수정 축제 조회
	public Festival festivalFesSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.festivalFesSelect",boardNo);
	}

	//게시글 축제 수정 인포 조회
	public Info festivalInfoSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.festivalInfoSelect",boardNo);
	}

	//게시글 축제 보드 수정 
	public int festivalUpdateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("adminMapper.festivalUpdateBoard",b);
	}

	//게시글 축제 인포 수정
	public int festivalUpdateInfo(SqlSessionTemplate sqlSession, Info in) {
		return sqlSession.update("adminMapper.festivalUpdateInfo",in);
	}

	//게시글 축제 파일 수정
	public int festivalUpdateAt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("adminMapper.festivalUpdateAt",at);
	}

	//게시글 축제 축제 수정
	public int festivalUpdateFes(SqlSessionTemplate sqlSession, Festival f) {
		return sqlSession.update("adminMapper.festivalUpdateFes",f);
	}

	//게시글 축제 수정 파일 삭제
	public int festivalFileDel(SqlSessionTemplate sqlSession, Integer fileNo) {
		return sqlSession.update("adminMapper.festivalFileDe", fileNo);
	}

	//게시글 테마 리스트 개수
	public int themeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.themeListCount");
	}

	//게시글 테마 리스트 조회
	public ArrayList<Board> selectThemeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectThemeList",null,rowBounds);
	}

	//게시글 명소 리스트 개수
	public int attractionListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.attractionListCount");
	}

	//게시글 명소 리스트 조회
	public ArrayList<Board> selectAttractionList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectAttractionList",null,rowBounds);
	}

	//게시글 피드 리스트 개수
	public int feedListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.feedListCount");
	}

	//게시글 피드 리스트 조회
	public ArrayList<Board> selectFeedList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectFeedList",null,rowBounds);
	}

	//게시글 일정자랑 리스트 개수
	public int scheduleListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.scheduleListCount");
	}

	//게시글 일정자랑 리스트 조회
	public ArrayList<Board> selectScheduledList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectScheduleList",null,rowBounds);
	}

	//게시글 함께가치 리스트 개수
	public int togetherListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.togetherListCount");
	}

	//게시글 함께가치 리스트 조회
	public ArrayList<Board> selectTogetherList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.selectTogetherList",null,rowBounds);
	}

	//게시글 테마 검색 개수
	public int themeSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.themeSearchCount",map);
	}

	//게시글 테마 검색 리스트 조회
	public ArrayList<Board> themeSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.themeSearchList",map,rowBounds);
	}

	//게시글 테마 보드 삭제
	public int themeBoardDel(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.delete("adminMapper.themeBoardDel",boardNo);
	}

	//게시글 테마 파일 삭제
	public int themeFileDel(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.delete("adminMapper.themeFileDel",boardNo);
	}

	//게시글 테마 테마 삭제
	public int themeDel(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.delete("adminMapper.themeDel",boardNo);
	}

	//게시글 테마 인포 삭제
	public int themeInfoDel(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.delete("adminMapper.themeInfoDel",boardNo);
	}

	//게시글 테마 파일 조회
	public ArrayList<Attachment> themeFilePath(SqlSessionTemplate sqlSession, Integer boardNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.themeFilePath",boardNo);
	}

	//게시글 축제 축제 삭제
	public int festivalDel(SqlSessionTemplate sqlSession, Integer boardNo) {
		return sqlSession.delete("adminMapper.festivalDel",boardNo);
	}

	//게시글 테마 수정 테마 조회
	public Theme themeSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.themeSelect",boardNo);
	}

	//게시글 테마 보드 수정
	public int themeUpdate(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("adminMapper.themeBoardUpdate", b);
	}

	//게시글 테마 인포 수정
	public int themeUpdate(SqlSessionTemplate sqlSession, Info in) {
		return sqlSession.update("adminMapper.themeInfoUpdate", in);
	}

	//게시글 테마 파일 수정
	public int themeUpdate(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("adminMapper.themeFileInsert", at);
	}

	//게시글 테마 테마 수정
	public int themeUpdate(SqlSessionTemplate sqlSession, Theme m) {
		return sqlSession.update("adminMapper.themeUpdate", m);
	}

	//게시글 축제 인포 수정
	public int festivalUpdate(SqlSessionTemplate sqlSession, Info in) {
		return sqlSession.update("adminMapper.festivalInfoUpdate", in);
	}

	//게시글 축제 축제 수정
	public int festivalUpdate(SqlSessionTemplate sqlSession, Festival f) {
		return sqlSession.update("adminMapper.festivalUpdate", f);
	}

	//게시글 명소 검색 개수
	public int attractionSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.attractionSearchCount",map);
	}

	//게시글 명소 검색 리스트 조회
	public ArrayList<Board> attractionSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map,
												 PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.attractionSearchList",map,rowBounds);
	}

	//게시글 피드 검색 개수
	public int feedSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.feedSearchCount",map);
	}

	//게시글 피드 검색 리스트 조회
	public ArrayList<Board> feedSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.feedSearchList",map,rowBounds);
	}

	//게시글 피드 사진 출력
	public ArrayList<Attachment> feedSelectFile(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.themeFilePath",boardNo);
	}


	
	

}

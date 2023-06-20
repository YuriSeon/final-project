package com.kh.finalProject.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.common.model.vo.PageInfo;

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

	

	
	

}

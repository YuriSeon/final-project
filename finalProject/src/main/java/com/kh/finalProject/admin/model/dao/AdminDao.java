package com.kh.finalProject.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class AdminDao {

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
	
	

}

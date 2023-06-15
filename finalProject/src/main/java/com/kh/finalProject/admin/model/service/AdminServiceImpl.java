package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.admin.model.dao.AdminDao;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//공지사항 등록
	@Override
	public int insertNotice(Notice n, Attachment a) {
		
		int result1 = adminDao.insertNotice(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.insertAttachment(sqlSession,a);
		}
		
		return result1*result2;
	}

	//공지사항 리스트 개수
	@Override
	public int noticeListCount() {
		int result =adminDao.noticeListCount(sqlSession);
		return result;
	}

	//공지사항 리스트
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession,pi);
	}

	//공지사항 수정 페이지 이동
	@Override
	public Notice noticeSelect(int serviceNo) {
		return adminDao.noticeSelect(sqlSession,serviceNo);
	}

	//공지사항 수정 파일 조회
	@Override
	public Attachment noticeFileSelect(int serviceNo) {
		return adminDao.noticeFileSelect(sqlSession,serviceNo);
	}
	
	//공지사항 수정
	@Override
	public int noticeUpdate(Notice n, Attachment a) {
		int result1 = adminDao.noticeUpdate(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.attachmentUpdate(sqlSession,a);
		}
		
		return result1*result2; 
	}

	//공지사항 파일이 없을때 수정
	@Override
	public int noticeNewFileUpdate(Notice n, Attachment a) {
		int result1 = adminDao.noticeUpdate(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.noticeNewFileUpdate(sqlSession,a);
		}
		
		return result1*result2;
	}
	
	//공지사항 삭제
	@Override
	public int noticeDelete(int serviceNo) {
		return adminDao.noticeDelete(sqlSession, serviceNo);
	}

	//공지사항 파일 삭제
	@Override
	public int noticeFileDelete(int serviceNo) {
		return adminDao.noticeFileDelete(sqlSession,serviceNo);
	}

	//공지사항 검색 개수
	@Override
	public int noticeSearchCount(HashMap<String, String> map) {
		return adminDao.noticeSearchCount(sqlSession,map);
	}

	//공지사항 검색 리스트
	@Override
	public ArrayList<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.noticeSearchList(sqlSession,map,pi);
	}


}

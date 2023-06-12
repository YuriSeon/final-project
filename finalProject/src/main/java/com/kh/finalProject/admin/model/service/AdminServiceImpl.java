package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
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
		return 0;
	}

	//공지사항 리스트
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return null;
	}

}

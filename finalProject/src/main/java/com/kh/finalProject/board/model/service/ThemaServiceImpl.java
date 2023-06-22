package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.ThemaDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;

@Service
public class ThemaServiceImpl implements ThemaService{
	
	@Autowired
	private ThemaDao themaDao;
	
	@Autowired
	private SqlSession sqlSession;

	//테마등록
	@Override
	@Transactional
	public int insertThema(Board b, Info in, ArrayList<Attachment> list, Theme m) {
		
		//보드등록
		int result = themaDao.insertThema(sqlSession,b);
		
		//장소등록
		int result2 = themaDao.insertThema(sqlSession,in);
		
		//첨부파일등록
		int result3 =1;
		for(Attachment at : list) {
		result3 = themaDao.insertThema(sqlSession,at);
		}
		
		//테마테이블 등록
		int result4 = themaDao.insertThema(sqlSession,m);
		return result*result2*result3*result4;
	}

	//리스트총갯수
	@Override
	public int selectListCount() {
		int result = themaDao.selectListCount(sqlSession);
		return result;
	}
	

}

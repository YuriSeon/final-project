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
import com.kh.finalProject.common.model.vo.PageInfo;

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

	//최신순 테마
	@Override
	public ArrayList<Board> selectThemaList(PageInfo pi) {
		ArrayList<Board> list = themaDao.selectThemaList(sqlSession,pi);
		return list;
	}

	//인기순 테마
	@Override
	public ArrayList<Board> selectRankingThemaList(PageInfo pi) {
		ArrayList<Board> list = themaDao.selectRankingThemaList(sqlSession,pi);
		return list;
	}

	//조회수 올리기
	@Override
	public int increaseCount(int boardNo) {
		int result = themaDao.increaseCount(sqlSession,boardNo);
		return result;
	}

	//상세페이지
	@Override
	public Board selectBoard(int boardNo) {
		Board b = themaDao.selectBoard(sqlSession,boardNo);
		return b;
	}

	//상세페이지 at
	@Override
	public ArrayList<Attachment> selectAttachment(int boardNo) {
		ArrayList<Attachment> list = themaDao.selectAttachment(sqlSession,boardNo);
		return list;
	}


}

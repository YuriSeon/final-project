package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.dao.AttractionDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class AttractionServiceImpl implements AttractionService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	AttractionDao atDao;

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertAttr(Info info, ArrayList<Attachment> atArr) {
		
		return atDao.insertAttr(sqlSession, info, atArr);
		
	}

}

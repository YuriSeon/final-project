package com.kh.finalProject.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.dao.FeedDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FeedDao feedDao;

	@Override
	public int insertFeed(Board b, ArrayList<Attachment> list) {
		int result = feedDao.insertBoard(sqlSession,b);
		int result2 = 1;
		for(Attachment at : list) {
			
			result2 *= feedDao.insertAttachment(sqlSession,at);
		}
		
		return result * result2;
	}

	@Override
	public int selectListCount() {
		int result =feedDao.selectListCount(sqlSession);
		return result;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		ArrayList<Board> list = feedDao.selectBoardList(sqlSession,pi);
		return list;
	}

	@Override
	public ArrayList<Attachment> selectAttachmentList() {
		ArrayList<Attachment> list = feedDao.selectAttachmentList(sqlSession);
		return list;
	}

}

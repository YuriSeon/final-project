package com.kh.finalProject.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.dao.FeedDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
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

	@Override
	@Transactional
	public int deleteFeed(int boardNo) {
		int result = feedDao.deleteFeed(sqlSession,boardNo);
		return result;
	}

	@Override
	public int ckHeart(int boardNo, String writer) {
		int result = feedDao.ckHeart(sqlSession,boardNo,writer);
		return result;
	}

	@Override
	public int deleteHeart(int boardNo, String writer) {
		
		int result = feedDao.deleteHeart(sqlSession,boardNo,writer);
		int result2 = 0;
		if(result>0) {			
			result2 = feedDao.updateDelete(sqlSession,boardNo);
		}
		return result * result2;
	}

	@Override
	public int insertHeart(int boardNo, String writer) {
		int result = feedDao.insertHeart(sqlSession,boardNo,writer);
		int result2 =0;
		if(result>0) {
			result2 = feedDao.updateInsert(sqlSession,boardNo);
		}
		return result*result2;
	}

	@Override
	public ArrayList<Good> selectGood() {
		ArrayList<Good> list = feedDao.selectGood(sqlSession);
		return list;
	}

	

}

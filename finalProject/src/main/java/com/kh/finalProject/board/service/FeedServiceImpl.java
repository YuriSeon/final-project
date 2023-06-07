package com.kh.finalProject.board.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.dao.FeedDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;

@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FeedDao feedDao;

	@Override
	public int insertFeed(Board b, ArrayList<Attachment> list) {
		int result = feedDao.insertBoard(sqlSession,b);
		int result2 = feedDao.insertAttachment(sqlSession,list);
		
		return result * result2;
	}

}

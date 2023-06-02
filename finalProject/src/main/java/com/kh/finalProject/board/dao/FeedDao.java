package com.kh.finalProject.board.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;


@Repository
public class FeedDao {

	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertBoard", b);
	}

	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> list) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertAttachment", list);
	}

}

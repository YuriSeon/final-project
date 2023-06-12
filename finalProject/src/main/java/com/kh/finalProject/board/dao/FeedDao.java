package com.kh.finalProject.board.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;


@Repository
public class FeedDao {

	//피드보드인서트
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertBoard", b);
	}

	//피드사진업로드
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertAttachment", at);
	}

	//리스트카운트
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("feedMapper.selectListCount");
	}

	//리스트 나오게하기
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectBoardList",null, rowBounds);
	}

	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectAttachmentList");
	}

}

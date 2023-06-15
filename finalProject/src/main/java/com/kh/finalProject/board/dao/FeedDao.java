package com.kh.finalProject.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
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

	//ATTACHMENT리스트나오게 하기
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectAttachmentList");
	}

	public int deleteFeed(SqlSessionTemplate sqlSession, int boardNo) {
		

        // Delete from BOARD table
        int result1 = sqlSession.delete("feedMapper.deleteBoard", boardNo);

        // Delete from ATTACHMENT table
        int result2 = sqlSession.delete("feedMapper.deleteAttachment", boardNo);
		return result1 + result2;
	}

	//good테이블 count세기
	public int ckHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);

	    return sqlSession.selectOne("feedMapper.ckHeart", params);
	}

	//good테이블 삭제
	public int deleteHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);
	    return sqlSession.delete("feedMapper.deleteHeart", params);
	}

	//board테이블 업데이트
	public int updateDelete(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateDelete", boardNo);
	}

	//good테이블 인서트
	public int insertHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);
	    return sqlSession.insert("feedMapper.insertHeart", params);
	}

	//board테이블 업데이트
	public int updateInsert(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		 return sqlSession.update("feedMapper.updateInsert", boardNo);
	}

	public ArrayList<Good> selectGood(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectGood");
	}

}

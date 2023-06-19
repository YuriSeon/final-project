package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class ScheduleDao {

	public int selectListCount(SqlSession sqlSession, String sort) {

		return sqlSession.selectOne("scheduleMapper.selectListCount", sort);
	}

	public ArrayList<Board> selectBoardList(SqlSession sqlSession, String sort, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("scheduleMapper.selectBoardList", sort, rowBounds);
	}

}
package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Path;
import com.kh.finalProject.board.model.vo.Plan;
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

	// board + plan 등록
	public int insertSchedule(SqlSession sqlSession, Plan plan) {
		return sqlSession.insert("scheduleMapper.insertSchedule", plan);
	}

	// path 등록
	public int insertPath(SqlSession sqlSession, Path path) {
		return sqlSession.insert("scheduleMapper.insertPath", path);
	}

	// path에 해당하는 infoNo 조회
	public int searchInfoNo(SqlSession sqlSession, Path path) {
		return sqlSession.selectOne("scheduleMapper.searchInfoNo", path);
	}
	
	// plan에 infoNo 추가해주기
	public int updatePlanInfoNo(SqlSession sqlSession, int infoNo) {
		return sqlSession.update("scheduleMapper.updatePlanInfoNo", infoNo);
	}


	

}

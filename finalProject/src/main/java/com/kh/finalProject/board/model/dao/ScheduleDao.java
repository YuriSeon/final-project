package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
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

	// 등록한 bno와 infoNo 조회해와서 등록에 이용
	public Board checkBno(SqlSession sqlSession, Plan plan) {
		return sqlSession.selectOne("scheduleMapper.checkBno", plan);
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
	public int updatePlanInfoNo(SqlSession sqlSession, Path path) {
		return sqlSession.update("scheduleMapper.updatePlanInfoNo", path);
	}

	// 디테일뷰 info랑 plan 조회
	public Plan selectBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("scheduleMapper.selectBoard", boardNo);
	}

	// 게획에 해당하는 info 목록 조회
	public Info selectInfo(SqlSession sqlSession, int infoNo) {
		return sqlSession.selectOne("scheduleMapper.selectInfo", infoNo);
	}

	// 계획에 해당하는 attach 목록조회
	public ArrayList<Attachment> selectAttachList(SqlSession sqlSession, int infoNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectAttachList", infoNo);
	}

	// 계획에 해당하는 path목록 조회
	public ArrayList<Path> selectPathList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("scheduleMapper.selectPathList", boardNo);
	}
	// board 삭제
	public int deleteBoard(SqlSession sqlSession, Plan plan) {
		return sqlSession.delete("scheduleMapper.deleteBoard", plan);
	}
	// plan 삭제
	public int deletePlan(SqlSession sqlSession, Plan plan) {
		return sqlSession.delete("scheduleMapper.deletePlan", plan);
	}
	// path 삭제
	public int deletePath(SqlSession sqlSession, Plan plan) {
		return sqlSession.delete("scheduleMapper.deletePlan", plan);
	}
	
	


	

}

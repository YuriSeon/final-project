package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class ThemaDao {

	//보드등록
	public int insertThema(SqlSession sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertBoard", b);
	}

	//장소등록
	public int insertThema(SqlSession sqlSession, Info in) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertInfo", in);
	}

	//첨부파일등록
	public int insertThema(SqlSession sqlSession, Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertAtt", at);
	}

	//테마테이블 등록
	public int insertThema(SqlSession sqlSession, Theme m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertThema", m);
	}

	//리스트총갯수
	public int selectListCount(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectListCount");
	}

	//최신순 테마
	public ArrayList<Board> selectThemaList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.selectThemaList", null, rowBounds);
	}

	//인기순 테마
	public ArrayList<Board> selectRankingThemaList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.selectRankingThemaList", null, rowBounds);
	}

	//조회수 올리기
	public int increaseCount(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("themaMapper.increaseCount", boardNo);
	}

	//상세페이지
	public Board selectBoard(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectBoard", boardNo);
	}

	//상세페이지 at
	public ArrayList<Attachment> selectAttachment(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("themaMapper.selectAttachment", boardNo);
	}

}

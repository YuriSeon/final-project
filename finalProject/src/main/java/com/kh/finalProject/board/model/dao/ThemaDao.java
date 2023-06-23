package com.kh.finalProject.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;

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

}

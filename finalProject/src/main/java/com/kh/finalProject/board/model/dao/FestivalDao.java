package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;

@Repository
public class FestivalDao {

	//보드 등록
	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("festivalMapper.insertBoard",b);
	}

	//장소 정보 등록
	public int insertInfo(SqlSession sqlSession, Info in) {
		return sqlSession.insert("festivalMapper.insertInfo",in);
	}

	//첨부파일 등록
	public int insertAt(SqlSession sqlSession, Attachment at) {
		return sqlSession.insert("festivalMapper.insertAt",at);
	}

	//페스티벌 등록
	public int insertFes(SqlSession sqlSession, Festival f) {
		return sqlSession.insert("festivalMapper.insertFe",f);
	}

}

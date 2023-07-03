package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Service;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class ServiceDao {

	//공지사항 총 리스트 수
	public int serCount(SqlSession sqlSession) {
		return sqlSession.selectOne("serviceMapper.serCount");
	}

	//페이징처리한 공지사항 리스트
	public ArrayList<Service> serList(SqlSession sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("serviceMapper.serList", null, rowBounds);
	}

	//공지사항 디테일
	public Service detailSer(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("serviceMapper.detailSer", boardNo);
	}

	//조회수 업
	public int countUp(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("serviceMapper.countUp", boardNo);
	}

	//이전글 가져오기
	public Service preSer(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("serviceMapper.preSer", boardNo);
	}
	//다음글 가져오기
	public Service nextSer(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("serviceMapper.nextSer", boardNo);
	}

	

}

package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class TogetherDao {

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("togetherMapper.selectListCount");
	}

	public ArrayList<TogetherVO> selectTogetherList(SqlSession sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("togetherMapper.selectTogetherList", null, new RowBounds(((pi.getCurrentPage()-1) * pi.getBoardLimit()), pi.getBoardLimit()));
	}
	
	public ArrayList<TogetherVO> optionSearch(SqlSession sqlSession, TogetherVO t) {
		return  (ArrayList)sqlSession.selectList("togetherMapper.optionSearch",t);
	}

	public int togetherApply(SqlSession sqlSession, int boardNo) {
		return sqlSession.insert("");
	}	

}

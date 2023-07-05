package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.TogetherApplyVO;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class TogetherDao {

	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("togetherMapper.selectListCount");
	}

	public ArrayList<TogetherVO> selectTogetherList(SqlSession sqlSession, PageInfo pi) {
		return (ArrayList)sqlSession.selectList("togetherMapper.selectTogetherList", null, new RowBounds(((pi.getCurrentPage()-1) * pi.getBoardLimit()), pi.getBoardLimit()));
	}
	
	public int selectOptionListCount(SqlSession sqlSession, TogetherVO t) {
		return sqlSession.selectOne("togetherMapper.selectOptionListCount",t);
	}
	
	public ArrayList<TogetherVO> optionSearch(SqlSession sqlSession, TogetherVO t, PageInfo pi) {
		return  (ArrayList)sqlSession.selectList("togetherMapper.optionSearch", t, new RowBounds(((pi.getCurrentPage()-1) * pi.getBoardLimit()), pi.getBoardLimit()));
	}

	public int togetherApply(SqlSession sqlSession, TogetherApplyVO ta) {
		return sqlSession.insert("togetherMapper.togetherApply",ta);
	}

	public TogetherVO togetherDetail(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("togetherMapper.togetherDetail",boardNo);
	}

	public ArrayList<TogetherApplyVO> applyParticipate(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("togetherMapper.applyParticipate",boardNo);
	}

	public int applyParticipateReject(SqlSession sqlSession, TogetherApplyVO ta) {
		return sqlSession.update("togetherMapper.applyParticipateReject",ta);
	}

	public int togetherChoiceCheck(SqlSession sqlSession, choice c) {
		return sqlSession.selectOne("togetherMapper.togetherChoiceCheck",c);
	}

	public int togetherYes(SqlSession sqlSession, choice c) {
		return sqlSession.insert("togetherMapper.togetherYes",c);
	}

	public int togetherNo(SqlSession sqlSession, choice c) {
		return sqlSession.delete("togetherMapper.togetherNo",c);
	}


}

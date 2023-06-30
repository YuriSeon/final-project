package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.TogetherDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.TogetherApplyVO;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class TogetherServiceImpl  implements TogetherService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private TogetherDao togetherDao;

	@Override
	@Transactional
	public int insertBoard(Board b, Attachment at, Plan p) {
		int result1 = sqlSession.insert("togetherMapper.insertBoard",b);
		int result2 = sqlSession.insert("togetherMapper.insertAttachment",at);
		int result3 = sqlSession.insert("togetherMapper.insertPlan",p);
		return result1*result2*result3;
	}

	@Override
	public int selectListCount() {
		return togetherDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<TogetherVO> selectTogetherList(PageInfo pi) {
		return togetherDao.selectTogetherList(sqlSession,pi);
	}
	
	@Override
	public int selectOptionListCount(TogetherVO t) {
		return togetherDao.selectOptionListCount(sqlSession,t);
	}	
	
	@Override
	public ArrayList<TogetherVO> optionSearch(TogetherVO t, PageInfo pi) {
		return togetherDao.optionSearch(sqlSession,t,pi);
	}

	@Override
	public int togetherApply(TogetherApplyVO ta) {
		return togetherDao.togetherApply(sqlSession, ta);
	}

	@Override
	public TogetherVO togetherDetail(int boardNo) {
		return togetherDao.togetherDetail(sqlSession,boardNo);
	}


	
}

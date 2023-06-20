package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.dao.ScheduleDao;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scDao;
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectListCount(String sort) {

		return scDao.selectListCount(sqlSession, sort);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String sort) {
		
		return scDao.selectBoardList(sqlSession, sort, pi);
	}

}

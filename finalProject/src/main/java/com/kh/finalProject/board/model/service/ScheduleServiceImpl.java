package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.ScheduleDao;
import com.kh.finalProject.board.model.vo.Attachment;
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

	// 일정 등록
	@Override
	@Transactional
	public int insertSc(HashMap<String, Object> dataMap) {
		// 데이터 등록 순서 board + plan -> path -> info + attachment + plan의 infoNo alter로 추가하기
		// 생성된 boardNo로 게시물 조회하고 해당 plan안에 있는 infoNo로 일정에 들어있는 장소들 조회하며 사진도 같이 조회할 예정이라 이 순서대로 등록해야 조회 가능
	}

}

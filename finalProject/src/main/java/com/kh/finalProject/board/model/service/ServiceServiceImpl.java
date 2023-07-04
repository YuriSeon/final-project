package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.dao.ServiceDao;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class ServiceServiceImpl implements ServiceService{

	@Autowired
	public SqlSession sqlSession;
	
	@Autowired
	public ServiceDao serviceDao;

	//공지사항 총 리스트 수
	@Override
	public int serCount() {
		return serviceDao.serCount(sqlSession);
	}

	//페이징 처리한 공지사항 리스트
	@Override
	public ArrayList<com.kh.finalProject.board.model.vo.Service> serList(PageInfo pi) {
		return serviceDao.serList(sqlSession, pi);
	}

	//공지사항 디테일
	@Override
	public com.kh.finalProject.board.model.vo.Service detailSer(int boardNo) {
		return serviceDao.detailSer(sqlSession, boardNo);
	}

	//조회수 업
	@Override
	public int countUp(int boardNo) {
		return serviceDao.countUp(sqlSession, boardNo);
	}

	//이전글 가져오기
	@Override
	public com.kh.finalProject.board.model.vo.Service preSer(int boardNo) {
		return serviceDao.preSer(sqlSession, boardNo);
	}
	//다음글 가져오기
	@Override
	public com.kh.finalProject.board.model.vo.Service nextSer(int boardNo) {
		return serviceDao.nextSer(sqlSession, boardNo);
	}
	
	

}

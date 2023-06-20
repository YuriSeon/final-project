package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.FestivalDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FestivalDao festivalDao;
	
	//트랜잭션 처리로 일괄처리
	@Override
	@Transactional
	public int insertFes(Board b, Info in, ArrayList<Attachment> list, Festival f) {
		
		//보드 등록
		int result =  festivalDao.insertBoard(sqlSession, b);
		//장소 정보 등록
		int result2 = festivalDao.insertInfo(sqlSession, in);
		//어태치먼트 등록
		int result3 = 1;
		for(Attachment at : list) {
			result3 *= festivalDao.insertAt(sqlSession, at);			
		}
		//페스티발 등록
		int result4 = festivalDao.insertFes(sqlSession, f);
		
		return result*result2*result3*result4;
	}

}

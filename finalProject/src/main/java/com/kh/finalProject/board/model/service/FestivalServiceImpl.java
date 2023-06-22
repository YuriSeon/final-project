package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.FestivalDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FestivalDao festivalDao;
	
	//축제 총 게시글
	@Override
	public int fesCount() {
		return festivalDao.fesCount(sqlSession);
	}
	
	//축제 리스트
	@Override
	public ArrayList<Board> fesList(PageInfo pi) {
		return festivalDao.fesList(sqlSession, pi);
	}
	
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

	//축제 조회
	@Override
	public Board detailFes(int boardNo) {
		return festivalDao.selectFes(sqlSession, boardNo);
	}
	//사진파일 조회
	@Override
	public ArrayList<Attachment> atList(int boardNo) {
		return festivalDao.atList(sqlSession,boardNo);
	}

	//조회수 올려주기
	@Override
	public int countUp(int boardNo) {
		return festivalDao.countUp(sqlSession, boardNo);
	}

	//찜하기 내역 조회
	@Override
	public int choiceCount(HashMap<String, String> info) {
		return festivalDao.choiceCount(sqlSession, info);
	}
	//찜하기
	@Override
	public int choiceCk(HashMap<String, String> info) {
		return festivalDao.choiceCk(sqlSession, info);
	}
	//찜하기 삭제
	@Override
	public int choiceDel(HashMap<String, String> info) {
		return festivalDao.choiceDel(sqlSession, info);
	}





}

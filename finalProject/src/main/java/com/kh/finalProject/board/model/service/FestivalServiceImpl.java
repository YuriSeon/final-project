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
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class FestivalServiceImpl implements FestivalService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private FestivalDao festivalDao;
	
	//축제 페이지 로드시 찜 리스트
	@Override
	public ArrayList<choice> choiList() {
		return festivalDao.choiList(sqlSession);
	}

	//축제 페이지 로드시 축제기간이 아닌 db는 상태값 N으로 바꿔주기
	@Override
	public int endFes() {
		return festivalDao.endFes(sqlSession);
	}
	//축제 페이지 로드시 축제 기간이면 상태값 y로 바꿔주기(예정 축제도 N으로 바뀌어져있기때문)
	@Override
	public int FesIng() {
		return festivalDao.fesIng(sqlSession);
	}
	
	//축제 총 게시글
	@Override
	public int fesCount(HashMap<String, String> keyword) {
		return festivalDao.fesCount(sqlSession, keyword);
	}
	
	//축제 리스트
	@Override
	public ArrayList<Board> fesList(HashMap<String, String> keyword, PageInfo pi) {
		return festivalDao.fesList(sqlSession, keyword, pi);
	}
	
	//마우스 올렸을시 축제 개수(날짜에 따른)
	@Override
	public int mouCount(String nowDay) {
		return festivalDao.mouCount(sqlSession, nowDay);
	}
	
	//게시글 검색시 게시글 수
	@Override
	public int selectSearchCount(HashMap<String, String> keyword) {
		return festivalDao.searchCount(sqlSession, keyword);
	}
	//게시글 검색시 게시글 리스트
	@Override
	public ArrayList<Festival> selectSearchList(HashMap<String, String> keyword, PageInfo pi) {
		return festivalDao.searchList(sqlSession, keyword, pi);
	}
	
	//축제 등록
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

	//축제 디테일 조회
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
	@Transactional
	@Override
	public int choiceCk(HashMap<String, String> info) {
		//찜하기
		int result = festivalDao.choiceCk(sqlSession, info);
		//찜 수 업데이트
		int result2 = festivalDao.choiceUp(sqlSession, info);
		return result*result2;
	}
	//찜하기 삭제
	@Transactional
	@Override
	public int choiceDel(HashMap<String, String> info) {
		//찜 삭제
		int result = festivalDao.choiceDel(sqlSession, info);
		//찜 수 업데이트
		int result2 = festivalDao.choiceDown(sqlSession, info);
		return result*result2;
		
	}
	//게시글의 총 찜 수 조회
	@Override
	public int choiAllCount(HashMap<String, String> info) {
		return festivalDao.choiAllCount(sqlSession, info);
	}

	//축제 디테일 페이지 로드시 주변 명소 불러오기
	@Override
	public ArrayList<Board> myungList(int boardNo) {
		return festivalDao.myungList(sqlSession, boardNo);
	}
}

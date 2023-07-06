package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class FestivalDao {
	
	//축제 페이지 로드시 축제 찜 리스트
	public ArrayList<choice> choiList(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("festivalMapper.choiList");
	}

	//축제 페이지 로드시 축제기간이 아닌 db는 상태값 N으로 바꿔주기
	public int endFes(SqlSession sqlSession) {
		return sqlSession.update("festivalMapper.endFes");
	}
	//축제 페이지 로드시 축제 기간이면 상태값 y로 바꿔주기(예정 축제도 N으로 바뀌어져있기때문)
	public int fesIng(SqlSession sqlSession) {
		return sqlSession.update("festivalMapper.fesIng");
	}

	//축제 총 게시글
	public int fesCount(SqlSession sqlSession, HashMap<String, String> keyword) {
		return sqlSession.selectOne("festivalMapper.fesCount", keyword);
	}
	
	//축제 리스트
	public ArrayList<Board> fesList(SqlSession sqlSession, HashMap<String, String> keyword, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("festivalMapper.fesList", keyword, rowBounds);
	}
	
	//마우스 올렸을시 축제 개수
	public int mouCount(SqlSession sqlSession, String nowDay) {
		return sqlSession.selectOne("festivalMapper.mouCount", nowDay);
	}
	
	//보드(게시글) 등록
	public int insertBoard(SqlSession sqlSession, Board b) {
		return sqlSession.insert("festivalMapper.insertBoard",b);
	}
	//장소 정보 등록
	public int insertInfo(SqlSession sqlSession, Info in) {
		return sqlSession.insert("festivalMapper.insertInfo",in);
	}
	//첨부파일 등록
	public int insertAt(SqlSession sqlSession, Attachment at) {
		return sqlSession.insert("festivalMapper.insertAt",at);
	}
	//페스티벌 등록
	public int insertFes(SqlSession sqlSession, Festival f) {
		return sqlSession.insert("festivalMapper.insertFe",f);
	}

	//축제 조회
	public Board selectFes(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("festivalMapper.selectFe", boardNo);
	}
	//사진 파일 조회
	public ArrayList<Attachment> atList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("festivalMapper.atList", boardNo);
	}

	//조회수 올려주기
	public int countUp(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("festivalMapper.countUp", boardNo);
	}

	//찜하기 내역 조회
	public int choiceCount(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("festivalMapper.choiceCount", info);
	}
	//찜하기 추가
	public int choiceCk(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.insert("festivalMapper.choiceCk", info);
	}
	//찜하기 -> 찜 수 +1 업데이트
	public int choiceUp(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.update("festivalMapper.choiceUp", info);
	}
	//찜하기 삭제
	public int choiceDel(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.delete("festivalMapper.choiceDel", info);
	}
	//찜 삭제 ->찜 수 -1 업데이트
	public int choiceDown(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.update("festivalMapper.choiceDown", info);
	}
	//게시글의 총 찜 수 조회
	public int choiAllCount(SqlSession sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("festivalMapper.choiAllCount", info);
	}

	//축제 디테일 페이지 로드시 주변 명소 불러오기
	public ArrayList<Board> myungList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("festivalMapper.myungList", boardNo);
	}
}

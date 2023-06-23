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
import com.kh.finalProject.common.model.vo.PageInfo;

@Repository
public class FestivalDao {

	//축제 총 게시글
	public int fesCount(SqlSession sqlSession) {
		return sqlSession.selectOne("festivalMapper.fesCount");
	}
	
	//축제 리스트
	public ArrayList<Board> fesList(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("festivalMapper.fesList", null, rowBounds);
	}
	
	//게시글 검색시 게시글 수
	public int searchCount(SqlSession sqlSession, HashMap<String, String> keyword) {
		return sqlSession.selectOne("festivalMapper.searchCount", keyword);
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
}

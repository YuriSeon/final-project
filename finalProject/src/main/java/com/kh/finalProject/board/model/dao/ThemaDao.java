package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Repository
public class ThemaDao {

	//보드등록
	public int insertThema(SqlSession sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertBoard", b);
	}

	//장소등록
	public int insertThema(SqlSession sqlSession, Info in) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertInfo", in);
	}

	//첨부파일등록
	public int insertThema(SqlSession sqlSession, Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertAtt", at);
	}

	//테마테이블 등록
	public int insertThema(SqlSession sqlSession, Theme m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertThema", m);
	}

	//리스트총갯수
	public int selectListCount(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectListCount");
	}

	//최신순 테마
	public ArrayList<Board> selectThemaList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.selectThemaList", null, rowBounds);
	}

	//인기순 테마
	public ArrayList<Board> selectRankingThemaList(SqlSession sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.selectRankingThemaList", null, rowBounds);
	}

	//조회수 올리기
	public int increaseCount(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("themaMapper.increaseCount", boardNo);
	}

	//상세페이지
	public Board selectBoard(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectBoard", boardNo);
	}

	//상세페이지 at
	public ArrayList<Attachment> selectAttachment(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("themaMapper.selectAttachment", boardNo);
	}

	//댓글입력
	public int insertReply(SqlSession sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.insertReply", r);
	}

	//댓글불러오기
	public ArrayList<Reply> selectReply(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("themaMapper.selectReply", boardNo);
	}

	//댓글삭제
	public int deleteReply(SqlSession sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("themaMapper.deleteReply", replyNo);
	}

	//댓글수정
	public int updateReply(SqlSession sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.update("themaMapper.updateReply", r);
	}

	//댓글신고 -신고테이블
	public int reportReply(SqlSession sqlSession, Report re) {
		// TODO Auto-generated method stub
		return sqlSession.insert("themaMapper.reportReply", re);
	}

	//댓글신고-멤버테이블
	public int reportUpdateMember(SqlSession sqlSession, String nickname) {
		// TODO Auto-generated method stub
		return sqlSession.update("themaMapper.reportUpdateMember",nickname);
	}

	//찜하기 테이블 확인
	public int ckChoice(SqlSession sqlSession, choice c) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.ckChoice", c);
	}

	//테이블 있으면 없애기
	public int deleteChoice(SqlSession sqlSession, choice c) {
		int result = sqlSession.delete("themaMapper.deleteChoice", c);
		
		//보드테이블업데이트
		int result2 = sqlSession.update("themaMapper.updateChoice", c.getBoardNo());
		return result+result2;
	}

	//테이블 없으면 넣기
	public int insertChoice(SqlSession sqlSession, choice c) {
		int result = sqlSession.insert("themaMapper.insertChoice", c);
		
		//보드테이블업데이트2
		int result2 = sqlSession.update("themaMapper.choiceUpdate", c.getBoardNo());
		return result + result2;
	}

	//찜하기이미지바꾸기
	public ArrayList<choice> selectChoice(SqlSession sqlSession, int boardNo) {

		return (ArrayList)sqlSession.selectList("themaMapper.selectChoice", boardNo);
	}

	//신고리스트
	public ArrayList<Report> selectReportList(SqlSession sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("themaMapper.selectReportList");
	}

	//검색리스트
	public int selectSearchListCount(SqlSession sqlSession, String zoneName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectSearchListCount", zoneName);
	}

	//검색 최신순
	public ArrayList<Board> selectThemaList(SqlSession sqlSession, PageInfo pi, String zoneName) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.searchThemaList", zoneName, rowBounds);
	}

	//검색 인기순
	public ArrayList<Board> selectRankingThemaList(SqlSession sqlSession, PageInfo pi, String zoneName) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("themaMapper.searchRankingThemaList", zoneName, rowBounds);
	}

	//댓글갯수
	public int selectReplyCount(SqlSession sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("themaMapper.selectReplyCount", boardNo);
	}

}

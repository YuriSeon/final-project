package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;


@Repository
public class FeedDao {

	//피드보드인서트
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertBoard", b);
	}

	//피드사진업로드
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertAttachment", at);
	}
	
	//장소등록
	public int insertInfo(SqlSessionTemplate sqlSession, Info in) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertInfo", in);
	}

	//리스트카운트
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("feedMapper.selectListCount");
	}

	//리스트 나오게하기
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectBoardList",null, rowBounds);
	}

	//ATTACHMENT리스트나오게 하기
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectAttachmentList");
	}

	//피드게시물삭제
	public int deleteFeed(SqlSessionTemplate sqlSession, int boardNo) {
		

        // Delete from BOARD table
        int result1 = sqlSession.delete("feedMapper.deleteBoard", boardNo);

        // Delete from ATTACHMENT table
        int result2 = sqlSession.delete("feedMapper.deleteAttachment", boardNo);
        //good테이블 삭제
        int result3 = sqlSession.delete("feedMapper.deleteGood", boardNo);
        //reply테이블 삭제
        int result4 = sqlSession.delete("feedMapper.replyDelete", boardNo);
        //rereply테이블 삭제
        int result5 = sqlSession.delete("feedMapper.deleteRereply",boardNo);
        //info테이블 삭제
        int result6 = sqlSession.delete("feedMapper.deleteInfo", boardNo);
		return result1 + result2 + result3+result4+result5+result6;
	}

	//good테이블 count세기
	public int ckHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);

	    return sqlSession.selectOne("feedMapper.ckHeart", params);
	}

	//good테이블 삭제
	public int deleteHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);
	    return sqlSession.delete("feedMapper.deleteHeart", params);
	}

	//board테이블 업데이트
	public int updateDelete(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateDelete", boardNo);
	}

	//good테이블 인서트
	public int insertHeart(SqlSessionTemplate sqlSession, int boardNo, String writer) {
		Map<String, Object> params = new HashMap<>();
	    params.put("boardNo", boardNo);
	    params.put("writer", writer);
	    return sqlSession.insert("feedMapper.insertHeart", params);
	}

	//board테이블 업데이트
	public int updateInsert(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		 return sqlSession.update("feedMapper.updateInsert", boardNo);
	}

	//좋아요
	public ArrayList<Good> selectGood(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectGood");
	}

	//프로필사진
	public ArrayList<Member> selectMember(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectMember");
	}

	//댓글인서트
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertReply", r);
	}

	//댓글삽입
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int refQno) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectReplyList", refQno);
	}

	//댓글삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("feedMapper.deleteReply", replyNo);
	}

	//댓글수정
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateReply", r);
	}

	//댓글신고
	public int reportReply(SqlSessionTemplate sqlSession, String nickname, Report rep) {
		//member테이블 업데이트
		int result = sqlSession.update("feedMapper.reportReply", nickname);
		
		//report테이블 업데이트
		
		int result2 = sqlSession.insert("feedMapper.report",rep);
		return result + result2;
	}

	//대댓글입력
	public int insertAnswer(SqlSessionTemplate sqlSession, Rereply re) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertAnswer", re);
	}

	//대댓글삽입
	public ArrayList<Rereply> selectRereply(SqlSessionTemplate sqlSession,int replyNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectRereply", replyNo);
	}

	//대댓글삭제
	public int deleteRere(SqlSessionTemplate sqlSession, int refRno) {
		// TODO Auto-generated method stub
		return sqlSession.delete("feedMapper.deleteRere", refRno);
	}

	//대댓글수정
	public int updateRere(SqlSessionTemplate sqlSession, Rereply re) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateRere", re);
	}

	//신고확인
	public boolean isAlreadyReported(SqlSessionTemplate sqlSession, Report rep) {
		
	    boolean isAlreadyReported = sqlSession.selectOne("feedMapper.alreadReport", rep);
		return isAlreadyReported;
	}

	//대댓글신고
	public int rereportReply(SqlSessionTemplate sqlSession, String nickname, Report rep) {
		int result = sqlSession.update("feedMapper.reportReply", nickname);
		
		int result2 = sqlSession.insert("feedMapper.insertReport", rep);
		return result + result2;
	}

	//게시물수정폼board
	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		
		return sqlSession.selectOne("feedMapper.selectBoard", boardNo);
	}

	//게시물수정폼attachment
	public ArrayList<Attachment> selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("feedMapper.selectAttachment", boardNo);
	}

	//게시물 수정 board
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateBoard", b);
	}

	//게시물 수정 attachment
	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.updateAttachment", at);
	}
	
	//게시물 수정 info
	public int updateInfo(SqlSessionTemplate sqlSession, Info in) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateInfo",in);
	}

	//게시물수정시 기존에 있던 사진지우기
	public int deleteAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("feedMapper.deleteAttachment", boardNo);
	}

	//인기순
	public ArrayList<Board> rankingBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("feedMapper.rankingBoardList",null, rowBounds);
	}

	//도시선택
	public ArrayList<Board> selectCityList(SqlSessionTemplate sqlSession, PageInfo pi, int city) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("feedMapper.selectCityList",city, rowBounds);
	}

	//도시선택 갯수
	public int selectListCount(SqlSessionTemplate sqlSession, int city) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("feedMapper.selectCityCount", city);
	}

	//게시물 신고업데이트
	public int reportBoard(SqlSessionTemplate sqlSession, String nickname) {
		// TODO Auto-generated method stub
		return sqlSession.update("feedMapper.updateMember", nickname);
	}

	//게시물 신고
	public int insertReport(SqlSessionTemplate sqlSession, Report re) {
		// TODO Auto-generated method stub
		return sqlSession.insert("feedMapper.insertReportBoard", re);
	}

	//도시선택 인기순
	public ArrayList<Board> selectRankingList(SqlSessionTemplate sqlSession, PageInfo pi, int city) {
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("feedMapper.selectRankingList", city, rowBounds);
	}

	//댓글갯수 리스트
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	

}

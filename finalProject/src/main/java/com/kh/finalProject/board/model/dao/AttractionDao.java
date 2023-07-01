package com.kh.finalProject.board.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.board.model.vo.choice;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class AttractionDao {
	
	// 지역번호 조회
	public static int selectZoneNo(SqlSession sqlSession, String address) {
		// 매개변수로 전달받은 주소로 시군구영역 뒤부터 찾아서 조회
		String zoneName = "";
		String[] strArr = address.split(" ");
		for(int i=strArr.length-1; i>=0; i--) {
			if(("시군구").contains(strArr[i].split("")[strArr[i].length()-1])) {
				zoneName = strArr[i]; // 일치하는 영역 담기
				break;
			}
		}
		return sqlSession.selectOne("attractionMapper.selectZoneNo", zoneName);
	}
	// 이미 등록된 장소인지 체크
	public static int checkInfo(SqlSession sqlSession, String infoAddress) {
		return sqlSession.selectOne("attractionMapper.checkInfo", infoAddress);
	}
	
	// board, info 등록
	public static int insertInfo(SqlSession sqlSession, Info info) {
		return sqlSession.insert("attractionMapper.insertInfo", info);
	}
	
	// 첨부파일 등록
	public static int insertAttachment(SqlSession sqlSession, Attachment at) {
		return sqlSession.insert("attractionMapper.insertAttachment", at); 
	}
	
	// 조회수 증가
	public int increaseCount(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("attractionMapper.increaseCount", boardNo);
	}

	// board 조회
	public Board selectBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("attractionMapper.selectBoard", boardNo);
	}
	
	// info 조회
	public Info selectInfo(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("attractionMapper.selectInfo", boardNo);
	}

	// board에 해당하는 첨부파일 조회
	public ArrayList<Attachment> selectAttachment(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectAttachment", boardNo);
	}
	
	// 댓글 등록
	public int insertReplyList(SqlSession sqlSession, Rereply r) {
		return sqlSession.insert("attractionMapper.insertReplyList", r);
	}

	// 대댓글 등록
	public int insertRereplyList(SqlSession sqlSession, Rereply r) {
		return sqlSession.insert("attractionMapper.insertRereplyList", r);
	}

	// 댓글 조회
	public ArrayList<Reply> selectReplyList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectReplyList", boardNo);
	}

	// 대댓글 조회
	public ArrayList<Rereply> selectRereplyList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectRereplyList", boardNo);
	}

	// 좋아요 조회
	public int goodSearch(SqlSession sqlSession, Good good) {
		return sqlSession.selectOne("attractionMapper.goodSearch", good);
	}

	// 찜 조회
	public int choiceSearch(SqlSession sqlSession, choice choice) {
		return sqlSession.selectOne("attractionMapper.choiceSearch", choice);
	}

	// 신고 조회
	public int reportSearch(SqlSession sqlSession, Report report) {
		return sqlSession.selectOne("attractionMapper.reportSearch", report);
	}

	// 좋아요 취소 
	public int deleteGood(SqlSession sqlSession, Good good) {
		return sqlSession.delete("attractionMapper.deleteGood", good);
	}

	// 찜 취소
	public int deletechoice(SqlSession sqlSession, choice choice) {
		return sqlSession.delete("attractionMapper.deletechoice", choice);
	}

	// 좋아요 등록
	public int insertGood(SqlSession sqlSession, Good good) {
		return sqlSession.insert("attractionMapper.insertGood", good);
	}

	// 찜 등록
	public int insertchoice(SqlSession sqlSession, choice choice) {
		return sqlSession.insert("attractionMapper.insertchoice", choice);
	}

	// 신고등록
	public int insertReport(SqlSession sqlSession, Report report) {
		return sqlSession.insert("attractionMapper.insertreport", report);
	}

	
	


}

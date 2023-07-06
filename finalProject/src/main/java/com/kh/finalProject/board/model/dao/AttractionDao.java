package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.board.model.vo.choice;

@Repository
@SuppressWarnings({ "unchecked", "rawtypes" })
public class AttractionDao {

	// 지역번호 조회
	public static int selectZoneNo(SqlSession sqlSession, String address) {
		// 매개변수로 전달받은 주소로 시군구영역 뒤부터 찾아서 조회
		String zoneName = "";
		String[] strArr = address.split(" ");
		switch(strArr[0]) {
		case "서울특별시" : strArr[0] = "서울"; break;
		case "부산광역시" : strArr[0] =  "부산"; break;
		case "대구광역시" : strArr[0] =  "대구"; break;
		case "인천광역시" : strArr[0] =  "인천"; break;
		case "광주광역시" : strArr[0] =  "광주"; break;
		case "대전광역시" : strArr[0] =  "대전"; break;
		case "울산광역시" : strArr[0] =  "울산"; break;
		case "세종특별자치시" : strArr[0] = "세종"; break;
		case "경기도" : strArr[0] =  "경기"; break;
		case "강원도" : strArr[0] =  "강원"; break;
		case "충청북도" : strArr[0] = "충북"; break; 
		case "충청남도" : strArr[0] = "충남"; break; 
		case "전라북도" : strArr[0] = "전북"; break; 
		case "전라남도" : strArr[0] = "전남"; break;
		case "경상북도" : strArr[0] = "경북"; break;
		case "경상남도" : strArr[0] = "경남"; break;
		case "제주특별자치도" : strArr[0] = "제주";
		}
		zoneName = strArr[0]+" "+strArr[1];
		System.out.println(zoneName);
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

	// 댓글 조회
	public ArrayList<Rereply> selectReplyList(SqlSession sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectReplyList", boardNo);
	}
	
	// 댓글 삭제
	public int deleteReply(SqlSession sqlSession, Rereply r) {
		return sqlSession.update("attractionMapper.deleteReply", r);
	}

	// 좋아요 조회
	public int goodSearch(SqlSession sqlSession, Good good) {
		return sqlSession.selectOne("attractionMapper.goodSearch", good);
	}

	// 찜 조회
	public int choiceSearch(SqlSession sqlSession, choice choice) {
		return sqlSession.selectOne("attractionMapper.choiceSearch", choice);
	}

	// 좋아요 취소
	public int deleteGood(SqlSession sqlSession, Good good) {
		int result = sqlSession.delete("attractionMapper.deleteGood", good);
		result *= sqlSession.update("attractionMapper.deletegoodcount", good);
		if(result>0) {
			result = sqlSession.selectOne("attractionMapper.goodCount",good);
		} 
		return result;
	}

	// 찜 취소
	public int deletechoice(SqlSession sqlSession, choice choice) {
		int result = sqlSession.delete("attractionMapper.deletechoice", choice);
		result *= sqlSession.update("attractionMapper.deletechoicecount", choice);
		if(result>0) {
			result = sqlSession.selectOne("attractionMapper.choiceCount",choice);
		}
		return result;
	}

	// 좋아요 등록
	public int insertGood(SqlSession sqlSession, Good good) {
		int result = sqlSession.insert("attractionMapper.insertGood", good);
		result *= sqlSession.update("attractionMapper.updategoodcount", good);
		if(result>0) {
			result = sqlSession.selectOne("attractionMapper.goodCount",good);
		}
		return result;
	}

	// 찜 등록
	public int insertchoice(SqlSession sqlSession, choice choice) {
		int result = sqlSession.insert("attractionMapper.insertchoice", choice);
		result *= sqlSession.update("attractionMapper.updatechiocecount", choice);
		if(result>0) {
			result = sqlSession.selectOne("attractionMapper.choiceCount",choice);
		}
		return result;
	}
	// 좋아요 수
	public int goodCount(SqlSession sqlSession, Good good) {
		return sqlSession.selectOne("attractionMapper.goodCount",good);
	}

	// 찜 수
	public int choiceCount(SqlSession sqlSession, choice choice) {
		return sqlSession.selectOne("attractionMapper.choiceCount",choice);
	}

	// 신고등록
	public int sendReport(SqlSession sqlSession, Report report) {
		System.out.println(report);
		return sqlSession.insert("attractionMapper.sendReport", report);
	}

	// 게시물 신고수 업데이트
	public int updateReport(SqlSession sqlSession, Report report) {
		return sqlSession.update("attractionMapper.updateReport", report);
	}

	// 관리자에게 내용 수정 요정 페이지 로드 전 조회
	public Info modifyRequestAttr(SqlSession sqlSession, int boardNo) {
		return sqlSession.selectOne("attractionMapper.modifyRequestAttr", boardNo);
	}

	// 관리자에게 게시물 내용 수정 요청
	public int modifyinfo(SqlSession sqlSession, Board b) {
		return sqlSession.insert("attractionMapper.modifyinfo", b);
	}

	// board삭제
	public int deleteBoard(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("attractionMapper.deleteBoard", boardNo);
	}

	// info삭제
	public int deleteInfo(SqlSession sqlSession, int boardNo) {
		return sqlSession.update("attractionMapper.deleteInfo", boardNo);
	}

	// 첨부파일 삭제(게시판번호로 삭제)
	public int deleteAttachment(SqlSession sqlSession, int boardNo) {
		return sqlSession.delete("attractionMapper.deleteAttachment", boardNo);
	}
	
	// board update
	public int updateBoard(SqlSession sqlSession, Info info) {
		return sqlSession.update("attractionMapper.updateBoard", info);
	}

	// info update
	public int updateInfo(SqlSession sqlSession, Info info) {
		return sqlSession.update("attractionMapper.updateInfo", info);
	}

	// attachment 삭제 (체인지네임으로)
	public int updateAttachment(SqlSession sqlSession, Attachment at) {
		return sqlSession.delete("attractionMapper.updateAttachment", at);
	}

	// update페이지에서 추가로 파일 등록
	public int updateFile(SqlSession sqlSession, Attachment at) {
		return sqlSession.insert("attractionMapper.insertAttachment", at);
	}

	// 키워드로 보드 검색
	// 리스트 수
	public int selectListCount(SqlSession sqlSession, String keyword) {
		return sqlSession.selectOne("attractionMapper.selectListCount", keyword);
	}
	// 게시글 
	public ArrayList<Board> selectBoardList(SqlSession sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectBoardList", keyword);
	}
	//info 정보
	public ArrayList<Info> selectInfo(SqlSession sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("attractionMapper.selectInfoList", keyword);
	}
	

	


}

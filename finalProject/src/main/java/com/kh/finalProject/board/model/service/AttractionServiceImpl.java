package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.dao.AttractionDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class AttractionServiceImpl implements AttractionService {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	AttractionDao atDao;

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return null;
	}
	
	// 게시물 등록
	@Override
	@Transactional
	public int insertAttr(Info info, ArrayList<Attachment> atArr) {
		// 주소로 지역번호 조회해와서 넣어주기
		int zoneNo = AttractionDao.selectZoneNo(sqlSession, info.getInfoAddress());
		info.setZoneNo(zoneNo); 
		// board, info 데이터 등록
		int result = AttractionDao.insertInfo(sqlSession, info); 
		// 첨부파일 개수만큼 반복해서 등록
		int result2 = 1;
		for(Attachment at : atArr) { 
			result2 *= AttractionDao.insertAttachment(sqlSession, at);
		}
		return result*result2;
	}
	
	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return atDao.increaseCount(sqlSession, boardNo);
	}

	//디테일뷰 페이지
	@Override
	public HashMap<String, Object> attrDetail(int boardNo) {
		HashMap<String, Object> dataMap = new HashMap<>(); // 조회해온 값 담을 map
		// board 조회
		dataMap.put("board", atDao.selectBoard(sqlSession, boardNo));
		// info 조회
		dataMap.put("info", atDao.selectInfo(sqlSession, boardNo));
		// attachment 조회
		dataMap.put("at", atDao.selectAttachment(sqlSession, boardNo));
		
		return dataMap;
	}

	// 댓글 등록
	@Override
	public int insertReply(Rereply r) {
		int result = 0;
		if(r.getRefRno()==0) { // 참조게시글 번호가 없다면 댓글
			// reply 등록
			result = atDao.insertReplyList(sqlSession, r);
		} else {
			// reReply 등록
			result = atDao.insertReplyList(sqlSession, r);
		}
		return result;
	}
	
	// 댓글삭제
	@Override
	public int deleteReply(Rereply r) {
		return atDao.deleteReply(sqlSession, r);
	}
	// 댓글조회
	@Override
	public ArrayList<Rereply> selectReplyList(int boardNo) {
		return atDao.selectReplyList(sqlSession, boardNo);
	}

	// 좋아요, 찜, 신고 조회 //나중에 if로 수정 !!!
	@Override
	public int iconCheck(String btnType, int boardno, String writer) {
		int result = 100; // 조회 오류 확인용 초기화
		if(btnType.equals("good")) {
			result = atDao.goodSearch(sqlSession,new Good(boardno, writer)); 
		} else {
			result = atDao.choiceSearch(sqlSession,new choice(boardno, writer));
		}
		return result;
	}

	// 좋아요 찜 취소
	@Override
	public int iconBefore(String btnType, String tableName, int no, String writer) {
		int result = 100;
		if(btnType.equals("good")) {
			result = atDao.deleteGood(sqlSession,new Good(no, writer));
		} else {
			result = atDao.deletechoice(sqlSession,new choice(no, writer));
		}
		return result;
	}

	// 좋아요, 찜 등록
	@Override
	public int iconAfter(String btnType, String tableName, int no, String writer) {
		int result = 100;
		if(btnType.equals("good")) {
			result = atDao.insertGood(sqlSession,new Good(no, writer));
		} else {
			result = atDao.insertchoice(sqlSession,new choice(no, writer));
		}
		return result;
	}
	
	// 신고하기 
	@Override
	public int sendReport(Report report) {
		return atDao.sendReport(sqlSession, report); 
	}

	// 기존 정보 있는지 체크
	@Override
	public int checkInfo(String address) {
		return AttractionDao.checkInfo(sqlSession, address);
	}

	// 내용 수정 요청 페이지 이동 전 조회
	@Override
	public Info modifyRequestAttr(int boardNo) {
		return atDao.modifyRequestAttr(sqlSession, boardNo);
	}

	// 관리자에게 게시물 수정 요청
	@Override
	public int modifyinfo(Board b) {
		return atDao.modifyinfo(sqlSession, b);
	}

	// 게시물 삭제 및 첨부파일 삭제
	@Override
	@Transactional
	public int deleteAttr(int boardNo, ArrayList<String> at) {
		int result = atDao.deleteBoard(sqlSession, boardNo);
		result *= atDao.deleteInfo(sqlSession, boardNo);
		int result2= 1;
		if(!(at.get(0)).equals("")) {
			result2 *= atDao.deleteAttachment(sqlSession, boardNo);
		}
		return result*result2;
	}
	
	// 게시물 수정 및 첨부파일 첨삭
	@Override
	@Transactional
	public int updateAttr(Info info, ArrayList<Attachment> removeList, Attachment at) {
		// board 수정
		int result = atDao.updateBoard(sqlSession, info);
		System.out.println(info);
		// info 수정
		result = atDao.updateInfo(sqlSession, info);
		int result2 = 1;
		System.out.println("????"+removeList);
		// attachment 수정
		for(int i=0; i<removeList.size(); i++) {
			result2 = atDao.updateAttachment(sqlSession, removeList.get(i));
		}
		// 새로운 파일 등록
		int result3 =1;
		System.out.println(result);
		System.out.println(result2);
		
		if(at.getOriginName()!=null) { // 비어있지 않다면 
			result3 = atDao.updateFile(sqlSession, at);
		}
		System.out.println(result3);
		return result*result2*result3;
	}

	// 첨부파일 변화 확인용 조회 메소드
	@Override
	public ArrayList<Attachment> selectAttachment(int boardNo) {
		return atDao.selectAttachment(sqlSession, boardNo);
	}
	
	

	

}

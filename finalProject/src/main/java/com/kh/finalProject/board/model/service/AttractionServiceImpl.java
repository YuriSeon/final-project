package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.AttractionDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
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
		int zoneNo = atDao.selectZoneNo(sqlSession, info.getInfoAddress());
		info.setZoneNo(zoneNo); 
		// board, info 데이터 등록
		int result = atDao.insertInfo(sqlSession, info); 
		// 첨부파일 개수만큼 반복해서 등록
		for(Attachment at : atArr) { 
			result += atDao.insertAttachment(sqlSession, at);
		}
		return result;
	}
	
	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return atDao.increaseCount(sqlSession, boardNo);
	}

	// 디테일뷰 페이지
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
		if(r.getReplyNo()==0) { // 참조게시글 번호가 없다면 댓글
			// reply 조회
			result = atDao.insertReplyList(sqlSession, r);
		} else {
			// reReply 조회
			result = atDao.insertRereplyList(sqlSession, r);
		}
		return result;
	}

}

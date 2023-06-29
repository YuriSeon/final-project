package com.kh.finalProject.board.model.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;

@Repository
@SuppressWarnings({"unchecked", "rawtypes"})
public class AttractionDao {
	
	// 지역번호 조회
	public int selectZoneNo(SqlSession sqlSession, String address) {
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
	
	// board, info 등록
	public int insertInfo(SqlSession sqlSession, Info info) {
		return sqlSession.insert("attractionMapper.insertInfo", info);
	}
	
	// 첨부파일 등록
	public int insertAttachment(SqlSession sqlSession, Attachment at) {
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
	


	

}

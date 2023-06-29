package com.kh.finalProject.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
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

	// 게시물등록
	public int insertAttr(SqlSession sqlSession, Info info, ArrayList<Attachment> atArr) {
		info.setZoneNo(selectZoneNo(sqlSession, info.getInfoAddress())); // 주소로 지역번호 조회해와서 넣어주기
		int result = sqlSession.insert("attractionMapper.insertInfo", info);
		
		// 첨부파일 개수만큼 반복해서 등록
		for(Attachment at : atArr) {
			result += sqlSession.insert("attractionMapper.insertAttachment", at); 
		}
		return result;
	}

}

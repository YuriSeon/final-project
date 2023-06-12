package com.kh.finalProject.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;

@Repository
public class AdminDao {

	//공지사항 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {

		return sqlSession.insert("adminMapper.insertNotice",n);
	}

	//파일 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		
		return sqlSession.insert("adminMapper.insertAttachment",a);
	}

}

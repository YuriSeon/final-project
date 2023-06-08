package com.kh.finalProject.member.model.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.member.model.dao.MemberDao;
import com.kh.finalProject.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private ServletContext ServletContext;
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	//회원가입
	@Override
	public int insertMember(Member m) {
		return 0;
	}

	@Override
	public int updateSurvey(Member m) {
		return memberDao.updateSurvey(sqlSession,m);
	}

	//프로필 사진 업데이트
	@Override
	public int updateImg(Attachment a) {
		
		Attachment att = memberDao.selectAttachment(sqlSession,a);
		
		String nicknameCheck = null;
		
		if (att != null) {
			nicknameCheck = att.getWriter();
			String filePath = ServletContext.getRealPath("/"+att.getFilePath()+att.getChangeName());
			File file = new File(filePath);
			file.delete();
		}
		
		if (a.getWriter() == nicknameCheck) {
			return memberDao.updateImg(sqlSession,a);
		}else {
			return memberDao.insertImg(sqlSession,a);
		}
		
	}

	//프로필용 멤버 조회
	@Override
	public Member loginMemberNick(String nickname) {
		return memberDao.loginMemberNick(sqlSession, nickname);
	}

	//프로필 사진 삭제
	@Override
	public int deleteImg(String nickname) {
		return memberDao.deleteImg(sqlSession, nickname);
	}

	
}

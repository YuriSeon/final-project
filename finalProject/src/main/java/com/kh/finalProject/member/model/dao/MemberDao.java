package com.kh.finalProject.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.member.model.vo.Member;

@Repository
public class MemberDao {
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	//아이디 중복 확인
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	//닉네임 중복 확인
	public int nickCheck(SqlSessionTemplate sqlSession, String checkNick) {
		return sqlSession.selectOne("memberMapper.nickCheck", checkNick);
	}
	
	//설문지 업데이트
	public int updateSurvey(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateSurvey", m);
	}
		
	//회원가입
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
		
	//첨부파일 프로필사진 조회
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.selectOne("memberMapper.selectAttachment", a);
	}
		
	//프로필 사진 추가
	public int insertImg(SqlSessionTemplate sqlSession, Attachment a) {
			return sqlSession.update("memberMapper.insertImg", a);
	}
		
	//프로필 사진 업데이트
	public int updateImg(SqlSessionTemplate sqlSession, Attachment a) {
			return sqlSession.update("memberMapper.updateImg", a);
	}

	//프로필용 멤버 조회
	public Member loginMemberNick(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.selectOne("memberMapper.loginMemberNo", nickname);
	}

	//프로필 사진 삭제
	public int deleteImg(SqlSessionTemplate sqlSession, String nickname) {
		return sqlSession.delete("memberMapper.deleteImg", nickname);
	}

		public Member loadProfile(SqlSessionTemplate sqlSession, String nickname) {
			return (Member)sqlSession.selectOne("memberMapper.loadProfile",nickname);
		}

}

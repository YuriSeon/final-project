package com.kh.finalProject.member.model.service;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	//회원가입
	int insertMember(Member m);

	//로그인
	Member loginMember(Member m);
		
	//설문 결과 업데이트
	int updateSurvey(Member m);
	
	//프로필 사진 업데이트
	int updateImg(Attachment a);

	//프로필용 멤버 조회
	Member loginMemberNick(String nickname);

	//프로필 사진 삭제
	int deleteImg(String nickname);

	//프로필 조회
	Member loadProfile(String nickname);
}

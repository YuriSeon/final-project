package com.kh.finalProject.member.model.service;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	//회원가입
	int insertMember(Member m);
	
	//로그인
	Member loginMember(Member m);
		
	//설문 결과 업데이트
	int updateSurvey(Member m);

	//아이디 중복 확인
	int idCheck(String checkId);

	//닉네임 중복 확인
	int nickCheck(String checkNick);
}

package com.kh.finalProject.member.model.service;

import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	//로그인
	Member loginMember(Member m);
		
	//회원가입
	int insertMember(Member m);
		
}

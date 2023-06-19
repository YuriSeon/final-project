package com.kh.finalProject.member.model.service;

import java.util.ArrayList;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.common.model.vo.PageInfo;
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
	
	//프로필 사진 업데이트
	int updateImg(Attachment a);

	//프로필용 멤버 조회
	Member loginMemberNick(String nickname);

	//프로필 사진 삭제
	int deleteImg(String nickname);

	//프로필 조회
	Member loadProfile(String nickname);

	//마이페이지 Q&A 질문 등록
	int myQnaInsert(Notice n);

	//마이페이지 Q&A 질문 파일 등록
	int myQnaFileInsert(Attachment a);

	//마이페이지 Q&A 개수
	int myQnaCount(String nick);

	//마이페이지 Q&A 리스트 조회
	ArrayList<Notice> myQnaList(PageInfo pi, String nick);
}

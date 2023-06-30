package com.kh.finalProject.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

public interface MemberService {

	//회원가입
	int insertMember(Member m);
	
	//로그인
	Member loginMember(Member m);
	
	//아이디 찾기 조회(인증번호 발송)
	int searchId(HashMap<String, String> info);
	//아이디 찾기 진행시 아이디 리스트
	Member searchIdMem(HashMap<String, String> info);
	
	//비밀번호 찾기 조회(인증번호 발송)
	int searchPwd(HashMap<String, String> info);
	//비밀번호 재설정
	int pwdRe(HashMap<String, String> info);
		
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

	//마이페이지 작성글 개수
	int myWritingCount(String nick);

	//마이페이지 작성글 리스트 조회
	ArrayList<Board> myWritingList(PageInfo pi, String nick);

	//마이페이지 작성글 게시판 종류 선택 개수
	int selectBoardCount(Board b);

	//마이페이지 작성글 게시판 종류 선택 리스트
	ArrayList<Board> selectBoardList(Board b, PageInfo pi);

	//마이페이지 댓글 개수
	int myReplyCount(String nick);

	//마이페이지 댓글 리스트
	ArrayList<Reply> myReplyList(PageInfo pi, String nick);

	//마이페이지 찜 목록 개수
	int myChoiceCount(String nick);

	//마이페이지 찜 목록 리스트
	ArrayList<Board> myChoiceList(PageInfo pi, String nick);

	//마이페이지 수정요청 개수
	int myRequestCount(String nick);

	//마이페이지 수정요청 리스트
	ArrayList<Notice> myRequestList(PageInfo pi, String nick);

	//마이페이지 개인정보 수정
	int updateMember(Member m);

	//마이페이지 회원 탈퇴
	void deleteMember(Member m);

	//마이페이지 게시글 파일 조회
	ArrayList<Attachment> fileSelect(int boardNo);

	//마이페이지 댓글 수정
	int replyUpdate(Reply r);

	//마이페이지 댓글 삭제
	int replyDelete(int replyNo);
}

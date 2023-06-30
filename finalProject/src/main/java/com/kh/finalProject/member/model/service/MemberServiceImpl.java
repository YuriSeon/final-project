package com.kh.finalProject.member.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
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

	//회원가입
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(sqlSession, m);
	}

	//로그인
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	//아이디 찾기 조회(인증번호 발송)
	@Override
	public int searchId(HashMap<String, String> info) {
		return memberDao.searchId(sqlSession, info);
	}
	//아이디 찾기 진행시 아이디
	@Override
	public Member searchIdMem(HashMap<String, String> info) {
		return memberDao.searchIdMem(sqlSession, info);
	}
	
	//비밀번호 찾기 조회(인증번호 발송)
	@Override
	public int searchPwd(HashMap<String, String> info) {
		return memberDao.searchPwd(sqlSession, info);
	}
	//비밀번호 재설정
	@Override
	public int pwdRe(HashMap<String, String> info) {
		return memberDao.pwdRe(sqlSession, info);
	}

	@Override
	public int updateSurvey(Member m) {
		return memberDao.updateSurvey(sqlSession,m);
	}

	//아이디 중복 확인
	@Override
	public int idCheck(String checkId) {
		return memberDao.idCheck(sqlSession,checkId);
	}

	//닉네임 중복 확인
	@Override
	public int nickCheck(String checkNick) {
		return memberDao.nickCheck(sqlSession,checkNick);
	}
	
	//프로필 사진 업데이트
	@Override
	public int updateImg(Attachment a) {
		
		Attachment att = memberDao.selectAttachment(sqlSession,a);
		
		String nicknameCheck = null;
		
		if (att != null) {
			nicknameCheck = att.getWriter();
			new File(ServletContext.getRealPath("/"+att.getFilePath()+att.getChangeName())).delete();
		}
		
		if (a.getWriter().equals(nicknameCheck)) {
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

	@Override
	public Member loadProfile(String nickname) {
		return memberDao.loadProfile(sqlSession,nickname);
	}

	//마이페이지 Q&A 질문 등록
	@Override
	public int myQnaInsert(Notice n) {
		return memberDao.myQnaInsert(sqlSession,n);
	}

	//마이페이지 Q&A 질문 파일 등록
	@Override
	public int myQnaFileInsert(Attachment a) {
		return memberDao.myQnaFileInsert(sqlSession,a);
	}

	//마이페이지 Q&A 개수
	@Override
	public int myQnaCount(String nick) {
		return memberDao.myQnaCount(sqlSession,nick);
	}

	//마이페이지 Q&A 리스트 조회
	@Override
	public ArrayList<Notice> myQnaList(PageInfo pi,String nick) {
		return memberDao.myQnaList(sqlSession,pi,nick);
	}

	//마이페이지 작성글 개수
	@Override
	public int myWritingCount(String nick) {
		return memberDao.myWritingCount(sqlSession,nick);
	}

	//마이페이지 작성글 리스트 조회
	@Override
	public ArrayList<Board> myWritingList(PageInfo pi, String nick) {
		return memberDao.myWritingList(sqlSession,nick,pi);
	}

	//마이페이지 작성글 게시판 종류 선택 개수
	@Override
	public int selectBoardCount(Board b) {
		return memberDao.selectBoardCount(sqlSession,b);
	}

	//마이페이지 작성글 게시판 종류 선택 리스트
	@Override
	public ArrayList<Board> selectBoardList(Board b, PageInfo pi) {
		return memberDao.selectBoardList(sqlSession,b,pi);
	}

	
	//마이페이지 댓글 개수
	@Override
	public int myReplyCount(String nick) {
		return memberDao.myReplyCount(sqlSession,nick);
	}

	//마이페이지 댓글 리스트
	@Override
	public ArrayList<Reply> myReplyList(PageInfo pi, String nick) {
		return memberDao.myReplyList(sqlSession,nick,pi);
	}

	//마이페이지 찜 목록 개수
	@Override
	public int myChoiceCount(String nick) {
		return memberDao.myChoiceCount(sqlSession,nick);
	}

	//마이페이지 찜 목록 리스트
	@Override
	public ArrayList<Board> myChoiceList(PageInfo pi, String nick) {
		return memberDao.myChoiceList(sqlSession,nick,pi);
	}

	//마이페이지 수정요청 개수
	@Override
	public int myRequestCount(String nick) {
		return memberDao.myRequestCount(sqlSession,nick);
	}

	//마이페이지 수정요청 리스트
	@Override
	public ArrayList<Notice> myRequestList(PageInfo pi, String nick) {
		return memberDao.mymyRequestList(sqlSession,nick,pi);
	}

	//마이페이지 개인정보 수정
	@Override
	public int updateMember(Member m) {
		return memberDao.updateMember(sqlSession,m);
	}

	//마이페이지 회원 탈퇴
	@Override
	public void deleteMember(Member m) {
		memberDao.deleteMember(sqlSession,m);
	}

	//마이페이지 게시글 파일 조회
	@Override
	public ArrayList<Attachment> fileSelect(int boardNo) {
		return memberDao.fileSelect(sqlSession,boardNo);
	}

	//마이페이지 댓글 수정
	@Override
	public int replyUpdate(Reply r) {
		return memberDao.replyUpdate(sqlSession,r);
	}

	//마이페이지 댓글 삭제
	@Override
	public int replyDelete(int replyNo) {
		return memberDao.replyDelete(sqlSession,replyNo);
	}

	//마이페이지 찜 목록 삭제
	@Override
	public int choiceDelete(choice c) {
		return memberDao.choiceDelete(sqlSession,c);
	}

	//마이페이지 Q&A 수정 조회
	@Override
	public Notice selectQna(int serviceNo) {
		return memberDao.selectQna(sqlSession,serviceNo);
	}

	//마이페이지 Q&A 수정
	@Override
	public int myQnaUpdate(Notice n) {
		return memberDao.myQnaUpdate(sqlSession,n);
	}

	//마이페이지 Q&A 파일 삭제
	@Override
	public int deleteFile(Attachment del) {
		return memberDao.deleteFile(sqlSession,del);
	}

	//마이페이지 Q&A 삭제파일 changName가져오기
	@Override
	public Attachment selectDelFile(Attachment del) {
		return memberDao.selectDelFile(sqlSession,del);
	}

	//마이페이지 Q&A 파일 수정
	@Override
	public int myQnaFileUpdate(Attachment a) {
		return memberDao.myQnaFileUpdate(sqlSession,a);
	}

	//마이페이지 Q&A 삭제
	@Override
	public int qnaDelete(int serviceNo) {
		memberDao.deleteFile(sqlSession, serviceNo);
		return memberDao.qnaDelete(sqlSession,serviceNo);
	}

	//마이페이지 Q&A 파일 삭제(serviceNo)
	@Override
	public int deleteFile(int serviceNo) {
		return memberDao.deleteFile(sqlSession, serviceNo);
	}

	//마이페이지 피드 보기
	@Override
	public Board selectFeed(int boardNo) {
		return memberDao.selectFeed(sqlSession,boardNo);
	}
	
}

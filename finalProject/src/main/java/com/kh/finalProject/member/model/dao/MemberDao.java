package com.kh.finalProject.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Repository
public class MemberDao {
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	//아이디 찾기 조회 (인증번호 발송)
	public int searchId(SqlSessionTemplate sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("memberMapper.searchId",info);
	}
	//아이디 찾기 진행시 아이디 리스트
	public Member searchIdMem(SqlSessionTemplate sqlSession, HashMap<String, String> info) {
		return sqlSession.selectOne("memberMapper.searchIdMem", info);
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
			return sqlSession.insert("memberMapper.insertImg", a);
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

	//마이페이지 Q&A 질문 등록
	public int myQnaInsert(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("memberMapper.myQnaInsert",n);
	}

	//마이페이지 Q&A 질문 파일 등록
	public int myQnaFileInsert(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("memberMapper.myQnaFileInsert",a);
	}

	//마이페이지 Q&A 개수
	public int myQnaCount(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("adminMapper.myQnaCount",nick);
	}

	//마이페이지 Q&A 리스트 조회
	public ArrayList<Notice> myQnaList(SqlSessionTemplate sqlSession, PageInfo pi, String nick) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.myQnaList",nick,rowBounds);
	}

	//마이페이지 작성글 개수
	public int myWritingCount(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.myWritingCount",nick);
	}

	//마이페이지 작성글 리스트 조회
	public ArrayList<Board> myWritingList(SqlSessionTemplate sqlSession, String nick, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.myWritingList",nick,rowBounds);
	}

	
	//마이페이지 작성글 게시판 종류 선택 개수
	public int selectBoardCount(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.selectOne("memberMapper.selectBoardCount",b);
	}

	//마이페이지 작성글 게시판 종류 선택 리스트
	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, Board b, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardList",b,rowBounds);
	}

	//마이페이지 댓글 개수
	public int myReplyCount(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.myReplyCount",nick);
	}

	//마이페이지 댓글 리스트
	public ArrayList<Reply> myReplyList(SqlSessionTemplate sqlSession, String nick, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.myReplyList",nick,rowBounds);
	}

	//마이페이지 찜 목록 개수
	public int myChoiceCount(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("memberMapper.myChoiceCount",nick);
	}

	//마이페이지 찜 목록 리스트
	public ArrayList<Board> myChoiceList(SqlSessionTemplate sqlSession, String nick, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("memberMapper.myChoiceList",nick,rowBounds);
	}

	//마이페이지 수정요청 개수
	public int myRequestCount(SqlSessionTemplate sqlSession, String nick) {
		return sqlSession.selectOne("adminMapper.myRequestCount",nick);
	}

	//마이페이지 수정요청 리스트
	public ArrayList<Notice> mymyRequestList(SqlSessionTemplate sqlSession, String nick, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("adminMapper.myRequestList",nick,rowBounds);
	}

	//마이페이지 개인정보 수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember",m);
	}

	//마이페이지 회원 탈퇴
	public void deleteMember(SqlSessionTemplate sqlSession, Member m) {
		sqlSession.update("memberMapper.deleteMember",m);
	}

	//마이페이지 게시글 파일 조회
	public ArrayList<Attachment> fileSelect(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.fileSelect",boardNo);
	}

	//마이페이지 댓글 수정
	public int replyUpdate(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("memberMapper.replyUpdate",r);
	}

	//마이페이지 댓글 삭제
	public int replyDelete(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("memberMapper.replyDelete",replyNo);
	}

	//마이페이지 찜 목록 삭제
	public int choiceDelete(SqlSessionTemplate sqlSession, choice c) {
		return sqlSession.delete("memberMapper.choiceDelete",c);
	}

	//마이페이지 Q&A 수정 조회
	public Notice selectQna(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.selectOne("adminMapper.selectQna",serviceNo);
	}

	//마이페이지 Q&A 수정
	public int myQnaUpdate(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("memberMapper.myQnaUpdate",n);
	}

	//마이페이지 Q&A 파일 삭제
	public int deleteFile(SqlSessionTemplate sqlSession, Attachment del) {
		return sqlSession.delete("memberMapper.deleteFile",del);
	}

	//마이페이지 Q&A 삭제파일 changName가져오기
	public Attachment selectDelFile(SqlSessionTemplate sqlSession, Attachment del) {
		return sqlSession.selectOne("memberMapper.selectDelFile",del);
	}

	//마이페이지 Q&A 파일 수정
	public int myQnaFileUpdate(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("memberMapper.myQnaFileUpdate",a);
	}

	//마이페이지 Q&A 파일 삭제(boardNo)
	public int deleteFile(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.delete("memberMapper.deleteFileNo",serviceNo);
	}

	//마이페이지 Q&A 삭제
	public int qnaDelete(SqlSessionTemplate sqlSession, int serviceNo) {
		return sqlSession.update("memberMapper.qnaDelete",serviceNo);
	}

	//마이페이지 피드 보기
	public Board selectFeed(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("memberMapper.selectFeed",boardNo);
	}

}

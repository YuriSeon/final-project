package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

public interface FeedService {

	//피드인서트문
	int insertFeed(Board b, ArrayList<Attachment> list, Info in);

	//리스트카운트
	int selectListCount();

	//리스트불러오기
	ArrayList<Board> selectBoardList(PageInfo pi);

	//사진 불러오기
	ArrayList<Attachment> selectAttachmentList();

	//삭제구문
	int deleteFeed(int boardNo);

	//하트체크구문
	int ckHeart(int boardNo, String writer);

	//두번 클릭하면 하트없애기
	int deleteHeart(int boardNo, String writer);

	//하트 인서트
	int insertHeart(int boardNo, String writer);

	//좋아요리스트
	ArrayList<Good> selectGood();

	//프로필뽑기
	ArrayList<Member> selectMember();

	//댓글인서트
	int insertReply(Reply r);

	//댓글삽입
	ArrayList<Reply> selectReplyList(int refQno);

	//댓글삭제
	int deleteReply(int replyNo);

	//댓글 수정
	int updateReply(Reply r);

	//댓글신고
	int reportReply(String nickname, Report rep);

	//대댓글입력
	int insertAnswer(Rereply re);

	//대댓글삽입
	ArrayList<Rereply> selectRereply(int replyNo);

	//대댓글 삭제
	int deleteRere(int refRno);

	//대댓글 수정
	int updateRere(Rereply re);

	//대댓글신고
	int rereportReply(String nickname, Report rep);

	//이미 신고된 회원인지 확인여부
	boolean isAlreadyReported(Report rep);

	//게시물 수정폼baord
	Board selectBoard(int boardNo);

	//게시물 수정폼attachment
	ArrayList<Attachment> selectAttachment(int boardNo);

	//게시물 수정
	int updateFeed(Board b, ArrayList<Attachment> list, Info in);

	//게시물수정시 기존에 있던 사진지우기
	int deleteAttachment(int boardNo);

	//인기순
	ArrayList<Board> rankingBoardList(PageInfo pi);

	//도시선택
	ArrayList<Board> selectCityList(PageInfo pi, int city);

	//도시선택갯수
	int selectListCount(int city);

	//게시물 신고
	int reportBoard(Report re, String nickname);

	

	
	
	

}

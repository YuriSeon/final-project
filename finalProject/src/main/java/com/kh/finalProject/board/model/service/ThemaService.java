package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;


public interface ThemaService {

	//테마 입력
	int insertThema(Board b, Info in, ArrayList<Attachment> list, Theme m);

	//리스트총갯수
	int selectListCount();

	//최신순테마
	ArrayList<Board> selectThemaList(PageInfo pi);

	//인기순 테마
	ArrayList<Board> selectRankingThemaList(PageInfo pi);

	//조회수 올리기
	int increaseCount(int boardNo);

	//상세페이지
	Board selectBoard(int boardNo);

	//상세페이지 at
	ArrayList<Attachment> selectAttachment(int boardNo);

	//댓글입력
	int insertReply(Reply r);

	//댓글불러오기
	ArrayList<Reply> selectReply(int boardNo);

	//댓글삭제
	int deleteReply(int replyNo);

	//댓글수정
	int updateReply(Reply r);

	//댓글신고
	int reportReply(Report re, String nickname);

	//찜하기 테이블 확인
	int ckChoice(choice c);

	//테이블에 있으면 없애기
	int deleteChoice(choice c);

	//테이블에 없으면 넣기
	int insertChoice(choice c);

	//찜하기이미지바꾸기
	choice selectChoice(int boardNo);

	//신고리스트
	ArrayList<Report> selectReportList();

	//검색리스트
	int selectSearchListCount(String zoneName);

	//검색 최신순
	ArrayList<Board> selectThemaList(PageInfo pi, String zoneName);

	//검색 인기순
	ArrayList<Board> selectRankingThemaList(PageInfo pi, String zoneName);

	//댓글 갯수
	int selectReplyCount(int boardNo);




}

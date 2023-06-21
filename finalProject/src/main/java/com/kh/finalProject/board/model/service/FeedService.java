package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface FeedService {

	//피드인서트문
	int insertFeed(Board b, ArrayList<Attachment> list);

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

	
	
	

}

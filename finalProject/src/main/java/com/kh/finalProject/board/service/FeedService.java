package com.kh.finalProject.board.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
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
	
	

}

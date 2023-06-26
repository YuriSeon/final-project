package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;


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



}

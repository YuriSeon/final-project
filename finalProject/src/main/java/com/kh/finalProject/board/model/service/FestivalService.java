package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface FestivalService {

	//축제 총 게시글 수
	int fesCount();

	//축제 리스트
	ArrayList<Board> fesList(PageInfo pi);

	//게시글 검색 시 게시글 수
	int selectSearchCount(HashMap<String, String> keyword);

	/* 축제 등록 */
	int insertFes(Board b, Info in, ArrayList<Attachment> list, Festival f);

	//축제 조회
	Board detailFes(int boardNo);
	/* 사진파일 조회 */
	ArrayList<Attachment> atList(int boardNo);

	//조회수 올려주기
	int countUp(int boardNo);

	//찜하기 내역조회
	int choiceCount(HashMap<String, String> info);
	//찜하기
	int choiceCk(HashMap<String, String> info);
	//찜하기 삭제
	int choiceDel(HashMap<String, String> info);
	//게시글의 총 찜 수 조회
	int choiAllCount(HashMap<String, String> info);


}

package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface FestivalService {
	
	//축제 페이지 로드시 찜 리스트
	ArrayList<choice> choiList();

	//축제 페이지 로드시 축제기간이 아닌 db는 상태값 N으로 바꿔주기
	int endFes();
	//축제 페이지 로드시 축제 기간이면 상태값 y로 바꿔주기(예정 축제도 N으로 바뀌어져있기때문)
	int FesIng();

	//축제 총 게시글 수
	int fesCount(HashMap<String, String> keyword);

	//축제 리스트
	ArrayList<Board> fesList(HashMap<String, String> keyword, PageInfo pi);
	
	//마우스 올렸을시 축제 개수
	int mouCount(String nowDay);

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

	////축제 디테일 페이지 로드시 주변 명소 불러오기
	ArrayList<Board> myungList(int boardNo);
}

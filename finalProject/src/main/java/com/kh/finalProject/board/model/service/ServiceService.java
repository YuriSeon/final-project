package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Service;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface ServiceService {

	//공지사항 총 리스트 카운트
	int serCount();

	//페이징처리한 공지사항리스트
	ArrayList<Service> serList(PageInfo pi);

	//공지사항 디테일
	Service detailSer(int boardNo);

	//조회수 업
	int countUp(int boardNo);
	
	//이전글 가져오기
	Service preSer(int boardNo);
	//다음글 가져오기
	Service nextSer(int boardNo);

}

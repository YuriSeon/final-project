package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface TogetherService {
	
	int insertBoard(Board b,Attachment at,Plan p);
	
	int selectListCount();
	
	ArrayList<TogetherVO> selectTogetherList(PageInfo pi);

	ArrayList<TogetherVO> optionSearch(TogetherVO t);
}

package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.TogetherApplyVO;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface TogetherService {
	
	int insertBoard(Board b,Attachment at,Plan p);
	
	int selectListCount();
	
	ArrayList<TogetherVO> selectTogetherList(PageInfo pi);

	int selectOptionListCount(TogetherVO t);
	
	ArrayList<TogetherVO> optionSearch(TogetherVO t, PageInfo pi);

	int togetherApply(TogetherApplyVO ta);

	TogetherVO togetherDetail(int boardNo);

	ArrayList<TogetherApplyVO> applyParticipate(int boardNo);

	int applyParticipateAccept(TogetherApplyVO ta);

	int applyParticipateReject(TogetherApplyVO ta);

	int togetherChoiceCheck(choice c);

	int choiceYes(choice c);

	int choiceNo(choice c);

}

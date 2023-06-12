package com.kh.finalProject.board.service;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Plan;

public interface TogetherService {
	
	int insertBoard(Board b,Attachment at,Plan p);

}

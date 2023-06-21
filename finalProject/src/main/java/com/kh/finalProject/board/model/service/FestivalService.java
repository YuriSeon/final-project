package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;

public interface FestivalService {

	/* 축제 등록 */
	int insertFes(Board b, Info in, ArrayList<Attachment> list, Festival f);


}

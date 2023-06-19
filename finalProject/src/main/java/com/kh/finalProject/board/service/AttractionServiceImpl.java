package com.kh.finalProject.board.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class AttractionServiceImpl implements AttractionService {

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		return null;
	}

}

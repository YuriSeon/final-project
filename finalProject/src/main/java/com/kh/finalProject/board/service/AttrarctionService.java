package com.kh.finalProject.board.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface AttrarctionService {

	int selectListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);

}

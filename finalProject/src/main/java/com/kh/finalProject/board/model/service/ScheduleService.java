package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface ScheduleService {

	int selectListCount(String sort);

	ArrayList<Board> selectBoardList(PageInfo pi, String sort);

}

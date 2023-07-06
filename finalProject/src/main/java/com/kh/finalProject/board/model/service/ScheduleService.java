package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface ScheduleService {

	int insertSchedule(HttpSession session, Plan plan, ArrayList<String[]> path);

	int checkInfo(String infoName);

	int increaseCount(int boardNo);

	HashMap<String, Object> selectSchedule(int boardNo);

	int deleteSchedule(Plan plan);

	int mainListCount();

	HashMap<String, Object> mainSelectList(PageInfo pi, String sort);

	int insertInfoFile(HttpSession session, Plan plan, ArrayList<String[]> path, ArrayList<Info> infoList);

	Board checkBno(Plan plan);

	int insertPath(ArrayList<String[]> path, Plan plan);





}

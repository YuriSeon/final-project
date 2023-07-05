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

	int insertSchedule(HttpSession session, Plan plan, ArrayList<Info> infoList, String[][] pathArr);

	int checkInfo(String address);

	HashMap<String, Object> selectSchedule(int boardNo);

	int deleteSchedule(Plan plan);



}

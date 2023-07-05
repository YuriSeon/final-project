package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface AttractionService {

	int selectListCount();

	int insertAttr(Info info, ArrayList<Attachment> atArr);

	int increaseCount(int boardNo);

	HashMap<String, Object> attrDetail(int boardNo);

	int insertReply(Rereply r);

	ArrayList<Rereply> selectReplyList(int boardNo);

	HashMap<String, Object> iconCheck(int boardno, String writer);

	HashMap<String, Object> iconChange(String btnType, int no, String writer);
	
	int checkInfo(String address);

	Info modifyRequestAttr(int boardNo);

	int modifyinfo(Board b);

	int deleteAttr(int boardNo, ArrayList<String> at);

	int updateAttr(Info info, ArrayList<Attachment> removeList, Attachment at);

	int sendReport(Report report);

	int deleteReply(Rereply r);

	ArrayList<Attachment> selectAttachment(int boardNo);

	HashMap<String, Object> selectAttrList(String keyword);




}

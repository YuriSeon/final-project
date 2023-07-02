package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface AttractionService {

	int selectListCount();

	ArrayList<Board> selectBoardList(PageInfo pi);

	int insertAttr(Info info, ArrayList<Attachment> atArr);

	int increaseCount(int boardNo);

	HashMap<String, Object> attrDetail(int boardNo);

	int insertReply(Rereply r);

	HashMap<String, Object> selectReplyList(int boardNo);

	int iconCheck(String btnType, int boardno, String writer);

	int iconBefore(String btnType, String tableName, int no, String writer);

	int iconAfter(String btnType, String tableName, int no, String writer);

	int checkInfo(String address);

	Info modifyRequestAttr(int boardNo);

	int modifyinfo(Board b);

	int deleteAttr(int boardNo);

	

}

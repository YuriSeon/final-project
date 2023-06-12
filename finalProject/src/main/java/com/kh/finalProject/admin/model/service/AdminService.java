package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface AdminService {

	//공지사항 등록
	int insertNotice(Notice s, Attachment a);

	//공지사항 리스트 개수
	int noticeListCount();

	//공지사항 리스트
	ArrayList<Notice> selectNoticeList(PageInfo pi);

}

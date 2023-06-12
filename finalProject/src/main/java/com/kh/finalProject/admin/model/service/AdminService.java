package com.kh.finalProject.admin.model.service;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;

public interface AdminService {

	//공지사항 등록
	int insertNotice(Notice s, Attachment a);

}

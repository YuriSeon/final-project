package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	
	//공지사항 수정 페이지 이동
	Notice noticeSelect(int serviceNo);

	//공지사항 수정 파일 조회
	Attachment noticeFileSelect(int serviceNo);
	
	//공지사항 수정
	int noticeUpdate(Notice n, Attachment a);

	//공지사항 파일이 없을때 수정
	int noticeNewFileUpdate(Notice n, Attachment a);
	
	//공지사항 삭제
	int noticeDelete(int serviceNo);

	//공지사항 파일 삭제
	int noticeFileDelete(int serviceNo);

	//공지사항 검색 개수
	int noticeSearchCount(HashMap<String, String> map);

	//공지사항 검색 리스트
	ArrayList<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pi);

}

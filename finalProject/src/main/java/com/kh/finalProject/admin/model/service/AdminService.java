package com.kh.finalProject.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.common.model.vo.PageInfo;

public interface AdminService {

	//대시보드 최근 신고 5개
	ArrayList<Report> currentReportList();

	//==================================================공지사항===========================================================
	
	//공지사항 등록
	int insertNotice(Notice n, Attachment a);

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
	
	//==================================================FAQ===========================================================
	
	//FAQ 등록
	int insertFAQ(Notice n);

	//FAQ 리스트 개수
	int faqListCount();

	//FAQ 리스트
	ArrayList<Notice> selectFAQList(PageInfo pi);
	
	//FAQ 수정 페이지 이동
	Notice faqSelect(int serviceNo);

	//FAQ 수정
	int faqUpdate(Notice n);

	//FAQ 삭제
	int faqDelete(int serviceNo);

	//FAQ 검색 개수
	int faqSearchCount(HashMap<String, String> map);

	//FAQ 검색 리스트
	ArrayList<Notice> faqSearchList(HashMap<String, String> map, PageInfo pi);

	
	//==================================================Q&A===========================================================

	//Q&A 리스트 개수
	int qnaListCount();

	//Q&A 리스트 조회
	ArrayList<Notice> selectQnaList(PageInfo pi);

	//Q&A 파일 조회
	ArrayList<Attachment> qnaFileSelect(int serviceNo);

	//Q&A 답변 조회
	ArrayList<Reply> qnaReplyList(int serviceNo);
	
	//Q&A 답변 등록
	int qnaReplyInsert(Reply r);

	//Q&A 답변 수정
	int qnaReplyUpdate(Reply r);
	
	//Q&A 답변 삭제
	int qnaReplyDelete(Reply r);

	//Q&A 검색 개수
	int qnaSearchCount(HashMap<String, String> map);

	//Q&A 검색 리스트
	ArrayList<Notice> qnaSearchList(HashMap<String, String> map, PageInfo pi);
	
	//==================================================신고관리===========================================================
	
	//신고관리 리스트 개수
	int reportListCount();

	//신고관리 리스트 조회
	ArrayList<Report> selectReportList(PageInfo pi);

	//신고 삭제
	int reportDelete(int reportNo);

	//신고 검색 개수
	int reportSearchCount(HashMap<String, String> map);

	//신고 검색 리스트 조회
	ArrayList<Notice> reportSearchList(HashMap<String, String> map, PageInfo pi);


}

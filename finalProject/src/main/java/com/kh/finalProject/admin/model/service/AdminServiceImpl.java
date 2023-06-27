package com.kh.finalProject.admin.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.finalProject.admin.model.dao.AdminDao;
import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.dao.MemberDao;
import com.kh.finalProject.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ServletContext ServletContext;

	
	//대시보드 최근 신고 5개
	@Override
	public ArrayList<Report> currentReportList() {
		return adminDao.currentReportList(sqlSession);
	}
	
	//==================================================공지사항===========================================================
	
	//공지사항 등록
	@Override
	public int insertNotice(Notice n, Attachment a) {
		
		int result1 = adminDao.insertNotice(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.insertAttachment(sqlSession,a);
		}
		
		return result1*result2;
	}

	//공지사항 리스트 개수
	@Override
	public int noticeListCount() {
		int result =adminDao.noticeListCount(sqlSession);
		return result;
	}

	//공지사항 리스트
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return adminDao.selectNoticeList(sqlSession,pi);
	}

	//공지사항 수정 페이지 이동
	@Override
	public Notice noticeSelect(int serviceNo) {
		return adminDao.noticeSelect(sqlSession,serviceNo);
	}

	//공지사항 수정 파일 조회
	@Override
	public Attachment noticeFileSelect(int serviceNo) {
		return adminDao.noticeFileSelect(sqlSession,serviceNo);
	}
	
	//공지사항 수정
	@Override
	public int noticeUpdate(Notice n, Attachment a) {
		int result1 = adminDao.noticeUpdate(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.attachmentUpdate(sqlSession,a);
		}
		
		return result1*result2; 
	}

	//공지사항 파일이 없을때 수정
	@Override
	public int noticeNewFileUpdate(Notice n, Attachment a) {
		int result1 = adminDao.noticeUpdate(sqlSession,n);
		int result2 = 1;
		if(a.getOriginName()!=null) {
			result2 = adminDao.noticeNewFileUpdate(sqlSession,a);
		}
		
		return result1*result2;
	}
	
	//공지사항 삭제
	@Override
	public int noticeDelete(int serviceNo) {
		return adminDao.noticeDelete(sqlSession, serviceNo);
	}

	//공지사항 파일 삭제
	@Override
	public int noticeFileDelete(int serviceNo) {
		return adminDao.noticeFileDelete(sqlSession,serviceNo);
	}

	//공지사항 검색 개수
	@Override
	public int noticeSearchCount(HashMap<String, String> map) {
		return adminDao.noticeSearchCount(sqlSession,map);
	}

	//공지사항 검색 리스트
	@Override
	public ArrayList<Notice> noticeSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.noticeSearchList(sqlSession,map,pi);
	}

	//==================================================FAQ===========================================================
	
	//FAQ 등록
	@Override
	public int insertFAQ(Notice n) {
		return adminDao.insertFAQ(sqlSession,n);
	}

	//FAQ 리스트 개수
	@Override
	public int faqListCount() {
		return adminDao.faqListCount(sqlSession);
	}

	//FAQ 리스트 조회
	@Override
	public ArrayList<Notice> selectFAQList(PageInfo pi) {
		return adminDao.selectFAQList(sqlSession,pi);
	}

	//FAQ 수정 페이지 이동
	@Override
	public Notice faqSelect(int serviceNo) {
		return adminDao.faqSelect(sqlSession,serviceNo);
	}


	//FAQ 수정
	@Override
	public int faqUpdate(Notice n) {
		return adminDao.faqUpdate(sqlSession,n);
	}

	//FAQ 삭제
	@Override
	public int faqDelete(int serviceNo) {
		return adminDao.faqDelete(sqlSession,serviceNo);
	}

	//FAQ 검색 개수
	@Override
	public int faqSearchCount(HashMap<String, String> map) {
		return adminDao.faqSearchCount(sqlSession,map);
	}

	//FAQ 검색 리스트 조회
	@Override
	public ArrayList<Notice> faqSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.faqSearchList(sqlSession,map,pi);
	}


//==================================================Q&A===========================================================
	
	//Q&A 리스트 개수
	@Override
	public int qnaListCount() {
		return adminDao.qnaListCount(sqlSession);
	}

	//Q&A 리스트 조회
	@Override
	public ArrayList<Notice> selectQnaList(PageInfo pi) {
		return adminDao.selectQnaList(sqlSession,pi);
	}

	//Q&A 파일 조회
	@Override
	public ArrayList<Attachment> qnaFileSelect(int serviceNo) {
		return adminDao.qnaFileSelect(sqlSession,serviceNo);
	}

	//Q&A 답변 조회
	@Override
	public ArrayList<Reply> qnaReplyList(int serviceNo) {
		return adminDao.qnaReplyList(sqlSession,serviceNo);
	}
	
	//Q&A 답변 등록
	@Override
	public int qnaReplyInsert(Reply r) {
		return adminDao.qnaReplyInsert(sqlSession,r);
	}

	//Q&A 답변 수정
	@Override
	public int qnaReplyUpdate(Reply r) {
		return adminDao.qnaReplyUpdate(sqlSession,r);
	}

	//Q&A 답변 삭제
	@Override
	public int qnaReplyDelete(Reply r) {
		return adminDao.qnaReplyDelete(sqlSession,r);
	}

	//Q&A 검색 개수
	@Override
	public int qnaSearchCount(HashMap<String, String> map) {
		return adminDao.qnaSearchCount(sqlSession,map);
	}

	//Q&A 검색 리스트
	@Override
	public ArrayList<Notice> qnaSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.qnaSearchList(sqlSession,map,pi);
	}

	//==================================================신고관리===========================================================
	
	//신고관리 리스트 개수
	@Override
	public int reportListCount() {
		return adminDao.reportListCount(sqlSession);
	}

	//신고관리 리스트 조회
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return adminDao.selectReportList(sqlSession,pi);
	}

	//신고 삭제
	@Override
	public int reportDelete(int reportNo) {
		return adminDao.reportDelete(sqlSession,reportNo);
	}

	//신고 검색 개수
	@Override
	public int reportSearchCount(HashMap<String, String> map) {
		return adminDao.reportSearchCount(sqlSession,map);
	}

	//신고 검색 리스트 조회
	@Override
	public ArrayList<Notice> reportSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.reportSearchList(sqlSession,map,pi);
	}

	//==================================================회원관리===========================================================

	//회원 리스트 개수
	@Override
	public int memberListCount() {
		return adminDao.memberListCount(sqlSession);
	}

	//회원 리스트 조회
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return adminDao.selectMemberList(sqlSession,pi);
	}

	//회원 탈퇴
	@Override
	public int memberDelete(int userNo) {
		return adminDao.memberDelete(sqlSession,userNo);
	}

	//회원 검색 개수
	@Override
	public int memberSearchCount(HashMap<String, String> map) {
		return adminDao.memberSearchCount(sqlSession,map);
	}

	//회원 검색 리스트 조회
	@Override
	public ArrayList<Member> memberSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.memberSearchList(sqlSession,map,pi);
	}

	//회원 관리 페이지 이동
	@Override
	public Member memberSelect(int userNo) {
		return adminDao.memberSelect(sqlSession,userNo);
	}

	//회원 수정
	@Override
	public int memberUpdate(Member m) {
		return adminDao.memberUpdate(sqlSession,m);
	}

	//회원 정보 엑셀
	@Override
	public ArrayList<Member> memberExcelList() {
		return adminDao.memberExcelList(sqlSession);
	}

	//회원 정보 게시물 개수
	@Override
	public List<Integer> boardCount(String nickname) {
		return adminDao.boardCount(sqlSession,nickname);
	}

	//회원 프로필 이미지 삭제
	@Override
	public int delProfileImg(String nickname) {
		return adminDao.delProfileImg(sqlSession,nickname);
	}

	//회원 프로필 이미지 수정
	@Override
	public int memberUpdateImg(Attachment a) {
	
		Attachment att = memberDao.selectAttachment(sqlSession,a);
		String nicknameCheck = null;
		
		if (att != null) {
			nicknameCheck = att.getWriter();
			new File(ServletContext.getRealPath("/"+att.getFilePath()+att.getChangeName())).delete();
		}
		
		if (a.getWriter().equals(nicknameCheck)) {
			return memberDao.updateImg(sqlSession,a);
		}else {
			return memberDao.insertImg(sqlSession,a);
		}
	}
	
	//==================================================회원관리===========================================================

	//게시글 축제 리스트 개수
	@Override
	public int festivalListCount() {
		return adminDao.festivalListCount(sqlSession);
	}

	//게시글 축제 리스트 개수
	@Override
	public ArrayList<Board> selectFestivalList(PageInfo pi) {
		return adminDao.selectFestivalList(sqlSession,pi);
	}

	//게시글 축제 검색 개수
	@Override
	public int festivalSearchCount(HashMap<String, String> map) {
		return adminDao.festivalSearchCount(sqlSession,map);
	}

	//게시글 축제 검색 리스트 개수
	@Override
	public ArrayList<Board> festivalSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.festivalSearchList(sqlSession,map,pi);
	}

	//게시글 축제 수정 조회
	@Override
	public Board festivalSelect(int boardNo) {
		return adminDao.festivalSelect(sqlSession,boardNo);
	}

	//게시글 축제 수정 파일 조회
	@Override
	public ArrayList<Attachment> festivalFileSelect(int boardNo) {
		return adminDao.festivalFileSelect(sqlSession,boardNo);
	}

	//게시글 축제 수정 축제 조회
	@Override
	public Festival festivalFesSelect(int boardNo) {
		return adminDao.festivalFesSelect(sqlSession,boardNo);
	}

	//게시글 축제 수정 인포 조회
	@Override
	public Info festivalInfoSelect(int boardNo) {
		return adminDao.festivalInfoSelect(sqlSession,boardNo);
	}

	//게시글 축제 수정
	@Override
	public int festivalUpdate(Board b, Info in, ArrayList<Attachment> list, Festival f) {
		
		//보드 등록
		int result =  adminDao.themeUpdate(sqlSession, b);
		//장소 정보 등록
		int result2 = adminDao.festivalUpdate(sqlSession, in);
		//어태치먼트 등록
		int result3 = 1;
		for(Attachment at : list) {
			result3 *= adminDao.themeUpdate(sqlSession, at);			
		}
		//페스티발 등록
		int result4 = adminDao.festivalUpdate(sqlSession, f);
		
		return result*result2*result3*result4;
	}

	//게시글 축제 수정 파일 삭제
	@Override
	public int festivalFileDel(Integer fileNo) {
		return adminDao.festivalFileDel(sqlSession,fileNo);
	}

	//게시글 테마 리스트 개수
	@Override
	public int themeListCount() {
		return adminDao.themeListCount(sqlSession);
	}

	//게시글 테마 리스트 조회
	@Override
	public ArrayList<Board> selectThemeList(PageInfo pi) {
		return adminDao.selectThemeList(sqlSession,pi);
	}

	//게시글 명소 리스트 개수
	@Override
	public int attractionListCount() {
		return adminDao.attractionListCount(sqlSession);
	}
	
	//게시글 명소 리스트 조회
	@Override
	public ArrayList<Board> selectAttractionList(PageInfo pi) {
		return adminDao.selectAttractionList(sqlSession,pi);
	}

	//게시글 피드 리스트 개수
	@Override
	public int feedListCount() {
		return adminDao.feedListCount(sqlSession);
	}

	//게시글 피드 리스트 조회
	@Override
	public ArrayList<Board> selectFeedList(PageInfo pi) {
		return adminDao.selectFeedList(sqlSession,pi);
	}

	//게시글 일정자랑 리스트 개수
	@Override
	public int scheduleListCount() {
		return adminDao.scheduleListCount(sqlSession);
	}

	//게시글 일정자랑 리스트 조회
	@Override
	public ArrayList<Board> selectScheduleList(PageInfo pi) {
		return adminDao.selectScheduledList(sqlSession,pi);
	}

	//게시글 함께가치 리스트 개수
	@Override
	public int togetherListCount() {
		return adminDao.togetherListCount(sqlSession);
	}

	//게시글 함께가치 리스트 조회
	@Override
	public ArrayList<Board> selectTogetherList(PageInfo pi) {
		return adminDao.selectTogetherList(sqlSession,pi);
	}

	//게시글 테마 검색 개수
	@Override
	public int themeSearchCount(HashMap<String, String> map) {
		return adminDao.themeSearchCount(sqlSession,map);
	}

	//게시글 테마 검색 리스트 조회	
	@Override
	public ArrayList<Board> themeSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.themeSearchList(sqlSession,map,pi);
	}

	//게시글 테마 보드 삭제
	@Override
	public int themeBoardDel(Integer boardNo) {
		return adminDao.themeBoardDel(sqlSession,boardNo);
	}

	//게시글 테마 파일 삭제
	@Override
	public int themeFileDel(Integer boardNo) {
		return adminDao.themeFileDel(sqlSession,boardNo);
	}

	//게시글 테마 테마 삭제
	@Override
	public int themeDel(Integer boardNo) {
		return adminDao.themeDel(sqlSession,boardNo);
	}

	//게시글 테마 인포 삭제
	@Override
	public int themeInfoDel(Integer boardNo) {
		return adminDao.themeInfoDel(sqlSession,boardNo);
	}

	//게시글 테마 파일 조회
	@Override
	public ArrayList<Attachment> themeFilePath(Integer boardNo) {
		return adminDao.themeFilePath(sqlSession, boardNo);
	}

	//게시글 축제 축제 삭제
	@Override
	public int festivalDel(Integer boardNo) {
		return adminDao.festivalDel(sqlSession,boardNo);
	}

	//게시글 테마 수정 테마 조회
	@Override
	public Theme themeSelect(int boardNo) {
		return adminDao.themeSelect(sqlSession,boardNo);
	}

	//게시글 테마 수정
	@Override
	public int themeUpdate(Board b, Info in, ArrayList<Attachment> list, Theme m) {
		//보드수정
		int result = adminDao.themeUpdate(sqlSession,b);
		
		//장소수정
		int result2 = adminDao.themeUpdate(sqlSession,in);
		
		//첨부파일수정
		int result3 =1;
		for(Attachment at : list) {
		result3 = adminDao.themeUpdate(sqlSession,at);
		}
		
		//테마테이블 수정
		int result4 = adminDao.themeUpdate(sqlSession,m);
		return result*result2*result3*result4;
	}

	//게시글 명소 검색 개수
	@Override
	public int attractionSearchCount(HashMap<String, String> map) {
		return adminDao.attractionSearchCount(sqlSession,map);
	}

	//게시글 명소 검색 리스트 조회
	@Override
	public ArrayList<Board> attractionSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.attractionSearchList(sqlSession,map,pi);
	}

	//게시글 피드 검색 개수
	@Override
	public int feedSearchCount(HashMap<String, String> map) {
		return adminDao.feedSearchCount(sqlSession,map);
	}

	//게시글 피드 검색 리스트 조회
	@Override
	public ArrayList<Board> feedSearchList(HashMap<String, String> map, PageInfo pi) {
		return adminDao.feedSearchList(sqlSession,map,pi);
	}

	//게시글 피드 사진 출력
	@Override
	public ArrayList<Attachment> feedSelectFile(int boardNo) {
		return adminDao.feedSelectFile(sqlSession,boardNo);
	}

	
	
	
	
}
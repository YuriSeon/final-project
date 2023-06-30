package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.dao.ThemaDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Service
public class ThemaServiceImpl implements ThemaService{
	
	@Autowired
	private ThemaDao themaDao;
	
	@Autowired
	private SqlSession sqlSession;

	//테마등록
	@Override
	@Transactional
	public int insertThema(Board b, Info in, ArrayList<Attachment> list, Theme m) {
		
		//보드등록
		int result = themaDao.insertThema(sqlSession,b);
		
		//장소등록
		int result2 = themaDao.insertThema(sqlSession,in);
		
		//첨부파일등록
		int result3 =1;
		for(Attachment at : list) {
		result3 = themaDao.insertThema(sqlSession,at);
		}
		
		//테마테이블 등록
		int result4 = themaDao.insertThema(sqlSession,m);
		return result*result2*result3*result4;
	}

	//리스트총갯수
	@Override
	public int selectListCount() {
		int result = themaDao.selectListCount(sqlSession);
		return result;
	}

	//최신순 테마
	@Override
	public ArrayList<Board> selectThemaList(PageInfo pi) {
		ArrayList<Board> list = themaDao.selectThemaList(sqlSession,pi);
		return list;
	}

	//인기순 테마
	@Override
	public ArrayList<Board> selectRankingThemaList(PageInfo pi) {
		ArrayList<Board> list = themaDao.selectRankingThemaList(sqlSession,pi);
		return list;
	}

	//조회수 올리기
	@Override
	public int increaseCount(int boardNo) {
		int result = themaDao.increaseCount(sqlSession,boardNo);
		return result;
	}

	//상세페이지
	@Override
	public Board selectBoard(int boardNo) {
		Board b = themaDao.selectBoard(sqlSession,boardNo);
		return b;
	}

	//상세페이지 at
	@Override
	public ArrayList<Attachment> selectAttachment(int boardNo) {
		ArrayList<Attachment> list = themaDao.selectAttachment(sqlSession,boardNo);
		return list;
	}

	//댓글입력
	@Override
	public int insertReply(Reply r) {
		int result = themaDao.insertReply(sqlSession,r);
		return result;
	}

	//댓글불러오기
	@Override
	public ArrayList<Reply> selectReply(int boardNo) {
		ArrayList<Reply> list = themaDao.selectReply(sqlSession,boardNo);
		return list;
	}

	//댓글삭제
	@Override
	public int deleteReply(int replyNo) {
		int result = themaDao.deleteReply(sqlSession,replyNo);
		return result;
	}

	//댓글수정
	@Override
	public int updateReply(Reply r) {
		int result = themaDao.updateReply(sqlSession,r);
		return result;
	}

	//댓글신고
	@Override
	public int reportReply(Report re,String nickname) {
		//신고테이블
		int result = themaDao.reportReply(sqlSession,re);
		//멤버테이블업데이트
		int result2 = themaDao.reportUpdateMember(sqlSession,nickname);
		return result *result2;
	}

	//찜하기 테이블 확인
	@Override
	public int ckChoice(choice c) {
		int result = themaDao.ckChoice(sqlSession,c);
		return result;
	}

	//테이블에 있으면 없애기
	@Override
	@Transactional
	public int deleteChoice(choice c) {
		int result = themaDao.deleteChoice(sqlSession,c);
		return result;
	}

	//테이블에 없으면 넣기
	@Override
	@Transactional
	public int insertChoice(choice c) {
		int result = themaDao.insertChoice(sqlSession,c);
		return result;
	}

	//찜하기이미지바꾸기
	@Override
	public choice selectChoice(int boardNo) {
		choice c = themaDao.selectChoice(sqlSession,boardNo);
		return c;
	}

	//신고리스트
	@Override
	public ArrayList<Report> selectReportList() {
		ArrayList<Report> list = themaDao.selectReportList(sqlSession);
		return list;
	}

	//검색리스트
	@Override
	public int selectSearchListCount(String zoneName) {
		int result = themaDao.selectSearchListCount(sqlSession,zoneName);
		return result;
	}

	//검색 최신순
	@Override
	public ArrayList<Board> selectThemaList(PageInfo pi, String zoneName) {
		ArrayList<Board> list = themaDao.selectThemaList(sqlSession, pi,zoneName);
		return list;
	}

	//검색 인기순
	@Override
	public ArrayList<Board> selectRankingThemaList(PageInfo pi, String zoneName) {
		ArrayList<Board> list = themaDao.selectRankingThemaList(sqlSession, pi,zoneName);
		return list;
	}

	//댓글갯수
	@Override
	public int selectReplyCount(int boardNo) {
		int reply = themaDao.selectReplyCount(sqlSession,boardNo);
		return reply;
	}




}

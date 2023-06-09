package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.dao.FeedDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.member.model.vo.Member;

@Service
public class FeedServiceImpl implements FeedService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FeedDao feedDao;

	@Override
	@Transactional
	public int insertFeed(Board b, ArrayList<Attachment> list,Info in) {
		int result = feedDao.insertBoard(sqlSession,b);
		int result2 =feedDao.insertInfo(sqlSession,in);
		int result3 = 1;
		for(Attachment at : list) {
			
			result3 *= feedDao.insertAttachment(sqlSession,at);
		}
		
		return result * result2 *result3;
	}

	@Override
	public int selectListCount() {
		int result =feedDao.selectListCount(sqlSession);
		return result;
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi) {
		ArrayList<Board> list = feedDao.selectBoardList(sqlSession,pi);
		return list;
	}

	@Override
	public ArrayList<Attachment> selectAttachmentList() {
		ArrayList<Attachment> list = feedDao.selectAttachmentList(sqlSession);
		return list;
	}

	@Override
	@Transactional
	public int deleteFeed(int boardNo) {
		int result = feedDao.deleteFeed(sqlSession,boardNo);
		return result;
	}

	@Override
	public int ckHeart(int boardNo, String writer) {
		int result = feedDao.ckHeart(sqlSession,boardNo,writer);
		return result;
	}

	@Override
	public int deleteHeart(int boardNo, String writer) {
		
		int result = feedDao.deleteHeart(sqlSession,boardNo,writer);
		int result2 = 0;
		if(result>0) {			
			result2 = feedDao.updateDelete(sqlSession,boardNo);
		}
		return result * result2;
	}

	@Override
	public int insertHeart(int boardNo, String writer) {
		int result = feedDao.insertHeart(sqlSession,boardNo,writer);
		int result2 =0;
		if(result>0) {
			result2 = feedDao.updateInsert(sqlSession,boardNo);
		}
		return result*result2;
	}

	@Override
	public ArrayList<Good> selectGood() {
		ArrayList<Good> list = feedDao.selectGood(sqlSession);
		return list;
	}

	@Override
	public ArrayList<Member> selectMember() {
		ArrayList<Member> list = feedDao.selectMember(sqlSession);
		return list;
	}

	@Override
	public int insertReply(Reply r) {
		int result = feedDao.insertReply(sqlSession,r);
		return result;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int refQno) {
		ArrayList<Reply> list = feedDao.selectReplyList(sqlSession,refQno);
		return list;
	}

	@Override
	public int deleteReply(int replyNo) {
		int result = feedDao.deleteReply(sqlSession,replyNo);
		return result;
	}

	@Override
	public int updateReply(Reply r) {
		int result = feedDao.updateReply(sqlSession,r);
		return result;
	}

	@Override
	@Transactional
	public int reportReply(String nickname, Report rep) {
		int result = feedDao.reportReply(sqlSession,nickname,rep);
		return result;
	}

	@Override
	public int insertAnswer(Rereply re) {
		int result = feedDao.insertAnswer(sqlSession,re);
		return result;
	}

	@Override
	public ArrayList<Rereply> selectRereply(int replyNo) {
		ArrayList<Rereply> list = feedDao.selectRereply(sqlSession,replyNo);
		return list;
	}

	@Override
	public int deleteRere(int refRno) {
		int result = feedDao.deleteRere(sqlSession,refRno);
		return result;
	}

	@Override
	public int updateRere(Rereply re) {
		int result = feedDao.updateRere(sqlSession,re);
		return result;
	}

	@Override
	@Transactional
	public int rereportReply(String nickname, Report rep) {
		int result = feedDao.rereportReply(sqlSession,nickname,rep);
		return result;
	}
	
//이미 신고되었는지 확인 여부
	@Override
	public boolean isAlreadyReported(Report rep) {
		boolean isAlreadyReported = feedDao.isAlreadyReported(sqlSession,rep);
		return isAlreadyReported;
	}

	@Override
	public Board selectBoard(int boardNo) {
		Board b = feedDao.selectBoard(sqlSession, boardNo);
		return b;
	}

	@Override
	public ArrayList<Attachment> selectAttachment(int boardNo) {
		ArrayList<Attachment> list = feedDao.selectAttachment(sqlSession,boardNo);
		return list;
	}

	@Override
	public int updateFeed(Board b, ArrayList<Attachment> list, Info in) {
		int result = feedDao.updateBoard(sqlSession,b);
		int result2 = 1;
		for(Attachment at : list) {
			
			result2 *= feedDao.updateAttachment(sqlSession,at);
		}
		int result3 = feedDao.updateInfo(sqlSession,in);
		System.out.println(result3);
		
		return result * result2 * result3;
	}

	//게시물수정시 기존에 있던 사진지우기
	@Override
	public int deleteAttachment(int boardNo) {
		int result = feedDao.deleteAttachment(sqlSession,boardNo);
		/* System.out.println("서비스:"+result); */
		return result;
	}

	//인기순
	@Override
	public ArrayList<Board> rankingBoardList(PageInfo pi) {
		ArrayList<Board> list = feedDao.rankingBoardList(sqlSession,pi);
		return list;
	}

	//도시 선택
	@Override
	public ArrayList<Board> selectCityList(PageInfo pi, int city) {
		ArrayList<Board> list = feedDao.selectCityList(sqlSession,pi,city);
		return list;
	}

	//도시선택 갯수
	@Override
	public int selectListCount(int city) {
		int result = feedDao.selectListCount(sqlSession,city);
		return result;
	}

	//게시물 신고
	@Override
	public int reportBoard(Report re, String nickname) {
		int result = feedDao.reportBoard(sqlSession,nickname);
		int result2 = feedDao.insertReport(sqlSession,re);
		return result * result2;
	}

	//도시선택 인기순
	@Override
	public ArrayList<Board> selectRankingList(PageInfo pi, int city) {
		ArrayList<Board> list = feedDao.selectRankingList(sqlSession,pi,city);
		return list;
	}

	//댓글갯수리스트
	@Override
	public ArrayList<Reply> selectRereply() {
		ArrayList<Reply> list = feedDao.selectReplyList(sqlSession);
		return list;
	}


	

}

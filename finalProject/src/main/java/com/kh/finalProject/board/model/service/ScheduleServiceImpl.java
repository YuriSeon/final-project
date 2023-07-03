package com.kh.finalProject.board.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.model.dao.AttractionDao;
import com.kh.finalProject.board.model.dao.ScheduleDao;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Path;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.common.model.vo.PageInfo;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scDao;
	@Autowired
	private SqlSession sqlSession;
	
	// 일정 등록
	@Override
	public int insertSchedule(Plan plan) {
		// 1. 지역코드 조회해서 set (기존 attraction에서 사용한 메소드 사용)
//		if(plan.getAddress()!=null) {
//			plan.setZoneNo(AttractionDao.selectZoneNo(sqlSession, plan.getAddress()));
//		}
		// 2. board + plan 등록
		return scDao.insertSchedule(sqlSession, plan);
	}
	// info + 해당 img 등록
	// (기존 attraction에서 사용한 메소드 static으로 사용)
	@Override
	@Transactional
	public int insertInfoAttach(Info info, ArrayList<Attachment> atList) {
		// 1. 지역코드 조회해서 set
//		info.setZoneNo(AttractionDao.selectZoneNo(sqlSession, info.getInfoAddress()));
		// 2. info 등록
		int result = AttractionDao.insertInfo(sqlSession, info);
		// 3. attachment 등록
		if(atList!=null) { // 이미지가 없으면 null로 전달받아서 있을때만 등록 진행
			for(Attachment at : atList) {
				result *= AttractionDao.insertAttachment(sqlSession, at);
			}
		}
		return result;
	}

	// path 등록 + plan에 infoNo 추가해주기
	@Override
	@Transactional
	public int insertPath(String[][] pathArr, int num) {
		int result = 1;
		for(int i=0; i<pathArr.length; i++) {
			// pathArr[i] = [infoName, daily, pathNo, infoAddress, pay] 순서로 담겨있음 
			Path path = Path.builder().boardNo(num).infoName(pathArr[i][0]).daily(Integer.parseInt(pathArr[i][1])).pathNo(Integer.parseInt(pathArr[i][2])).build();
			if(pathArr[i].length==5 && pathArr[i][4]!=null) { // 해당 인덱스 존재 여부와 문자열로 보낸값이기에 null ck
				path.builder().pay(Integer.parseInt(pathArr[i][4]));
			} else {
				path.builder().pay(0);
			}
			result *= scDao.insertPath(sqlSession, path);
			// 등록한 path로 해당 infoNo 조회해와서 plan에 업데이트
			System.out.println("service 부분    "+path);
			int infoNo = scDao.searchInfoNo(sqlSession, path); 
			path.setInfoNo(infoNo);
			result *= scDao.updatePlanInfoNo(sqlSession, path);
		}
		return result;
	}

	// 기존에 등록되어있는 info인지 체크
	@Override
	public int checkInfo(String address) {
		return AttractionDao.checkInfo(sqlSession, address);
	}
	@Override
	public int selectListCount(String sort) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

}

package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.finalProject.board.controller.AttractionController;
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
	
	// 기존에 등록되어있는 info인지 체크
	@Override
	public int checkInfo(String address) {
		return AttractionDao.checkInfo(sqlSession, address);
	}
		
	// 일정 등록
	@Override
	@Transactional
	public int insertSchedule(HttpSession session, Plan plan, ArrayList<Info> infoList, String[][] pathArr) {
		ArrayList<Attachment> atList = new ArrayList<>(); // 첨부파일 담을 리스트 선언 (attachment 등록)
		// 1. 지역코드 조회해서 set (기존 attraction에서 사용한 메소드 사용)
		plan.setZoneNo(AttractionDao.selectZoneNo(sqlSession, plan.getAddress()));
		// 2. board + plan 등록
		int result = scDao.insertSchedule(sqlSession, plan);
		// 방금 등록한 bno와 infoNo 조회해와서 사용
		Board b = scDao.checkBno(sqlSession, plan);
		// 3. 가져온 장소 정보안에 img url 추출 (이미지 다운)후 등록
		// imgsrc 리스트에 담기(infoList의 boardContent ||구분자로 [0] -> 이 안에 url |구분자로 들어있음
		for(int i=0; i<infoList.size(); i++) {
			ArrayList<String> imgURL = new ArrayList<>();
			if(infoList.get(i).getBoardContent()!=null) {
				// 기존에 사용하던 메소드 사용해서 json의 형태로 받았기에 한글자씩 문자열의 배열로넘어옴. 원하는 형태로 가공하기 위해 문자열로 합쳐줌
				String urlString = String.join(infoList.get(i).getBoardContent()); 
				String[] str = urlString.split("||");
				if(str[0].contains("|")) { //이미지가 여러개
					System.out.println("str1 :   "+str[1]);
					infoList.get(i).setBoardContent(str[1]);
					String[] url = str[0].split("|"); // info 하나의 url들
					System.out.println("구분자 제거한 url들 : "+ Arrays.toString(url));
					for(int j=0; j<url.length; j++) {
						imgURL.add(url[j]);
						atList = AttractionController.imgTool(session, imgURL);
					}
				} else if(str[0].contains("http")){ // 이미지가 하나
					imgURL.add(str[0]);
					infoList.get(i).setBoardContent(str[1]);
					atList = AttractionController.imgTool(session, imgURL);
				} else { // 이미지 정보가 없을때
					atList = null;
				}
				// 4. info와 해당하는 img등록 (기존 attraction에서 사용한 메소드 static으로 사용)
				infoList.get(i).setZoneNo(plan.getZoneNo());
				AttractionDao.insertInfo(sqlSession, infoList.get(i));
				// attachment 등록
				if(atList!=null) { // 이미지가 없으면 null로 전달받아서 있을때만 등록 진행
					for(Attachment at : atList) {
						result *= AttractionDao.insertAttachment(sqlSession, at);
					}
				}
			}
		}
		// 5. path 등록하면서 plan에 infoNo 추가해주기
		for(int i=0; i<pathArr.length; i++) {
			// pathArr[i] = [infoName, daily, pathNo, infoAddress, pay] 순서로 담겨있음 
			Path path = Path.builder().boardNo(b.getBoardNo())
									.infoName(pathArr[i][0])
									.daily(Integer.parseInt(pathArr[i][1]))
									.pathNo(Integer.parseInt(pathArr[i][2])).build();
			if(pathArr[i].length==5 && pathArr[i][4]!=null) { // 해당 인덱스 존재 여부와 문자열로 보낸값이기에 null ck
				path.builder().pay(Integer.parseInt(pathArr[i][4]));
			} else {
				path.builder().pay(0);
			}
			result *= scDao.insertPath(sqlSession, path);
			// 등록한 path로 해당 infoNo 조회해와서 plan에 업데이트
			int infoNo = scDao.searchInfoNo(sqlSession, path); 
			path.setInfoNo(infoNo);
			result *= scDao.updatePlanInfoNo(sqlSession, path);
		}
		return result;
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

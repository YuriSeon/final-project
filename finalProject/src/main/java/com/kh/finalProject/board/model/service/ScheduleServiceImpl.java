package com.kh.finalProject.board.model.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

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
	public int checkInfo(String infoName) {
		return AttractionDao.checkInfo(sqlSession, infoName);
	}
		
	// 일정 등록
	@Override
	public int insertSchedule(HttpSession session, Plan plan, ArrayList<String[]> path) {
		// 1. 지역코드 조회해서 set (기존 attraction에서 사용한 메소드 사용)
		plan.setZoneNo(AttractionDao.selectZoneNo(sqlSession,path.get(0)[3]));
		// 2. board + plan 등록
		int result = scDao.insertSchedule(sqlSession, plan);
		
		return result;
	}
	// boardNo 조회
	// 2. 등록한 no 조회해서 사용
	@Override
	public Board checkBno(Plan plan) {
		return scDao.checkBno(sqlSession, plan);
	}
	
	// attach, info 등록
	@Override
	@Transactional
	public int insertInfoFile(HttpSession session, Plan plan, ArrayList<String[]> path, ArrayList<Info> infoList) {
		ArrayList<Attachment> atList = new ArrayList<>(); // 첨부파일 담을 리스트 선언 (attachment 등록)
		int result = 0;
		// 3. 가져온 장소 정보안에 img url 추출 (이미지 다운)후 등록
		// imgsrc 리스트에 담기(infoList의 boardContent $$$구분자로 [0] -> 이 안에 url $$구분자로 들어있음
		for(int i=0; i<infoList.size(); i++) {
			ArrayList<String> imgURL = new ArrayList<>();
			System.out.println(infoList.get(i).getBoardContent());
			if(infoList.get(i).getBoardContent()!=null || infoList.get(i).getBoardContent().equals("")||infoList.get(i).getBoardContent().equals(" ")) {
				// 기존에 사용하던 메소드 사용해서 json의 형태로 받았기에 한글자씩 문자열의 배열로넘어옴. 원하는 형태로 가공하기 위해 문자열로 합쳐줌
				String urlString = infoList.get(i).getBoardContent();
				System.out.println(urlString);
				String[] str = urlString.split("~~~~");
				infoList.get(i).setBoardContent(str[1]);
				System.out.println(Arrays.toString(str));
				if(str[0].contains("~~~")) { //이미지가 여러개
					String[] url = str[0].split("~~~"); // info 하나의 url들
					for(int j=0; j<url.length; j++) {
						imgURL.add(url[j]);
						atList = AttractionController.imgTool(session, imgURL);
					}
				} else if(str[0].contains("http")){ // 이미지가 하나
					imgURL.add(str[0]);
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
		return result;
	}
	
	// path 등록 및 infoNo plan에 추가
	@Override
	public int insertPath(ArrayList<String[]> path, Plan plan) {
		// 5. path 등록하면서 plan에 infoNo 추가해주기
		int result = 0;
		for(int i=0; i<path.size(); i++) {
			System.out.println(path.get(i)[0]);
			// path.get(i) = [infoName, daily, pathNo, infoAddress, pay] 순서로 담겨있음 
			Path p = Path.builder().boardNo(plan.getBoardNo())
					.infoName(path.get(i)[0])
					.daily(Integer.parseInt(path.get(i)[1]))
					.pathNo(Integer.parseInt(path.get(i)[2]))
					.address(path.get(i)[3]).build();
			if(!path.get(i)[4].equals("")&&!path.get(i)[4].equals(" ")&&path.get(i)[4]!=null) { // 빈문자열 or 공백 or null ck
				p.setPay(Integer.parseInt(path.get(i)[4]));
			} else {
				p.setPay(0);
			}
			System.out.println(p);
			result = scDao.insertPath(sqlSession, p);
			// 등록한 path로 해당 infoNo 조회해와서 plan에 업데이트
			int infoNo = scDao.searchInfoNo(sqlSession, p); 
			p.setInfoNo(infoNo);
			result *= scDao.updatePlanInfoNo(sqlSession, p);
			
		}
		return result;
	}
	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return scDao.increaseCount(sqlSession, boardNo);
	}
	
	// 디테일뷰 조회
	@Override
	@Transactional
	public HashMap<String, Object> selectSchedule(int boardNo) {
		HashMap<String, Object> dataMap = new HashMap<>();
		// Plan+board조회
		Plan p = scDao.selectBoard(sqlSession, boardNo);
//		 게시물 안에 들어있는 infoNo 추출해서 사용
		String[] pathList = p.getPathList().split("/");
//		 info+ attachment 조회
		ArrayList<Info> info = new ArrayList<>();
		HashMap<Integer, ArrayList<Attachment>> atList = new HashMap<>();
		for(int i =1; i<pathList.length; i++) { // 맨앞에 /가 있어서 1번부터 길이까지 조회
			info.add(scDao.selectInfo(sqlSession,Integer.parseInt(pathList[i])));
			atList.put(Integer.parseInt(pathList[i]), scDao.selectAttachList(sqlSession, Integer.parseInt(pathList[i])));
		}
		// path 조회 
		ArrayList<Path> pList = scDao.selectPathList(sqlSession,boardNo);
		dataMap.put("plan", p);
		dataMap.put("info", info);
		dataMap.put("atList", atList);
		dataMap.put("pList", pList);
		return dataMap;
	}

	// 게시물 삭제 (board, path, plan)
	@Override
	public int deleteSchedule(Plan plan) {
		// path 삭제
		int result = scDao.deletePath(sqlSession, plan);
		// plan 삭제
		int result2 =  scDao.deletePlan(sqlSession, plan);
		// board 삭제
		int result3 = scDao.deleteBoard(sqlSession, plan);
		return result*result2*result3;
	}

	// 일정 메인페이지 리스트 개수
	@Override
	public int mainListCount() {
		return scDao.mainListCount(sqlSession);
	}

	// 일정 메인 전체 리스트 조회
	@Override
	public HashMap<String, Object> mainSelectList(PageInfo pi, String sort) {
		HashMap<String, Object> dataMap = new HashMap<>();
		ArrayList<Plan> pList= scDao.planList(sqlSession, pi, sort);
		ArrayList<Board> together= scDao.boardList(sqlSession);
		ArrayList<Attachment> at = new ArrayList<>();
		for(Plan p : pList) {
			// 조회해온 infoNo에 들어있는 구분자 제거해서 배열로 만든 뒤 조회 요청보내기
			// (맨앞부터 '/' 들어있어 인덱스 1번부터 진행)
			if(p.getPathList()!=null && p.getPathList().equals("") && p.getPathList().equals(" ")) {
				String[] infoNo = p.getPathList().split("/");
				for(int i=1; i<=infoNo.length; i++ ) {
					// 첨부파일 조회
					at = scDao.selectAttachList(sqlSession, Integer.parseInt(infoNo[i]));
					for(int j=0; j<at.size(); j++) {
						Attachment a = null;
						if(at.get(j).getFileLevel()==1) { //대표이미지가 있다면 반복문 빠져나가기
							a = at.get(j);
							break;
						} else if(j==at.size()&& a==null){ // 반복문 동안에 대표이미지가 없었다면 
							a = at.get(0); // 첫번째 사진 가져가기
						}
						at.add(a); // 조회한 사진 반환할 리스트에 담아주기
					}
				}
			}
		}
		dataMap.put("plan", pList);
		dataMap.put("together", together);
		dataMap.put("attachment", at);
		return dataMap;
	}


}

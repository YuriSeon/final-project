package com.kh.finalProject.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.Selenium;



@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	
	// 일정 등록페이지 이동
	@GetMapping("insert.sc")
	public String insertSc() {
		return "board/schedule/enrollPage";
	}
	
	// 일정 등록
	@PostMapping("insert.sc")
	public void insertSc(@RequestParam(value="path") String[] path,
						 Plan plan, HttpSession session, ModelAndView mv) {
		// 1. 데일리 일정 경로별 데이터 조회
		ArrayList<Info> infoList = new ArrayList<>(); // 검색한 데이터 담을 리스트 선언 (Info 등록)
		String[][] pathArr = new String[path.length][]; // 전달받은 값 담을 이차배열 선언 (path 등록)
		// 전달받은 path 가공해 selenium으로 데이터 찾아오기
		for(int i=0; i<path.length; i++) {
			String[] str = path[i].split(","); //구분자로 구분해서 배열에 넣기
			pathArr[i] = new String[str.length]; // 이차배열 길이 설정
			for(int j=0; j<str.length; j++) {
				pathArr[i][j] = str[j]; 
			}
			infoList.add(new Selenium().infoDataGet(pathArr[i]));
		}
		// 2. 가져온 장소 정보안에 img url 추출 (이미지 다운)
		// imgsrc 리스트에 담기(infoList의 boardContent ||구분자로 [0]
		ArrayList<String> imageURL = new ArrayList<>();
		for(int i=0; i<infoList.size(); i++) {
			String[] str = infoList.get(i).getBoardContent().split("||");
			imageURL.add(str[0]);
		}
		// URL로 이미지 다운로드 및 데이터 정보 추출 (기존에 attraction에서 사용한 메소드 사용)
		ArrayList<Attachment> atList = AttractionController.imgTool(session, imageURL);
		
		// 3. 등록할 정보 Map에 담아서 등록
		HashMap<String, Object> dataMap = new HashMap<>();
		dataMap.put("plan", plan);
		dataMap.put("info", infoList);
		dataMap.put("path", pathArr);
		dataMap.put("at", atList);
		
		int result = scService.insertSc(dataMap);
	}
	
	
	
}

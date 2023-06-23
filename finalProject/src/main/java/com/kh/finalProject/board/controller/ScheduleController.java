package com.kh.finalProject.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.finalProject.board.model.service.ScheduleService;



@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	
	// 게시물 등록페이지 이동
	@GetMapping("insert.sc")
	public String scInsert() {
		return "board/schedule/enrollPage";
	}
//	
//	@PostMapping("insert.sc")
//	public void scInsert(@RequestParam(value="path") String[] path) {
//		String[][] pathArr = new String[path.length][]; // 전달받은 값 담을 이차배열 선언
//		// 전달받은 path 가공해 selenium으로 데이터 찾아오기
//		for(int i=0; i<path.length; i++) {
//			String[] str = path[i].split(","); //구분자로 구분해서 배열에 넣기
//			pathArr[i] = new String[str.length]; // 이차배열 길이 설정
//			for(int j=0; j<str.length; j++) {
//				pathArr[i][j] = str[j]; 
//			}
//			new Selenium().infoDataGet(pathArr[i]);
//		}
//	}
	
	
	
}

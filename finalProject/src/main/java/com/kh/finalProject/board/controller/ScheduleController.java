package com.kh.finalProject.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.finalProject.board.model.vo.Selenium;
import com.kh.finalProject.board.service.ScheduleService;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	private Selenium sel;
	
	// 게시물 등록페이지 이동
	@GetMapping("insert.sc")
	public String scInsert() {
		return "schedule/enrollPage";
	}
	
	@PostMapping("insert.sc")
	public void scInsert(@RequestParam(value="path") String[] path) {
		System.out.println(path[0].toString());
		System.out.println(path[1].toString());
		
		String[][] pathArr = {};
		// 전달받은 path 가공해 selenium으로 데이터 찾아오기
		for(int i=0; i<path.length; i++) {
			String[] str = path[i].split(","); //구분자로 구분해서 배열에 넣
			System.out.println(str.toString());
			System.out.println((path[i].split(",").toString()));
			for(int j=0; j<str.length; j++) {
				pathArr[i][j] = str[i]; 
				System.out.println(str[i]);
			}
			sel.infoDataGet(pathArr[i]);
		}
	}
}

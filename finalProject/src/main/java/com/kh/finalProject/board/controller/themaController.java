package com.kh.finalProject.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.finalProject.board.model.service.ThemaService;

@Controller
public class themaController {
	
	/*
	 * @Autowired private ThemaService themaService;
	 */
	
	//테마리스트페이지로 이동
	@RequestMapping("themaList.bo")
	public String themeList() {
		
		return "thema/themaList";
	}
	
	//등록페이지로 이동
	@RequestMapping("themaEnroll.bo")
	public String themaEnroll() {
		return "thema/EnrollForm";
	}

}

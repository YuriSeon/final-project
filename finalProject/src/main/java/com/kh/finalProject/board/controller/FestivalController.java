package com.kh.finalProject.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FestivalController {

	//축제 등록 페이지
	@RequestMapping("fesEnrollForm.fe")
	public String FesEnrollerForm() {
		return "board/festivalEnrollForm";
	}
}

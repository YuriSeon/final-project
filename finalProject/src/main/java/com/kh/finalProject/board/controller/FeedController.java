package com.kh.finalProject.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FeedController {

	@RequestMapping("enroll.fo")
	public String enrollForm() {
		return "board/feedEnrollerForm";
	}
}

package com.kh.finalProject.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Path;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	// 게시물 등록페이지 이동
	@GetMapping("insert.sc")
	public String scInsert() {
		return "schedule/enrollPage";
	}
	
//	@PostMapping("insert.sc")
//	public ModelAndView scInsert(ModelAndView mv, HttpSession session, MultipartFile upfile, Attachment a, Path p) {
//		
//	}
}

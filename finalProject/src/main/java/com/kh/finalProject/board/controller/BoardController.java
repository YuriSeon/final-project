package com.kh.finalProject.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.service.AttrarctionService;
import com.kh.finalProject.board.service.FeedService;
import com.kh.finalProject.board.service.ScheduleService;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	private AttrarctionService atService;
	
	@Autowired
	private ScheduleService scService;
	
	@Autowired
	private FeedService feedService;
	
	@RequestMapping("main.bo")
	public String goMain() {
		return "redirect:/";
	}
	
	@RequestMapping("theme.bo")
	public String goTheme() {
		return "board/theme";
	}
	
	@RequestMapping("festival.bo")
	public String goFestival() {
		return "board/festival";
	}
	
	@RequestMapping("attraction.bo")
	public String goAttraction(@RequestParam(value="currentPage", defaultValue="1") int currentPage
								, String sort, Model model) {
		
		int listCount = atService.selectListCount();
		
		int pageLimit = 5;
		
		int boardLimit = 6;
		
		PageInfo pi = new PageInfo(listCount, pageLimit, boardLimit, currentPage);
		
		ArrayList<Board> list = atService.selectBoardList(pi);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pi", pi);
		
		return "board/attraction";
	}
	
	@RequestMapping("feed.bo")
	public String goFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model) {

		ArrayList<Attachment> alist = feedService.selectAttachmentList();
		int listCount = feedService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = feedService.selectBoardList(pi);
//		for(int i=0; i<list.size(); i++) {
//
//			alist.add(feedService.selectAttachmentList(list.get(i).getBoardNo()));
//		}
//		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("alist", new Gson().toJson(alist));
		model.addAttribute("size", alist.size());
		
		
		return "board/feed";
	}
	
	@RequestMapping("schedule.bo")
	public String goSchedule(@RequestParam(value="sort", defaultValue="recently") String sort
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = scService.selectListCount(sort);
		
		int pageLimit = 5;
		
		int boardLimit = 5;
		
		PageInfo pi = new PageInfo(listCount, pageLimit, boardLimit, currentPage);
		
		ArrayList<Board> list = scService.selectBoardList(pi, sort);
		
		model.addAttribute("list", list);
		
		model.addAttribute("pi", pi);
		
		return "board/schedule";
	}
	
	@RequestMapping("together.bo")
	public String goTogether() {
		return "board/together";
	}

	@GetMapping("survey.me")
	public String survey() {
		return "member/myPage/survey";
	}
}

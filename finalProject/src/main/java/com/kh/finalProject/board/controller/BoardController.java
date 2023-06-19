package com.kh.finalProject.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.AttrarctionService;
import com.kh.finalProject.board.model.service.FeedService;
import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.service.TogetherService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private AttrarctionService atService;
	
	@Autowired
	private ScheduleService scService;
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private TogetherService togetherService;
	
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
	public String goFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model,HttpServletRequest request) {

		
		ArrayList<Good> glist = feedService.selectGood();
		ArrayList<Attachment> alist = feedService.selectAttachmentList();
		int listCount = feedService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = feedService.selectBoardList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("blist", new Gson().toJson(list));
		model.addAttribute("bsize",list.size());
		model.addAttribute("pi", pi);
		model.addAttribute("alist", new Gson().toJson(alist));
		model.addAttribute("size", alist.size());
		model.addAttribute("glist",new Gson().toJson(glist));

		return "board/feed";
	}
	
	@RequestMapping("schedule.bo")
	public String goSchedule(@RequestParam(value="sort", defaultValue="recently") String sort
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		return "board/schedule";
	}
	
	@RequestMapping("together.bo")
	public ModelAndView goTogether(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = togetherService.selectListCount();
		
		int pageLimit = 5;
		
		int boardLimit = 6;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<TogetherVO> list = togetherService.selectTogetherList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("board/together");
		
		return mv;
	}

	@GetMapping("survey.me")
	public String survey() {
		return "member/myPage/survey";
	}
}

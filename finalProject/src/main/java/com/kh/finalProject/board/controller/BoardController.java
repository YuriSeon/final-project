package com.kh.finalProject.board.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.AttractionService;
import com.kh.finalProject.board.model.service.FeedService;
import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.service.TogetherService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class BoardController {
	
	@Autowired
	private AttractionService atService;
	
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
	
	@RequestMapping("attraction.bo")
	public String goAttraction(@RequestParam(value="currentPage", defaultValue="1") int currentPage
								, String sort, Model model) {
		return "board/attraction/attraction";
	}
	
	@RequestMapping("feed.bo")
	public String goFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage
						,@RequestParam(value="sort",defaultValue = "1") int sort
						,Model model,HttpServletRequest request) {

		ArrayList<Member> mlist = feedService.selectMember();
		ArrayList<Good> glist = feedService.selectGood();
		ArrayList<Attachment> alist = feedService.selectAttachmentList();
		//댓글갯수리스트
		ArrayList<Reply> rlist = feedService.selectRereply();
		int listCount = feedService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = new ArrayList<>();
		if(sort == 1) {			
			list = feedService.selectBoardList(pi);			
		}else if(sort ==2) {
			list = feedService.rankingBoardList(pi);
		}
		
		
		
		model.addAttribute("list", list);
		model.addAttribute("blist", new Gson().toJson(list));
		model.addAttribute("bsize",list.size());
		model.addAttribute("pi", pi);
		model.addAttribute("alist", new Gson().toJson(alist));
		model.addAttribute("size", alist.size());
		model.addAttribute("glist",new Gson().toJson(glist));
		model.addAttribute("mlist",new Gson().toJson(mlist));
		model.addAttribute("sort", sort);

		return "board/feed";
	}
	
	@RequestMapping("schedule.bo")
	public String goSchedule(@RequestParam(value="sort", defaultValue="recently") String sort
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		return "board/schedule/schedule";
	}
	
	public String getCookie(HttpServletRequest request){
	    Cookie[] cookies=request.getCookies(); // 모든 쿠키 가져오기
	    if(cookies!=null){
	        for (Cookie c : cookies) {
	            String name = c.getName(); // 쿠키 이름 가져오기
	            String value = c.getValue(); // 쿠키 값 가져오기
	            if (name.equals("mbtiCheck")) {
	                return value;
	            }
	        }
	    }
	    return null;
	}
	
	@RequestMapping("together.bo")
	public ModelAndView goTogether(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, 
																@RequestParam(value="mbtiCheck", defaultValue="null") String mbtiCheck, HttpServletResponse response
																,HttpServletRequest request) throws UnsupportedEncodingException {
		
		Cookie cookie = null;
		
		String loginMbti = null;
		
		if(request.getSession().getAttribute("loginUser") != null) {
			loginMbti = ((Member)(request.getSession().getAttribute("loginUser"))).getSurvey().split(" ")[0];
		}
		
		if(getCookie(request) != null && !getCookie(request).equals("null") && !getCookie(request).split("\\+")[1].equals(loginMbti) && mbtiCheck != null) {
			System.out.println("check");
			mbtiCheck = URLEncoder.encode(mbtiCheck, "UTF-8");
			cookie = new Cookie("mbtiCheck",mbtiCheck);
			cookie.setMaxAge(60*60*24*3);
			response.addCookie(cookie);
		}else if(getCookie(request) != null && getCookie(request).equals("null")) {
			System.out.println("check2");
			mbtiCheck = URLEncoder.encode(mbtiCheck, "UTF-8");
			cookie = new Cookie("mbtiCheck",mbtiCheck);
			cookie.setMaxAge(60*60*24*3);
			response.addCookie(cookie);
		}else if(getCookie(request) == null ) {
			System.out.println("check3");
			mbtiCheck = URLEncoder.encode(mbtiCheck, "UTF-8");
			cookie = new Cookie("mbtiCheck",mbtiCheck);
			cookie.setMaxAge(60*60*24*3);
			response.addCookie(cookie);
		}
		
		int listCount = togetherService.selectListCount();
		
		int pageLimit = 5;
		
		int boardLimit = 6;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<TogetherVO> list = togetherService.selectTogetherList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("board/together/together");
		
		return mv;
	}

	@GetMapping("survey.me")
	public String survey() {
		return "member/myPage/survey";
	}
	
}

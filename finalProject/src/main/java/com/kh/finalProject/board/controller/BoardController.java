package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.AttractionService;
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
	private AttractionService atService;
	
	@Autowired
	private ScheduleService scService;
	
	@Autowired
	private FeedService feedService;
	
	@Autowired
	private TogetherService togetherService;
	
	// file upload changeName생성 
	public static String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 1. 원본 파일명 뽑기
		String originName = upfile.getOriginalFilename();
		
		// 2. 시간형식 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙은 5자리 랜덤값 뽑아주기
		int ranNum = (int)(Math.random()*90000+10000); // 5자리 랜덤값
		
		// 4. 확장자명 추출하기
		String ext = originName.substring(originName.lastIndexOf("."));
		
		// 5. 추출한 문자열들 다 합쳐서 changeName 만들기
		String changeName = currentTime+ranNum+ext;
		
		// 6. 업로드하고자하는 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 7. 경로와 수정파일명을 합쳐 파일 업로드하기
		try {
			upfile.transferTo(new File(savePath+changeName)); //파일 업로드 구문
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return changeName;
	}
	
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
	public String goFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage,Model model,HttpServletRequest request) {

		ArrayList<Member> mlist = feedService.selectMember();
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
		model.addAttribute("mlist",new Gson().toJson(mlist));

		return "board/feed";
	}
	
	@RequestMapping("schedule.bo")
	public String goSchedule(@RequestParam(value="sort", defaultValue="recently") String sort
								,@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		return "board/schedule/schedule";
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

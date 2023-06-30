package com.kh.finalProject.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.admin.model.service.AdminService;
import com.kh.finalProject.admin.model.vo.Criteria;
import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;



@Controller
public class AdminController {

	@Autowired
	private ServletContext ServletContext;
	
	@Autowired
	public AdminService adminService;
	
	
	//파일 업로드 처리 메소드 (모듈)
	public String saveFile(MultipartFile upfile,HttpSession session) {
		String originName= upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000);//5자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime+ranNum+ext;
		String savePath = session.getServletContext().getRealPath("/resources/images/notice/");
		
		try {
			//파일업로드 구문
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	//관리자 페이지로 이동
	@RequestMapping("admin.ad")
	public String goAdmin() {
		return "admin/dashboard";
	}
	
	//사용자 페이지로 이동
	@RequestMapping("custom.ad")
	public String goCustom() {
		return "redirect:/";
	}

//==================================================대시보드===========================================================	
	
	//대시보드 최근 신고 5개
	@ResponseBody
	@RequestMapping(value = "currentReportList.ad",produces = "application/json; charset=UTF-8")
	public String selectList() {
		
		ArrayList<Report> list = adminService.currentReportList();
		return new Gson().toJson(list);
	}
	
//==================================================게시판관리-테마===========================================================
	
	//테마 페이지로 이동
	@RequestMapping("theme.ad")
	public ModelAndView goAdminTheme(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.themeListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectThemeList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adTheme");
		
		return mv;
	}
	
	//선택한 게시글 테마 삭제
	@ResponseBody
	@RequestMapping(value = "themeChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String themeChkDelete(@RequestParam(value = "list[]") int[] list, HttpSession session) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		for (Integer i : list) {
			
			ArrayList<Attachment> a = adminService.themeFilePath(i);
			
			for (Attachment file : a) {
				new File(ServletContext.getRealPath("/"+file.getFilePath())).delete();
			}
			
			result1 = adminService.themeBoardDel(i);
			result2 = adminService.themeFileDel(i);
			result3 = adminService.themeDel(i);
			result4 = adminService.themeInfoDel(i);
		}
		
		if(result1*result2*result3*result4>0) {
			session.setAttribute("alertMsg","게시글 삭제 완료");
		}
		
		return (result1*result2*result3*result4>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	//게시글 테마 검색
	@GetMapping("themeSearch.ad")
	public ModelAndView themeSearch(Criteria cri
					 			   ,ModelAndView mv
								   ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.themeSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Board> list = adminService.themeSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adTheme");
		
		return mv;
	}
	
	//게시글 테마 수정 페이지 이동
	@RequestMapping("themeSelect.ad")
	public ModelAndView themeSelect(@RequestParam(value="boardNo") int boardNo
					 											  ,ModelAndView mv) {

		Board b = adminService.festivalSelect(boardNo);
		ArrayList<Attachment> a = adminService.festivalFileSelect(boardNo);
		Theme t = adminService.themeSelect(boardNo);
		Info i = adminService.festivalInfoSelect(boardNo);

		mv.addObject("b", b);
		mv.addObject("a", a);
		mv.addObject("t", t);
		mv.addObject("i", i).setViewName("admin/adThemeUpdate");
		
		return mv;
	}
	
	//게시글 테마 수정
	@RequestMapping("themeUpdate.ad")
	public ModelAndView themeUpdate(Board b
								   ,ModelAndView mv
								   ,HttpSession session
								   ,MultipartFile[] upfile
								   ,Info in
								   ,Theme m) {
		
		//파일 이름 바꾸기
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i<upfile.length; i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {//파일이 있으면
				
				ArrayList<Attachment> a = adminService.themeFilePath(b.getBoardNo());
				
				//기존 파일 삭제
				for (Attachment file : a) {
					adminService.themeFileDel(b.getBoardNo());
					new File(ServletContext.getRealPath("/"+file.getFilePath())).delete();
				}
				
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int) (Math.random()*90000+10000);
				//확장자명 추출
				String ext = originName.substring(originName.lastIndexOf("."));
				//추출한 문자열 합쳐서 changeName만들기
				String changeName = currentTime+ranNum+ext;
				//업로드하는 경로
				String filePath = session.getServletContext().getRealPath("/resources/images/thema/");
				
				//경로와 수정파일명 합쳐서 파일 업로드
				try {
					upfile[i].transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
				at.setBoardNo(b.getBoardNo());
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath("resources/images/thema/"+changeName);
				//파일 레벨 나누기
				if(i==0) {
					at.setFileLevel(1);
				}else {
					at.setFileLevel(2);
				}
				list.add(at);
			}
		}
		
		int result = adminService.themeUpdate(b,in,list,m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			mv.setViewName("redirect:theme.ad");
		}else {//실패시 파일도 지워주기
			for(int i=0; i<list.size(); i++) {
				new File(session.getServletContext().getRealPath("/"+list.get(i).getFilePath())).delete();
			}
			mv.addObject("errorMsg", "게시글 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;	
	}
	
//==================================================게시판관리-축제===========================================================
	
	//축제 페이지로 이동
	@RequestMapping("festival.ad")
	public ModelAndView goAdminFestival(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.festivalListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectFestivalList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adFestival");
		
		return mv;
	}
	
	//게시글 축제 검색
	@GetMapping("festivalSearch.ad")
	public ModelAndView festivalSearch(Criteria cri
									  ,ModelAndView mv
									  ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.festivalSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Board> list = adminService.festivalSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adFestival");
		
		return mv;
	}
	
	//선택한 게시글 축제 삭제
	@ResponseBody
	@RequestMapping(value = "festivalChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String festivalChkDelete(@RequestParam(value = "list[]") int[] list, HttpSession session) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		for (Integer i : list) {
			
			ArrayList<Attachment> a = adminService.themeFilePath(i);
			
			for (Attachment file : a) {
				new File(ServletContext.getRealPath("/"+file.getFilePath())).delete();
			}
			
			result1 = adminService.themeBoardDel(i);
			result2 = adminService.themeFileDel(i);
			result3 = adminService.festivalDel(i);
			result4 = adminService.themeInfoDel(i);
		}
		
		if(result1*result2*result3*result4>0) {
			session.setAttribute("alertMsg","게시글 삭제 완료");
		}
		
		return (result1*result2*result3*result4>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	//게시글 축제 수정 페이지 이동
	@RequestMapping("festivalSelect.ad")
	public ModelAndView festivalSelect(@RequestParam(value="boardNo") int boardNo
						 											 ,ModelAndView mv) {

		Board b = adminService.festivalSelect(boardNo);
		ArrayList<Attachment> a = adminService.festivalFileSelect(boardNo);
		Festival f = adminService.festivalFesSelect(boardNo);
		Info i = adminService.festivalInfoSelect(boardNo);

		mv.addObject("b", b);
		mv.addObject("a", a);
		mv.addObject("f", f);
		mv.addObject("i", i).setViewName("admin/adFestivalUpdate");
		
		return mv;
	}
	
	//게시글 테마 수정
	@RequestMapping("festivalUpdate.ad")
	public ModelAndView festivalUpdate(Board b
								      ,ModelAndView mv
								      ,HttpSession session
								      ,MultipartFile[] upfile
								      ,Info in
								      ,Festival f) {
		
		//파일 이름 바꾸기
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i<upfile.length; i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {//파일이 있으면
				
				ArrayList<Attachment> a = adminService.themeFilePath(b.getBoardNo());
				
				//기존 파일 삭제
				for (Attachment file : a) {
					adminService.themeFileDel(b.getBoardNo());
					new File(ServletContext.getRealPath("/"+file.getFilePath())).delete();
				}
				
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int) (Math.random()*90000+10000);
				//확장자명 추출
				String ext = originName.substring(originName.lastIndexOf("."));
				//추출한 문자열 합쳐서 changeName만들기
				String changeName = currentTime+ranNum+ext;
				//업로드하는 경로
				String filePath = session.getServletContext().getRealPath("/resources/images/festivalImg/");
				
				//경로와 수정파일명 합쳐서 파일 업로드
				try {
					upfile[i].transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
				at.setBoardNo(b.getBoardNo());
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath("resources/images/festivalImg/"+changeName);
				//파일 레벨 나누기
				if(i==0) {
					at.setFileLevel(1);
				}else {
					at.setFileLevel(2);
				}
				list.add(at);
			}
		}
		
		int result = adminService.festivalUpdate(b,in,list,f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "게시글 수정 완료");
			mv.setViewName("redirect:festival.ad");
		}else {//실패시 파일도 지워주기
			for(int i=0; i<list.size(); i++) {
				new File(session.getServletContext().getRealPath("/"+list.get(i).getFilePath())).delete();
			}
			mv.addObject("errorMsg", "게시글 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;	
	}

//==================================================게시판관리-명소===========================================================
	
	//명소 페이지로 이동
	@RequestMapping("attraction.ad")
	public ModelAndView goAdminAttraction(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.attractionListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectAttractionList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adAttraction");
		
		return mv;
	}

	//게시글 명소 검색
	@GetMapping("attractionSearch.ad")
	public ModelAndView attractionSearch(Criteria cri
									  ,ModelAndView mv
									  ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.attractionSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Board> list = adminService.attractionSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adAttraction");
		
		return mv;
	}
	
	//선택한 게시글 명소 삭제
	@ResponseBody
	@RequestMapping(value = "attractionChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String attractionChkDelete(@RequestParam(value = "list[]") int[] list, HttpSession session) {
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		for (Integer i : list) {
			
			ArrayList<Attachment> a = adminService.themeFilePath(i);
			
			for (Attachment file : a) {
				new File(ServletContext.getRealPath("/"+file.getFilePath())).delete();
			}
			
			result1 = adminService.themeBoardDel(i);
			result2 = adminService.themeFileDel(i);
			result4 = adminService.themeInfoDel(i);
		}
		
		if(result1*result2*result3*result4>0) {
			session.setAttribute("alertMsg","게시글 삭제 완료");
		}
		
		return (result1*result2*result3*result4>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
//==================================================게시판관리-피드===========================================================
	
	//피드 페이지로 이동
	@RequestMapping("feed.ad")
	public ModelAndView goAdminFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.feedListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectFeedList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adFeed");
		
		return mv;
	}
	
	//게시글 피드 검색
	@GetMapping("feedSearch.ad")
	public ModelAndView feedSearch(Criteria cri
								  ,ModelAndView mv
								  ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.feedSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Board> list = adminService.feedSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adFeed");
		
		return mv;
	}
	
	//게시글 피드 사진 출력
	@ResponseBody
	@RequestMapping(value = "feedSelectFile.ad",produces = "application/json; charset=UTF-8")
	public String feedSelectFile(int boardNo) {
		
		ArrayList<Attachment> list = adminService.feedSelectFile(boardNo);
		return new Gson().toJson(list);
	}
	
//==================================================게시판관리-일정자랑===========================================================
	
	//일정자랑 페이지로 이동
	@RequestMapping("schedule.ad")
	public ModelAndView goAdminSchedule(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.scheduleListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectScheduleList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adSchedule");
		
		return mv;
	}
	
//==================================================게시판관리-함께가치===========================================================
	
	//함께가치 페이지로 이동
	@RequestMapping("together.ad")
	public ModelAndView goAdminTogether(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.togetherListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = adminService.selectTogetherList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adTogether");
		
		return mv;
	}
	
//==================================================회원관리===========================================================
	
	//회원관리 페이지로 이동
	@RequestMapping("member.ad")
	public ModelAndView goAdminMember(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		int listCount = adminService.memberListCount();
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Member> list = adminService.selectMemberList(pi);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.setViewName("admin/adMember");
		
		return mv;
	}
	
	//회원 검색
	@GetMapping("memberSearch.ad")
	public ModelAndView memberSearch(Criteria cri
									,ModelAndView mv
									,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.memberSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Member> list = adminService.memberSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adMember");
		
		return mv;
	}
	
	//선택한 회원 탈퇴
	@ResponseBody
	@RequestMapping(value = "memberChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String memberChkDelete(@RequestParam(value = "list[]") int[] list
					   		  	 								 ,HttpSession session) {
		
		int result = 0;
		for (Integer i : list) {
			result = adminService.memberDelete(i);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","회원 탈퇴 완료");
		}
		
		return (result>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	//회원 편집 페이지로 이동
	@RequestMapping("goMemberUpdate.ad")
	public ModelAndView goMemberUpdate(@RequestParam(value="userNo") int userNo
	 																		 ,ModelAndView mv) {
		
		Member m = adminService.memberSelect(userNo);
		List<Integer> bcount = adminService.boardCount(m.getNickname());

		if (bcount.size() < 3) {
		    int remaining = 3 - bcount.size(); // 남은 개수 계산

		    for (int i = 0; i < remaining; i++) {
		        bcount.add(0); // 0 추가
		    }
		}

		mv.addObject("bcount", bcount);
		mv.addObject("m", m).setViewName("admin/adMemberUpdate");
		return mv;
	}
	
	//회원 수정
	@PostMapping("memberUpdate.ad")
	public ModelAndView memberUpdate(Member m
								    ,ModelAndView mv
								    ,HttpSession session) {

		int result = adminService.memberUpdate(m);
		
		if(result>0) {
			session.setAttribute("alertMsg","회원정보 수정 완료");
			mv.setViewName("redirect:member.ad");
		}else {
			mv.addObject("errorMsg","회원정보 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//프로필 사진 업데이트
	@PostMapping("memberUpdateImg.ad")
	public ModelAndView memberUpdateImg(int userNo
									   ,Attachment a
									   ,ModelAndView mv
				   					   ,MultipartFile upfile
		   							   ,HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String originName= upfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random()*90000+10000);//5자리 랜덤값
			String ext = originName.substring(originName.lastIndexOf("."));
			String changeName = currentTime+ranNum+ext;
			String savePath = session.getServletContext().getRealPath("/resources/images/profile/");
			
			try {
				upfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			a.setWriter(a.getWriter());
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/images/profile/");
		}
		
		int result = adminService.memberUpdateImg(a);
		
		if(result>0) {
			session.setAttribute("alertMsg","프로필 변경 완료");
			mv.setViewName("redirect:goMemberUpdate.ad?userNo="+userNo);
		}else {
			mv.addObject("errorMsg","프로필 변경 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//프로필 사진 삭제
	@ResponseBody
	@PostMapping("delProfileImg.ad")
	public String delProfileImg(Member m
							   ,ModelAndView mv
					   		   ,HttpSession session) {
		
		String profileImg = m.getProfileImg();
		new File(session.getServletContext().getRealPath(profileImg)).delete();
		
		int result = adminService.delProfileImg(m.getNickname());
		
		if(result>0) {
			session.setAttribute("alertMsg","프로필 삭제 완료");
		}else {
			session.setAttribute("alertMsg","프로필 삭제 실패");
		}
		
		return "";
	}
	
	
	//회원 정보 엑셀로 받기
	@GetMapping("memberExcel.ad")
    public void excelDownload(HttpServletResponse response) throws IOException {
//        Workbook wb = new HSSFWorkbook();
        Workbook wb = new XSSFWorkbook();
        Sheet sheet = wb.createSheet("첫번째 시트");
        Row row = null;
        Cell cell = null;
        int rowNum = 0;
        
        ArrayList<Member> list = adminService.memberExcelList();
        
        // Header
        row = sheet.createRow(rowNum++);
        cell = row.createCell(0);
        cell.setCellValue("회원번호");
        cell = row.createCell(1);
        cell.setCellValue("아이디");
        cell = row.createCell(2);
        cell.setCellValue("닉네임");
        cell = row.createCell(3);
        cell.setCellValue("이름");
        cell = row.createCell(4);
        cell.setCellValue("성별");
        cell = row.createCell(5);
        cell.setCellValue("연령대");
        cell = row.createCell(6);
        cell.setCellValue("이메일");
        cell = row.createCell(7);
        cell.setCellValue("전화번호");
        cell = row.createCell(8);
        cell.setCellValue("MBTI");
        cell = row.createCell(9);
        cell.setCellValue("설문지 결과");
        cell = row.createCell(10);
        cell.setCellValue("여행 스타일");
        cell = row.createCell(11);
        cell.setCellValue("신고 횟수");
        cell = row.createCell(12);
        cell.setCellValue("경고 횟수");
        cell = row.createCell(13);
        cell.setCellValue("가입일");
        cell = row.createCell(14);
        cell.setCellValue("인증여부");
        cell = row.createCell(15);
        cell.setCellValue("상태");
        cell = row.createCell(16);
        cell.setCellValue("관심사");

        
        // Body
        for (int i=0; i<list.size(); i++) {
            row = sheet.createRow(rowNum++);
            cell = row.createCell(0);
            cell.setCellValue(list.get(i).getUserNo());
            cell = row.createCell(1);
            cell.setCellValue(list.get(i).getUserId());
            cell = row.createCell(2);
            cell.setCellValue(list.get(i).getNickname());
            cell = row.createCell(3);
            cell.setCellValue(list.get(i).getUserName());
            cell = row.createCell(4);
            if (list.get(i).getGender().equals("M")) {
            	cell.setCellValue("남자");
			}else {
				cell.setCellValue("여자");
			}
            cell = row.createCell(5);
            cell.setCellValue(list.get(i).getAge()+"대");
            cell = row.createCell(6);
            cell.setCellValue(list.get(i).getEmail());
            cell = row.createCell(7);
            cell.setCellValue(list.get(i).getPhone());
            cell = row.createCell(8);
            cell.setCellValue(list.get(i).getMBTI());
            cell = row.createCell(9);
            cell.setCellValue(list.get(i).getSurvey());
            cell = row.createCell(10);
            cell.setCellValue(list.get(i).getStyle());
            cell = row.createCell(11);
            cell.setCellValue(list.get(i).getReport()+"회");
            cell = row.createCell(12);
            cell.setCellValue(list.get(i).getWarning()+"회");
            cell = row.createCell(13);
            cell.setCellValue(list.get(i).getEnrollDate());
            cell = row.createCell(14);
            if (list.get(i).getCertification() == 1) {
            	cell.setCellValue("카카오");
			}else if (list.get(i).getCertification() == 2) {
				cell.setCellValue("네이버");
			}else{
				cell.setCellValue("미인증");
			}
            cell = row.createCell(15);
            if (list.get(i).getStatus().equals("Y")) {
            	cell.setCellValue("정상");
			}else {
				cell.setCellValue("탈퇴");
			}
            cell = row.createCell(16);
            cell.setCellValue(list.get(i).getInterest());
        }

        // 컨텐츠 타입과 파일명 지정
        response.setContentType("ms-vnd/excel");
        response.setHeader("Content-Disposition", "attachment;filename=memberExcel.xlsx");

        // Excel File Output
        wb.write(response.getOutputStream());
        wb.close();
    }
	
//==================================================공지사항===========================================================
	
	//공지사항 관리 페이지로 이동
	@RequestMapping("notice.ad")
	public ModelAndView goAdminNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.noticeListCount();
		
		int pageLimit = 10;
		
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.selectNoticeList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("admin/adNotice");
		
		return mv;
	}
	
	//공지사항 검색
	@GetMapping("noticeSearch.ad" )
	public ModelAndView noticeSearch(Criteria cri
									,ModelAndView mv
									,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.noticeSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.noticeSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adNotice");
		
		return mv;
	}
	
	//공지사항 등록 페이지로 이동
	@RequestMapping("noticeEnroll.ad")
	public String goAdminNoticeEnroll() {
		return "admin/adNoticeEnroll";
	}
	
	//공지사항 등록
	@RequestMapping("noticeInsert.ad")
	public ModelAndView insertNotice(Notice n
								    ,Attachment a
								    ,ModelAndView mv
								    ,MultipartFile upfile
								    ,HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			a.setWriter(a.getWriter());
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/images/notice/");
		}
		
		int result = adminService.insertNotice(n,a);
//		int result = 0;
		
		if(result>0) {
			session.setAttribute("alertMsg","공지사항 등록 완료");
			mv.setViewName("redirect:notice.ad");
		}else {
			mv.addObject("errorMsg","공지사항 등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//공지사항 수정 페이지 이동
	@RequestMapping("noticeSelect.ad")
	public ModelAndView noticeSelect(@RequestParam(value="serviceNo") int serviceNo
							 		,ModelAndView mv) {

		Notice n = adminService.noticeSelect(serviceNo);
		Attachment a = adminService.noticeFileSelect(serviceNo);

		if (a != null) {
			mv.addObject("n", n);
			mv.addObject("a", a).setViewName("admin/adNoticeUpdate");
		}else {
			mv.addObject("n", n).setViewName("admin/adNoticeUpdate");
		}
		
		return mv;
	}
		
	//공지사항 수정
	@PostMapping("noticeUpdate.ad")
	public ModelAndView updateBoard(Notice n
		    					   ,Attachment a
								   ,ModelAndView mv
								   ,MultipartFile upfile
								   ,HttpSession session) {

		Attachment att = adminService.noticeFileSelect(n.getServiceNo());
		a.setBoardNo(n.getServiceNo());
		
		if(!upfile.getOriginalFilename().equals("")) {

			if (a.getOriginName() != null) {
				new File(ServletContext.getRealPath("/"+att.getFilePath()+att.getChangeName())).delete();
			}
			
			String changeName = saveFile(upfile, session);
			
			a.setWriter(a.getWriter());
			a.setOriginName(upfile.getOriginalFilename());
			a.setChangeName(changeName);
			a.setFilePath("resources/images/notice/");
		}
		
		int result = 0;
		if (att != null) {
			result = adminService.noticeUpdate(n,a);
		}else {
			result = adminService.noticeNewFileUpdate(n,a);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","공지사항 수정 완료");
			mv.setViewName("redirect:notice.ad");
		}else {
			mv.addObject("errorMsg","공지사항 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//공지사항 삭제
	@ResponseBody
	@RequestMapping("noticeDelete.ad")
	public String noticeDelete(int serviceNo
					   		  ,HttpSession session) {
		
		int result = adminService.noticeDelete(serviceNo);
		
		if(result>0) {
			session.setAttribute("alertMsg","공지사항 삭제 완료");
		}
		
		return (result>0)?"success":"fail";
	}
	
	//선택한 공지사항 삭제
	@ResponseBody
	@RequestMapping(value = "noticeChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String noticeChkDelete(@RequestParam(value = "list[]") int[] list
					   		  	 ,HttpSession session) {
		
		int result = 0;
		for (Integer i : list) {
			Attachment a = adminService.noticeFileSelect(i);
			result = adminService.noticeDelete(i);
			if (a != null) {
				adminService.noticeFileDelete(i);
			}
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","공지사항 삭제 완료");
		}
		
		return (result>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	//공지사항 파일 삭제
	@ResponseBody
	@RequestMapping("noticeFileDelete.ad")
	public String noticeFileDelete(Attachment a
								  ,HttpSession session) throws ParseException {

		int result = adminService.noticeFileDelete(a.getBoardNo());
		
		new File(ServletContext.getRealPath("/"+a.getFilePath()+a.getChangeName())).delete();
		
		return (result>0)?"success":"fail";
	}
	
//==================================================FAQ===========================================================
	
	//FAQ 관리 페이지로 이동
	@RequestMapping("faq.ad")
	public ModelAndView goAdminFAQ(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.faqListCount();
		
		int pageLimit = 10;
		
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.selectFAQList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("admin/adFAQ");
		
		return mv;
	}
		
	//FAQ 검색
	@GetMapping("faqSearch.ad" )
	public ModelAndView faqSearch(Criteria cri
								 ,ModelAndView mv
								 ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.faqSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.faqSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adFAQ");
		
		return mv;
	}
	
	//FAQ 등록 페이지로 이동
	@RequestMapping("faqEnroll.ad")
	public String goAdminFAQEnroll() {
		return "admin/adFAQEnroll";
	}
	
	//FAQ 등록
	@RequestMapping("faqInsert.ad")
	public ModelAndView insertFAQ(Notice n
							     ,ModelAndView mv
							     ,MultipartFile upfile
							     ,HttpSession session) {
		
		
		int result = adminService.insertFAQ(n);
		
		if(result>0) {
			session.setAttribute("alertMsg","FAQ 등록 완료");
			mv.setViewName("redirect:faq.ad");
		}else {
			mv.addObject("errorMsg","FAQ 등록 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//FAQ 수정 페이지 이동
	@RequestMapping("faqSelect.ad")
	public ModelAndView faqSelect(@RequestParam(value="serviceNo") int serviceNo
						 		 ,ModelAndView mv) {

		Notice n = adminService.faqSelect(serviceNo);
		mv.addObject("n", n).setViewName("admin/adFAQUpdate");
		return mv;
	}
		
	//FAQ 수정
	@PostMapping("faqUpdate.ad")
	public ModelAndView updateFaq(Notice n
							     ,ModelAndView mv
							     ,MultipartFile upfile
							     ,HttpSession session) {

		int result = adminService.faqUpdate(n);
		
		if(result>0) {
			session.setAttribute("alertMsg","FAQ 수정 완료");
			mv.setViewName("redirect:faq.ad");
		}else {
			mv.addObject("errorMsg","FAQ 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//FAQ 삭제
	@ResponseBody
	@RequestMapping("faqDelete.ad")
	public String faqDelete(int serviceNo
				   		   ,HttpSession session) {
		
		int result = adminService.faqDelete(serviceNo);
		
		if(result>0) {
			session.setAttribute("alertMsg","FAQ 삭제 완료");
		}
		
		return (result>0)?"success":"fail";
	}
	
	//선택한 FAQ 삭제
	@ResponseBody
	@RequestMapping(value = "faqChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String faqChkDelete(@RequestParam(value = "list[]") int[] list
					   		  ,HttpSession session) {
		
		int result = 0;
		for (Integer i : list) {
			result = adminService.faqDelete(i);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","FAQ 삭제 완료");
		}
		
		return (result>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}

	//	==================================================Q&A===========================================================		
	
	//Q&A 관리 페이지로 이동
	@RequestMapping("qna.ad")
	public ModelAndView goAdminQna(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.qnaListCount();
		
		int pageLimit = 10;
		
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.selectQnaList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("admin/adQNA");
		
		return mv;
	}
	
	//Q&A 검색
	@GetMapping("qnaSearch.ad" )
	public ModelAndView qnaSearch(Criteria cri
								 ,ModelAndView mv
								 ,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.qnaSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.qnaSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adQNA");
		
		return mv;
	}
	
	//Q&A 답변 페이지 이동
	@RequestMapping("qnaSelect.ad")
	public ModelAndView qnaSelect(@RequestParam(value="serviceNo") int serviceNo
						 		 ,ModelAndView mv) {

		Notice n = adminService.faqSelect(serviceNo);
		ArrayList<Attachment> aList = adminService.qnaFileSelect(serviceNo);
		mv.addObject("aList", aList);
		mv.addObject("n", n).setViewName("admin/adQnaUpdate");
		return mv;
	}
	
	//Q&A 삭제
	@ResponseBody
	@RequestMapping("qnaDelete.ad")
	public String qnaDelete(int serviceNo
				   		   ,HttpSession session) {
		
		int result = adminService.faqDelete(serviceNo);
		
		if(result>0) {
			session.setAttribute("alertMsg","Q&A 삭제 완료");
		}
		
		return (result>0)?"success":"fail";
	}
	
	//선택한 Q&A 삭제
	@ResponseBody
	@RequestMapping(value = "qnaChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String qnaChkDelete(@RequestParam(value = "list[]") int[] list
					   		  ,HttpSession session) {
		
		int result = 0;
		for (Integer i : list) {
			result = adminService.faqDelete(i);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","Q&A 삭제 완료");
		}
		
		return (result>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	//Q&A 답변 조회
	@ResponseBody
	@RequestMapping(value = "qnaReplyList.ad",produces = "application/json; charset=UTF-8")
	public String qnaReplyList(int serviceNo) {
		
		ArrayList<Reply> list = adminService.qnaReplyList(serviceNo);
		return new Gson().toJson(list);
	}
	
	//Q&A 답변 등록
	@ResponseBody
	@RequestMapping("qnaReplyInsert.ad")
	public String qnaReplyInsert(Reply r
							 	,HttpSession session) {
		
		int result = adminService.qnaReplyInsert(r);
		return (result>0)?"success":"fail";
	}
	
	//Q&A 답변 수정
	@ResponseBody
	@RequestMapping("qnaReplyUpdate.ad")
	public String qnaReplyUpdate(Reply r
							 	,HttpSession session) {
		
		int result = adminService.qnaReplyUpdate(r);
		return (result>0)?"success":"fail";
	}
	
	//Q&A 답변 삭제
	@ResponseBody
	@RequestMapping("qnaReplyDelete.ad")
	public String qnaReplyDelete(Reply r
							 	,HttpSession session) {
		
		int result = adminService.qnaReplyDelete(r);
		return (result>0)?"success":"fail";
	}
	
	//	==================================================신고관리===========================================================
	
	//신고관리 페이지로 이동
	@RequestMapping("report.ad")
	public ModelAndView goAdminReport(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = adminService.reportListCount();
		
		int pageLimit = 10;
		
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Report> list = adminService.selectReportList(pi);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("admin/adReport");
		
		return mv;
	}
	
	//신고내역 검색
	@GetMapping("reportSearch.ad" )
	public ModelAndView reportSearch(Criteria cri
								 	,ModelAndView mv
								 	,HttpSession session) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("keyword", cri.getKeyword());
		map.put("status", cri.getType());
		
		int searchCount = adminService.reportSearchCount(map);
		int pageLimit = 10;
		int boardLimit = 15;
		
		PageInfo pi = Pagination.getPageInfo(searchCount, cri.getCurrentPage(), pageLimit, boardLimit);
		
		ArrayList<Notice> list = adminService.reportSearchList(map,pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("keyword", cri.getKeyword());
		mv.addObject("type", cri.getType());
		mv.setViewName("admin/adReport");
		
		return mv;
	}
	
	//선택한 신고 삭제
	@ResponseBody
	@RequestMapping(value = "reportChkDelete.ad",produces = "application/json; charset=UTF-8")
	public String reportChkDelete(@RequestParam(value = "list[]") int[] list
					   		  									 ,HttpSession session) {
		
		int result = 0;
		for (Integer i : list) {
			result = adminService.reportDelete(i);
		}
		
		if(result>0) {
			session.setAttribute("alertMsg","신고내역 삭제 완료");
		}
		
		return (result>0)?new Gson().toJson("success"):new Gson().toJson("fail");
	}
	
	
}

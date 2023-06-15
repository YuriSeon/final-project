package com.kh.finalProject.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

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
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;



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
	@RequestMapping("/admin.ad")
	public String goAdmin() {
		return "admin/dashboard";
	}
	
	//사용자 페이지로 이동
	@RequestMapping("/custom.ad")
	public String goCustom() {
		return "redirect:/";
	}
	
	//테마 페이지로 이동
	@RequestMapping("/theme.ad")
	public String goAdminTheme() {
		return "admin/adTheme";
	}
	
	//회원관리 페이지로 이동
	@RequestMapping("/member.ad")
	public String goAdminMember() {
		return "admin/adMember";
	}
	
	//회원 편집 페이지로 이동
	@RequestMapping("/memberUpdate.ad")
	public String goAdminMemberUpdate() {
		return "admin/adMemberUpdate";
	}
	
	//공지사항 관리 페이지로 이동
	@RequestMapping("/notice.ad")
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
	@GetMapping("/noticeSearch.ad" )
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
	@RequestMapping("/noticeEnroll.ad")
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
		System.out.println(a);
		System.out.println(att);
		
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
			System.out.println(i);
			result = adminService.noticeDelete(i);
		}
		
		System.out.println(result);
		
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
	
}

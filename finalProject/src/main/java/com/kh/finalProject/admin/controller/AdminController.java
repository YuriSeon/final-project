package com.kh.finalProject.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.admin.model.service.AdminService;
import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;



@Controller
public class AdminController {

	@Autowired
	public AdminService adminService;
	
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
	public String goAdminNotice() {
		return "admin/adNotice";
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
}

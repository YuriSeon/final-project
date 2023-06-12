package com.kh.finalProject.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	//관리자 페이지로 이동
	@RequestMapping("/admin.ad")
	public String goAdmin() {
		return "admin/dashboard";
	}
	
	//사용자 페이지로 이동
	@RequestMapping("/custom.ad")
	public String goAdmin2() {
		return "redirect:/";
	}
	
	//테마 페이지로 이동
	@RequestMapping("/adTheme.ad")
	public String goAdminTheme() {
		return "admin/adTheme";
	}
	
	//회원관리 페이지로 이동
	@RequestMapping("/adMember.ad")
	public String goAdminMember() {
		return "admin/adMember";
	}
	
	//회원 편집 페이지로 이동
	@RequestMapping("/adMemberUpdate.ad")
	public String goAdminMemberUpdate() {
		return "admin/adMemberUpdate";
	}
}

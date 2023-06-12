package com.kh.finalProject.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminController {

	@RequestMapping("/admin.ad")
	public String goAdmin() {
		return "admin/dashboard";
	}
	
	@RequestMapping("/adTheme.ad")
	public String goAdminTheme() {
		return "admin/adTheme";
	}
}

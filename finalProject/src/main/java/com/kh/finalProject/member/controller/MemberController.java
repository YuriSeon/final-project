package com.kh.finalProject.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("mypage.me")
	public String goMypage() {
		return "member/mypage";
	}
}

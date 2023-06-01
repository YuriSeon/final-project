package com.kh.finalProject.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	

	@RequestMapping("mypage.me")
	public String goMypage() {
		return "member/mypage";
	}
	@GetMapping("/surveyResult.me")
	@ResponseBody
	public String surveyResult(String result) {
		
		int countEI = 0;
		int countSN = 0;
		int countTF = 0;
		int countPJ = 0;
		
		String mbti = "";
		
		for(int i=0; i<result.length(); i++) {
			if(i<3) {
				if(result.charAt(i) == 'E') {
					countEI++;
				}else {
					countEI--;
				}
				
			}else if(i<6) {
				if(result.charAt(i) == 'N') {
					countSN++;
				}else {
					countSN--;
				}
				
			}else if(i<9) {
				if(result.charAt(i) == 'T') {
					countTF++;
				}else {
					countTF--;
				}
				
			}else if(i<12) {
				if(result.charAt(i) == 'J') {
					countPJ++;
				}else {
					countPJ--;
				}
				
			}
			
		}
		
		if(countEI>0) {
			mbti += "E";
		}else {
			mbti += "I";
		}
		
		if(countSN>0) {
			mbti+="N";
		}else {
			mbti+="S";
		}
		
		if(countTF>0) {
			mbti+="T";
		}else {
			mbti+="F";
		}
		
		if(countPJ>0) {
			mbti+="J";
		}else {
			mbti+="P";
		}
		
		return mbti;

	}
}

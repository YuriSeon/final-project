package com.kh.finalProject.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	public MemberService memberService;
	
	//비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("/mypage.me")
	public String goMypage() {
		return "member/myPage/mypage";
	}
	@GetMapping("/surveyResult.me")
	@ResponseBody
	public String surveyResult(String result, String userId) {
		
		System.out.println(userId);
		
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
		
		switch(mbti) {
			case "ENFJ" :  mbti += " INFP ISTP";break;
			case "ENFP" : mbti += " INFJ ISTJ"; break;
			case "ENTJ" : mbti += " INTP ISFP"; break;
			case "ENTP" : mbti += " INTJ ISFJ"; break;
			case "ESFJ" : mbti += " ISFP INTP"; break;
			case "ESFP" : mbti += " ISFJ INTJ"; break;
			case "ESTJ" : mbti += " ISTP INFP"; break;
			case "ESTP" : mbti += " ISTJ INFJ"; break;
			case "INFJ" : mbti += " ENFP ESTP"; break;
			case "INFP" : mbti += " ENFJ ESFJ"; break;
			case "INTJ" : mbti += " ENTP ESFP"; break;
			case "INTP" : mbti += " ENTJ ESFJ"; break;
			case "ISFJ" : mbti += " ESFP ENTP"; break;
			case "ISFP" : mbti += " ESFJ ENTJ"; break;
			case "ISTJ" : mbti += " ESTP ENFJ"; break;
			case "ISTP" : mbti += " ENTJ ENFJ"; break;
		}
		
		Member m = Member.builder().userId(userId).survey(mbti).build();
		
		memberService.updateSurvey(m);
		
		return mbti.split(" ")[0];
	}
	
	//회원가입 폼 이동
	@RequestMapping("enrollForm.me")
	public String joinMember() {
		return "member/memberEnrollForm";
	}
	
	//로그인 메소드
	@RequestMapping("login.me")
	public String loginMember(String saveId, Member m, HttpSession session, HttpServletResponse response) {
			
		//아이디 저장
		Cookie cookie = null;
			
		if(saveId != null && saveId.equals("on")) {//체크 박스 체크시
			//쿠키 생성
			cookie = new Cookie("userId",m.getUserId());
			cookie.setMaxAge(60*60*24*14);
			response.addCookie(cookie);
		}else {//체크 아닐시
			cookie = new Cookie("userId",null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
			
		Member loginUser = memberService.loginMember(m);

		if(loginUser!=null) {//로그인 유저 있으면 -> 유저 정보 담기
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인이 완료되었습니다.");
		}

		return "redirect:/";
	}
		
	//로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
}

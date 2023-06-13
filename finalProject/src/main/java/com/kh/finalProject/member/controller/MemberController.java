package com.kh.finalProject.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

import javax.servlet.ServletContext;
import java.time.LocalDate;
import java.time.Period;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	public MemberService memberService;
	
	@Autowired
	private ServletContext ServletContext;
	
	//비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//마이페이지 이동
	@RequestMapping("/mypage.me")
	public String goMypage() {
		return "member/myPage/mypage";
	}

	//프로필 사진 업데이트
	@PostMapping("/updateImg.me")
	public ModelAndView updateImg(Attachment a
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
		
		Member loginUser = memberService.loginMemberNick(a.getWriter());
		loginUser.setProfileImg(a.getFilePath()+a.getChangeName());

		int result = memberService.updateImg(a);
		
		if(result>0) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg","프로필 변경 완료");
			mv.setViewName("redirect:mypage.me");
		}else {
			mv.addObject("errorMsg","프로필 변경 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//프로필 사진 삭제
	@PostMapping("/deleteImg.me")
	@ResponseBody
	public String deleteImg(String nickname
						   ,ModelAndView mv
				   		   ,HttpSession session) {
		
		String profileImg = ((Member)(session.getAttribute("loginUser"))).getProfileImg();
		new File(session.getServletContext().getRealPath(profileImg)).delete();
		
		int result = memberService.deleteImg(nickname);
		Member m = memberService.loginMemberNick(nickname);
		
		if(result>0) {
			session.setAttribute("alertMsg","프로필 삭제 완료");
			session.setAttribute("loginUser", m);
		}else {
			session.setAttribute("alertMsg","프로필 삭제 실패");
		}
		
		return "";
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
	
	//회원가입 메소드
	@RequestMapping("insert.me")
	public ModelAndView enrollForm(Member m,String birthDay, ModelAndView mv, HttpSession session) {
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println(encPwd);
		m.setUserPwd(encPwd);
		
		//연령대 계산
		//입력한 나이
		int birYear = Integer.parseInt(birthDay.substring(0, 4));
		int birMonth = Integer.parseInt(birthDay.substring(4, 6));
		int birDay = Integer.parseInt(birthDay.substring(6, 8));
		
		LocalDate birth = LocalDate.of(birYear, birMonth, birDay);
		
		//현재 날짜
		LocalDate today = LocalDate.now();
		
		//입력나이와 현재 날짜 사이의 기간 알아내기
		//Period : 날짜 기간을 나타내는 클래스 (두 날짜 사이의 기간을 알 수 있음)
		Period age = Period.between(birth, today);
		
		int manAge = age.getYears();
		
		//만나이 연령대별로 나누기
		if(10<=manAge && manAge<20) {
			m.setAge(10);
		}else if(20<=manAge && manAge<30) {
			m.setAge(20);
		}else if(30<=manAge && manAge<40) {
			m.setAge(30);
		}else if(40<=manAge && manAge<50) {
			m.setAge(40);
		}else {
			m.setAge(50);
		}
		
		int result = memberService.insertMember(m);

		if(result>0) {
			session.setAttribute("alertMsg", "회원가입을 성공하였습니다.");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "회원가입 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//로그인 메소드
	@ResponseBody
	@RequestMapping("login.me")
	public String loginMember(String saveId, Member m, HttpSession session,HttpServletRequest request, HttpServletResponse response) throws IOException {

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

		if(loginUser!=null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {//로그인 유저 있으면 -> 유저 정보 담기
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인이 완료되었습니다.");
			//로그인 성공시 전 페이지로 돌려주기
			return request.getHeader("referer");
		}else {//로그인 실패시
			return "NNNNN";
		}
	}
	
	//아이디 중복 확인
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
		
		return (count>0)?"NNNNN":"NNNNY";
	}
	
	//닉네임 중복 확인
	@ResponseBody
	@RequestMapping("nickCheck.me")
	public String nickCheck(String checkNick) {
		
		int count = memberService.nickCheck(checkNick);
		
		return (count>0)?"NNNNN":"NNNNY";
	}
		
	//로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.setAttribute("alertMsg", "로그아웃 되었습니다.");
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	//프로필 정보 조회
	@ResponseBody
	@GetMapping(value="loadProfile.me",produces = "application/json; charset=utf-8")
	public String loadProfile(String nickname) {
		
		Member m = memberService.loadProfile(nickname);
		
		return new Gson().toJson(m);
	}
}

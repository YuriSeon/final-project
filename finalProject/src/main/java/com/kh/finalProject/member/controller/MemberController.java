package com.kh.finalProject.member.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	public MemberService memberService;
	
	@Autowired
	private ServletContext ServletContext;
	
	//파일 업로드 처리 메소드 (모듈)
	public String saveFile(MultipartFile upfile,HttpSession session) {
		String originName= upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random()*90000+10000);//5자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = currentTime+ranNum+ext;
		String savePath = session.getServletContext().getRealPath("/resources/images/qna/");
		
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
	
	//비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//카카오인증키
	private static final String appKey = "04c77a2f5ca75a521a0d0e08cbb740b3";
	
	//마이페이지 이동
	@RequestMapping("mypage.me")
	public String goMypage() {
		return "member/myPage/mypage";
	}
	
	//마이페이지 Q&A 이동
	@RequestMapping("myQna.me")
	public ModelAndView goMyQna(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																			  		,ModelAndView mv
																			  		,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		
		int listCount = memberService.myQnaCount(nick);
		
		int pageLimit = 5;
		
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Notice> list = memberService.myQnaList(pi,nick);
		
		mv.addObject("list",list);
		
		mv.addObject("pi",pi);
		
		mv.setViewName("member/myPage/mypageQna");
		
		return mv;
	}
	
	//마이페이지 Q&A 질문등록 이동
	@RequestMapping("myQnaEnroll.me")
	public String goMyQnaEnroll() {
		return "member/myPage/mypageQnaEnroll";
	}
	
	//마이페이지 Q&A 질문 등록
	@ResponseBody
	@RequestMapping("myQnaInsert.me")
	public String myQnaInsert(Notice n
							 ,Model model
					   	     ,HttpSession session) {
		
		int result = memberService.myQnaInsert(n);
		
		if(result>0) {
			session.setAttribute("alertMsg","질문 등록 완료");
			return (result>0)?"1":"0";
		}else {
			model.addAttribute("errorMsg","질문 등록 실패");
			return "common/errorPage";
		}
		
		
	}
	
	//마이페이지 Q&A 질문 파일 등록
	@ResponseBody
	@PostMapping("myQnaFileInsert.me")
	public String myQnaInsert(@RequestParam("file") MultipartFile[] files
												   ,Notice n
										           ,HttpSession session) {
		
		int result = 0;
		for (MultipartFile file : files) {
			if (file != null) {
				Attachment a = new Attachment();
				
				if(!file.getOriginalFilename().equals("")) {
					String changeName = saveFile(file, session);
					
					a.setOriginName(file.getOriginalFilename());
					a.setChangeName(changeName);
					a.setFilePath("resources/images/qna/");
				}
				
				result = memberService.myQnaFileInsert(a);
			}
		}
		
		return (result>0)?"1":"0";
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
	@PostMapping("deleteImg.me")
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
	
	//회원가입리트스 폼 이동 메소드
		@RequestMapping("enrollListForm.me")
		public String enrollForm(Member m,String birthDay, ModelAndView mv, HttpSession session) {
			
			return "member/enrollList";
		}
		
	//회원가입 메소드
	@RequestMapping("insert.me")
	public ModelAndView insertMember(Member m,String birthDay, String kakaoId, String access_token, ModelAndView mv, HttpSession session) throws IOException, ParseException {
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
			
			//카카오 인증 회원가입
			if(m.getCertification()==1) {
				//카카오 로그아웃 도시켜주기
					String url = "https://kauth.kakao.com/oauth/logout";
					url += "?client_id="+appKey;
					url += "&logout_redirect_uri=http://localhost:8888/finalProject/";
					
					mv.setViewName("redirect:"+url);
					
//				카카오 로그아웃
//				String url = "https://kapi.kakao.com/v1/user/logout";
//				
//				URL requestUrl = new URL(url);
//				HttpURLConnection urlCon = (HttpURLConnection) requestUrl.openConnection();
//				urlCon.setRequestMethod("POST");
//				urlCon.setRequestProperty("Authorization", "Bearer "+access_token);
//		
//				BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
//				
//				String text = "";
//				String line;
//				
//				while((line=br.readLine())!=null) {
//					text += line;
//				}
//				
//				System.out.println(text);
//				
//				mv.setViewName("redirect:/");
			}
			//네이버 인증 후 회원가입 시
			if(m.getCertification()==2) {
				String clientId = "xezYicDH1SzVKNokPSX2";
				String ClientSecret = "h48MxFzhpW";
				//네이버 탈퇴 요청
				String url = "https://nid.naver.com/oauth2.0/token";
						url += "?grant_type=delete";
						url += "&client_id="+clientId;
						url += "&client_secret="+ClientSecret;
						url += "&access_token="+access_token;
						url += "&redirect_uri=http://localhost:8888/finalProject/";
						url += "&service_provider=NAVER";
				//System.out.println(url);
				
				URL requestUrl = new URL(url);
				HttpURLConnection urlCon = (HttpURLConnection) requestUrl.openConnection();
				
				//응답데이터 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
				
				String responseText="";
				String line;
				
				while((line=br.readLine())!=null) {
					responseText += line;
				}
						
				//System.out.println(responseTextToken);
				
				//파싱 작업
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject) jsonParser.parse(responseText);
				//System.out.println(jsonObj);
				
				String resultNaver = (String) jsonObj.get("result");
				
				mv.setViewName("redirect:/index");
			}
		}else {
			mv.addObject("errorMsg", "회원가입 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//카카오 인증 조회 (1.인가 코드 받기 2.인가코드로 토큰 받기 3.토큰으로 정보 조회)
	//회원가입 폼
	@RequestMapping("enrollForm.me")
	public String joinMember(Member m, String birthDay, @RequestParam(value="certification",defaultValue="0") String certification, ModelAndView mv, String code,String error, HttpServletRequest request, HttpSession session) throws IOException, ParseException{
		
		//카카오톡
		//로그인 인증 동의시 토큰 받기 요청위한 인가 코드(동의하고 계속하기 선택, 로그인 진행시)
		//System.out.println(code);
		//인증 실패시 반환되는 에러코드(로그인 취소)
		//System.out.println(error);
		
		//카카오 인증 취소시
		if(error != null) {
			if(error.equals("access_denied")) {
				session.setAttribute("alertMsg", "인증을 취소하였습니다.");
			}
		}
		//인증1번으로 넘어오면 카카오로 토큰 받아오기
		if(certification.equals("1")) {
			//url작성
			String url = "https://kauth.kakao.com/oauth/token";
			url += "?grant_type=authorization_code";
			url += "&client_id="+appKey;
			url += "&redirect_uri=http://localhost:8888/finalProject/enrollForm.me?certification=1";
			url += "&code="+code;
			
			//URL객체생성
			URL requestUrl = new URL(url);
			HttpURLConnection urlCon = (HttpURLConnection) requestUrl.openConnection();
			urlCon.setRequestMethod("POST");
			
			//응답 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
			
			String responseText="";
			String line;
			
			while((line=br.readLine())!=null) {
				responseText += line;
			}
			//System.out.println(responseText);
			
			//파싱작업
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(responseText);
			
			String access_token = (String) jsonObj.get("access_token");
			//System.out.println(access_token);
			
			//토큰으로 사용자 id 조회
			//url작성
			String urlId = "https://kapi.kakao.com/v1/user/access_token_info";
			
			//객체 생성
			URL requestUrlId = new URL(urlId);
			HttpURLConnection urlConId = (HttpURLConnection) requestUrlId.openConnection();
			urlConId.setRequestMethod("GET");
			urlConId.setRequestProperty("Authorization", "Bearer "+access_token);
			
			//응답데이터 읽어오기
			BufferedReader brId = new BufferedReader(new InputStreamReader(urlConId.getInputStream()));
			
			String responseTextId = "";
			String lineId;
			
			while((lineId=brId.readLine())!=null) {
				responseTextId += lineId;
			}
			//System.out.println(responseTextId);
			
			//파싱작업
			JSONParser jsonParserId = new JSONParser();
			JSONObject jsonObjId = (JSONObject) jsonParserId.parse(responseTextId);
			//System.out.println(jsonObjId);
			
			//원하는 데이터 추출
			Long id = (Long) jsonObjId.get("id");
			String idd = String.valueOf(id);
			//System.out.println(idd);
			
			//토큰으로 사용자 정보 조회
			//url작성
			String urlToken = "https://kapi.kakao.com/v2/user/me";
			
			//객체 생성
			URL requestUrlToken = new URL(urlToken);
			HttpURLConnection urlConToken = (HttpURLConnection) requestUrlToken.openConnection();
			urlConToken.setRequestMethod("GET");
			urlConToken.setRequestProperty("Authorization", "Bearer "+access_token);
			
			//응답데이터 읽어오기
			BufferedReader brToken = new BufferedReader(new InputStreamReader(urlConToken.getInputStream()));
			
			String responseTextToken="";
			String lineToken;
			
			while((lineToken=brToken.readLine())!=null) {
				responseTextToken += lineToken;
			}
					
			//System.out.println(responseTextToken);
			
			//파싱 작업
			JSONParser jsonParserToken = new JSONParser();
			JSONObject jsonObjToken = (JSONObject) jsonParserToken.parse(responseTextToken);
			//System.out.println(jsonObjToken);
			
			JSONObject kakao_account =  (JSONObject) jsonObjToken.get("kakao_account");
			//System.out.println(kakao_account);
			
			String age = (String) kakao_account.get("age_range");
			String birthday = (String) kakao_account.get("birthday");
			String gender = (String) kakao_account.get("gender");
			if (gender.equals("female")) {
				gender = "F";
			}else {
				gender = "M";
			}
			//System.out.println(age);
			//System.out.println(birthday);
			//System.out.println(gender);
			
			Map<String,String> kakaoInfo = new HashMap();
			kakaoInfo.put("age", age);
			kakaoInfo.put("birthday", birthday);
			kakaoInfo.put("gender", gender);
			kakaoInfo.put("id",idd);
			kakaoInfo.put("access_token",access_token);
			
			session.setAttribute("kakaoInfo",kakaoInfo);
		}
		
		//인증2번으로 넘어올시 네이버 토큰 발급 후 정보 조회
		if(certification.equals("2")) {
			
			String clientId = "xezYicDH1SzVKNokPSX2";
			String ClientSecret = "h48MxFzhpW";
			
			//토큰 발급
			String url = "https://nid.naver.com/oauth2.0/token";
			url += "?grant_type=authorization_code";
			url += "&client_id="+clientId;
			url += "&client_secret="+ClientSecret;
			url += "&code="+code;
			url += "&state=test";
			
			URL requestUrl = new URL(url);
			HttpURLConnection urlCon = (HttpURLConnection) requestUrl.openConnection();
			
			//응답데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
			
			String responseText="";
			String line;
			
			while((line=br.readLine())!=null) {
				responseText += line;
			}
					
			//System.out.println(responseTextToken);
			
			//파싱 작업
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = (JSONObject) jsonParser.parse(responseText);
			//System.out.println(jsonObj);
			
			String access_token = (String) jsonObj.get("access_token");
			//System.out.println(access_token);
			
			//토큰으로 사용자 정보 가져오기
			String urlToken = "https://openapi.naver.com/v1/nid/me	";
			
			URL requestUrlInfo = new URL(urlToken);
			HttpURLConnection urlInfoCon = (HttpURLConnection) requestUrlInfo.openConnection();
			urlInfoCon.setRequestMethod("GET");
			urlInfoCon.setRequestProperty("Authorization", "Bearer " + access_token);
			
			//System.out.println(urlInfoCon);
			
			//응답데이터 읽어오기
			BufferedReader brInfo = new BufferedReader(new InputStreamReader(urlInfoCon.getInputStream()));
			
			String infoText="";
			String lineInfo;
			
			while((lineInfo=brInfo.readLine())!=null) {
				infoText += lineInfo;
			}
					
			//System.out.println(infoText);
			
			//파싱 작업
			JSONParser jsonParserToken = new JSONParser();
			JSONObject jsonObjToken = (JSONObject) jsonParserToken.parse(infoText);
			//System.out.println(jsonObjToken);
			
			JSONObject responseInfoText =  (JSONObject) jsonObjToken.get("response");
			//System.out.println(responseInfoText);
			
			String mobile = (String) responseInfoText.get("mobile"); //010-1111-1111
			String name = (String) responseInfoText.get("name");
			String email = (String) responseInfoText.get("email");
			String gender = (String) responseInfoText.get("gender");
			String birthday = (String) responseInfoText.get("birthday"); //12-12
			String birthyear = (String) responseInfoText.get("birthyear");
			
			//원하는 값으로 문자열로 바꿔주기
			String phone = mobile.replaceAll("-", "");
	        String birthdayInfo = birthday.replaceAll("-", "");
	        String birthInfo = birthyear+birthdayInfo;
	        
	        Map<String,String> naverInfo = new HashMap();
			naverInfo.put("phone", phone);
			naverInfo.put("name", name);
			naverInfo.put("email", email);
			naverInfo.put("gender",gender);
			naverInfo.put("birthDay",birthInfo);
			naverInfo.put("access_token",access_token);
			naverInfo.put("certification",certification);
			
			session.setAttribute("naverInfo",naverInfo);
		}
		
		return "member/memberEnrollForm";
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

		if(m.getProfileImg() == null) {
			m.setProfileImg("resources/images/기본프로필.png");
		}
		return new Gson().toJson(m);
	}
}

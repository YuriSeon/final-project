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
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.admin.model.service.AdminService;
import com.kh.finalProject.admin.model.vo.Notice;
import com.kh.finalProject.admin.model.vo.Visit;
import com.kh.finalProject.board.model.service.FeedService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.service.MemberService;
import com.kh.finalProject.member.model.vo.Member;

import lombok.Data;

@Controller
public class MemberController {
	
	@Autowired
	public MemberService memberService;
	
	@Autowired
	public FeedService feedService;
	
	@Autowired
	public AdminService adminService;
	
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
	
	//마이페이지 개인정보 수정 이동
	@RequestMapping("goInfoUpdate.me")
	public String goMyInfoUpdate() {
		return "member/myPage/myInfoUpdate";
	}
	
	//마이페이지 개인정보 수정
	@RequestMapping("myInfoUpdate.me")
	public ModelAndView myInfoUpdate(Member m
									,ModelAndView mv
									,HttpSession session) throws IOException, ParseException {
		
		if (!m.getUserPwd().equals("")) {
			//비밀번호 암호화
			String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
			m.setUserPwd(encPwd);
		}
		
		int result = memberService.updateMember(m);

		Member loginUser = memberService.loginMember(m);
		
		if(result>0) {
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "개인정보 수정 완료");
			mv.setViewName("redirect:mypage.me");
		}else {
			mv.addObject("errorMsg", "개인정보 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//마이페이지 회원 탈퇴 이동
	@RequestMapping("goInfoDelete.me")
	public String goMyInfoDelete() {
		return "member/myPage/myInfoDelete";
	}
	
	//마이페이지 회원 탈퇴
	@ResponseBody
	@RequestMapping(value="myInfoDelete.me",produces = "application/json; charset=utf-8")
	public String myInfoDelete(Member m
							  ,ModelAndView mv
							  ,HttpSession session) throws IOException, ParseException {
		Member loginUser = memberService.loginMember(m);
		memberService.deleteMember(m);
		
		if (loginUser!=null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("alertMsg2", "회원탈퇴가 완료되었습니다.<br>이용해주시고 사랑해주셔서 감사합니다.<br>더욱더 노력하고 발전하겠습니다.");
			session.removeAttribute("loginUser");
			return new Gson().toJson("success");
		}else {
			return new Gson().toJson("fail");
		}
	}
	
	//마이페이지 작성글 보기 이동
	@RequestMapping("myWriting.me")
	public ModelAndView goMyWriting(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																				  		,ModelAndView mv
																				  		,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		
		int listCount = memberService.myWritingCount(nick);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = memberService.myWritingList(pi,nick);
		
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageWriting");
		
		return mv;
	}
	
	//마이페이지 작성글 게시판 종류 선택
	@RequestMapping("selectBoard.me")
	public ModelAndView selectBoard(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																						,int category
																						,ModelAndView mv
																						,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		Board b = Board.builder()
				.category(category)
				.boardWriter(nick).build();
		int listCount = memberService.selectBoardCount(b);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = memberService.selectBoardList(b,pi);
		
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.addObject("category", category).setViewName("member/myPage/mypageWriting");
		return mv;
	}
	
	//마이페이지 게시글 피드 보기
	@ResponseBody
	@RequestMapping(value = "selectFeed.me",produces = "application/json; charset=UTF-8")
	public feedResponse selectFeed(@RequestParam("boardNo") int boardNo
					        	  ,HttpSession session) {
		
		Board feed = memberService.selectFeed(boardNo);
		ArrayList<Attachment> a = memberService.fileSelect(boardNo);
		
		feedResponse response = new feedResponse(feed, a);
		return response;
	}
	
	//마이페이지 피드 보기 객체 2개 보낼때 사용
	@Data
	private static class feedResponse {
	    private Board b;
	    private ArrayList<Attachment> a;
	    
	    public feedResponse(Board b, ArrayList<Attachment> a) {
	      this.b = b;
	      this.a = a;
	    }
	}
	
	//마이페이지 게시글 피드 삭제
	@ResponseBody
	@RequestMapping(value = "deleteFeed.me", method = RequestMethod.POST)
	public String deleteFeed(@RequestParam("boardNo") int boardNo
												     ,HttpSession session) {
		
		ArrayList<Attachment> a = memberService.fileSelect(boardNo);
		int result = feedService.deleteFeed(boardNo);
		String resultString = "";
		if (result > 0) {
            if (!a.isEmpty()) {
                for (Attachment path : a) {
                    new File(session.getServletContext().getRealPath("/"+path.getFilePath())).delete();
                }
                session.setAttribute("alertMsg", "게시글 삭제 성공");
                resultString = "success";
            }else {
            	resultString = "fail";
			}
        }else {
        	resultString = "fail";
		}
		return resultString;
	}
	
	//마이페이지 댓글 보기 이동
	@RequestMapping("myReply.me")
	public ModelAndView goMyReply(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																				  	  ,ModelAndView mv
																				  	  ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		
		int listCount = memberService.myReplyCount(nick);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Reply> list = memberService.myReplyList(pi,nick);
		
		int writingCount = memberService.myWritingCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageReply");
		
		return mv;
	}
	
	//마이페이지 댓글 수정
	@RequestMapping("myReplyUpdate.me")
	public ModelAndView myReplyUpdate(Reply r
									 ,ModelAndView mv
									 ,HttpSession session){
		
		int result = memberService.replyUpdate(r);
		
		if(result>0) {
			session.setAttribute("alertMsg", "댓글 수정 완료");
			mv.setViewName("redirect:myReply.me");
		}else {
			mv.addObject("errorMsg", "댓글 수정에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//마이페이지 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "replyDelete.me", method = RequestMethod.POST)
	public String replyDelete(@RequestParam("replyNo") int replyNo
												     ,HttpSession session) {
		
		int result = memberService.replyDelete(replyNo);
		String resultString = "";
		if (result>0) {
			session.setAttribute("alertMsg", "댓글 삭제 성공");
			resultString = "success";
			
		}else {
			resultString = "fail";
		}

		return resultString;
	}
	
	//마이페이지 찜 목록 이동
	@RequestMapping("myChoice.me")
	public ModelAndView goMyChoice(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																		  	     ,ModelAndView mv
																		  	     ,HttpSession session) {
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		
		int listCount = memberService.myChoiceCount(nick);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Board> list = memberService.myChoiceList(pi,nick);
		
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageChoice");
		
		return mv;
	}
	
	//마이페이지 찜 목록 삭제
	@ResponseBody
	@RequestMapping(value = "choiceDelete.me", method = RequestMethod.POST)
	public String choiceDelete(@RequestParam("boardNo") int boardNo
												       ,HttpSession session) {

		String writer = ((Member)session.getAttribute("loginUser")).getNickname();
		choice c = choice.builder().boardNo(boardNo).writer(writer).build();
		
		int result = memberService.choiceDelete(c);
		String resultString = "";
		if (result>0) {
			session.setAttribute("alertMsg", "찜 목록 삭제 성공");
			resultString = "success";
		}else {
			resultString = "fail";
		}

		return resultString;
	}
	
	//마이페이지 수정요청 이동
	@RequestMapping("myRequest.me")
	public ModelAndView goMyRequest(@RequestParam(value="currentPage", defaultValue="1") int currentPage
																				  		,ModelAndView mv
																				  		,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		
		int listCount = memberService.myRequestCount(nick);
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		ArrayList<Notice> list = memberService.myRequestList(pi,nick);
		
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageRequest");
		
		return mv;
	}
	
	//마이페이지 수정요청 등록 이동
	@RequestMapping("myRequestEnroll.me")
	public ModelAndView goMyRequestEnroll(ModelAndView mv
	  								 	 ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageRequestEnroll");
		return mv;
	}
	
	//마이페이지 수정요청 상세 페이지 이동
	@RequestMapping("goRequestDetail.me")
	public ModelAndView goMyRequestDetail(int serviceNo
										 ,ModelAndView mv
										 ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		Notice n = memberService.selectQna(serviceNo);
		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.addObject("a",a);
		mv.addObject("n",n).setViewName("member/myPage/mypageRequestDetail");
		
		return mv;
	}
	
	//마이페이지 Q&A 수정 이동
	@RequestMapping("goRequestUpdate.me")
	public ModelAndView goRequestUpdate(@RequestParam(value="serviceNo") int serviceNo
																	    ,ModelAndView mv
																	    ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		Notice n  = memberService.selectQna(serviceNo);
		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.addObject("n", n);
		mv.addObject("a", a).setViewName("member/myPage/mypageRequestUpdate");
		return mv;
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
		
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		
		mv.addObject("list",list);
		mv.addObject("pi",pi);
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.setViewName("member/myPage/mypageQna");
		
		return mv;
	}
	
	//마이페이지 Q&A 질문등록 이동
	@RequestMapping("myQnaEnroll.me")
	public ModelAndView goMyQnaEnroll(ModelAndView mv
	  								 ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.setViewName("member/myPage/mypageQnaEnroll");
		return mv;
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
	
	//마이페이지 Q&A 수정 이동
	@RequestMapping("goServiceUpdate.me")
	public ModelAndView goServiceUpdate(@RequestParam(value="serviceNo") int serviceNo
																	    ,ModelAndView mv
																	    ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		Notice n  = memberService.selectQna(serviceNo);
		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.addObject("n", n);
		mv.addObject("a", a).setViewName("member/myPage/mypageQnaUpdate");
		return mv;
	}
	
	//마이페이지 Q&A 수정
	@ResponseBody
	@RequestMapping("myQnaUpdate.me")
	public String myQnaUpdate(@RequestParam("serviceNo") int serviceNo
								   ,@RequestParam("category") int category
								   ,@RequestParam("serviceTitle") String serviceTitle
								   ,@RequestParam("serviceContent") String serviceContent
								   ,@RequestParam("writer") String writer
								   ,@RequestParam("fileNames[]") String[] names
								   ,Model model
								   ,HttpSession session) {
		
		ArrayList<Attachment> oldList = memberService.fileSelect(serviceNo);
		ArrayList<String> different = new ArrayList<>();
		ArrayList<Attachment> delName = new ArrayList<Attachment>();
		
		//원래 있던 파일과 새로 들어온 파일 비교 같지 않은 이름 추출
		for (Attachment a : oldList) {
            boolean found = false;
            for (String name : names) {
                if (a.getOriginName().equals(name)) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                different.add(a.getOriginName());
            }
        }
		//같지 않은 이름 새로운 arraylist에 담기
		for (String diff : different) {
			Attachment a = Attachment.builder().boardNo(serviceNo).originName(diff).build();
			delName.add(a);
		}
		//없어진 파일 삭제
		for (Attachment del : delName) {
			Attachment a = memberService.selectDelFile(del);
			int result = memberService.deleteFile(del);
			if (result>0) {
				new File(session.getServletContext().getRealPath(a.getFilePath()+a.getChangeName())).delete();
			}
		}
		
		Notice n = Notice.builder().serviceNo(serviceNo).category(category).serviceTitle(serviceTitle).serviceContent(serviceContent).writer(writer).build();
		int result = memberService.myQnaUpdate(n);
		
		if(result>0) {
			session.setAttribute("alertMsg","질문 수정 완료");
			return (result>0)?"1":"0";
		}else {
			model.addAttribute("errorMsg","질문 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	//마이페이지 Q&A 파일없는 수정
	@ResponseBody
	@RequestMapping("myQnaUpdateNf.me")
	public String myQnaUpdateNf(@RequestParam("serviceNo") int serviceNo
							   ,@RequestParam("category") int category
							   ,@RequestParam("serviceTitle") String serviceTitle
							   ,@RequestParam("serviceContent") String serviceContent
							   ,@RequestParam("writer") String writer
							   ,Model model
							   ,HttpSession session) {
		
		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
		if (a!=null) {
			int result = memberService.deleteFile(serviceNo);
			if (result>0) {
				for (Attachment del : a) {
					new File(session.getServletContext().getRealPath(del.getFilePath()+del.getChangeName())).delete();
				}
			}
		}
		
		Notice n = Notice.builder().serviceNo(serviceNo).category(category).serviceTitle(serviceTitle).serviceContent(serviceContent).writer(writer).build();
		int result = memberService.myQnaUpdate(n);
		
		if(result>0) {
			session.setAttribute("alertMsg","질문 수정 완료");
			return (result>0)?"1":"0";
		}else {
			model.addAttribute("errorMsg","질문 수정 실패");
			return "common/errorPage";
		}
		
	}
	
	//마이페이지 Q&A 질문 파일 수정
	@ResponseBody
	@PostMapping("myQnaFileUpdate.me")
	public String myQnaFileUpdate(@RequestParam("file") MultipartFile[] files
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
					a.setBoardNo(n.getServiceNo());
				}
				result = memberService.myQnaFileUpdate(a);
			}
		}
		return (result>0)?"1":"0";
	}
	
	//마이페이지 Q&A 삭제
	@ResponseBody
	@RequestMapping(value = "qnaDelete.me", method = RequestMethod.POST)
	public String qnaDelete(@RequestParam("serviceNo") int serviceNo
												       ,HttpSession session) {

		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
		if (a!=null) {
			for (Attachment del : a) {
				new File(session.getServletContext().getRealPath(del.getFilePath()+del.getChangeName())).delete();
			}
		}
		int result = memberService.qnaDelete(serviceNo);
		
		String resultString = "";
		if (result>0) {
			session.setAttribute("alertMsg", "질문 삭제 완료");
			resultString = "success";
		}else {
			resultString = "fail";
		}

		return resultString;
	}
	
	//마이페이지 Q&A 상세 페이지 이동
	@RequestMapping("goQnaDetail.me")
	public ModelAndView goMyQnaDetail(int serviceNo
									 ,ModelAndView mv
									 ,HttpSession session) {
		
		String nick = ((Member)session.getAttribute("loginUser")).getNickname();
		Notice n = memberService.selectQna(serviceNo);
		ArrayList<Attachment> a = memberService.fileSelect(serviceNo);
 		int writingCount = memberService.myWritingCount(nick);
		int replyCount = memberService.myReplyCount(nick);
		int choiceCount = memberService.myChoiceCount(nick);
		int requestCount = memberService.myRequestCount(nick);
		int qnaCount = memberService.myQnaCount(nick);
		
		mv.addObject("w",writingCount);
		mv.addObject("r",replyCount);
		mv.addObject("c",choiceCount);
		mv.addObject("rq",requestCount);
		mv.addObject("q",qnaCount);
		mv.addObject("a",a);
		mv.addObject("n",n).setViewName("member/myPage/mypageQnaDetail");
		
		return mv;
	}
	
	//마이페이지 Q&A 답변 조회
	@ResponseBody
	@RequestMapping(value = "qnaReplyList.me",produces = "application/json; charset=UTF-8")
	public String qnaReplyList(int serviceNo) {
		
		ArrayList<Reply> list = adminService.qnaReplyList(serviceNo);
		return new Gson().toJson(list);
	}
	
	//마이페이지 Q&A 답변 등록
	@ResponseBody
	@RequestMapping("qnaReplyInsert.me")
	public String qnaReplyInsert(Reply r
							 	,HttpSession session) {
		
		int result = adminService.qnaReplyInsert(r);
		return (result>0)?"success":"fail";
	}
	
	//마이페이지 Q&A 답변 삭제
	@ResponseBody
	@RequestMapping("qnaReplyDelete.me")
	public String qnaReplyDelete(Reply r
							 	,HttpSession session) {
		
		int result = adminService.qnaReplyDelete(r);
		return (result>0)?"success":"fail";
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
	
	//회원가입리트스 폼 이동 메소드
	@RequestMapping("myCertification.me")
	public String myCertification(Member m
								 ,String birthDay
								 ,ModelAndView mv
								 ,HttpSession session) {
		
		return "member/myPage/certiPopup";
	}
	
	
	@GetMapping("/surveyResult.me")
	@ResponseBody
	public String surveyResult(String result, String userId) {
		
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
	public ModelAndView insertMember(Member m,String birthDay, @RequestParam(value = "certification", defaultValue = "0")int certification, String kakaoId, String access_token, ModelAndView mv, HttpSession session) throws IOException, ParseException {
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
			
			//일반 회원가입시
			if(certification==0) {
				mv.setViewName("redirect:/");
			}
			
			//카카오 인증 회원가입
			if(m.getCertification()==1) {
//				카카오 로그아웃 (카카오 관련 api만 로그아웃되므로 계정 로그아웃으로 진행)
//				String url = "https://kapi.kakao.com/v1/user/logout";
				
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
//				//System.out.println(text);
//				
//				mv.setViewName("redirect:/");

				//카카오 계정 로그아웃
				String url = "https://kauth.kakao.com/oauth/logout";
				url += "?client_id="+appKey;
				url += "&logout_redirect_uri=http://localhost:8888/finalProject/";
				
				mv.setViewName("redirect:"+url);
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
				
				mv.setViewName("redirect:/");
			}
		}else {
			mv.addObject("errorMsg", "회원가입 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//카카오 인증 조회 (1.인가 코드 받기 2.인가코드로 토큰 받기 3.토큰으로 정보 조회)
	//회원가입 폼
	@RequestMapping("enrollForm.me")
	public ModelAndView joinMember(Member m, String birthDay, @RequestParam(value="certification",defaultValue="0") String certification, ModelAndView mv, String code,String error, HttpServletRequest request, HttpSession session) throws IOException, ParseException{
		
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
			kakaoInfo.put("certification",certification);
			
			mv.addObject("kakaoInfo",kakaoInfo);
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
			
			mv.addObject("naverInfo",naverInfo);
		}
		
		mv.setViewName("member/memberEnrollForm");
		
		return mv;
	}
	
	//이메일 인증번호 보내는 메소드
	public int emailSend(String userMail) {
		
		String host = "smtp.naver.com";
		String user = "cjj3845@naver.com";
		String password = "1s2s3s4s";
		
		int ranNum = (int)(Math.random()*9000+1000);
		
		Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(userMail));
			
			message.setSubject("여행가보자고의 인증 메일이 도착하였습니다.");
			message.setText("인증번호 : "+ranNum);
			
			Transport.send(message);
			System.out.println(userMail+"로 인증메일 발송 완료, 인증번호 : "+ranNum);
			
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ranNum;
	}
	
	//이메일 인증번호 쏴주기
	@ResponseBody
	@RequestMapping("emailCk.fe")
	public int emailCk(@RequestParam("email")String userMail) {
		System.out.println("인증메일 보내는중...");
		int ranNum = emailSend(userMail);
		return ranNum;
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
		
		String ipAddress = request.getRemoteAddr(); // 사용자의 IP 주소 추출
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd kk:mm:ss");
		Date currentTime = new Date();
		String strdate = dateFormat.format(currentTime);
		

		if(loginUser!=null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {//로그인 유저 있으면 -> 유저 정보 담기
//		if(loginUser!=null) {// 이거 쓸거라서 ... 잠깐 둘게요! 제가 안까먹고 꼭 지울게요!!!!!
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인이 완료되었습니다.");
			if (loginUser != null) {
				Visit v = Visit.builder().visitIp(ipAddress).visitTime(strdate).visitor(loginUser.getNickname()).build();
				if (!loginUser.getStatus().equals("A")) {
					memberService.connectData(v);
				}
			}
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
	
	//아이디 찾기 폼으로 돌려주기
	@RequestMapping("searchIdForm.me")
	public String searchId() {
		return "member/searchId";
	}
	//아이디 찾기 진행시 인증번호 발송
	@ResponseBody
	@RequestMapping("searchId.me")
	public int searchId(@RequestParam("emailNm")String emailNm, @RequestParam("email")String email) {
		System.out.println("인증메일 보내는 중...");
		
		HashMap<String, String> info = new HashMap();
			info.put("emailNm", emailNm);
			info.put("email", email);
		
		int count = memberService.searchId(info);
		int ranNum = 0;
		
		if(count>0) {
			ranNum = emailSend(email);
		}
		return ranNum;
	}
	//아이디 찾기 진행시 아이디 가져오기
	@ResponseBody
	@RequestMapping("searchIdList.me")
	public Member searchIdList(@RequestParam("emailNm")String emailNm, @RequestParam("email")String email) {
		
		HashMap<String, String> info = new HashMap();
			info.put("emailNm", emailNm);
			info.put("email", email);
		
		Member memId = memberService.searchIdMem(info);
		
		return memId;
	}
	
	//비밀번호 폼으로
	@RequestMapping("searchPwdForm.me")
	public String searchPwd(){
		return "member/searchPwd";
	}
	//비밀번호 찾기 진행시 인증번호 발송
	@ResponseBody
	@RequestMapping("searchPwd.me")
	public int searchPwd(@RequestParam("pwdId")String pwdId, @RequestParam("emailNm")String emailNm, @RequestParam("email")String email) {
		System.out.println("인증메일 보내는 중...");
		
		HashMap<String, String> info = new HashMap();
			info.put("emailNm", emailNm);
			info.put("email", email);
			info.put("pwdId", pwdId);
		
		int count = memberService.searchPwd(info);
		int ranNum = 0;

		if(count>0) {
			ranNum = emailSend(email);
		}
		return ranNum;
	}
	//비밀번호 재설정
	@ResponseBody
	@RequestMapping("pwdRe.me")
	public int searchPwdMem(@RequestParam("memPwd")String memPwd, @RequestParam("pwdId")String pwdId,
								@RequestParam("emailNm")String emailNm, @RequestParam("email")String email,
								ModelAndView mv) {
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(memPwd);
		
		HashMap<String, String> info = new HashMap();
			info.put("userPwd", encPwd);
			info.put("userId", pwdId);
			info.put("userName", emailNm);
			info.put("email", email);
		
		int count = memberService.pwdRe(info);
		
		return count;
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
	
	//카카오 인증 조회 (1.인가 코드 받기 2.인가코드로 토큰 받기 3.토큰으로 정보 조회)
	//마이페이지 동행인증
	@RequestMapping("certi.me")
	public String certificationMember(@RequestParam(value="certification",defaultValue="0") String certification
									 ,ModelAndView mv
									 ,String code
									 ,String error
									 ,HttpServletRequest request
									 ,HttpSession session) throws IOException, ParseException{
		
		String nickname = ((Member)(session.getAttribute("loginUser"))).getNickname();
		
		//인증1번으로 넘어오면 카카오로 토큰 받아오기
		if(certification.equals("1")) {
			//url작성
			String url = "https://kauth.kakao.com/oauth/token";
			url += "?grant_type=authorization_code";
			url += "&client_id="+appKey;
			url += "&redirect_uri=http://localhost:8888/finalProject/certi.me?certification=1";
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
			int agesub = Integer.parseInt(age.substring(0,2));
			
			Member m = memberService.loginMemberNick(nickname);
			if (m.getAge() == agesub && m.getGender().equals(gender)) {
				int result = memberService.updateCertik(nickname);
				if (result>0) {
					Member member = memberService.loginMemberNick(nickname); 
					session.setAttribute("loginUser", member);
					session.setAttribute("alertMsg2", "카카오 인증이 완료되었습니다.");
				}
				System.out.println("성공");
			}else {
				session.setAttribute("alertMsg2", "카카오 회원 정보와 회원 정보가 일치하지 않아 인증에 실패하였습니다.");
			}
			
//			카카오 로그아웃 (카카오 관련 api만 로그아웃되므로 계정 로그아웃으로 진행)
			String url2 = "https://kapi.kakao.com/v1/user/logout";
			try {
				URL requestUrl2 = new URL(url2);
				HttpURLConnection urlCon2 = (HttpURLConnection) requestUrl2.openConnection();
				urlCon.setRequestMethod("GET");
				urlCon.setRequestProperty("Authorization", "Bearer "+access_token);
				
				BufferedReader br2 = new BufferedReader(new InputStreamReader(urlCon2.getInputStream()));
				
				String text2 = "";
				String line2;
				
				while((line2=br2.readLine())!=null) {
					text2 += line2;
				}
				
				System.out.println(text2);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
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
			
			String phone = mobile.replaceAll("-", "");
			String birthdayInfo = birthday.replaceAll("-", "");
			String birthInfo = birthyear+birthdayInfo;
			
			//연령대 계산
			//입력한 나이
			int birYear = Integer.parseInt(birthInfo.substring(0, 4));
			int birMonth = Integer.parseInt(birthInfo.substring(4, 6));
			int birDay = Integer.parseInt(birthInfo.substring(6, 8));
			
			LocalDate birth = LocalDate.of(birYear, birMonth, birDay);
			
			//현재 날짜
			LocalDate today = LocalDate.now();
			
			//입력나이와 현재 날짜 사이의 기간 알아내기
			//Period : 날짜 기간을 나타내는 클래스 (두 날짜 사이의 기간을 알 수 있음)
			Period age = Period.between(birth, today);
			
			int manAge = age.getYears();

			//만나이 연령대별로 나누기
			if(10<=manAge && manAge<20) {
				manAge = 10;
			}else if(20<=manAge && manAge<30) {
				manAge = 20;
			}else if(30<=manAge && manAge<40) {
				manAge = 30;
			}else if(40<=manAge && manAge<50) {
				manAge = 40;
			}else {
				manAge = 50;
			}
			
			Member m = memberService.loginMemberNick(nickname);
			if (m.getPhone().equals(phone) && m.getAge()==manAge && m.getUserName().equals(name) && m.getGender().equals(gender)) {
				int result = memberService.updateCerti(nickname);
				if (result>0) {
					Member member = memberService.loginMemberNick(nickname); 
					session.setAttribute("loginUser", member);
					session.setAttribute("alertMsg2", "네이버 인증이 완료되었습니다.");
				}
				System.out.println("성공");
			}else {
				session.setAttribute("alertMsg2", "네이버 회원 정보와 회원 정보가 일치하지 않아 인증에 실패하였습니다.");
			}
		}
		
		return "member/myPage/certiPopdown";
	}
	
}

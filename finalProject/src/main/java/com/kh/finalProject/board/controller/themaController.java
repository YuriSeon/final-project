package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.service.ThemaService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Theme;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;

@Controller
public class themaController {
	
	
	 @Autowired 
	 private ThemaService themaService;
	 
	
	//테마리스트페이지로 이동
	@RequestMapping("themaList.bo")
	public String themeList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
							,@RequestParam(value="sort",defaultValue = "1") int sort
							,Model model,HttpServletRequest request) {
		
		int listCount = themaService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = new ArrayList<>();
		
		
		if(sort ==1) {
			//최신순 테마
			list = themaService.selectThemaList(pi);
		}else if(sort ==2) {
			//인기순 테마
			list = themaService.selectRankingThemaList(pi);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("count", listCount);
		model.addAttribute("sort", sort);
		return "thema/themaList";
	}
	
	//등록페이지로 이동
	@RequestMapping("themaEnroll.bo")
	public String themaEnroll() {
		return "thema/EnrollForm";
	}
	
	//테마 등록
	@RequestMapping("insertThema.bo")
	public ModelAndView insertThema(Board b
								   ,ModelAndView mv
								   ,HttpSession session
								   ,MultipartFile[] upfile
								   ,Info in
								   ,Theme m) {
		

		//파일 이름 바꾸기
		ArrayList<Attachment> list = new ArrayList<>();
		
		for(int i=0; i<upfile.length; i++) {
			
			if(!upfile[i].getOriginalFilename().equals("")) {//파일이 있으면
					
				String originName = upfile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
				int ranNum = (int) (Math.random()*90000+10000);
				//확장자명 추출
				String ext = originName.substring(originName.lastIndexOf("."));
				//추출한 문자열 합쳐서 changeName만들기
				String changeName = currentTime+ranNum+ext;
				//업로드하는 경로
				String filePath = session.getServletContext().getRealPath("/resources/images/thema/");
				
				//경로와 수정파일명 합쳐서 파일 업로드
				try {
					upfile[i].transferTo(new File(filePath+changeName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Attachment at = new Attachment();
					at.setOriginName(originName);
					at.setChangeName(changeName);
					at.setFilePath("resources/images/thema/"+changeName);
					//파일 레벨 나누기
					if(i==0) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
				list.add(at);
			}
		}
		
		int result = themaService.insertThema(b,in,list,m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "테마 게시글 등록이 완료되었습니다.");
			mv.setViewName("redirect:theme.ad");//관리자 등록 페이지로 돌려줄 생각
		}else {//실패시
			//파일도 지워주기
			for(int i=0; i<list.size(); i++) {
				new File(session.getServletContext().getRealPath("/"+list.get(i).getFilePath())).delete();
			}
			mv.addObject("errorMsg", "테마 게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;	

	}
	
	@RequestMapping("detailTheme.bo")
	public ModelAndView detailTheme(int boardNo,ModelAndView mv,HttpServletRequest request) {
		
		
		//조회수 올리기
		int result = themaService.increaseCount(boardNo);
		
		if(result>0) {
			//상세페이지
			Board b = themaService.selectBoard(boardNo);
			//상세페이지 at
			ArrayList<Attachment> at = themaService.selectAttachment(boardNo);
			//찜하기			
			choice c = themaService.selectChoice(boardNo);
			//신고리스트
			ArrayList<Report> rlist = themaService.selectReportList(); 
			//댓글 갯수
			int reply =themaService.selectReplyCount(boardNo);
						
			mv.addObject("b", b);
			mv.addObject("at", at);
			mv.addObject("c", c);
			mv.addObject("rlist", new Gson().toJson(rlist));
			mv.addObject("reply", reply);
			mv.setViewName("thema/themeDetailView");
		}else {
			mv.addObject("errorMsg", "테마 게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//댓글입력
	@ResponseBody
	@RequestMapping("insertReply.mo")
	public String insertReply(Reply r) {
		
		int result = themaService.insertReply(r);
		return (result>0)?"success":"fali";
	}
	
	//댓글불러오기
	@ResponseBody
	@RequestMapping(value="selectReply.mo", produces = "application/json; charset=UTF-8")
	public String selectReply(int boardNo) {
		ArrayList<Reply> list = themaService.selectReply(boardNo);
		
		return new Gson().toJson(list);
	}
	
	//댓글삭제
	@ResponseBody
	@RequestMapping("deleteReply.mo")
	public String deleteReply(int replyNo) {
		
		int result = themaService.deleteReply(replyNo);
		return (result>0)?"success":"fali";
	}
	
	//댓글수정
	@ResponseBody
	@RequestMapping("updateReply.mo")
	public String updateReply(Reply r) {
		int result = themaService.updateReply(r);
		return (result>0)?"success":"fali";
	}
	
	//댓글신고
	@ResponseBody
	@RequestMapping("report.mo")
	public String reportReply(Report re,String nickname) {
		int result = themaService.reportReply(re,nickname);
		return (result>0)?"success":"fali";
	}
	
	//찜하기
	@ResponseBody
	@RequestMapping(value = "choice.mo", produces = "application/json; charset=UTF-8")
	public String insertChoice(choice c) {
		//찜하기테이블 확인
		int result = themaService.ckChoice(c);
		
		if(result>0) {
			//테이블에 있으면 없애기
			result = themaService.deleteChoice(c)-1;
		}else {
			//테이블이 없으면 넣기
			result = themaService.insertChoice(c);
		}
		return new Gson().toJson(result);
	}
	
	//검색
	@RequestMapping("search.mo")
	public String searchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage
							,@RequestParam(value="sort",defaultValue = "1") int sort
							,Model model,HttpServletRequest request
							,@RequestParam(value="zone")String zone
							,@RequestParam(value="country")String country) {
		
		String zoneName = zone+" "+ country;

		int listCount = themaService.selectSearchListCount(zoneName); 
		int pageLimit = 5;
		int boardLimit = 5;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = new ArrayList<>();
		
		
		if(sort ==1) {
			//검색 최신순 테마
			list = themaService.selectThemaList(pi,zoneName);
		}else if(sort ==2) {
			//검색 인기순 테마
			list = themaService.selectRankingThemaList(pi,zoneName);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("count", listCount);
		model.addAttribute("zone", zone);
		model.addAttribute("country", country);
		model.addAttribute("sort", sort);
		return "thema/themaList";
	}
	
	//사용자 요청페이지 이동
	@RequestMapping("askUpdate.mo")
	public String askUpdate(int boardNo) {
		return "";
	}
	
}

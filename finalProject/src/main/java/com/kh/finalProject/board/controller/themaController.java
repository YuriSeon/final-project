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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.ThemaService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Theme;
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
		int boardLimit = 10;
		
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
	public ModelAndView detailTheme(int boardNo,ModelAndView mv) {
		
		//조회수 올리기
		int result = themaService.increaseCount(boardNo);
		
		if(result>0) {
			//상세페이지
			Board b = themaService.selectBoard(boardNo);
			//상세페이지 at
			ArrayList<Attachment> at = themaService.selectAttachment(boardNo);
			
			mv.addObject("b", b);
			mv.addObject("at", at);
			mv.setViewName("thema/themeDetailView");
		}else {
			mv.addObject("errorMsg", "테마 게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}

}

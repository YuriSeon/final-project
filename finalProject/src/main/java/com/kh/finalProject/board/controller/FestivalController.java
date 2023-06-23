package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.FestivalService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class FestivalController {
	
	@Autowired
	public FestivalService festivalService;
	
	//축제 페이지로 이동
	@RequestMapping("festival.fe")
	public String fesList(@RequestParam(value="currentPage",defaultValue="1")int currentPage, Model model) {

		int listCount = festivalService.fesCount();
		int pageLimit = 10;
		int boardLimit = 6;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Board> list = festivalService.fesList(pi);
		
		model.addAttribute("list",list);
		model.addAttribute("pi",pi);
		
		return "board/festival";
	}

	//축제 등록 폼 이동
	@RequestMapping("fesEnrollForm.fe")
	public String FesEnrollerForm() {
		return "board/festivalEnrollForm";
	}
	
	//축제 등록
	@RequestMapping("fesEnroll.fe")
	public ModelAndView FesEnroll(Board b, Info in, Festival f, MultipartFile[] upfile, ModelAndView mv, HttpSession session) {
		
		String nickname = ((Member) session.getAttribute("loginUser")).getNickname();
		b.setBoardWriter(nickname);

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
				String filePath = session.getServletContext().getRealPath("/resources/images/festivalImg/");
				
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
					at.setFilePath("resources/images/festivalImg/"+changeName);
					at.setWriter(nickname);
					//파일 레벨 나누기
					if(i==0) {
						at.setFileLevel(1);
					}else {
						at.setFileLevel(2);
					}
				list.add(at);
			}
		}
		
		int result = festivalService.insertFes(b,in,list,f);
		
		if(result>0) {
			session.setAttribute("alertMsg", "축제 게시글 등록이 완료되었습니다.");
			mv.setViewName("redirect:festival.ad");//관리자 등록 페이지로 돌려줄 생각
		}else {//실패시
			//파일도 지워주기
			for(int i=0; i<list.size(); i++) {
				new File(session.getServletContext().getRealPath("/"+list.get(i).getFilePath())).delete();
			}
			mv.addObject("errorMsg", "축제 게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//축제 디테일 페이지 이동
	@RequestMapping("fesDetail.fe")
	public ModelAndView fesDetail(@RequestParam("boardNo")int boardNo, ModelAndView mv) {
		
		//조회수 올려주기
		int count = festivalService.countUp(boardNo);
		
		if(count>0) {
			Board b = festivalService.detailFes(boardNo);
			ArrayList<Attachment> at = festivalService.atList(boardNo);
			
			if(b!=null && at!=null) {
				mv.addObject("b", b);
				mv.addObject("at", at);
				mv.setViewName("board/festivalDetailView");
			}else {
				mv.addObject("errorMsg", "축제 페이지를 불러오는데 실패하였습니다.").setViewName("common/errorPage");
			}			
		}else {
			mv.addObject("errorMsg", "축제 페이지를 불러오는데 실패하였습니다.").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜하기 정보 조회
	@ResponseBody
	@RequestMapping("choice.fe")
	public String choice(@RequestParam("boardNo")int boardNo) {
		System.out.println(boardNo);
		return "";
	}
	
	//찜하기 눌렀을시
	@ResponseBody
	@RequestMapping("goodCk.fe")
	public Map<String, Object> choiceCk(@RequestParam("boardNo")String boardNo, HttpSession session) {
		
		String userNo = String.valueOf(((Member)session.getAttribute("loginUser")).getUserNo());
		
		HashMap<String,String> info = new HashMap<String,String>();
		info.put("boardNo", boardNo);
		info.put("userNo", userNo);
		
		//찜 내역 조회
		int choiceCount = festivalService.choiceCount(info);
		
		Map<String, Object> resultText = new HashMap<>();
		
		String Text = "";
		
		if(choiceCount>0) {//찜한 내역 있음
			//찜한 내역 지워주기
			int result = festivalService.choiceDel(info);
			if(result>0) {//찜 삭제 성공
				Text = "N";	
			}else {//찜 삭제 실패
				Text = "NF";
			}
		}else {//찜한 내역 없음
			//찜하기 추가
			int result = festivalService.choiceCk(info);
			if(result>0) {//찜하기 성공				
				Text = "Y";
			}else {//찜하기 실패
				Text ="YF";
			}
		}
		//게시글의 총 찜 수 조회
		int choiAllCount = festivalService.choiAllCount(info);

		resultText.put("text", Text);
		resultText.put("count", choiAllCount);
		
		return resultText;
	}
}

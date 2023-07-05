package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.TogetherService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.TogetherApplyVO;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.board.model.vo.choice;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class TogetherController {
	
	@Autowired
	private TogetherService togetherService;

	@RequestMapping("togetherEnroll.bo")
	public ModelAndView togetherEnroll(ModelAndView mv, String nickname) { 
		
		mv.addObject("nickname", nickname);
		mv.setViewName("board/together/togetherEnrollForm");
		return mv;
	}
	
	@RequestMapping("togetherInsert.bo")
	public ModelAndView insertBoard(String boardTitle, String dateIn, String dateOut, int totalDate, String city, String country,int pay, int togetherCount,String concept,String boardContent,String nickname, ModelAndView mv, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals(" ")) {
			Board b = Board.builder().boardTitle(boardTitle).boardContent(boardContent).boardWriter(nickname).address(city+" "+country).build();
			Attachment at = Attachment.builder().originName(upfile.getOriginalFilename()).changeName(saveFile(upfile,session)).filePath("/resources/images/togetherFiles/").fileLevel(1).writer(nickname).build();
			Plan p = Plan.builder().startDate(dateIn).endDate(dateOut).totalDate(totalDate).together(togetherCount).concept(concept).totalPay(pay).writer(nickname).build();
			
			int result = togetherService.insertBoard(b,at,p);
			if(result>0) {
				mv.addObject("alertMsg", "게시글 작성에 성공하였습니다.");
				mv.setViewName("redirect:together.bo");
			}else {
				mv.addObject("errorMsg", "게시글 작성에 실패하였습니다.");
				mv.setViewName("common/errorPage");
			}
			
		}		
		
		return mv;
	}
	
public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		int ranNum = (int)(Math.random()*90000+10000); //5자리 랜덤값
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/images/togetherFiles/");
		
		try {
			upfile.transferTo(new File(savePath+changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return changeName;
	}

@ResponseBody
@GetMapping(value="optionSearch.bo",produces="application/json; charset=utf-8")
public String optionSearch(@RequestParam(value="currentPage", defaultValue="1") int currentPage,String startDate, String endDate, String location, int pay) {
	
	if(startDate.equals("")) {
		startDate = null;
	}
	if(endDate.equals("")) {
		endDate = null;
	}
	
	TogetherVO t = TogetherVO.builder().startDate(startDate).endDate(endDate).totalPay(pay).zoneName(location).build();
	
	int listCount = togetherService.selectOptionListCount(t);
	
	int pageLimit = 5;
	
	int boardLimit = 6;
	
	PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
	
	ArrayList<TogetherVO> list = togetherService.optionSearch(t, pi);
	
	ArrayList<Object> total = new ArrayList<>();
	
	total.add(list);
	total.add(pi);

	return new Gson().toJson(total);
}

@PostMapping("togetherApply.bo")
public ModelAndView togetherApply(int boardNo, String writer, String applyMessage, ModelAndView mv, HttpServletResponse response) {

	Cookie cookie = null;
	TogetherApplyVO ta = TogetherApplyVO.builder().refBno(boardNo).nickname(writer).message(applyMessage).build();
	int result = togetherService.togetherApply(ta);
	
	if(result>0) {
		
		cookie = new Cookie("applyCheck",Integer.toString(boardNo)+"/"+writer);
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		
		mv.addObject("alertMsg", "참여하기에 성공하였습니다. 작성자의 승인을 기다려주세요.");
		mv.setViewName("redirect:/together.bo");
	}else {
		mv.addObject("errorMsg", "참여하기에 실패하였습니다. 다시 시도해주세요.");
		mv.setViewName("common/errorPage");
	}
	
	return mv;
}

@GetMapping("togetherDetail.bo")
public ModelAndView togetherDetail(int boardNo, ModelAndView mv, HttpSession session) {
	
	int result = 0;
	
	TogetherVO t = togetherService.togetherDetail(boardNo);
	
	if(session.getAttribute("loginUser") != null) {
		String writer = ((Member)(session.getAttribute("loginUser"))).getNickname();
		choice c = choice.builder().writer(writer).boardNo(boardNo).build();
		result = togetherService.togetherChoiceCheck(c);
	}
	
	mv.addObject("choiceCheck",result);
	mv.addObject("t",t);
	mv.setViewName("board/together/togetherDetail");
	
	return mv;
}

@ResponseBody
@GetMapping(value="applyParticipate.bo",produces="application/json; charset=utf-8")
public String applyParticipate(int boardNo) {
	
	ArrayList<TogetherApplyVO> list = togetherService.applyParticipate(boardNo);
	return new Gson().toJson(list);
}

@GetMapping("applyParticipateResult.bo")
public String applyParticipateResult(int boardNo, String type, String nickname, HttpServletResponse response) {
	
	String[] arr;
	Cookie cookie = null;
	
	if(!nickname.equals(" ")) {
		arr = nickname.split(" ");
	
		if(type.equals("accept")) { //참여 수락이면 apply테이블 status 변경하고 plan 테이블도 수정하기
			for(int i=0; i<arr.length;i++) {
				TogetherApplyVO ta = TogetherApplyVO.builder().refBno(boardNo).nickname(arr[i]).build();
				int result = togetherService.applyParticipateAccept(ta);
			}
		}else { //참여 거절이면 apply테이블 status만 변
			for(int i=0; i<arr.length;i++) {
				TogetherApplyVO ta = TogetherApplyVO.builder().refBno(boardNo).nickname(arr[i]).build();
				int result = togetherService.applyParticipateReject(ta);
			}
		}
	}
	
	cookie = new Cookie("applyCheck",null);
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	return "redirect:/together.bo";
}

@GetMapping("togetherChoice.bo")
public ModelAndView togetherChoiceYes(int boardNo, String writer, int choiceCheck, ModelAndView mv) {

	int result = 0;

	choice c = choice.builder().boardNo(boardNo).writer(writer).build();
	
	if(choiceCheck ==0) { //찜하기 안한 상태 > 추가 해야함 
		result = togetherService.choiceYes(c);
		mv.addObject("choiceCheck", result);
		mv.addObject("alertMsg", "게시물 찜하기 완료");
	}else { //찜하기 한 상태 > 삭제 해야함
		result = togetherService.choiceNo(c);
		mv.addObject("choiceCheck", result-1);
		mv.addObject("alertMsg", "게시물 찜하기 취소 완료");
	}
	mv.setViewName("redirect:/together.bo");
	return mv;
}

@GetMapping("togetherUpdate.bo")
public ModelAndView togetherUpdate(int boardNo, ModelAndView mv) {
	
	TogetherVO t = togetherService.togetherDetail(boardNo);
	mv.addObject("t",t);
	mv.setViewName("board/together/togetherUpdateForm");
	return mv;
}

}

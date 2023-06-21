package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.TogetherVO;
import com.kh.finalProject.board.service.TogetherService;

@Controller
public class TogetherController {
	
	@Autowired
	private TogetherService togetherService;

	@RequestMapping("togetherEnroll.bo")
	public ModelAndView togetherEnroll(ModelAndView mv, String nickname) { 
		
		mv.addObject("nickname", nickname);
		mv.setViewName("board/togetherEnrollForm");
		return mv;
	}
	
	@RequestMapping("togetherInsert.bo")
	public ModelAndView insertBoard(String boardTitle, String dateIn, String dateOut, int totalDate, String city, String country,int pay, int togetherCount,String concept,String boardContent,String nickname, ModelAndView mv, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals(" ")) {
			Board b = Board.builder().boardTitle(boardTitle).boardContent(boardContent).boardWriter(nickname).address(city+" "+country).build();
			Attachment at = Attachment.builder().originName(upfile.getOriginalFilename()).changeName(saveFile(upfile,session)).filePath("/resources/togetherFiles/").fileLevel(1).writer(nickname).build();
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
		
		String savePath = session.getServletContext().getRealPath("/resources/togetherFiles/");
		
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
public String optionSearch(String startDate, String endDate, String location, int pay) {
	
	//지정 안함 지정 안함 대구 400000
	//2023-06-13 2023-06-16 대구 400000
	
	if(startDate.equals("")) {
		startDate = null;
	}
	if(endDate.equals("")) {
		endDate = null;
	}
	
	TogetherVO t = TogetherVO.builder().startDate(startDate).endDate(endDate).totalPay(pay).zoneName(location).build();
	
	ArrayList<TogetherVO> list = togetherService.optionSearch(t);

	return new Gson().toJson(list);
}

@ResponseBody
@GetMapping("togetherApply.bo")
public int togetherApply(int boardNo) {
	
	int result = togetherService.togetherApply(boardNo);
	
	return result;
}
}

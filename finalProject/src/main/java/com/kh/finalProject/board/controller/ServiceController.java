package com.kh.finalProject.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.FestivalService;
import com.kh.finalProject.board.model.service.ServiceService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Service;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;

@Controller
public class ServiceController {
	
	@Autowired
	public ServiceService serviceService;
	
	@Autowired
	public FestivalService festivalService;
	
	//고객센터 페이지로
	@RequestMapping("service.se")
	public ModelAndView serviceHome(@RequestParam(value = "currentPage", defaultValue = "1")int currentPage, ModelAndView mv) {
		
		int listCount = serviceService.serCount();
		int pageLimit = 10;
		int boardLimit = 7;
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Service> serList = serviceService.serList(pi);
		
		mv.addObject("list",serList).setViewName("board/service");
		mv.addObject("pi",pi);
		
		return mv;
	}
	
	//고객센터(공지사항) 디테일
	@RequestMapping("notiDetail.se")
	public ModelAndView serviceDetail(int boardNo, ModelAndView mv) {
		
		//조회수 올려주기
		int count = serviceService.countUp(boardNo);
		
		//이전글 가져오기
		Service preSer = serviceService.preSer(boardNo);
		//다음글 가져오기
		Service nextSer = serviceService.nextSer(boardNo);
		
		if(count>0) {
			Service s = serviceService.detailSer(boardNo);
			ArrayList<Attachment> at = festivalService.atList(boardNo);

			String filePath = "";
			if(!at.isEmpty()) {
				filePath = at.get(0).getFilePath()+at.get(0).getChangeName();
			}

			if(s!=null) {
				mv.addObject("s", s);
				mv.addObject("at", filePath);
				mv.setViewName("board/serviceDetail");
				
				//이전글 담기
				mv.addObject("preSer", preSer);
				//다음글 담기
				mv.addObject("nextSer", nextSer);
			}else {
				mv.addObject("errorMsg", "축제 페이지를 불러오는데 실패하였습니다.").setViewName("common/errorPage");
			}			
		}else {
			mv.addObject("errorMsg", "축제 페이지를 불러오는데 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}

}

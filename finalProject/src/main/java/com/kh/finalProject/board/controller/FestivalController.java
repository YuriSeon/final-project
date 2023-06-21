package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.FestivalService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Festival;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.member.model.vo.Member;

@Controller
public class FestivalController {
	
	@Autowired
	public FestivalService festivalService;

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
//			for(int i=0; i<list.size(); i++) {
//				new File(session.getServletContext().getRealPath("/"+list.get(i).getFilePath())).delete();
//			}
			mv.addObject("errorMsg", "축제 게시글 등록에 실패하였습니다.").setViewName("common/errorPage");
		}
		
		return mv;
	}
}

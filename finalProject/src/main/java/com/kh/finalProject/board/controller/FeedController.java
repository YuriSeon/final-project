package com.kh.finalProject.board.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.service.FeedService;
import com.kh.finalProject.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;

	@RequestMapping("enroll.fo")
	public String enrollForm() {
		return "board/feedEnrollerForm";
	}
	
	@RequestMapping("insert.fo")
	public ModelAndView insertFeed(Board b,ModelAndView mv,HttpSession session,ArrayList<MultipartFile> upfile) {

		ArrayList<Attachment> list = new ArrayList<>();
		
		for(MultipartFile file : upfile) {
	
		if(!file.getOriginalFilename().equals("")) {
			
			//1.원본 파일명 뽑기 
			String originName = file.getOriginalFilename(); 
			
			//2.시간형식 문자열로 뽑아내기
			//202305163033
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			
			//3.뒤에 붙을 5자리 랜덤값 뽑아주기
			int ranNum = (int)(Math.random()*90000+10000); //5자리 랜덤값
			
			//4.확장자명 추출하기
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5.추출한 문자열들 다 합쳐서 changeName 만들기
			String changeName = currentTime+ranNum+ext;
			
			//6.업로드하고자 하는 물리적인 경로 알아내기
			String filePath = session.getServletContext().getRealPath("/resources/feed/");
		
			
			//7.경로와 수정파일명을 합쳐 파일 업로드 하기
			
			try {
				//파일업로드 구문
				file.transferTo(new File(filePath+changeName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//Attachment에 originName,changeName,Level,boardNo세팅하기
			Attachment at = new Attachment();
			at.setOriginName(originName);
			at.setChangeName(changeName);
			at.setFileLevel(2);
			at.setFilePath("resources/feed/"+changeName);
			at.setBoardNo(b.getBoardNo());
			list.add(at);
			
		}
		}

		int result = feedService.insertFeed(b,list);
		if(result>0) {
			mv.addObject("alertMsg","피드게시물 작성완료").setViewName("redirect:feed.bo");
		}else {
			mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
		//삭제 구문
		@RequestMapping(value = "delete.fo", method = RequestMethod.POST)
		public ModelAndView deleteFeed(@RequestParam("boardNo") int boardNo, ModelAndView mv,HttpSession session,@RequestParam("filePath") String filePath) {
			
			 int result = feedService.deleteFeed(boardNo);
			 System.out.println(result);
			
			if (result > 0) {
	            if (!filePath.isEmpty()) {
	            	String[] filePathList = filePath.split(",");
	                for (String path : filePathList) {
	                    new File(session.getServletContext().getRealPath("/"+path)).delete();
	                }
	                session.setAttribute("alertMsg", "게시글 삭제 완료");
	                mv.setViewName("redirect:feed.bo");
	            } else {
	                mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
	            }
	        }else {
	        	mv.addObject("errorMsg", "게시글 삭제 실패").setViewName("common/errorPage");
	        }
	   
	    return mv;
        
		}
		
		@RequestMapping(value="heart.bo", method = RequestMethod.POST)
		@ResponseBody
		public void insertHeart(@RequestParam("boardNo") int boardNo,@RequestParam("writer") String writer,ModelAndView mv,HttpServletRequest request,HttpServletResponse response ) throws IOException {
			

			int result = feedService.ckHeart(boardNo,writer);

			if(result>0) {
				result = feedService.deleteHeart(boardNo,writer)-1;
				
			}else {
				result = feedService.insertHeart(boardNo,writer);
				
			}
			response.setContentType("application/json; charset=UTF-8");
		    response.getWriter().print(result);
		}
	
}

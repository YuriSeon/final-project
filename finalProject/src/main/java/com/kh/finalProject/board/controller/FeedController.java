package com.kh.finalProject.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.admin.model.vo.Report;
import com.kh.finalProject.board.model.service.FeedService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Board;
import com.kh.finalProject.board.model.vo.Good;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Reply;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.common.model.vo.PageInfo;
import com.kh.finalProject.common.template.Pagination;
import com.kh.finalProject.member.model.vo.Member;


@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedService;

	@RequestMapping("enroll.fo")
	public String enrollForm() {
		return "board/feedEnrollerForm";
	}
	
	@RequestMapping("insert.fo")
	public ModelAndView insertFeed(Board b,ModelAndView mv,HttpSession session,ArrayList<MultipartFile> upfile,Info in) {

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

		int result = feedService.insertFeed(b,list,in);
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
		
		//좋아요등록
		@RequestMapping(value="heart.bo", method = RequestMethod.POST,produces = "application/json; charset=UTF-8")
		@ResponseBody
		public void insertHeart(@RequestParam("boardNo") int boardNo,@RequestParam("writer") String writer,ModelAndView mv,HttpServletRequest request,HttpServletResponse response ) throws IOException {
			

			int result = feedService.ckHeart(boardNo,writer);

			if(result>0) {
				result = feedService.deleteHeart(boardNo,writer)-1;
				
			}else {
				result = feedService.insertHeart(boardNo,writer);
				
			}
		    response.getWriter().print(result);
		}
		
		//댓글등록
		@ResponseBody
		@RequestMapping(value="reply.fo")
		public String insertReply(Reply r){
			
			int result = feedService.insertReply(r);
			/*
			 * if(result>0) { return "success"; }else { return "fail"; }
			 */
			return (result>0)?"success":"fail";
		}
		
		//댓글삽입
		@ResponseBody
		@RequestMapping(value="selectReplyList.fo",produces = "application/json; charset=UTF-8")
		public String selectReplyList(int refQno) {
			
			ArrayList<Reply> list = feedService.selectReplyList(refQno);
			return new Gson().toJson(list);
		}
		
		//댓글삭제
		@ResponseBody
		@RequestMapping("deleteReply.fo")
		public String deleteReply(int replyNo) {
			int result = feedService.deleteReply(replyNo);
//			System.out.println(result);
			return (result>0)?"success":"fail";
		}
		
		//댓글수정
		@ResponseBody
		@RequestMapping("updateReply.fo")
		public String updateReply(Reply r) {
			
			int result = feedService.updateReply(r);
			
			return (result>0)?"success":"fail";
		}
		
		//댓글신고
		@ResponseBody
		@RequestMapping("report.fo")
		public String reportReply(String nickname, Report rep) {
			/*
			 * boolean isAlreadyReported = feedService.isAlreadyReported(rep); // 이미 신고된
			 * 회원인지 여부 확인
			 * 
			 * if (isAlreadyReported) { return "alreadyReported"; }
			 */
			int result = feedService.reportReply(nickname,rep);
			
			return (result>0)?"success":"fail";
		}
		
		//대댓글입력
		@ResponseBody
		@RequestMapping("answer.fo")
		public String insertAnswer(Rereply re) {
			int result = feedService.insertAnswer(re);
			
			return (result>0)?"success":"fail";
		}
		
		//대댓글 삽입
		@ResponseBody
		@RequestMapping(value="selectAnswer.fo",produces = "application/json; charset=UTF-8")
		public String selectRereply(int replyNo) {
			
			ArrayList<Rereply> list = feedService.selectRereply(replyNo);
			return new Gson().toJson(list);
		}
		
		//대댓글 삭제
		@ResponseBody
		@RequestMapping("deleteRere.fo")
		public String deleteRere(int refRno) {
			int result = feedService.deleteRere(refRno);
			return (result>0)?"success":"fail";
		}
		
		//대댓글수정
		@ResponseBody
		@RequestMapping("updateRere.fo")
		public String updateRere(Rereply re) {
			int result = feedService.updateRere(re);
			
			return (result>0)?"success":"fail";
		}
		
		//대댓글 신고
		@ResponseBody
		@RequestMapping("rereport.fo")
		public String rereportReply(String nickname, Report rep) {
			int result = feedService.rereportReply(nickname,rep);
			
			return (result>0)?"success":"fail";
		}
		
		//게시물 수정폼
		@RequestMapping("updateEnroll.fo")
		public String updateForm(int boardNo,Model model) {
			
			
			 Board b = feedService.selectBoard(boardNo);
			 ArrayList<Attachment> alist = feedService.selectAttachment(boardNo);
			 
			 model.addAttribute("b", b);
			 model.addAttribute("alist", new Gson().toJson(alist));
			 model.addAttribute("size", alist.size());
			 model.addAttribute("list", alist);
			return "board/feedUpdateForm";
		}
		
		//게시물 수정
		@RequestMapping(value="updatefeed.fo",method=RequestMethod.POST)
		public ModelAndView updatefeed(Board b,ArrayList<MultipartFile> upfile,String[] filePath,ModelAndView mv,HttpSession session,Info in) {
			ArrayList<Attachment> list = new ArrayList<>();
			System.out.println(in);
			for(MultipartFile file : upfile) {
				if(!file.getOriginalFilename().equals("")) {
					
					if(filePath != null) {
						//기존 첨부파일 찾아서 지우기
						for(String origin : filePath) {							
							new File(session.getServletContext().getRealPath(origin)).delete();
						}
					}
					
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
					String savePath = session.getServletContext().getRealPath("/resources/feed/");
					
					try {
						file.transferTo(new File(savePath+changeName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					Attachment at = new Attachment();
					at.setOriginName(originName);
					at.setChangeName(changeName);
					at.setFileLevel(2);
					at.setFilePath("resources/feed/"+changeName);
					at.setBoardNo(b.getBoardNo());
					list.add(at);
				}
			}
			int result = feedService.deleteAttachment(b.getBoardNo());
			int result2 = feedService.updateFeed(b,list,in);
			
			if(result *result2>0) {
				mv.addObject("alertMsg","피드게시물 수정완료").setViewName("redirect:feed.bo");
			}else {
				mv.addObject("errorMsg", "게시글 작성 실패").setViewName("common/errorPage");
			}
			
			return mv;
		}

		//도시선택
		@RequestMapping("city.bo")
		public String goFeed(@RequestParam(value="currentPage", defaultValue="1") int currentPage
							,@RequestParam(value="city",defaultValue = "1") int city
							,@RequestParam(value="sort",defaultValue = "1") int sort
							,Model model,HttpServletRequest request) {

			ArrayList<Member> mlist = feedService.selectMember();
			ArrayList<Good> glist = feedService.selectGood();
			ArrayList<Attachment> alist = feedService.selectAttachmentList();
			int listCount = feedService.selectListCount(city);
			int pageLimit = 5;
			int boardLimit = 5;
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
					
			ArrayList<Board> list = new ArrayList<>();
			
			if(sort ==1) {
				//최신순
				list = feedService.selectCityList(pi,city);
			}else if(sort==2) {
				//인기순
				list = feedService.selectRankingList(pi,city);
			}
							
			model.addAttribute("list", list);
			model.addAttribute("blist", new Gson().toJson(list));
			model.addAttribute("bsize",list.size());
			model.addAttribute("pi", pi);
			model.addAttribute("alist", new Gson().toJson(alist));
			model.addAttribute("size", alist.size());
			model.addAttribute("glist",new Gson().toJson(glist));
			model.addAttribute("mlist",new Gson().toJson(mlist));
			model.addAttribute("city", city);
			model.addAttribute("sort", sort);

			return "board/feed";
		}
		
		//게시물 신고
		@ResponseBody
		@RequestMapping("report")
		public String report(Report re,String nickname) {
			int result = feedService.reportBoard(re,nickname);
			return (result>0)?"success":"fali";
		}
		
		
		
	
}

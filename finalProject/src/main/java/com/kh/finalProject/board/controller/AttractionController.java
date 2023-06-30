package com.kh.finalProject.board.controller;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.AttractionService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Rereply;
import com.kh.finalProject.board.model.vo.Selenium;

@Controller
public class AttractionController {
	
	private static String BASEURL = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=";
	private static String SERVICEKEY = "E15I5%2FPXccZzl%2BCSlsAkGubm20fnvVbSgMXRQg5sSx2qPglZUEa73k3K32wX1dWvBNris%2BiRqICN51d93m08tA%3D%3D";
	
	@Autowired
	private AttractionService atService;
	
	// file upload전 changeName생성 
	public static String getChangeName(String originName) {
		String changeName = ""; 
		// 1. 시간형식 문자열로 뽑아내기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		// 2. 뒤에 붙은 5자리 랜덤값 뽑아주기
		int ranNum = (int)(Math.random()*90000+10000); // 5자리 랜덤값
		if(originName.lastIndexOf(".")!=-1) { // 확장자명이 있다면
			// 3. 확장자명 추출하기
			String ext = originName.substring(originName.lastIndexOf("."));
			// 4. 추출한 문자열들 다 합쳐서 changeName 만들기
			changeName = currentTime+ranNum+ext;
		} else {// 확장자명이 없다면
			changeName = currentTime+ranNum+".jpg";
		}
		return changeName;
	}

	// 이미지 다운 및 경로 설정 메소드(URL)
	public static ArrayList<Attachment> imgTool(HttpSession session, ArrayList<String> imageURL){
		String savePath = session.getServletContext().getRealPath("/resources/infoImg/"); //프로젝트 내 파일 다운받을 경로 설정
		// 전역변수 선언
		String originName = "";
		String changeName = "";
		InputStream inputStream = null;
		ByteArrayOutputStream outputStream = null;
		FileOutputStream fileOutputStream = null;
		ArrayList<Attachment> atArr = new ArrayList<>();
		
		for(int i=0; i<imageURL.size(); i++) {
			Attachment at = new Attachment();
			String[] strArr = imageURL.get(i).split("/"); // 기존이름과 확장자명 추출위해 배열 변수처리
			originName = strArr[strArr.length-1]; // 마지막 인덱스가 파일명
			changeName = getChangeName(originName); // 랜덤 파일이름 부여 
			
			try {
				URL url = new URL(imageURL.get(i));
				URLConnection conn = url.openConnection();
				inputStream = conn.getInputStream();

				// 이미지 파일을 바이트 배열로 읽어오기
				outputStream = new ByteArrayOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer)) != -1) {
				    outputStream.write(buffer, 0, bytesRead);
				}
				byte[] imageBytes = outputStream.toByteArray();

				// 디렉토리 생성
				File directory = new File(savePath);
				if (!directory.exists()) {
				    directory.mkdirs();
				}

				// 이미지 파일로 저장하기
				fileOutputStream = new FileOutputStream(new File(savePath, changeName));// 파일 저장 경로 설정
				fileOutputStream.write(imageBytes);
				
				// 이미지 저장되면 이름, 경로 저장
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath("resources/infoImg/"+changeName);
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					outputStream.close();
					inputStream.close();
					fileOutputStream.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			atArr.add(at);
		}
		
		return atArr;
	}
	
	// 파일로 이미지 업로드한 경우
	public static ArrayList<Attachment> imgTool(ArrayList<MultipartFile> upfile, HttpSession session ){
		String savePath = session.getServletContext().getRealPath("/resources/infoImg/"); //프로젝트 내 파일 다운받을 경로 설정
		// 전역변수 선언
		String originName = "";
		String changeName = "";
		ArrayList<Attachment> atArr = new ArrayList<>();
		
		// 직접 올린 파일이라면
		for(int i=0; i<upfile.size(); i++) {
			Attachment at = new Attachment();
			originName = upfile.get(i).getOriginalFilename(); // 기존 이름 추출
			if(!originName.equals("")) {  // 파일이 비어있지 않으면
				changeName = getChangeName(originName); // 랜덤 파일이름 부여
				// 경로와 수정파일명을 합쳐 파일 업로드
				try {
					upfile.get(i).transferTo(new File(savePath+changeName)); // 파일 업로드 구문
					at.setOriginName(originName);
					at.setChangeName(changeName);
					at.setFilePath("resources/infoImg/"+changeName);
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
			}
			atArr.add(at);
		}
		return atArr;
	}
	
	@ResponseBody
	@GetMapping(value="searchKeyword1", produces = "application/json; charset=UTF-8")
	public String ListSelectApi(@RequestParam(value="currentPage", defaultValue ="1") int currentPage,
								@RequestParam(value="sort", defaultValue ="O") String sort,
								String zoneName,
								@RequestParam(value="searchType", defaultValue ="12") int searchType) throws IOException {
		// 검색내역변수처리
		String rowBounds = "&numOfRows=6"; // 한페이지당 보이는 게시물 수 나중에 게시물수 확인해서 값 수정하기
		String page = "&pageNo="+currentPage; // currentPage넣어주기
		String arr = "&arrange="+sort; // 정렬기준 (O=제목순, Q=수정일순, R=생성일순)
		String keyword = "&keyword="+zoneName; // 검색지역 넣기
		String type = "&contentTypeId="+searchType; // 검색유형 (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 38:쇼핑, 39:음식점)
		String etc = "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y";
		
		// 검색해서 보여줄 url 완성
		String url = BASEURL + SERVICEKEY + rowBounds + page  + sort + keyword + type + etc;
		
		// url 연결 후 값 읽어오기
		URL requestUrl = new URL(url);
		HttpURLConnection urlCon = (HttpURLConnection)requestUrl.openConnection();
		urlCon.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlCon.getInputStream()));
		String responseText = "";
		String line;
		while((line=br.readLine())!=null) { // 조건문 영역에서 바로 확인시 결과 누락할 수 있어서 변수에 담으며 확인
			responseText += line;
		}
		
		// 사용 끝나면 닫아주기
		br.close();
		urlCon.disconnect(); 
		
		return responseText;
	}
	
	// 디테일뷰 페이지로 이동
	@GetMapping("detail.attr")
	public String detailAttr(int boardNo, Model model) {
		// 게시물 클릭시 조회수 증가
		int count = atService.increaseCount(boardNo);
		// 게시물 데이터 조회
		HashMap<String, Object> dataMap = atService.attrDetail(boardNo);
		model.addAttribute("dataMap", dataMap);
		return "board/attraction/attractionDetail";
	}
	
	// 게시물 수정페이지 이동
	@GetMapping("update.attr")
	public String updateAttr(int boardNo) {
		return "board/attraction/attractionUpdate";
	}
	
	// 게시물 등록페이지 이동
	@GetMapping("insert.attr")
	public String insertAttr() {
		return "board/attraction/attractionInsert";
	}
	
	// 게시물 등록전 정보조회해오는 메소드 
	@PostMapping(value="searchInfo.attr", produces ="json/application; charset=UTF-8")
	public String searchInfo(Info in) {
		Info info = new Selenium().infoDataGet(in);
		return new Gson().toJson(info);
	}
	
	// 게시물 등록 메소드 
	@PostMapping("insert.attr")
	public ModelAndView insertAttr(HttpSession session, ModelAndView mv, Info info, int mainImg, ArrayList<MultipartFile> upfile, 
									@RequestParam("imageURL") ArrayList<String> imageURL) {
		// 이미지처리하는 메소드 실행
		ArrayList<Attachment> atArr = new ArrayList<>();
		if(!imageURL.isEmpty()) {
			atArr = imgTool(session, imageURL);
		} else {
			atArr = imgTool(upfile, session);
		}
		for(int i=0; i<atArr.size(); i++) { // 대표이미지 설정
			if(i==(mainImg-1)) {
				atArr.get(i).setFileLevel(1);
			} else {
				atArr.get(i).setFileLevel(2);
			}
		}
		int result = atService.insertAttr(info, atArr);
		if(result!=0) { // 0이 아니면 한번도 실패 안한거라서 성공
			session.setAttribute("alertMsg", "게시물등록 성공");
			mv.setViewName("redirect:attraction.bo");
		} else {
			mv.addObject("errorMsg", "게시물 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 게시물 내용 수정 요청 페이지로 이동
	@GetMapping("modify.attr")
	public String modifyRequestAttr(int boardNo) {
		return "board/attraction/attrModifyRequest";
	}
	
	// 댓글 등록
	@ResponseBody
	@RequestMapping(value="insertReply.attr", produces ="application/json; charset=UTF-8")
	public int insertReply(Rereply r){
		return atService.insertReply(r);
	}
	
	// 댓글 조회
	@ResponseBody
	@RequestMapping(value="selectReplyList.attr", produces ="application/json; charset=UTF-8")
	public String selectReplyList(int boardNo) {
		HashMap<String, Object> rList = atService.selectReplyList(boardNo);
		return new Gson().toJson(rList);
	}
	
	// 좋아요, 찜, 신고여부 조회
	@ResponseBody
	@RequestMapping(value="iconCheck.attr", produces ="application/json; charset=UTF-8")
	public String iconCheck(@RequestParam("btnType") String btnType, 
							@RequestParam("boardNo") int boardNo, 
							@RequestParam("writer") String writer) {
		int result = atService.iconCheck(btnType, boardNo, writer);
		return new Gson().toJson(result);
	}
	
	// 좋아요, 찜 아이콘 변경
	@ResponseBody
	@RequestMapping(value="iconChange.attr", produces ="application/json; charset=UTF-8")
	public String iconChange(@RequestParam("btnType") String btnType, @RequestParam("tableName")String tableName,
							 @RequestParam("no") int no, @RequestParam("writer") String writer) {
		int count = 0;
		int result = atService.iconCheck(btnType, no, writer);
		if(result>0) { // 이미 눌렀던 사람 (취소하기)
			count = atService.iconBefore(btnType, tableName, no, writer);
		} else { // 새로 등록할 사람
			count = atService.iconAfter(btnType, tableName, no, writer);
		}
		return new Gson().toJson(count);
	}
	
	// 
}

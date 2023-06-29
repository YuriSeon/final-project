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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.finalProject.board.model.service.AttractionService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Info;
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
			changeName = currentTime+ranNum;
		}
		return changeName;
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
	@ResponseBody
	@PostMapping(value="searchInfo.attr", produces ="json/application; charset=UTF-8")
	public String searchInfo(Info in) {
		Info info = new Selenium().infoDataGet(in);
		return new Gson().toJson(info);
	}
	
	// 게시물 등록 메소드 
	@PostMapping("insert.attr")
	public ModelAndView insertAttr(HttpSession session, ModelAndView mv, Info info, int mainImg, ArrayList<MultipartFile> upfile, 
									@RequestParam("imageURL") ArrayList<String> imageURL) {
		String savePath = session.getServletContext().getRealPath("/resources/infoImg");
		String originName = "";
		String changeName = "";
		InputStream inputStream = null;
		ByteArrayOutputStream outputStream = null;
		FileOutputStream fileOutputStream = null;
		ArrayList<Attachment> atArr = new ArrayList<>();
		
		if(!imageURL.isEmpty()) { // 웹에서 다운받아야한다면
			for(int i=0; i<imageURL.size(); i++) {
				Attachment at = new Attachment();
				String[] strArr = imageURL.get(i).split("/"); // 기존이름과 확장자명 추출위해 배열 변수처리
				originName = strArr[strArr.length-1]; // 마지막 인덱스가 파일명
				changeName = getChangeName(originName);
				
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

					// 이미지 파일로 저장하기
					fileOutputStream = new FileOutputStream(savePath);// 파일 저장 경로 설정
					fileOutputStream.write(imageBytes);
					
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					try {
						outputStream.close();
						inputStream.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(i==(mainImg-1)) {
					at.setFileLevel(1);
				} else {
					at.setFileLevel(2);
				}
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath(savePath);
				atArr.add(at);
			}
		} else { // 직접 올린 파일이라면
			for(int i=0; i<upfile.size(); i++) {
				Attachment at = new Attachment();
				originName = upfile.get(i).getOriginalFilename();
				if(!originName.equals("")) { 
					changeName = getChangeName(originName);
					// 경로와 수정파일명을 합쳐 파일 업로드
					try {
						upfile.get(i).transferTo(new File(savePath+changeName)); //파일 업로드 구문
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(i==(mainImg-1)) {
					at.setFileLevel(1);
				} else {
					at.setFileLevel(2);
				}
				at.setOriginName(originName);
				at.setChangeName(changeName);
				at.setFilePath(savePath);
				atArr.add(at);
			}
		}
		int result = atService.insertAttr(info, atArr);
		if(result==(atArr.size()+1)) { // 파일개수 + 데이터삽입수의 합
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
}

package com.kh.finalProject.board.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.finalProject.board.model.service.AttrarctionService;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Selenium;
import com.kh.finalProject.board.service.AttractionService;

@Controller
public class AttractionController {
	
	private static String BASEURL = "https://apis.data.go.kr/B551011/KorService1/searchKeyword1?serviceKey=";
	private static String SERVICEKEY = "E15I5%2FPXccZzl%2BCSlsAkGubm20fnvVbSgMXRQg5sSx2qPglZUEa73k3K32wX1dWvBNris%2BiRqICN51d93m08tA%3D%3D";
	
	@Autowired
	private AttrarctionService atService;
	
	@ResponseBody
	@GetMapping(value="searchKeyword1", produces = "application/json; charset=UTF-8")
	public String ListSelectApi() throws IOException {
		// 검색내역변수처리
		String rowBounds = "&numOfRows=10"; // 한페이지당 보이는 게시물 수 나중에 게시물수 확인해서 값 수정하기
		String page = "&pageNo=1"; // currentPage넣어주기
		String sort = "&arrange=A"; // 정렬기준 (O=제목순, Q=수정일순, R=생성일순)
		String keyword = "&keyword=강원"; // 검색지역 넣기
		String type = "&contentTypeId=12"; // 검색유형 (12:관광지, 14:문화시설, 15:축제공연행사, 25:여행코스, 28:레포츠, 32:숙박, 38:쇼핑, 39:음식점)
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
		JsonObject totalObj = new Gson().fromJson(responseText, JsonObject.class); //String->json 형태로 변경
		JsonObject obj = totalObj.getAsJsonObject("response").getAsJsonObject("header").getAsJsonObject("body").getAsJsonObject("items").getAsJsonObject("item");
		
		//데이터 변수명 전화해서 확인하고 마저 작성하기 VO 만들기
		
		// 사용 끝나면 닫아주기
		br.close();
		urlCon.disconnect(); 
		
		return responseText;
	}
	
	@RequestMapping("detail.attr")
	public String detailAttr() {
		return "board/attraction/attractionDetail";
	}
	
	@RequestMapping("update.attr")
	public String updateAttr() {
		return "board/attraction/attractionUpdate";
	}
	
	@RequestMapping("insert.attr")
	public String insertAttr() {
		return "board/attraction/attractionInsert";
	}
	
	// 나중에 값 넣기 
	@RequestMapping("searchInfo.attr")
	public Info searchInfo(Info in) {
		Info info = new Selenium().infoDataGet(in);
		return info;
	}
}

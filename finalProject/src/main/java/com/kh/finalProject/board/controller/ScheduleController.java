package com.kh.finalProject.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.AttractionService;
import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.vo.Attachment;
import com.kh.finalProject.board.model.vo.Info;
import com.kh.finalProject.board.model.vo.Plan;
import com.kh.finalProject.board.model.vo.Selenium;



@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scService;
	
	
	// 일정 등록페이지 이동
	@GetMapping("insert.sc")
	public String insertSc() {
		return "board/schedule/enrollPage";
	}
	
	public Info infoDataGet(String[] pathArr) {
		Info info = null;
		// 매개변수로 전달받은 배열에서 사용할 값 추출
		String infoName = pathArr[0];
		String infoAddress = pathArr[3];
		String zone = infoAddress.split(" ")[0]; // 주소에서 지역명 추출
		// 첫번째 공백 뒤로 잘라서 주소 검색
		// 서울이나 서울특별시 이렇게 다르게 찾아질 수 있으니 처음 단위 제거
		String address = infoAddress.substring(infoAddress.indexOf(" ")+1); 
		int result = scService.checkInfo(address);
		if(result>0) {
			info = new Selenium().searchData(infoName, zone);
		} 
		return info;
	}
	
	// 일정 등록
	// 데이터 등록 순서 board + plan -> info + attachment -> path 등록 + plan의 infoNo alter로 추가하기
	// 생성된 boardNo로 게시물 조회하고 해당 plan안에 있는 infoNo로 일정에 들어있는 장소들 조회
	// 이미 등록된 info는 제외하고 등록예정이라 등록 순서 중요함
	@PostMapping("insert.sc")
	public void insertSc(@RequestParam(value="path") String[] path,
						 Plan plan, HttpSession session, ModelAndView mv) throws ParseException {
		// 1.  데이터 등록전 가공처
		// 데일리 일정 경로별 데이터 조회
		ArrayList<Info> infoList = new ArrayList<>(); // 검색한 데이터 담을 리스트 선언 (Info 등록)
		String[][] pathArr = new String[path.length][]; // 전달받은 값 담을 이차배열 선언 (path 등록)
		System.out.println(plan.getEndDate());
		// 전달받은 path 가공해 selenium으로 데이터 찾아오기
		for(int i=0; i<path.length; i++) {
			String[] str = path[i].split(","); //구분자로 구분해서 배열에 넣기
			pathArr[i] = new String[str.length]; // 이차배열 길이 설정
			for(int j=0; j<str.length; j++) {
				pathArr[i][j] = str[j]; 
			}
			Info in = infoDataGet(pathArr[i]);
			if(in!= null) { // 이미 기존에 등록된 정보가 없을때만 리스트에 담기
				infoList.add(in);
			}
		}
		
		// 지역코드 조회할 주소 하나 추출해서 plan객체에 담기
		plan.setAddress(infoList.get(0).getInfoAddress());
		
		// plan 현재날짜와 비교해서 완료된 일정인지 체크
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String date = format.format(currentTime);
		Date endDate = format.parse(plan.getEndDate()); // 입력받은 일정 마지막 날짜
		Date todate = format.parse(date);
		int compare = endDate.compareTo(todate); // 현재시간과 일정 마지막 날짜 비교
		if(compare>0) { // 비교한 값이 0보다 크면 아직 일정 진행중
			plan.setComplete("N");
		} else {
			plan.setComplete("Y");
		}
		// 2. board+ plan 등록
		int result = scService.insertSchedule(plan);
		
		// 3. 가져온 장소 정보안에 img url 추출 (이미지 다운)후 등록
		// imgsrc 리스트에 담기(infoList의 boardContent ||구분자로 [0] -> 이 안에 url |구분자로 들어있음
		for(int i=0; i<infoList.size(); i++) {
			ArrayList<String> imgURL = new ArrayList<>();
			String[] str = infoList.get(i).getBoardContent().split("||");
			String[] url = str[0].split("|"); // info 하나의 url들
			for(int j=0; j<url.length; j++) {
				imgURL.add(url[j]);
			}
			ArrayList<Attachment> atList = AttractionController.imgTool(session, imgURL);
			
			// 4. info와 해당하는 img등록
			result *= scService.insertInfoAttach(infoList.get(i), atList);
		}
		// 5. path 등록하면서 plan에 infoNo 추가해주기
		result *= scService.insertPath(pathArr, plan.getBoardTitle());
	}
	// path는 글제목으로 조회해서 boardNo 넣고 infoName으로 조회해서 infoNo 넣기
	
	
}

package com.kh.finalProject.board.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.finalProject.board.model.service.ScheduleService;
import com.kh.finalProject.board.model.vo.Board;
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

	// 
	public Info infoDataGet(String[] pathArr) {
		Info info = null;
		// 매개변수로 전달받은 배열에서 사용할 값 추출
		String infoName = pathArr[0];
		
		String[] infoAddress = pathArr[3].split(" ");
		String zone = infoAddress[0] + " " + infoAddress[1]; // 주소에서 지역명 추출
		int result = scService.checkInfo(infoName);
		if (result == 0) { // 기존에 등록된 정보가 아니면 데이터 조회
			info = new Selenium().searchData(infoName, infoAddress[0]);
		}
		return info;
	}

	// 일정 등록
	// 데이터 등록 순서 board + plan -> info + attachment -> path 등록 + plan의 infoNo alter로
	// 추가하기
	// 생성된 boardNo로 게시물 조회하고 해당 plan안에 있는 infoNo로 일정에 들어있는 장소들 조회
	// 이미 등록된 info는 제외하고 등록예정이라 등록 순서 중요함
	@PostMapping("insert.sc")
	public ModelAndView insertSc(@RequestParam(value = "path") ArrayList<String[]> path, Plan plan, HttpSession session,
			ModelAndView mv) throws ParseException {
		// 1. 데이터 등록전 가공처리
		// 데일리 일정 경로별 데이터 조회
		ArrayList<Info> infoList = new ArrayList<>(); // 검색한 데이터 담을 리스트 선언 (Info 등록)
		// 전달받은 path 가공해 selenium으로 데이터 찾아오기
		for (int i = 0; i < path.size(); i++) { // 주소 추출해서 조회
			System.out.println("조회시작 : "+Arrays.toString(path.get(i)));
			Info in = infoDataGet(path.get(i)); // 기존정보가 있는지를 확인하고 조회해옴
			System.out.println(in);
			if (in != null) { // 이미 기존에 등록된 정보가 없을때만 등록할 info 리스트에 담기
				infoList.add(in);
			}
		}
		// plan 현재날짜와 비교해서 완료된 일정인지 체크
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date currentTime = new Date();
		String date = format.format(currentTime);
		Date endDate = format.parse(plan.getEndDate()); // 입력받은 일정 마지막 날짜
		Date todate = format.parse(date);
		int compare = endDate.compareTo(todate); // 현재시간과 일정 마지막 날짜 비교
		if (compare > 0) { // 비교한 값이 0보다 크면 아직 일정 완료 안됨
			plan.setComplete("N");
		} else {
			plan.setComplete("Y");
		}
		System.out.println(plan);
		// 서비스로 한번에 보내서 트랜잭션처리하면 등록후 조회해서 사용하는 값들을 꺼낼 수 없기에 따로 메소드 만들어서 진행
		// 2. plan board 등록
		int result = scService.insertSchedule(session, plan, path);
		Board b = scService.checkBno(plan);
		plan.setBoardNo(b.getBoardNo());
		// 3. attachment, info 등록
		if(!infoList.isEmpty()) {
			result *= scService.insertInfoFile(session, plan, path, infoList);
		}
		// 경로 등록
		result *= scService.insertPath(path, plan);
		if (result != 0) { // 모든 데이터 등록 성공
			session.setAttribute("alertMsg", "일정 등록 성공");
			if (plan.getTogether() == 0) { // 동행구한다고 했으니 작성하기 연결
				mv.setViewName("redirect:schedule.bo");
			} else { // 동행 안구함
				mv.setViewName("redirect:togetherEnroll.bo");
			}
		} else { // 등록 실패
			mv.addObject("errorMsg", "일정 등록 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	// path는 글제목으로 조회해서 boardNo 넣고 infoName으로 조회해서 infoNo 넣기
	// 이미지 url 제거하는 작업이랑 url 구분이 안되니 이미지가 안들어감 지역코드 조회하는거 다시 해보기

	// 디테일뷰 조회
	@GetMapping("detail.sc")
	public String detailview(int boardNo, Model model) {
		int count = scService.increaseCount(boardNo);
		HashMap<String, Object> dataMap = scService.selectSchedule(boardNo);
		model.addAttribute("dataMap", dataMap);
		System.out.println(dataMap.get("pList"));
		return "board/schedule/detailPage";
	}

	// 일정 삭제
	// board, plan, path만 삭제 나머지는 다른페이지에서도 사용하니 삭제 안함
	@GetMapping("delete.sc")
	public ModelAndView deleteAttr(Plan plan, ModelAndView mv, HttpSession session) {
		int result = scService.deleteSchedule(plan);
		if (result > 0) {
			session.setAttribute("alertMsg", "게시물 삭제 성공");
			mv.setViewName("redirect:list.bo");
		} else {
			mv.addObject("errorMsg", "게시물 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	

}

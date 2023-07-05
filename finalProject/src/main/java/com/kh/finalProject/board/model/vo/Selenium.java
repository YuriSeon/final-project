package com.kh.finalProject.board.model.vo;

import java.time.Duration;
import java.util.List;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

import com.kh.finalProject.board.controller.AttractionController;
import com.kh.finalProject.board.model.service.AttractionService;



public class Selenium {
	
	private WebDriver wd;
	private static String WEB_DRIVER_ID = "webdriver.chrome.driver"; // Properties 설정(정해져있는 키값)
	private static String WEB_DRIVER_PATH = (Selenium.class.getResource("/").getPath()).replace("target/classes/", "src/main/webapp/WEB-INF/lib/chromedriver");
	
	// chrome driver연결
	private void chrome() {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH); // 시스템에 아이디와 경로 세팅
		
		// webDriver 옵션 설정.
		ChromeOptions options = new ChromeOptions();
		
//		options.setHeadless(true); // 브라우저를 띄우지 않겠다고 설정
		options.addArguments("--disable-gpu"); //headless로 실행 가능하도록 설정
		options.addArguments("--lang=ko"); // 언어설정
		options.addArguments("--no-sandbox"); // 보안 설정 해제
		options.addArguments("Content-Type=application/json; charset=utf-8");
		options.setCapability("ignoreProtectedModeSettings", true); // protectedMode 설정 무시하고 실행 설정
		
		//wd = new ChromeDriver(options); // 설정한 option으로  webDriver생성
		wd = new ChromeDriver();
		wd.manage().timeouts().implicitlyWait(Duration.ofMillis(5000));//페이지로드가 완료 될 때까지 기다리는 시간 설정
	}
	
	// 정보 검색해오는 메소드
	public Info searchData(String infoName, String zone) {
		chrome(); // 실행
		Info in = new Info(); // 조회한 정보 담을 객체
		try {
			// webDriver와 검색할 url 연결(검색어 입력)
			wd.get("https://conlab.visitkorea.or.kr/conlab/search-result?mainKeyword="+zone+ " " +infoName +"&mainSearchType=Formal&searchPage=1&searchLang=%ED%95%9C%EA%B5%AD%EC%96%B4");
			// 검색결과창에서 첫번째 나오는 게시물 선택
			WebElement searchResult = wd.findElement(By.xpath("//*[@id=\"full-width-tabpanel-Formal\"]/div/div/div/div[2]/div/div[2]/div[1]")); 
			searchResult.click();
			// 게시물내의 info data key, value형태로 저장시키기
			List<WebElement> culomnList = (wd.findElements(By.className("label"))); // info table에 저장할 컬럼명
			List<WebElement> valueList = (wd.findElements(By.className("cont-txt"))); // 컬럼명에 일치하는 value값
			// 이미지 가져오기 
			List<WebElement> imgEl = wd.findElements(By.className("related-img-button"));
			String imgPath = "";
			for(int i=0; i<imgEl.size(); i++) {
				imgPath += imgEl.get(i).getAttribute("src"); // 이미지 경로 변수에 담기
				if(i != imgEl.size()-1) {
					imgPath += "|"; // String타입에 담아서 전달하기위해서 구분자 넣음
				}
			}
			for (int i = 0; i < culomnList.size(); i++) {
				String culomn = culomnList.get(i).getText();
				String value = valueList.get(i).getText();
				switch (culomn) { // culomn에 맞는 value값으로 set
				case "주소": in.setInfoAddress(value); break;
				case "이용시간": 
					if(value.contains(":")) {	
						String str[] = value.split(":");
						if(str[2].contains(" ,/")){
							str[2]= str[2].split(" /,")[0];
							in.setInfoTime(str[0]+":"+str[1]+":"+str[2]); break;
						}
					}else if(value.contains("/,")) { // 데이터 크기에 맞춰서 조정
						in.setInfoTime(value.split("/,")[0]); break;
					} else {
						in.setInfoTime(value);break;
					}
				case "휴무일": in.setDayOff(value); break;
				case "홈페이지": in.setInfoHomepage(value); break;
				case "전화번호": in.setInfoCall(value); break;
				case "주차장": 
					if(value.contains("가능")) {
						in.setParking("Y"); break;
					} else {
						in.setParking("N"); break;
					}
				case "개요": 
					if(imgPath!="") {
						in.setBoardContent(imgPath+"||"+value); break;
					} else {
						in.setBoardContent(value); break;
					}
				case "카테고리" : 
					if(value.contains("음식")) {
						in.setInfoType(2);
					} else if(value.contains("관광")||value.contains("숙박")) {
						in.setInfoType(1);
					} else {
						in.setInfoType(3);
					}
				}
			}
			in.setInfoName(infoName);
		} catch (Exception e) {
			e.printStackTrace();
			in.setBoardContent("오류"); // 오류 확인하기 위해 임의로 값 넣음
			return in;
		} finally {
			quitDriver();
		}
		return in;
	}
	
	// 새탭의 타이틀을 이용해서 창 전환하는 메소드
	private void handleWindows(String windowTitle) {
        Set<String> windows = wd.getWindowHandles();

        for (String window : windows) {
            wd.switchTo().window(window);
            if (wd.getTitle().contains(windowTitle)) {
                return;
            }
        }
	}
	
	// 종료
	public void quitDriver() {
		if(wd != null) {
			wd.close();
			wd.quit(); //close 하면 webDriver만 종료, quit으로 browser까지 종료
		}
	}
}

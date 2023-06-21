package com.kh.finalProject.board.model.vo;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Selenium {
	
	private WebDriver wd;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver"; // Properties 설정(정해져있는 키값)
	public static String WEB_DRIVER_PATH = "/WEB-INF/lib/chromedriver.exe";  // 프로젝트내 경로로 작성
	
	// 기본생성자
	public Selenium() {
		chrome(); // 현재 class내에 있는 method연결해서 객체생성될 때 실행되도록 설정 
	}
	
	// chrome driver연결
	private void chrome() {
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH); // 시스템에 아이디와 경로 세팅
		
		// webDriver 옵션 설정.
		ChromeOptions options = new ChromeOptions();
		
		options.setHeadless(true); // 브라우저를 띄우지 않겠다고 설정
		options.addArguments("--disable-gpu"); //headless로 실행 가능하도록 설정
		options.addArguments("--lang=ko"); // 언어설정
		options.addArguments("--no-sandbox"); // 보안 설정 해제
		options.addArguments("--disable-dev-shm-usage"); // /deb/shm 디렉토리를 사용하지 않는다 (이 디렉토리는 공유 메모리를 담당하는 부분)
		options.setCapability("ignoreProtectedModeSettings", true); // protectedMode 설정 무시하고 실행 설정
		
		wd = new ChromeDriver(options); // 설정한 option으로  webDriver생성
		wd.manage().timeouts().pageLoadTimeout(100, TimeUnit.SECONDS); //페이지로드가 완료 될 때까지 기다리는 시간 설정
	}
	
	// info data 등록
	public void infoDataGet(String[] pathArr) {
		for(int i=0; i<pathArr.length; i++) {
			System.out.println(pathArr[i]);
		}
		// 매개변수로 전달받은 배열에서 사용할 값 추출
		String infoName = pathArr[0];
		String infoAddress = pathArr[3];
		// webDriver와 검색할 url 연결
		wd.get("https://conlab.visitkorea.or.kr/conlab/search-result?mainKeyword=&mainSearchType=All");
		
		// 요소 추출
		WebElement inputClass = wd.findElement(By.className("MuiAutocomplete-root MuiAutocomplete-hasClearIcon")); // search input tag 들어있는 클래스명 추출
		WebElement input = inputClass.findElement(By.tagName("input")); // input 요소 선택
		WebElement button = wd.findElement(By.className(".MuiButtonBase-root MuiButton-root MuiButton-text btn-init fill icon search")); // 검색어 입력 후 전송할 버튼
		
		// 검색어 입력 후 상세페이지로 이동
		input.sendKeys(infoName); // 매개변수로 전달받은 검색어 input창에 입력
		button.click(); 
		WebElement searchResult = wd.findElement(By.className("card-style-wrap")); // 검색결과창에서 첫번째 나오는 게시물 선택
		searchResult.click();
		
		// 게시물내의 info data key, value형태로 저장시키기
		List<WebElement> infoDiv = wd.findElements(By.className("label-has-wrap")); // info div요소 배열로 선택
		Info info = null; // 배열에서 꺼내온 값 담을 객체 
		for(int i=0; i<infoDiv.size(); i++) {
			String culomn = (infoDiv.get(i).findElement(By.className("label"))).getText(); // info table에 저장할 컬럼명
			String value = (infoDiv.get(i).findElement(By.className("cont-text"))).getText(); // 컬럼명에 일치하는 value값
			switch(culomn) { // culomn에 맞는 value값으로 set
				case "주소" : 
//					if(value==infoAddress) {
						info.setInfoAddress(value); break;
//					} else {
						
//					}
				case "이용시간" : info.setInfoTime(value); break;
				case "휴무일" : info.setDayOff(value); break;
				case "홈페이지" : info.setInfoHomepage(value); break;
				case "전화번호" : info.setInfoCall(value); break;
				case "주차장" : info.setParking(value); break;
			}
		}
		System.out.println(info);
//		// 이미지 가져오기 
//		WebElement imgEl = wd.findElement(By.xpath("//*[@id='full-width-tabpanel-Formal']/div/div/div/div[2]/div/div[2]/div[1]/div[1]//img[1]")); // 사진 전체 영역에서 첫번째 이미지요소 선택(xpath//img[1])
//		String imgPath = imgEl.getAttribute("src"); // 이미지 경로 변수에 담음
//		String[] strArr = imgPath.split("/"); // 경로 '/' 구분자로 배열에 넣음
//		String originName = strArr[strArr.length]; // 파일이름 추출
//		// 파일명 랜덤으로 바꿔주기위한 작업
//		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); 
//		int ranNum = (int)(Math.random()*90000+10000); // 5자리 랜덤값
//		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자명 추출
//		String changeName = currentTime+ranNum+ext; 
//		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		
	}
	
	// 종료
	public void quitDriver() {
		wd.quit(); //close 하면 webDriver만 종료, quit으로 browser까지 종료
	}
}

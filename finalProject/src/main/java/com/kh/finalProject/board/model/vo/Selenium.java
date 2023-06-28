package com.kh.finalProject.board.model.vo;

import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.StringSelection;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


public class Selenium {
	
	private WebDriver wd;
	// 상대경로로 수정해서 변수처리 (강사님께 여쭤보기)
	private static String TEST = (Selenium.class.getResource("/").getPath()).replace("target/classes/", "src/main/webapp/WEB-INF/lib/chromedriver");
	private static String WEB_DRIVER_ID = "webdriver.chrome.driver"; // Properties 설정(정해져있는 키값)
	private static String WEB_DRIVER_PATH = TEST;  
	
	
	// 기본생성자
	public Selenium() {
		chrome(); // 현재 class내에 있는 method연결해서 객체생성될 때 실행되도록 설정 
	}
	
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
		
		wd = new ChromeDriver(options); // 설정한 option으로  webDriver생성
		wd.manage().timeouts().pageLoadTimeout(50000, TimeUnit.SECONDS); //페이지로드가 완료 될 때까지 기다리는 시간 설정
	}
	
	// info data 등록
	public void infoDataGet(String[] pathArr) {
		// 매개변수로 전달받은 배열에서 사용할 값 추출
		String infoName = pathArr[0];
		String infoAddress = pathArr[3];
		// webDriver와 검색할 url 연결
		wd.get("https://conlab.visitkorea.or.kr/conlab/search-result?mainKeyword=&mainSearchType=All");
		
		// 요소 추출
		WebElement input = wd.findElement(By.xpath("//*[@id=\\\"mui-10523\\\"]")); // search input tag 들어있는 클래스명 추출
		WebElement button = wd.findElement(By.className(".MuiButtonBase-root MuiButton-root MuiButton-text btn-init fill icon search")); // 검색어 입력 후 전송할 버튼
		
		// 검색어 입력 후 상세페이지로 이동
		input.sendKeys(infoName); // 매개변수로 전달받은 검색어 input창에 입력
		StringSelection data = new StringSelection("검색할값넣기");
		Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
		clipboard.setContents(data, data);
		Actions act = new Actions(wd);
		Action paste = act.keyDown(input, Keys.COMMAND).sendKeys(input, "v").keyUp(input, Keys.COMMAND).build();
		paste.perform();
		button.click(); 
		WebElement searchResult = wd.findElement(By.className("card-style-wrap")); // 검색결과창에서 첫번째 나오는 게시물 선택
		searchResult.click();
		// 새창전환
	//	ArrayList<String> tabs = new ArrayList<String>(wd.getWindowHandles());
	//	wd.switchTo().window(tabs.get(1));
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
		
		quitDriver();
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
		if(wd != null) {
			wd.close();
			wd.quit(); //close 하면 webDriver만 종료, quit으로 browser까지 종료
		}
	}

	// attraction insert시 사용할 메소드
	public Info infoDataGet(Info in) {
		// 매개변수로 전달받은 장소 이름, 주소, 지역명
		String infoName = in.getInfoName();
		String infoAddress = in.getInfoAddress();
		String zone = infoAddress.split(" ")[0]; // 주소에서 지역명 추출
		// 검색해서 추출한 값 담을 객체
		Info info = new Info();
		// 해당 값 추출할때까지 기다릴 시간 설정
		WebDriverWait wait = new WebDriverWait(wd, 20000); 
		
		try {
			// webDriver와 검색할 url 연결(검색어 입력)
			wd.get("https://conlab.visitkorea.or.kr/conlab/search-result?mainKeyword="+zone+ " " +infoName +"&mainSearchType=Formal&searchPage=1&searchLang=%ED%95%9C%EA%B5%AD%EC%96%B4");
			
			// 요소 추출할 xpath
			String img = "//*[@id=\"full-width-tabpanel-Formal\"]/div/div/div/div[2]/div/div[2]/div[1]/div[1]/a/img";
			
			// 이미지 가져오기 
			WebElement imgEl = wd.findElement(By.xpath(img));
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath(img)));
			String imgPath = imgEl.getAttribute("src"); // 이미지 경로 변수에 담음
			System.out.println(imgPath);
			
			// 검색결과창에서 첫번째 나오는 게시물 선택
			WebElement searchResult = wd.findElement(By.className("card-style-wrap")); 
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("card-style-wrap")));
			searchResult.click();
			wd.manage().timeouts().pageLoadTimeout(50000, TimeUnit.SECONDS);
			System.out.println("여기까지는 되는거니?");
			// 게시물내의 info data key, value형태로 저장시키기
//			List<WebElement> infoDiv = wd.findElements(By.className("label-has-wrap")); // info div요소 배열로 선택
//			wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("label-has-wrap")));
			List<WebElement> culomnList = (wd.findElements(By.className("label"))); // info table에 저장할 컬럼명
			List<WebElement> valueList = (wd.findElements(By.className("cont-text"))); // 컬럼명에 일치하는 value값
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("label")));
			wait.until(ExpectedConditions.visibilityOfElementLocated(By.className("cont-text")));
			System.out.println(culomnList);
			System.out.println(valueList);
			for (int i = 0; i < culomnList.size(); i++) {
				String culomn = culomnList.get(i).getText();
				String value = valueList.get(i).getText();
				switch (culomn) { // culomn에 맞는 value값으로 set
					case "주소": info.setInfoAddress(value); break;
					case "이용시간": info.setInfoTime(value); break;
					case "휴무일": info.setDayOff(value); break;
					case "홈페이지": info.setInfoHomepage(value); break;
					case "전화번호": info.setInfoCall(value); break;
					case "주차장": info.setParking(value); break;
					case "개요": info.setBoardContent(imgPath+"||"+value); break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류로 인해 크롤링실패");
			
		} finally {
				quitDriver();
		}
		System.out.println(info);

		
		return info;
		
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
}

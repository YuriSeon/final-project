package com.kh.finalProject.board.model.vo;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Component;

@Component
public class Selenium {
	
	private WebDriver wd;
	public static String WEB_DRIVER_ID = "webdriver.chrome.driver"; // Properties 설정(정해져있는 키값)
	public static String WEB_DRIVER_PATH = "/dev/Selenium/chromedriver.exe"; 
	// WebDriver경로(지금은 나의 노트북의 경로로 설정 추후 프로젝트 내로 변경 가능하면 이동시키기)
	
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
		options.addArguments("--no-sandbox");
		options.addArguments("--disable-dev-shm-usage"); // /deb/shm 디렉토리를 사용하지 않는다 (이 디렉토리는 공유 메모리를 담당하는 부분)
		options.setCapability("ignoreProtectedModeSettings", true); // protectedMode 설정 무시하고 실행 설정
		
		wd = new ChromeDriver(options); // 설정한 option으로  webDriver생성
		wd.manage().timeouts().pageLoadTimeout(20, TimeUnit.SECONDS); //페이지로드가 완료 될 때까지 기다리는 시간 설정
	}
	
	// driver 사용
	public void useDriver(String url) {
		wd.get(url); // webDriver와 url 연결
		
		WebElement name = wd.findElement(By.id("나중에 찾아올 태그의 아이디값 작성"));
		
	}
	
	// 사용한 driver process까지 종료
	public void quitDriver() {
		wd.quit(); 
	}
}

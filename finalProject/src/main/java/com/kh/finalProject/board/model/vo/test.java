package com.kh.finalProject.board.model.vo;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class test { 
	// 필요한 기능 테스트 해보려고 만든 클래스 
	// java application으로 실행해서 테스트 해볼거라 main 넣음

	public static void main(String[] args) {
		
		WebDriver wb = new ChromeDriver();
		
		try {
			wb.get("http://www.naver.com");
			System.out.println("실행");
			
		} finally {
			wb.quit();
		}
		
	}

}

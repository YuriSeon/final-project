package com.kh.finalProject.board.model.vo;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		WebDriver wb = new ChromeDriver();
		
		try {
			wb.get("https://www.naver.com");
		} finally {
			wb.quit();
		}
		
	}

}

package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class KeywordAPI {
	
	private int totalCount; // 전체 결과 수 
	private String addr1; // 주소
	private int sigungucode; // 시군구코드
	private int contenttypeid; // 관광타입(관광지, 숙박등) ID
	private String createdtime; // 등록일
	private String firstimage2; // 대표이미지(썸네일) (약 150*100 size)
	private double mapx; // GPS X좌표
	private double mapy; // GPS Y좌표
	private int mlevel; // Map Level
	private String tel; // 전화번호
	private String title; // 제목
}

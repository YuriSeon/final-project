package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Board {
//	BOARD_NO	NUMBER
//	ZONE_NO	NUMBER
//	INFO_NO	NUMBER
//  BOARD_WRITER VARCHAR2(30)
//	CATEGORY	NUMBER
//	BOARD_TITLE	VARCHAR2(60 BYTE)
//	BOARD_CONTENT	VARCHAR2(4000 BYTE)
//	CREATE_DATE	DATE
//	MODIFY_DATE	DATE
//	GOOD	NUMBER
//	REPORT	NUMBER
//	COUNT	NUMBER
//	STATUS	VARCHAR2(1 BYTE)
	
	private int boardNo;
	private int zoneNo;
	private int infoNo;
	private String boardWriter;
	private int category;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String modifyDate;
	private int good;
	private int choice;
	private int report;
	private int count;
	private String status;
	private String address; // 쿼리문 쓸 때 ZONE_NO 서브쿼리로 검색하기 위한 한글 주소 저장용 
	private String changeName;//	CHANGE_NAME
	private String filePath;//
	private String profileImg; // 프로필이미지 경로+바뀐이름
	
	private Info info; //join시 사용할 객체 참조변수
	private Festival festival;
	private Attachment attachment;
	private Zone zone;
	private Theme theme;
	
	private int totalViewCount; //관리자 조회수 비교
}	

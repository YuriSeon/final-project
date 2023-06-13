package com.kh.finalProject.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
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
	private int report;
	private int count;
	private String status;
	private String address; // 쿼리문 쓸 때 ZONE_NO 서브쿼리로 검색하기 위한 한글 주소 저장용 
	private String changeName;//	CHANGE_NAME
	private String filePath;//
	
}	

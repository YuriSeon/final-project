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
//	USER_NO	NUMBER
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
	private int userNo;
	private int category;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private int good;
	private int report;
	private int count;
	private String status;
	
	
}	

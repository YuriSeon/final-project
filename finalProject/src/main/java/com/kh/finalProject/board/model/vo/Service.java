package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Service {
	
	private int serviceNo;			//	SERVICE_NO	NUMBER
	private int category;			//	CATEGORY	NUMBER
	private String serviceTitle;	//	SERVICE_TITLE	VARCHAR2(80 BYTE)
	private String serviceContent;	//	SERVICE_CONTENT	VARCHAR2(4000 BYTE)
	private String answerStatus;	//	ANSWER_STATUS	VARCHAR2(1 BYTE)
	private int count;				//	COUNT	NUMBER
	private String createDate;		//	CREATE_DATE	DATE
	private String status;			//	STATUS	VARCHAR2(1 BYTE)
	private String writer;			//	WRITER	VARCHAR2(30 BYTE)
	
}

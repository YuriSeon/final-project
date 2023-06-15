package com.kh.finalProject.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	
	private int serviceNo;			//	SERVICE_NO	NUMBER
	private String writer;			//	WRITER	VARCHAR2(30 BYTE)
	private int category;			//	CATEGORY	NUMBER
	private String serviceTitle;	//	SERVICE_TITLE	VARCHAR2(80 BYTE)
	private String serviceContent;	//	SERVICE_CONTENT	VARCHAR2(200 BYTE)
	private String answerStatus;	//	ANSWER_STATUS	VARCHAR2(1 BYTE)
	private int count;				//	COUNT	NUMBER
	private String createDate;		//	CREATE_DATE	DATE
	private String status;			//	STATUS	VARCHAR2(1 BYTE)
	
}	

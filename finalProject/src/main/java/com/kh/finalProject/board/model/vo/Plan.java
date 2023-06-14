package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@NoArgsConstructor
@SuperBuilder
public class Plan extends Board{
//	BOARD_NO	NUMBER
//	INFO_NO	NUMBER // 지역이름 또는 장소이름으로 보여줘야할거같아서 String으로 쓸게요
//	USER_NO	NUMBER // 회원번호말고 회원아이디로 출력할거라서 String writer로 써놓을게요
//	TOGETHER	NUMBER
//	TOGETHER_COUNT	NUMBER
//	CONCEPT	VARCHAR2(50 BYTE)
//	START_DATE	DATE
//	END_DATE	DATE
//	STAY	VARCHAR2(1 BYTE)
//	TRANSPORT	NUMBER
//	TOTAL_DATE	NUMBER
//	TOTAL_PAY	NUMBER
//	COMPLETE	VARCHAR2(1 BYTE)
	
	private int boardNo;
	private String infoName;
	private String writer;
	private int together;
	private int togetherCount;
	private String concept;
	private String startDate;
	private String endDate;
	private String stay;
	private int transport;
	private int totalDate;
	private int totalPay;
	private String complete;
	
}

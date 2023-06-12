package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Info {
//	INFO_NO	NUMBER
//	BOARD_NO	NUMBER
//	ZONE_NO	NUMBER
//	INFO_ADDRESS	VARCHAR2(100 BYTE)
//	INFO_TIME	VARCHAR2(50 BYTE)
//	INFO_MONEY	NUMBER
//	INFO_HOMEPAGE	VARCHAR2(500 BYTE)
//	INFO_CALL	VARCHAR2(30 BYTE)
//	PARKING	VARCHAR2(1 BYTE)
//	INFO_NAME	VARCHAR2(50 BYTE)
//	INFO_TYPE	NUMBER
	
	private int infoNo;
	private int boardNo;
	private int zoneNo;
	private String infoAddress;
	private String infoTime;
	private int infoMoney;
	private String infoHompage;
	private String infoCall;
	private String parking;
	private String infoName;
	private int infoType;
}

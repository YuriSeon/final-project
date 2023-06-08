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
	
	private int infoNo; //INFO_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int zoneNo; //ZONE_NO	NUMBER
	private String infoAddress; //INFO_ADDRESS	VARCHAR2(100 BYTE)
	private String infoTime; //INFO_TIME	VARCHAR2(50 BYTE)
	private int infoMoney; // INFO_MONEY	NUMBER
	private String infoHomepage; //INFO_HOMEPAGE	VARCHAR2(500 BYTE)
	private String infoCall; //INFO_CALL	VARCHAR2(30 BYTE)
	private String parking; //PARKING	VARCHAR2(1 BYTE)
	private String infoName; //INFO_NAME	VARCHAR2(50 BYTE)
	private int infoType; //INFO_TYPE	NUMBER

}

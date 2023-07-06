package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Festival {
	
	private int boardNo;		//	BOARD_NO	NUMBER
	private int zoneNo;			//	ZONE_NO	NUMBER
	private int infoNo;			//	INFO_NO	NUMBER
	private String startDate;	//	START_DATE	DATE
	private String endDate;		//	END_DATE	DATE
	private int fesCategory;	//	FES_CATEGORY	NUMBER
	private String fesMoney;	//이용 요금
	private String boardTitle;
	private String filePath;
	
}

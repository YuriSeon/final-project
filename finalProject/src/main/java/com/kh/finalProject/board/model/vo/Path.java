package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Path {
//	BOARD_NO	NUMBER
//	INFO_NO	NUMBER
//	DAILY	NUMBER
//	PATH_NO	NUMBER
//	PAY	NUMBER
	
	private int boardNo;
	private int infoNo;
	private int daily;
	private int pathNo;
	private int pay;
}

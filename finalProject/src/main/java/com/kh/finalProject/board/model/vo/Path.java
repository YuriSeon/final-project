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
//	INFO_NO	NUMBER // no보단 String으로 보여줄 일이 있어서 필드 String으로 생성함
//	DAILY	NUMBER
//	PATH_NO	NUMBER
//	PAY	NUMBER
	
	private int boardNo;
	private String infoName;
	private int daily;
	private int pathNo;
	private int pay;
}

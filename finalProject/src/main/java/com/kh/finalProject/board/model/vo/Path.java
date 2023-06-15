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
public class Path extends Plan{
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

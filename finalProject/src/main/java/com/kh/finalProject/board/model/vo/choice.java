package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class choice {
	
	private int boardNo;	//	BOARD_NO	NUMBER

	private String writer;	//	WRITER

}

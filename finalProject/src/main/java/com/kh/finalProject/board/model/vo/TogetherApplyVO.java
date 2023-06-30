package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TogetherApplyVO {
	
	private int refBno; //REF_BNO	NUMBER
	private String nickname; //NICKNAME	VARCHAR2(30 BYTE)
	private String message; //MESSAGE	VARCHAR2(210 BYTE)
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private String applyDate; //APPLY_DATE	DATE

}

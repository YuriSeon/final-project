package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class TogetherVO {

	private int boardNo;
	private String zoneName;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private String filePath;
	private int together;
	private int togetherCount;
	private String concept;
	private String startDate;
	private String endDate;
	private int totalDate;
	private int totalPay;
	private String profilePath;
	private String createDate;
	private String survey;
	private int certification;
	
}

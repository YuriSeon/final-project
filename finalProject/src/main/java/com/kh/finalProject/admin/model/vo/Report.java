
package com.kh.finalProject.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Report {
	private int reportNo;
	private int boardNo; 			//	BOARD_NO	NUMBER
	private int replyNo; 			//	REPLY_NO	NUMBER
	private String writer;			//	WRITER	VARCHAR2(30 BYTE)
	private String reportReason;	//	REPORT_REASON	VARCHAR2(100 BYTE)
	private String createDate; 		//	CREATE_DATE	DATE
    private int rereplyNo;             //	REREPLY_NO
	private String boardWriter;
	private int boardReport;
	private String replyWriter;
	private int replyReport;

	private String rereplyWriter;
	private int rereplyReport;
	

}

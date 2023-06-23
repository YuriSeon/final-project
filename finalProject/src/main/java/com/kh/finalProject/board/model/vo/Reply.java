package com.kh.finalProject.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Reply {
//	REPLY_NO	NUMBER
//	CONTENT	VARCHAR2(200 BYTE)
//	CREATE_DATE	DATE
//	REPLY_WRITER	NUMBER // 작성자로 보여줘야하니 필드부 String으로 할게요
//	REF_QNO	NUMBER
//	REF_RNO	NUMBER
//	STATUS	VARCHAR2(1 BYTE)
	
	private int replyNo;
	private String content;
	private String createDate;
	private String replyWriter;
	private int refQno;
	private int refRno;
	private String status;
}

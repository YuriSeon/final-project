package com.kh.finalProject.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Rereply {
private int refRno;//	REF_RNO
private String content;//	CONTENT
private String createDate;//	CREATE_DATE
private String replyWriter;//	REPLY_WRITER
private int refQno;//	REF_QNO
private int replyNo;//	REPLY_NO
private String status;//	STATUS
private String profileImg; // 프로필이미지 경로+바뀐이름
}

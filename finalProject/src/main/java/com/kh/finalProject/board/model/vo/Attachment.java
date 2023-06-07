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
public class Attachment {

private int fileNo;//	FILE_NO
private int boardNo;//	BOARD_NO
private String originName;//	ORIGIN_NAME
private String changeName;//	CHANGE_NAME
private String filePath;//	FILE_PATH
private Date uploadDate;//	UPLOAD_DATE
private int fileLevel;//	FILE_LEVEL
private String status;//	STATUS
}

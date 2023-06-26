package com.kh.finalProject.board.model.vo;

import java.sql.Date;
import java.util.List;

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
	private String writer;//	WRITER
	private String originName;//	ORIGIN_NAME
	private String changeName;//	CHANGE_NAME
	private String filePath;//	FILE_PATH
	private Date uploadDate;//	UPLOAD_DATE
	private int fileLevel;//	FILE_LEVEL
	private String status;//	STATUS

	private List<Attachment> aList;

	public List<Attachment> getBoardVoList() {
		return aList;
	}
	public void setBoardVoList(List<Attachment> aList) {
		this.aList = aList;
	}

}

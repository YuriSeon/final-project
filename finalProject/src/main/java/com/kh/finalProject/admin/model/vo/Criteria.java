package com.kh.finalProject.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Criteria {
	
	private Integer pageLimit;
	private Integer boardLimit;
	private Integer currentPage;
	
	private String keyword;
	private String type;
	private String[] typeArr;
	
	public Criteria(Integer pageLimit, Integer boardLimit) {
		this.pageLimit = pageLimit;
		this.boardLimit = boardLimit;
	}
	
	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}
}

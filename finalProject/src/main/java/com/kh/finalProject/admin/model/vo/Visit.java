package com.kh.finalProject.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Visit {
	private int visitNo; 
	private String visitIp; 
	private String visitTime;
	private String visitor;
	
}

package com.kh.finalProject.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {

	private int userNo;			//	USER_NO	NUMBER
	private String userId;		//	USER_ID	VARCHAR2(30 BYTE)
	private String nickname;	//	NICKNAME	VARCHAR2(30 BYTE)
	private String userPwd;		//	USER_PWD	VARCHAR2(100 BYTE)
	private String userName;	//	USER_NAME	VARCHAR2(20 BYTE)
	private String gender;		//	GENDER	VARCHAR2(1 BYTE)
	private int age;			//	AGE	NUMBER
	private String email;		//	EMAIL	VARCHAR2(30 BYTE)
	private String phone;		//	PHONE	VARCHAR2(12 BYTE)
	private String MBTI;		//	MBTI	VARCHAR2(4 BYTE)	-> 회원가입때 받은 MBTI
	private String survey;		//	SURVEY	VARCHAR2(4 BYTE)	-> 설문지 결과 MBTI
	private String style;		//	STYLE	VARCHAR2(100 BYTE)	-> 여행 스타일
	private int report;			//	REPORT	NUMBER				-> 신고 누적 횟수
	private int warning;		//	WARNING	NUMBER				-> 경고횟수
	private String enrollDate;	//	ENROLL_DATE	DATE
	private int certification;	//	CERTIFICATION	NUMBER		-> 인증여부
	private String status;		//	STATUS	VARCHAR2(1 BYTE)
	private String profileImg; // 프로필이미지 경로+바뀐이름
}

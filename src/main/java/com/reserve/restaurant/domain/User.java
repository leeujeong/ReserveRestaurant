package com.reserve.restaurant.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class User {

	private Long userNo;
	private String id;
	private String pw;
	private String userName;
	private String userTel;
	private String userGrade;
	private Date userDate;
	private String userHbd;
	private int state;
	private int point;
	private String userEmail;
	
}

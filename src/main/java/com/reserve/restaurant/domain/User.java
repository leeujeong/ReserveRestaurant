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

	private Long user_no;
	private String id;
	private String pw;
	private String user_name;
	private String user_tel;
	private String user_grade;
	private Date user_date;
	private String user_hbd;
	private int state;
	private int point;
	private String user_email;
	
}

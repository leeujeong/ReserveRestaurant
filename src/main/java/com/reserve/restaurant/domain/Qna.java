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
public class Qna {

	private Long qNo;
	private String witer;
	private String title;
	private String content;
	private Long hit;
	private Date qDate;
	private Date lastModified;
	private int state;
}

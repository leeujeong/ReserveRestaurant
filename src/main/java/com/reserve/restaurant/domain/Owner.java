package com.reserve.restaurant.domain;

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

public class Owner {

	private Long oNo;
	private String oName;
	private String oId;
	private String oEmail;
	private String oPw;
	private int state;
}
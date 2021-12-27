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

	private Long ownerNo;
	private String id;
	private String pw;
	private String email;
	private String tel;
	private String name;
	private Long state;
	
	
	private Restaurant restaurant;
	
	
	
}
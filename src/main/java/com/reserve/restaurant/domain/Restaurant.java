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

public class Restaurant {

	public Long resNo;
	public String resName;
	public String address;
	public String addressDetail;
	public String openTime;
	public String closeTime;
	public String tel;
	public String content;
	public String origin;
	public String resOption;
	public String saved;
	public String path;
	public Long owneroNo;
}

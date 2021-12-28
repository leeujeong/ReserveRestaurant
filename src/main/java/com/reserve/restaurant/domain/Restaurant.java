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
	public String resAddress;
	public String resAddressDetail;
	public String resOpenTime;
	public String resCloseTime;
	public String resTel;
	public String resContent;
	public String resOrigin;
	public String resOption;
	public String resSaved;
	public String resPath;
	public Long ownerNo;
}

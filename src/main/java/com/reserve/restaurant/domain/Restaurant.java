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
	public String resLoc;
	public String resLocDetail;
	public String resOpenTime;
	public String resCloseTime;
	public String resTel;
	public String resContent;
	public String origin;
	public String res_addtional_option;
	public String saved;
	public String path;
	public Long ownerONo;
}

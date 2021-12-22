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

public class Restaurant {

	public Long resNo;
	public String resName;
	public String resLoc;
	public String resHours;
	public String resTel;
	public Date resDate;
	public String origin;
	public String saved;
	public String path;
	public Long ownerONo;
}
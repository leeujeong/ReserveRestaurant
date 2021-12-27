package com.reserve.restaurant.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder

public class Menu {

	private Long menuNo;
	private String menu;
	private Long price;
	private Long discount;
	private String expiryDate;
	private Long restaurantResNo;
	
}
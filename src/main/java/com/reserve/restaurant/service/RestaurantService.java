package com.reserve.restaurant.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Restaurant;

public interface RestaurantService {

	public List<Restaurant> selectMyRestaurantList();
	public Restaurant selectRestaurantByNo(Long resNo);
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public int removeRestaurant(Long resNo);
	
}

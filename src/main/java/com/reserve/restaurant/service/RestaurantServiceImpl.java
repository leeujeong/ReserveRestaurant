package com.reserve.restaurant.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Restaurant;

public class RestaurantServiceImpl implements RestaurantService {

	@Override
	public List<Restaurant> selectMyRestaurantList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant selectRestaurantByNo(Long resNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public int removeRestaurant(Long resNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}

package com.reserve.restaurant.repository;

import java.util.List;

import com.reserve.restaurant.domain.Restaurant;

public interface RestaurantRepository {

	public List<Restaurant> selectMyRestaurantList();
	public Restaurant selectRestaurantByNo(Long resNo);
	public int addRestaurant(Restaurant restaurant);
	public int modifyRestaurant(Restaurant restaurant);
	public int removeRestaurant(Long resNo);
}

package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import com.reserve.restaurant.domain.Restaurant;

public interface RestaurantRepository {

	public int selectTotalCount(String id);
	public List<Restaurant> selectMyRestaurantList(Map<String, Object> map);
	public Restaurant selectRestaurantByNo(Long resNo);
	public int addRestaurant(Restaurant restaurant);
	public int modifyRestaurant(Restaurant restaurant);
	public int removeRestaurant(Long resNo);
}

package com.reserve.restaurant.repository;

import com.reserve.restaurant.domain.User;

public interface UserRepository {
	
	public User login(User user);
	
}

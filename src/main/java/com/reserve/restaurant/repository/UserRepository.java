package com.reserve.restaurant.repository;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.User;

@Repository
public interface UserRepository {
	
	public User login(User user);
	
}

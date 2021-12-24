package com.reserve.restaurant.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository {

	public List<String> selectAllUser();
	
	
	
}

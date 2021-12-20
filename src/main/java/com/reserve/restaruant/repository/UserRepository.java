package com.reserve.restaruant.repository;

import org.springframework.stereotype.Repository;

import com.reserve.restaruant.domain.User;

@Repository
public interface UserRepository {

	public User selectMemberById(String id);
	public int updatePw(User user);
	public int updateUser(User user);
	
}

package com.reserve.restaurant.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.reserve.restaurant.domain.User;

public interface UserService {

	
	public Map<String, Object> idCheck(String id);
	public Map<String, Object> findUserByEmail(String email);
	public Map<String, Object> sendAuthCode(String email);
	public void insertUser(User user,HttpServletResponse response);
	
}

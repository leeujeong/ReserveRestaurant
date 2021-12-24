package com.reserve.restaurant.service;

<<<<<<< HEAD
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.reserve.restaurant.domain.User;
=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git

public interface UserService {

<<<<<<< HEAD
	
	public Map<String, Object> idCheck(String id);
	public Map<String, Object> findUserByEmail(String email);
	public Map<String, Object> sendAuthCode(String email);
	public void insertUser(User user,HttpServletResponse response);
=======
	public void login(HttpServletRequest request);
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
	
}

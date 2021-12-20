package com.reserve.restaruant.service;

import javax.servlet.http.HttpSession;

import com.reserve.restaruant.domain.User;

public interface UserService {

	public void updatePw(User user);
	public void updateUser(User user , HttpSession session);
}

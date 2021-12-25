package com.reserve.restaurant.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.reserve.restaurant.domain.Owner;


public interface OwnerService {

	public Map<String, Object> idCheck(String oId);
	public Map<String, Object> findOwnerByEmail(String oEmail);
	public void join(Owner owner);
	public void login(HttpServletRequest request);
	public void updatePw(Owner owner);
	public void updateOwner(Owner owner, HttpSession session);
//	public Map<String, Object> presentPwCheck(HttpServletRequest request);
	public void leave(Long oNo, HttpSession session);
}

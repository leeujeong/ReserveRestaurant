package com.reserve.restaurant.service;

import javax.servlet.http.HttpServletRequest;


public interface OwnerService {

//	public Map<String, Object> idCheck(String oId);
//	public Map<String, Object> findOwnerByEmail(String oEmail);
	public void join(HttpServletRequest request);
	public void loginOwner(HttpServletRequest request);
//	public void updatePw(Owner owner);
//	public void updateOwner(Owner owner, HttpSession session);
//	public Map<String, Object> presentPwCheck(HttpServletRequest request);
//	public void leave(Long owner_no, HttpSession session);

}

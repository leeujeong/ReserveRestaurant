package com.reserve.restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Restaurant;

public interface AdminService {

	public void findAllUser(Model model	);  
	public void findAllOwner(Model model);
	public void	findUser(Model model);
	public void findOwner(Model model);
	public void selectUserInfo(Model model);
	public void selectOwnerInfoRes(Model model);
	public void selectResList(HttpServletRequest request, Model model);
	public void selectResDetail(Model model, Restaurant restaurant);




}

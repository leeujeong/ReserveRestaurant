package com.reserve.restaurant.service;

import org.springframework.ui.Model;

public interface AdminService {

	public void findAllUser(Model model);  
	public void findAllOwner(Model model);
	public void	findUser(Model model);
	public void findOwner(Model model);
	public void selectUserInfo(Model model);
	public void selectOwnerInfoRes(Model model);




}

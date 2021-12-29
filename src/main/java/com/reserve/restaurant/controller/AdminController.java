package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.service.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
	
	@Autowired
	AdminService service;
	
	@GetMapping(value="adminPage") 
	public String adminPage() {
		return "admin/main";
	}
	
	@GetMapping(value="userAdminPage")
	public String userAdminPage() {
		return "admin/adminUser";
	}
	
	@GetMapping(value="findAllUser")
	public String allFindUser(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service.findAllUser(model);
		return "admin/adminUser";
	}
	
	@GetMapping(value="findAllOwner")
	public String allFindOwner(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service.findAllOwner(model);
		return "admin/adminUser";
	}
	
	@GetMapping(value="findUser")
	public String findUser(HttpServletRequest request, Model model) {		
		String type = request.getParameter("radio");
		if (type.contains("user")) {
			model.addAttribute("request", request);
			service.findUser(model);
			return "admin/adminUser";
		} else if (type.contains("owner")) {
			model.addAttribute("request", request);
			service.findOwner(model);
			return "admin/adminUser";
		}
		return "admin/adminUser";
	}
	
	@GetMapping(value="userDetailPage")
	public String userDetailPage(Long userNo, Model model) {
		model.addAttribute("userNo", userNo);
		service.selectUserInfo(model);
		return "admin/userDetailPage";
	}
	
	
	@GetMapping(value="ownerDetailPage")
	public String ownerDetailPage(Long ownerNo, Model model) {
		model.addAttribute("ownerNo", ownerNo);
		service.selectOwnerInfoRes(model);
		return "admin/ownerDetailPage";
	}
	
	// 검색 페이지로 이동
	@GetMapping(value="searchPage")
	public String searchPage() {
		return "admin/searchPage";
	}
	
	// 검색 AND 페이징
	@GetMapping(value="searchRestaurant")
	public String searchRestaurant(HttpServletRequest request, Model model, HttpServletResponse response) {
		service.selectResList(request, model,response);
		return "admin/searchPage";
	}
	
	// 검색된리스트에서 restaurant detail로 이동
	@GetMapping(value="goResDetail")
	public String goResDetail(Model model, Restaurant restaurant) {
		service.selectResDetail(model, restaurant);
		return "user/detail";
	}
	
	
}

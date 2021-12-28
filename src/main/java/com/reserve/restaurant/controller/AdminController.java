package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println("controller에서 ownerNo : " + ownerNo);
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
	public String searchRestaurant(HttpServletRequest request, Model model) {
		System.out.println("전달받은 query : " + request.getParameter("query"));
		service.selectResList(request, model);
		return "admin/searchPage";
	}
	
	// 검색된리스트에서 restaurant detail로 이동
	@GetMapping(value="goResDetail")
	public String goResDetail(@RequestParam(value="resNo") Long resNo) {
		service.selectResDetail(resNo);
		return "";
	}
	
	
}

package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		System.out.println("타입:" + request.getParameter("radio"));
		System.out.println("칼럼:" + request.getParameter("column"));
		System.out.println("쿼리:" + request.getParameter("query"));
		
		String type = request.getParameter("radio");
		
		if (type.contains("user")) {
			System.out.println("service user로");
			model.addAttribute("request", request);
			service.findUser(model);
			return "admin/adminUser";
		} else if (type.contains("owner")) {
			System.out.println("service owner로");
			model.addAttribute("request", request);
			service.findOwner(model);
			return "admin/adminUser";
		}
		return "admin/adminUser";
	}
	
	@GetMapping(value="userDetailPage")
	public String detailPage(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service.selectUserInfo(model);
		return "admin/userDetailPage";
	}
	
	
	
	
	
	
}

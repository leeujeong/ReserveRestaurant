
package com.reserve.restaurant.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	
	

	//하나만 선택
	@GetMapping(value="owner/selectList")
	public String selectList(@RequestParam("resNo")Long resNo, Model model) {
		
		model.addAttribute("restaurant", restaurantService.selectList(resNo));
		model.addAttribute("menu_list", restaurantService.selectMenu(resNo));
		
		
		return "owner/detail";
	}
	
	//등록 form
	@PostMapping(value="owner/addRestaurant")
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		restaurantService.addRestaurant(multipartRequest, response);
	}	
	
	//관리 페이지로 이동
	@GetMapping(value="owner/managePage")
	public String managePage(HttpServletRequest request, Model model) throws IOException {
		
		HttpSession session = request.getSession();
		Owner owner = (Owner) session.getAttribute("loginUser");

		model.addAttribute("oid", owner.getId());
		model.addAttribute("request", request);
		
		restaurantService.selectMyRestaurantList(model);
		
		return "owner/list";
	}

	//삭제
	@PostMapping(value="owner/deleteRestaurant")
	public void deleteRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		restaurantService.deleteRestaurant(multipartRequest, response);
	}
	//수정
	@PostMapping(value="owner/modifyRestaurant")
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		restaurantService.modifyRestaurant(multipartRequest, response);
	}
	
//	//메뉴 불러오기
//	@GetMapping(value="owner/selectMenu")
//	public String selectMenu(Long resNo, Model model){
//		restaurantService.selectMenu(resNo);
//		return "owner/detail";
//	}
	
}

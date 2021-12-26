
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.service.RestaurantService;

@Controller
public class RestaurantController {

	@Autowired
	private RestaurantService restaurantService;
	
	//등록 form
	@PostMapping(value="owner/addRestaurant")
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
//		
		String resName = multipartRequest.getParameter("s_name");
//		String resTel = multipartRequest.getParameter("tel");
//		String resLoc = multipartRequest.getParameter("address");
//		String resContent = multipartRequest.getParameter("content");
//		String open_time =  multipartRequest.getParameter("open_time");
//		String close_time = multipartRequest.getParameter("close_time");
//		String content = multipartRequest.getParameter("content");
//		String[] res_addtional_option = multipartRequest.getParameterValues("additional_option");
//		System.out.println("전번 : " + resTel);
//		System.out.println("위치 : " + resLoc);
//		System.out.println("설명 : " + resContent);
//		System.out.println("여시긴 : " + open_time);
//		System.out.println("닫시긴 : " + close_time);
//		System.out.println("내용 : " + content);
//		for (int i = 0; i < res_addtional_option.length; i++) {
//			System.out.println("추가옵션" + res_addtional_option[i]);
//		}
//		String[] menus = multipartRequest.getParameterValues("menu");
//		for (int i = 0; i < menus.length; i++) {
//			System.out.println("메뉴 : " + menus[i]);
//		}
//		String[] prices = multipartRequest.getParameterValues("price");
//		for (int i = 0; i < menus.length; i++) {
//			System.out.println("가격 : " + prices[i]);
//		}
		System.out.println("식당이름 : " + resName);
		
		restaurantService.addRestaurant(multipartRequest, response);
	}	
	
	@GetMapping(value="owner/managePage")
	public String manageRestaurant(HttpServletRequest request, Model model) throws IOException {
		
		HttpSession session = request.getSession();
//		String oId = (String)session.getAttribute("oId");
//		String oId1 = "d";
//		
//		model.addAttribute(oId1, oId1);
		
		model.addAttribute("request", request);
//		model.addAttribute("list", restaurantService.selectMyRestaurantList(model));
		
		
		
		restaurantService.selectMyRestaurantList(model);
		return "owner/list";
		
	}
	
	
}

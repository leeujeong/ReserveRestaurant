
package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
//		String resName = multipartRequest.getParameter("resName");
//		String resTel = multipartRequest.getParameter("tel");
//		String resLoc = multipartRequest.getParameter("address");
//		String resContent = multipartRequest.getParameter("content");
//		String open_time =  multipartRequest.getParameter("open_time");
//		String close_time = multipartRequest.getParameter("close_time");
//		String[] res_addtional_option = multipartRequest.getParameterValues("additional_option");
//		System.out.println("전번" + resTel);
//		System.out.println("위치" + resLoc);
//		System.out.println("설명" + resContent);
//		System.out.println("여시긴" + open_time);
//		System.out.println("닫시긴" + close_time);
//		for (int i = 0; i < res_addtional_option.length; i++) {
//			System.out.println("추가옵션" + res_addtional_option[i]);
//		}
		restaurantService.addRestaurant(multipartRequest, response);
	}	
	
}

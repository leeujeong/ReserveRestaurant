package com.reserve.restaurant.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Restaurant;

public interface RestaurantService {

	public List<Restaurant> selectMyRestaurantList();
	public Restaurant selectRestaurantByNo(Long resNo);
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public Map<String, Object> removeRestaurant(Long resNo);
	
	//message method
	public default void message(int result, HttpServletResponse response, 
			String success, String fail, String path) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.println("<script>");
				out.println("alert('" + success + "')");
				out.println("location.href='" + path + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('" + fail + "')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
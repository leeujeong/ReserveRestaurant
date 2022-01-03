package com.reserve.restaurant.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ReviewService {

	public void reviewList(Model model);
	public void insertReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response);
	public void moreReview(Model mode);
	//	public int avgReviewRate(Long resNo);
//	public int totalReview(Long resNo);
	
	
	
	
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

package com.reserve.restaurant.service;

<<<<<<< HEAD
import javax.servlet.http.HttpServletRequest;
=======
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git

import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Book;

public interface BookService {
	
<<<<<<< HEAD
	public int insertBook(Book book);
	public void bookList( Model model);
=======
	public Map<String, Object> booking(Book book, HttpServletRequest request);
	public void selectBookingList(Long userNo, Model model);
	public void selectBookingDetail(Long resNo, Model model);
	public void bookingCancel(Long bookNo, HttpServletResponse response);
	public void FindCancelList(Model model);
	
	
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
	
	
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
}

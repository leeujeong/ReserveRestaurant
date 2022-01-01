package com.reserve.restaurant.controller;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
=======
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
<<<<<<< HEAD
=======
import org.springframework.web.bind.annotation.PathVariable;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.service.BookService;

@Controller

public class BookController {

	@Autowired
	BookService service;
	 
<<<<<<< HEAD
	@PostMapping(value = "insertBook")
	public String insertNotice(Book book ) {
		System.out.println(book);
		service.insertBook(book);
		return "redirect:user/myPage";
=======
	@PostMapping(value = "booking" , produces ="application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> booking (@RequestBody Book book, HttpServletRequest request){
	  return service.booking(book, request);
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
	}


	

	



	
	
	@RequestMapping(value = "selectBookingList", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectBookingList (@RequestParam("userNo") Long userNo, HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		service.selectBookingList(userNo, model);
		return "user/booking"; 
	}
	
	@GetMapping(value = "selectBookingDetail")
	public String selectBookingDetail(@RequestParam("resNo") Long userNo, Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.selectBookingDetail(userNo, model);
		return "user/bookingDetail";
	}
	
	
	
	@GetMapping(value = "bookingCancel")
	public void bookingCancel(@RequestParam("bookNo")Long bookNo, HttpServletResponse response) {
		service.bookingCancel(bookNo, response);
	}
	
	
	
	@GetMapping(value = "findCancelList")
	public String findCancelList(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.FindCancelList(model);
		return "user/bookingCancel";
	}
	
}

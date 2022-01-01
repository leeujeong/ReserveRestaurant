package com.reserve.restaurant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.service.BookService;

@Controller

public class BookController {

	@Autowired
	BookService service;
	 
	@PostMapping(value = "insertBook")
	public String insertNotice(Book book ) {
		System.out.println(book);
		service.insertBook(book);
		return "redirect:user/myPage";
	}


	

	



	
	
	
}

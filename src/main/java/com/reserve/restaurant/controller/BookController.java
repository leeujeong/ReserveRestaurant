package com.reserve.restaurant.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.service.BookService;

@Controller
@RequestMapping("book/*")
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

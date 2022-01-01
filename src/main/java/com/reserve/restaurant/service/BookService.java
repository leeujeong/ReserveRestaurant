package com.reserve.restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Book;

public interface BookService {
	
	public int insertBook(Book book);
	public void bookList( Model model);
}

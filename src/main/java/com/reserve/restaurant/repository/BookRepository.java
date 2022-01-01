package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import com.reserve.restaurant.domain.Book;

public interface BookRepository {
		
	public int insertBook(Book book);
	public List<Book> bookList(Map<String, Object> map);
}

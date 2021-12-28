package com.reserve.restaurant.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Book;

public class BookServiceImpl implements BookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBook(Book book) {
		return 0;
	
		
	}
	
}

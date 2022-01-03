package com.reserve.restaurant.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.reserve.restaurant.service.BookService;
import com.reserve.restaurant.service.BookServiceImpl;
import com.reserve.restaurant.service.NoticeService;
import com.reserve.restaurant.service.NoticeServiceImpl;
import com.reserve.restaurant.service.ReplyService;
import com.reserve.restaurant.service.ReplyServiceImpl;
import com.reserve.restaurant.service.UserService;
import com.reserve.restaurant.service.UserServiceImpl;

@Configuration
public class UserConfig {

	@Bean
	public UserService userService() {
		return new UserServiceImpl();
	}
	
	@Bean
	public BookService bookService() {
		return new BookServiceImpl();
	}
	
	@Bean
	public NoticeService noticeService() {
		return new NoticeServiceImpl();
	}
	
	@Bean
	public ReplyService replyService() {
		return new ReplyServiceImpl();
	}
	
}

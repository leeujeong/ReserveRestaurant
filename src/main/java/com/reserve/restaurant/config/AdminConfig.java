package com.reserve.restaurant.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.reserve.restaurant.service.AdminService;
import com.reserve.restaurant.service.AdminServiceImpl;

@Configuration
public class AdminConfig {

	@Bean
	public AdminService service() {
		return new AdminServiceImpl();
	}
}

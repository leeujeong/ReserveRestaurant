package com.reserve.restaurant.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.reserve.restaurant.service.OwnerService;
import com.reserve.restaurant.service.OwnerServiceImpl;

@Configuration
public class OwnerConfig {

	@Bean
	public OwnerService oservice() {
		return new OwnerServiceImpl();
	}
}
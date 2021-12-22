package com.reserve.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("owner/*")
public class OwnerController {

	@GetMapping(value="addstore")
	public String addstore() {
		return "owner/addstore";
	}
	
	@GetMapping(value="cancle")
	public String cancle() {
		return "owner/cancle";
	}
}

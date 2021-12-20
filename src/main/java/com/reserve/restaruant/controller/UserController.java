package com.reserve.restaruant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@GetMapping(value="myPage")
	public String myPage() {
		return "user/myPage";
	}
	@GetMapping(value="ingReserve")
	public String ingReserve() {
		return null;
	}
}


package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.restaurant.service.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@GetMapping(value="myPage")
	public String myPage() {
		return "/user/myPage";
	}

	@GetMapping(value="loginPage")
	public String loginPage() {
		return "user/login";
	}

	@PostMapping(value="login")
	public String login(HttpServletRequest request) {
		userService.login(request);
		return "redirect:/";
	}


}

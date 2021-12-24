package com.reserve.restaurant.controller;

<<<<<<< HEAD
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
=======
import javax.servlet.http.HttpServletRequest;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.service.UserService;

import com.reserve.restaurant.service.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
	
	@Autowired
	UserService service;

	@Autowired
	private UserService userService;
	
	
	@GetMapping(value="myPage")
	public String myPage() {
		return "/user/myPage";
	}
<<<<<<< HEAD
	
	@GetMapping(value="updateUser")
	public String updateUser() {
		return "/user/updateUser";
	}
	@GetMapping(value="join")
	public String join() {
		return "/user/join";
	}
	
	@PostMapping(value="idCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam("id") String id) {
			return service.idCheck(id);
	}
	
	
	@PostMapping(value= "emailCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> findUserByEmail(@RequestParam("user_email") String email) {
		return service.findUserByEmail(email);
	
	}
	
	@PostMapping(value = "sendAuthCode" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendAuthCode(@RequestParam("user_email") String email) {
		return service.sendAuthCode(email);
	}
	
	
	@PostMapping(value = "insertUser")
	public void insertUser(User user , HttpServletResponse response) {
		service.insertUser(user, response);
		
	
		
	}
=======

	@GetMapping(value="loginPage")
	public String loginPage() {
		return "user/login";
	}

	@PostMapping(value="login")
	public String login(HttpServletRequest request) {
		userService.login(request);
		return "redirect:/";
	}


>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
}

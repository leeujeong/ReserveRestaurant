package com.reserve.restaurant.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.restaurant.domain.User;
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
			return userService.idCheck(id);
	}
	
	
	@PostMapping(value= "emailCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> findUserByEmail(@RequestParam("userEmail") String email) {
		return userService.findUserByEmail(email);
	
	}
	
	@PostMapping(value = "sendAuthCode" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendAuthCode(@RequestParam("userEmail") String email) {
		return userService.sendAuthCode(email);
	}
	
	
	@PostMapping(value = "insertUser")
	public void insertUser(User user , HttpServletResponse response) {
		userService.insertUser(user, response);
		
	}
	
 //윤건씨가 작업하던 부분
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

package com.reserve.restaurant.controller;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	UserService service;

	@Autowired
	private UserService userService;
	
	
	@GetMapping(value = "search")
	public String search() {
		return"/user/search";
	}
	
	// 마이페이지
	@GetMapping(value="myPage")
	public String myPage() {
		return "/user/myPage";
		
	}
	
	@GetMapping(value="selectUserByNo")
	public String selectUserByNo(@RequestParam("userNo") Long userNo , Model model ) {
		model.addAttribute("userInfo", service.selectUserByNo(userNo));
		
		return "/user/updateUser";
	}
	// 예약페이지
	@GetMapping(value="reserve")
	public String reserve() {
		return "/user/reserve";
	}

	// 회원가입페이지
	@GetMapping(value="join")
	public String join() {
		return "/user/join";
	}
	// 로그인페이지
	@GetMapping(value="loginPage")
	public String loginPage() {
		return "user/login";
	}
	
	//아이디 중복체크
	@PostMapping(value="idCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> idCheck(@RequestParam("id") String id) {
			return service.idCheck(id);
	}
	
	//이메일 중복체크
	@PostMapping(value= "emailCheck" , produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> findUserByEmail(@RequestParam("email") String email) {
		return service.findUserByEmail(email);
	
	}
	//인증번호전송
	@PostMapping(value = "sendAuthCode" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendAuthCode(@RequestParam("email") String email) {
		return service.sendAuthCode(email);
	}
	
	// 회원등록
	@PostMapping(value = "insertUser")
	public void insertUser(User user , HttpServletResponse response) {
		service.insertUser(user, response);
	}
	// 로그인
	@PostMapping(value="login")
	public String login(HttpServletRequest request) {
		userService.login(request);
		return "redirect:/";
	}
	// 로그아웃
	@GetMapping(value="logout")
	public String logout(HttpSession session) {
		if (session.getAttribute("loginUser") != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	@GetMapping(value="updateUser")
	public String updateUser() {
		return "/user/updateUser";
	}

}

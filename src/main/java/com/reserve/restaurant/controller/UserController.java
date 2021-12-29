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
	private UserService userService;
	
	//검색페이지
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
		model.addAttribute("userInfo", userService.selectUserByNo(userNo));
		
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
			return userService.idCheck(id);
	}
	
	//이메일 중복체크
	@PostMapping(value= {"emailCheck", "findId"} , produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> findUserByEmail(@RequestParam("email") String email) {
		return userService.findUserByEmail(email);
	
	}
	//인증번호전송
	@PostMapping(value = "sendAuthCode" , produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> sendAuthCode(@RequestParam("email") String email) {
		return userService.sendAuthCode(email);
	}
	
	
	// 회원등록
	@PostMapping(value = "insertUser")
	public void insertUser(User user , HttpServletResponse response) {
		userService.insertUser(user, response);
	}

	@PostMapping(value="login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		userService.login(request,response);
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
	// 업데이트페이지 이동
	@GetMapping(value="updateUser")
	public String updateUser() {
		return "/user/updateUser";
	}
	
	//현재 비밀번호 체크
	@PostMapping(value="presentPwCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
		return userService.presentPwCheck(request);
	}
	
	//사용자 비밀번호 변경하기
	@PostMapping(value="updatePw")
	public void updatePw(User user, HttpServletResponse response) {
		userService.updatePw(user,response);
		
	}
	
	//사용자 탈퇴하기
	@PostMapping(value="leave")
	public void leave(@RequestParam("userNo") Long userNo , HttpServletResponse response ,HttpSession session) {
		userService.deleteUser(userNo, response, session);
		
	}
	
	//사용자 정보 수정
	@PostMapping(value="updateUser")
	public String updateUser(User user, HttpSession session) {
		userService.updateUser(user, session);
		return "redirect:/user/updateUser";
	}
	
	//아이디 찾기 페이지
	@GetMapping(value = "findIdPage")
	public String findIdPage() {
		return"/user/findId";
	}
	//비밀번호 찾기 페이지
	@GetMapping(value = "findPwPage")
	public String findPwPage() {
		return"/user/findPw";
	}
	
	
	@GetMapping(value = "detail")
	public String detail() {
		return "/user/detail";
	}
	
}

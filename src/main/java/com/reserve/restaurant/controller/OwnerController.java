
package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.restaurant.service.OwnerService;
import com.reserve.restaurant.service.QnaService;

@Controller
@RequestMapping("owner/*")
public class OwnerController {

	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private QnaService qnaService;
	
	//등록페이지
	@GetMapping(value="addPage")
	public String addPage() {
		return "owner/addstore";
	}
	
	//개인정보 수정 페이지
	@GetMapping(value="modifyPage")
	public String modifyPage() {
		return "owner/info";
	}
	
	//수정 페이지
	@GetMapping(value="detail")
	public String updatePage() {
		return "owner/detail";
	}
	
	//문의페이지
	@GetMapping(value="questionPage")
	public String questionPage(Model model) {
		int state = 1;
		model.addAttribute("list", qnaService.selectQnaList1());
		model.addAttribute("state",state);
		return "owner/question";
	}
	
	//리뷰관리 페이지
	@GetMapping(value="reviewPage")
	public String reviewPage() {
		return "owner/review";
	}

	//로그인페이지
	@PostMapping(value="login")
	public String loginOwner(HttpServletRequest request) {
		ownerService.loginOwner(request);
		return "redirect:/";
	}	
	//회원가입
	@PostMapping(value="insertOwner")
	public String insertOwner(HttpServletRequest request) {
		ownerService.join(request);
		return "redirect:/";
	}
	//로그아웃
	@GetMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}

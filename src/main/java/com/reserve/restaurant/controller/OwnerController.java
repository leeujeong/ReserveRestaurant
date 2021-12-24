
package com.reserve.restaurant.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.reserve.restaurant.service.OwnerService;

@Controller
@RequestMapping("owner/*")
public class OwnerController {

	
	@Autowired
	private OwnerService ownerService;
	
	//등록페이지
	@GetMapping(value="addPage")
	public String addPage() {
		return "owner/addstore";
	}
	
	      
	//관리페이지
	@GetMapping(value="managePage")
	public String managePage() {
		return "owner/list";
	}
	//수정 페이지
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
	public String questionPage() {
		return "owner/question";
	}
	//리뷰관리 페이지
	@GetMapping(value="reviewPage")
	public String reviewPage() {
		return "owner/review";
	}

	//로그인페이지로 이동
	@GetMapping(value="login")
	public String login() {
		return "owner/login";
	}
	

//	//아이디체크
//	@PostMapping(value="idCheck", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public Map<String, Object> idCheck(@RequestBody("oId") String oId){
//		return service.idCheck(oId);
//	}
//	//이메일체크
//	@PostMapping(value="emailCheck", produces="application/json; charset=UTF-8")
//	public Map<String, Object> emailCheck(@RequestBody("oEmail") String oEmail){
//		return service.findOwnerByEmail(oEmail);
//	}
//	
//	//업데이트
//	@PostMapping(value="updateOwner")
//	public String updateOwner(Owner owner, HttpSession session) {
//		oservice.updateOwner(owner, session);
//		return "redirect:/";
//	}
	
	//현재 비밀번호
//	@PostMapping(value="presentPwCheck", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
//		return service.presentPwCheck(request);
//	}
	
	
}

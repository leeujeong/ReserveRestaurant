
package com.reserve.restaurant.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.service.BookService;
import com.reserve.restaurant.service.OwnerService;
import com.reserve.restaurant.service.QnaService;
import com.reserve.restaurant.service.ReviewService;

@Controller
@RequestMapping("owner/*")
public class OwnerController {

	
	@Autowired
	private OwnerService ownerService;
	
	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private BookService bookService;
	
	@Autowired
	private ReviewService reviewService;
	
	//등록페이지
	@GetMapping(value="addPage")
	public String addPage() {
		return "owner/addstore";
	}
	
	
	//예약관리 페이지
	@GetMapping(value="bookPage")
	public String bookPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		Owner owner = (Owner) session.getAttribute("loginUser");
		
		model.addAttribute("ownerNo", owner.getOwnerNo());
		model.addAttribute("request", request);
		
		bookService.bookList(model);
		
		return "owner/book";
	}
	
	
//	@GetMapping(value="selectOwnerByNo")
//	public String selectOwnerByNo(Long ownerNo, Model model ) {
//		model.addAttribute("ownerInfo",ownerService.selectOwnerByNo(ownerNo));
//		return "owner/updateOwner";
//	}
	
	//사용자 정보 수정
	@GetMapping(value="modifyOwner")
	public String updateOwner(@RequestParam("ownerNo")Long ownerNo, Model model) {
		model.addAttribute("loginUser", ownerService.selectOwnerByNo(ownerNo));
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
//	@GetMapping(value="reviewPage")
//	public String reviewPage(HttpServletRequest request, Model model) {
//		
//		HttpSession session = request.getSession();
//		model.addAttribute("request", request);
//		
//		reviewService.reviewList(model);
//		return "owner/review";
//	}
//	

	 //리뷰관리 페이지
	   @GetMapping(value="reviewPage")
	   public String reviewPage(HttpServletRequest request, Model model) {
	      
	      HttpSession session = request.getSession();
	      model.addAttribute("request", request);
	      
	      reviewService.ownerReviewList(model);
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
	
	//아이디 체크
//	@PostMapping(value="idCheck", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public Map<String, Object> idCheck(@RequestParam("id") String id){
//		return ownerService.idCheck(id);
//	}
	
	//이메일로 아이디 찾기
//	@PostMapping(value={"emailCheck", "findId"}, produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public Map<String, Object>findOwnerByEmail(@RequestParam("email")String email){
//		return ownerService.findOwnerByEmail(email);
//	}
	
	//이메일 전송
//	@PostMapping(value="sendAuthCode", produces="application/json; charset=UTF-8")
//	@ResponseBody
//	public Map<String, Object> sendAuthCode(@RequestParam("email") String email) {
//		return ownerService.sendAuthCode(email);
//	}
	//회원정보 수정
	@PostMapping(value="updateOwner")
	public String updateMember(Owner owner, HttpSession session) {
		ownerService.updateOwner(owner, session);
		return "redirect:/";
	}
	
	//비밀번호 체크
	@PostMapping(value="presentPwCheck", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
		return ownerService.presentPwCheck(request);
	}
	//비밀번호 변경
	@PostMapping(value="updatePw")
	public String updatePw(Owner owner) {
		ownerService.updatePw(owner);
		return "redirect:/";
	}
	//탈퇴
	@PostMapping(value="delete")
	public String leave(@RequestParam("ownerNo") Long ownerNo, HttpSession session) {
		ownerService.deleteOwner(ownerNo, session);
		return "redirect:/";
	}
}
package com.reserve.restaurant.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.reserve.restaurant.domain.Reply;
import com.reserve.restaurant.service.ReplyService;

@Controller
@RequestMapping("reply/*")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	
	// 회원 등록
	@PostMapping(value="addReply", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> addMember(@RequestBody Reply reply, HttpServletResponse response) {
		System.out.println(reply + "콘트롤러");
		
		try {
			return replyService.addReply(reply);
		} catch (DuplicateKeyException e) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				response.setStatus(500);
				response.getWriter().println("중복");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		} catch (DataIntegrityViolationException e) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				response.setStatus(501);
				response.getWriter().println("필수 정보가 누락되었습니다.");
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;  // 동작할 일 없음.
	}

}

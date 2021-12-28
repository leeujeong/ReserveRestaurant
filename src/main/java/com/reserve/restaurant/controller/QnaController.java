package com.reserve.restaurant.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	//공지사항 1(식당 정보 문의)
	@GetMapping(value="owner/selectQnaList1")
	public String selectQnaList1(Model model) {
		int state = 1;
		model.addAttribute("list", qnaService.selectQnaList1());
		model.addAttribute("state",state);
		return "owner/question";
	}
	//공지사항 2(예약문의)
	@GetMapping(value="owner/selectQnaList2")
	public String selectQnaList2(Model model) {
		int state = 2;
		model.addAttribute("list", qnaService.selectQnaList2());
		model.addAttribute("state",state);
		return "owner/question";
	}
	//공지사항 선택
	@GetMapping(value="owner/selectQnaByqnaNo")
	public String selectQnaByNo(@RequestParam("qnaNo") Long qnaNo, Model model) {
		model.addAttribute("qna", qnaService.selectQnaByNo(qnaNo));
		return "qna/detail";
	}
	
	//공지사항 작성 페이지로 이동
	@GetMapping(value="owner/QnaPage")
	public String QnaPage() {
		return "qna/insert";
	}
	
	//공지사항 작성
	@PostMapping(value="insertQna")
	public String insertQna(Qna Qna) {
		qnaService.insertQna(Qna);
		return "owner/question";		// list1, list2 두군데 보내야되는데..?
	}
	
	//공지사항 수정
	@GetMapping(value="updateQna")
	public String updateQna(Qna Qna) {
		qnaService.updateQna(Qna);
		return "redirect:selectQnaByNo?qnaNo=" + Qna.getQnaNo();
	}
	
	//공지사항 삭제
	@GetMapping(value="deleteQna")
	public String deleteQna(@RequestParam("qnaNo") Long qnaNo) {
		qnaService.deleteQna(qnaNo);
		return "owner/question";
	}
	
}

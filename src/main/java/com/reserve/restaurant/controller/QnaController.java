package com.reserve.restaurant.controller;
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
	@GetMapping(value="selectQnaList1")
	public String selectQnaList1(Model model) {
		model.addAttribute("list", qnaService.selectQnaList1());
		return "owner/question";
	}
	//공지사항 2(예약문의)
	@GetMapping(value="selectQnaList2")
	public String selectQnaList2(Model model) {
		model.addAttribute("list", qnaService.selectQnaList2());
		return "owner/question";
	}
	//공지사항 선택
	@GetMapping(value="selectQnaByqNo")
	public String selectQnaByNo(@RequestParam("qNo") Long qNo, Model model) {
		model.addAttribute("Qna", qnaService.selectQnaByNo(qNo));
		return "Qna/detail";
	}
	
	//공지사항 작성 페이지로 이동
	@GetMapping(value="QnaPage")
	public String QnaPage() {
		return "/insert";
	}
	
	//공지사항 작성
	@PostMapping(value="insertQna")
	public String insertQna(Qna Qna) {
		qnaService.insertQna(Qna);
		return "redirect:selectQnaList";		// list1, list2 두군데 보내야되는데..?
	}
	
	//공지사항 수정
	@GetMapping(value="updateQna")
	public String updateQna(Qna Qna) {
		qnaService.updateQna(Qna);
		return "redirect:selectQnaByNo?qNo=" + Qna.getQNo();
	}
	
	//공지사항 삭제
	@GetMapping(value="deleteQna")
	public String deleteQna(@RequestParam("qNo") Long qNo) {
		qnaService.deleteQna(qNo);
		return "redirect:selectQnaList";
	}
	
}

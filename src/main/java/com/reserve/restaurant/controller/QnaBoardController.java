package com.reserve.restaurant.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.service.QnaBoardService;

@Controller
@RequestMapping("qnaboard/*")
public class QnaBoardController {
	
	@Autowired
	private QnaBoardService qnaBoardService;

	@GetMapping(value = "qnalist")
	public String qnalist(Model model) {
		model.addAttribute("list", qnaBoardService.selectQnaBoardList());
		return "qnaboard/qnalist";
	}
	
	@GetMapping(value="insertPage")
	public String insertPage() {
		return "qnaboard/qnainsert";
	}
	
	@PostMapping(value="insertBoardQna")
	public String insertBoardQna(Qna Qna) {
		qnaBoardService.insertBoardQna(Qna);
		return "redirect:qnalist";	
		// return "redirect:selectQnaBoardList";	
	}
	
	@GetMapping(value = "selectQnaBoardByNo")
	public String selectQnaBoardByNo(@RequestParam("qnaNo") Long qnaNo, Model model) {
		// model.addAttribute("map", qnaBoardService.selectQnaBoardByNo(qnaNo));
		qnaBoardService.selectQnaBoardByNo(qnaNo, model);
		return "qnaboard/qnadetail";
	}

	
	@PostMapping(value="updateBoardQna")
	public void updateBoardQna(HttpServletRequest request, HttpServletResponse response) {
		qnaBoardService.updateBoardQna(request, response);
	}
	
	@GetMapping(value="deleteBoardQna")
	public void deleteBoardQna(Long qnaNo, HttpServletResponse response) {
		qnaBoardService.deleteBoardQna(qnaNo, response);
	}
	
	@PostMapping(value="updateQnaPage")
	public String updateQnaPage(Qna qna, Model model) {
		model.addAttribute("qna", qna);
		return "qnaboard/qnaupdate";
	}
	
	@GetMapping(value="qnaReply")
	public String qnaReply(HttpServletRequest request, HttpServletResponse response, Model model) {
		Long qnaNo = Long.parseLong(request.getParameter("qnaNo"));
		qnaBoardService.insertQnaReply(request, response, model);
		return "forward:/qnaboard/selectQnaBoardByNo?qnaNo=" + qnaNo;
	}
	
}

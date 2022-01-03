package com.reserve.restaurant.controller;

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
		model.addAttribute("qnaBoardDetail", qnaBoardService.selectQnaBoardByNo(qnaNo));
		return "qnaboard/qnadetail";
	}
	/* model.addAttribute("qnaBoardDetail", qnaBoardService.selectQnaBoardByNo(qnaNo)); 
	 * model.addAttribute("qnaBoardDetail", qnaBoardService.selectQnaBoardByNo(qnaNo));
	 * */

	
	@PostMapping(value="updateBoardQna")
	public String updateBoardQna(Qna Qna) {
		qnaBoardService.updateBoardQna(Qna);
		return "redirect:selectQnaBoardByNo?qanNo=" + Qna.getQnaNo();
	}
	
	@GetMapping(value="deleteBoardQna")
	public String deleteBoardQna(@RequestParam("qNo") Long qNo) {
		qnaBoardService.deleteBoardQna(qNo);
		return "redirect:selectQnaBoardList";
	}
	
	
	
	
	
}

package com.reserve.restaurant.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String selectQnaBoardByNo(@RequestParam("qnaNo") Long qnaNo, Model model, HttpServletResponse response) {
		qnaBoardService.selectQnaBoardByNo(qnaNo, model, response);
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
	
	@PostMapping(value="qnaReply", produces="application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> qnaReply(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("ajax에서 넘어온 content : " + request.getParameter("content"));
		System.out.println("ajax에서 넘어온 writer : " + request.getParameter("writer"));
		System.out.println("ajax에서 넘어온 qnaNo : " + request.getParameter("qnaNo"));
		try {
			return qnaBoardService.insertQnaReply(request);
		} catch(Exception e) {
			// SQLIntegrityConstraintViolationException
			try {
				System.out.println("여기로 오면 실패");
				response.setContentType("application/json; charset=UTF-8");
				response.setStatus(500);
				response.getWriter().println("Q&A게시글당 답글은 한개만 가능합니다. 기존 답글을 삭제 후 다시 작성해주세요.");
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
	
}

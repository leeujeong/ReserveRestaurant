package com.reserve.restaurant.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.domain.Reply;
import com.reserve.restaurant.repository.QnaBoardRepository;

public class QnaBoardServiceImpl implements QnaBoardService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Qna> selectQnaBoardList() {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.selectQnaBoardList();
	}
	
	@Override
	public void selectQnaBoardByNo(Long qnaNo, Model model) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		Qna qna = repository.selectQnaInfo(qnaNo);
		Reply reply = repository.selectReplyInfo(qnaNo);
		model.addAttribute("qna", qna);
		model.addAttribute("reply", reply);
		// Map<String, Object> map = repository.selectQnaBoardByNo(qnaNo);
		// return map;
	}
	
	@Override
	public int insertBoardQna(Qna Qna) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.insertBoardQna(Qna);
	}
	
	@Override
	public void updateBoardQna(HttpServletRequest request, HttpServletResponse response) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		String qnaTitle = request.getParameter("qnaTitle");
		String qnaContent = request.getParameter("qnaContent");
		Long qnaNo = Long.parseLong(request.getParameter("qnaNo"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qnaTitle", qnaTitle);
		map.put("qnaContent", qnaContent);
		map.put("qnaNo", qnaNo);
		int result = repository.updateBoardQna(map);
		if (result == 1) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('수정 성공')");
				out.println("location.href='/restaurant/qnaboard/qnalist'");
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	}
	
	@Override
	public int updateQnaBoardHit(Qna qanNo) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.updateQnaBoardHit(qanNo);
	}
	
	@Override
	public void deleteBoardQna(Long qanNo, HttpServletResponse response) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		int result = repository.deleteBoardQna(qanNo);
		if (result == 1) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 성공')");
				out.println("location.href='/restaurant/qnaboard/qnalist'");
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@Override
	public void insertQnaReply(HttpServletRequest request, HttpServletResponse response, Model model) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		String content = request.getParameter("content");
		Long qnaNo = Long.parseLong(request.getParameter("qnaNo"));
		String writer = request.getParameter("writer");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		map.put("qnaNo", qnaNo);
		map.put("writer", writer);
		int result = repository.insertQnaReply(map);
		System.out.println("reply 실행결과 : " + result);
		Reply reply = repository.selectQnaReply(qnaNo);
		model.addAttribute("reply", reply);
		/*
		if (result == 1) {
			try {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('답글 성공')");
				out.println("location.href='/restaurant/qnaboard/selectQnaBoardByNo?qnaNo='" + qnaNo);
				out.println("</script>");
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		*/
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
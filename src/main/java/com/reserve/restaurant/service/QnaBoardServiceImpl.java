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
	public void selectQnaBoardByNo(Long qnaNo, Model model, HttpServletResponse response) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		Qna qna = repository.selectQnaInfo(qnaNo);
		Reply reply = repository.selectReplyInfo(qnaNo);
		model.addAttribute("qna", qna);
		model.addAttribute("reply", reply);
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
	public Map<String, Object> insertQnaReply(HttpServletRequest request) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		String content = request.getParameter("content");
		Long qnaNo = Long.parseLong(request.getParameter("qnaNo"));
		String writer = request.getParameter("writer");
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("content", content);
		m.put("qnaNo", qnaNo);
		m.put("writer", writer);
	    int result = repository.insertQnaReply(m);
		Reply reply = repository.selectReplyInfo(qnaNo);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("replyDate", reply.getReplyDate());
		map.put("replyWriter", reply.getReplyWriter());
		map.put("replyContent", reply.getReplyContent());
		System.out.println("reply insert결과 : " + result);
		System.out.println("controller로 return하는 map : " + map.toString());
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
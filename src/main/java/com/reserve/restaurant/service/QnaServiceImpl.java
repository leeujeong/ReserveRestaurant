package com.reserve.restaurant.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.domain.Reply;
import com.reserve.restaurant.repository.QnaRepository;

public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//식당문의
	@Override
	public List<Qna> selectQnaList1() {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.selectQnaList1();
	}
	
	//예약문의
	@Override
	public List<Qna> selectQnaList2() {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.selectQnaList2() ;
	}
	//하나의 문의 선택
	@Override
	public Qna selectQnaByNo(Long qnaNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		
		return repository.selectQnaByNo(qnaNo);
	}
	//문읭 삽입
//	@Override
//	public int insertQna(Qna Qna) {
//		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
//		return repository.insertQna(Qna);
//	}
	//문의 수정
//	@Override
//	public int updateQna(Qna Qna) {
//		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
//		return repository.updateQna(Qna);
//	}
	//문의 삭제
	@Override
	public int deleteQna(Long qnaNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.deleteQna(qnaNo);
	}

	@Override
	public List<Reply> qnaReplyList(Long qnaNo, Model model) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		List<Reply> list = repository.qnaReplyList(qnaNo);
				System.out.println("리스트"+list);
		return list;
	}

	@Override
	public int qnaReplyInsert(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Owner loginUser = (Owner)session.getAttribute("loginUser");
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		Reply reply = new Reply();
		Long qnaNo = Long.parseLong(request.getParameter("qnaNo"));
		String replyContent = request.getParameter("replyContent");
		
		reply.setQnaNo(qnaNo);
		reply.setReplyContent(replyContent);
		reply.setReplyWriter(loginUser.getName());
		
		
		return repository.qnaReplyInsert(reply) ;
	}

	@Override
	public int qnaReplyUpdate (Reply reply){
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.qnaReplyUpdate(reply);
	}

	@Override
	public int qnaReplyDelete (Long replyNo){
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.qnaReplyDelete(replyNo);
	}


}

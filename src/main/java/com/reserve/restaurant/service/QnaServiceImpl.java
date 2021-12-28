package com.reserve.restaurant.service;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.repository.QnaRepository;

public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//식당문의
	@Override
	public List<Qna> selectQnaList1() {
		Qna qna = new Qna();
		
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
	@Override
	public int insertQna(Qna Qna) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.insertQna(Qna);
	}
	//문의 수정
	@Override
	public int updateQna(Qna Qna) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.updateQna(Qna);
	}
	//문의 삭제
	@Override
	public int deleteQna(Long qnaNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.deleteQna(qnaNo);
	}

	
	// 조회수 증가
	@Override
	public int updateQnaHit(Qna qnaNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.updateQnaHit(qnaNo);
	}


}

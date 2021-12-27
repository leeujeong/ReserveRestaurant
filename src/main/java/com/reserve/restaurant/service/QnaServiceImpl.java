package com.reserve.restaurant.service;

import org.mybatis.spring.SqlSessionTemplate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.repository.QnaRepository;

public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<Qna> selectQnaList1() {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.selectQnaList1();
	}

	@Override
	public List<Qna> selectQnaList2() {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.selectQnaList2() ;
	}

	@Override
	public Qna selectQnaByNo(Long qNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.selectQnaByNo(qNo);
	}

	@Override
	public int insertQna(Qna Qna) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.insertQna(Qna);
	}

	@Override
	public int updateQna(Qna Qna) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.updateQna(Qna);
	}

	@Override
	public int deleteQna(Long qNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.deleteQna(qNo);
	}

	
	// 조회수 증가
	@Override
	public int updateQnaHit(Qna qNo) {
		QnaRepository repository = sqlSession.getMapper(QnaRepository.class);
		return repository.updateQnaHit(qNo);
	}


}

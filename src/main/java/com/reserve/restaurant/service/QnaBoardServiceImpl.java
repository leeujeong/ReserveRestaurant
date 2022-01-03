package com.reserve.restaurant.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Qna;
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
	public Qna selectQnaBoardByNo(Long qanNo) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.selectQnaBoardByNo(qanNo);
	
	}
	
	@Override
	public int insertBoardQna(Qna Qna) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.insertBoardQna(Qna);
	}
	
	@Override
	public int updateBoardQna(Qna Qna) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.updateBoardQna(Qna);
	}
	
	@Override
	public int updateQnaBoardHit(Qna qanNo) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.updateQnaBoardHit(qanNo);
	}
	
	@Override
	public int deleteBoardQna(Long qanNo) {
		QnaBoardRepository repository = sqlSession.getMapper(QnaBoardRepository.class);
		return repository.deleteBoardQna(qanNo);
	}
	
}

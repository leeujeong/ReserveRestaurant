package com.reserve.restaurant.service;

import java.util.List;

import com.reserve.restaurant.domain.Qna;

public interface QnaService {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qnaNo);
	public int updateQnaHit(Qna qna);
	public int insertQna(Qna qna);
	public int updateQna(Qna qna);
	public int deleteQna(Long qnaNo);
	
}

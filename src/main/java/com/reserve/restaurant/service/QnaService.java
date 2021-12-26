package com.reserve.restaurant.service;

import java.util.List;

import com.reserve.restaurant.domain.Qna;

public interface QnaService {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qNo);
	public int updateQnaHit(Qna qNo);
	public int insertQna(Qna Qna);
	public int updateQna(Qna Qna);
	public int deleteQna(Long qNo);
	
}

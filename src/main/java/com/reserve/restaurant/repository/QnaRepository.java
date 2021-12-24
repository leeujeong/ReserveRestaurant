package com.reserve.restaurant.repository;

import java.util.List;

import com.reserve.restaurant.domain.Qna;

public interface QnaRepository {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qNo);
	public int insertQna(Qna Qna);
	public int updateQna(Qna Qna);
	public int deleteQna(Long qNo);
}

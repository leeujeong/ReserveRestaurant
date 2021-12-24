package com.reserve.restaurant.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Qna;


@Repository
public interface QnaRepository {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qNo);
	public int insertQna(Qna Qna);
	public int updateQna(Qna Qna);
	public int deleteQna(Long qNo);
}

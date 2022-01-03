package com.reserve.restaurant.service;

import java.util.List;

import com.reserve.restaurant.domain.Qna;

public interface QnaBoardService {

	public List<Qna> selectQnaBoardList();
	public Qna selectQnaBoardByNo(Long qnaNo);
	public int updateQnaBoardHit(Qna qnaNo);
	public int insertBoardQna(Qna Qna);
	public int updateBoardQna(Qna Qna);
	public int deleteBoardQna(Long qnaNo);
	
	
}

package com.reserve.restaurant.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Qna;

@Repository
public interface QnaBoardRepository {

	public List<Qna> selectQnaBoardList();
	public Qna selectQnaBoardByNo(Long qanNo);
	public int updateQnaBoardHit(Qna qanNo);
	public int insertBoardQna(Qna Qna);
	public int updateBoardQna(Qna Qna);
	public int deleteBoardQna(Long qanNo);
	
}

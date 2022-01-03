package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.domain.Reply;

@Repository
public interface QnaBoardRepository {

	public List<Qna> selectQnaBoardList();
	public Qna selectQnaBoardByNo(Long qanNo);
	public int updateQnaBoardHit(Qna qanNo);
	public int insertBoardQna(Qna Qna);
	public int updateBoardQna(Map<String, Object> map);
	public int deleteBoardQna(Long qanNo);
	public int insertQnaReply(Map<String, Object> map);
	public Reply selectQnaReply(Long qnaNo);
}

package com.reserve.restaurant.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.domain.Reply;


@Repository
public interface QnaRepository {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qnaNo);
	public int deleteQna(Long qnaNo);
	
	//댓글 관련
	public List<Reply> qnaReplyList(Long qnaNo);
	public int qnaReplyInsert(Reply reply);
	public int qnaReplyUpdate(Reply reply);
	public int qnaReplyDelete(Long qnaNo);

	
	
	
}
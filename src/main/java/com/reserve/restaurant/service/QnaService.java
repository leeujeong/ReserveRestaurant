package com.reserve.restaurant.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Comment;
import com.reserve.restaurant.domain.Qna;
import com.reserve.restaurant.domain.Reply;

public interface QnaService {

	public List<Qna> selectQnaList1();
	public List<Qna> selectQnaList2();
	public Qna selectQnaByNo(Long qnaNo);
	public int deleteQna(Long qnaNo);
	
	//댓글 관련
	public List<Reply> qnaReplyList(Long qnaNo, Model model);
	public int qnaReplyInsert(HttpServletRequest request);
	public int qnaReplyUpdate(Reply reply);
	public int qnaReplyDelete(Long replyNo);
	
}

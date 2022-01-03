package com.reserve.restaurant.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Reply;
import com.reserve.restaurant.repository.ReplyRepository;

public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public Map<String, Object> addReply(Reply reply) {
		ReplyRepository repository = sqlSession.getMapper(ReplyRepository.class);
		
		System.out.println(reply + "임플 ");
		reply.setReplyWriter(reply.getReplyWriter());
		reply.setReplyContent(reply.getReplyContent());
		reply.setNoticeNo(reply.getNoticeNo());
		
		int result = repository.insertReply(reply); 
		System.out.println(result + "임플 ");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result); 
		return map;
	}
}

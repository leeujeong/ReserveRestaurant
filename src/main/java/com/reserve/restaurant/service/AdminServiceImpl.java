package com.reserve.restaurant.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reserve.restaurant.repository.AdminRepository;

@Service
public class AdminServiceImpl implements AdminService {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void findAllUser(Model model) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		List<String> list = repository.selectAllUser();
		int count = repository.countUser();
		model.addAttribute("count", count);
		model.addAttribute("list", list);

	}

}











package com.reserve.restaurant.service;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.UserRepository;
import com.reserve.restaurant.util.SecurityUtils;

public class UserServiceImpl implements UserService {
		
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void login(HttpServletRequest request) {
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPw(SecurityUtils.sha256(request.getParameter("pw")));
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		User loginUser = repository.login(user);
		if (loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
		}	
	}
}

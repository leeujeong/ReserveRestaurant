package com.reserve.restaruant.service;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaruant.domain.User;
import com.reserve.restaruant.repository.UserRepository;
import com.reserve.restaruant.util.SecurityUtils;

public class UserServiceImpl implements UserService {

	public SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void updatePw(User user) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		user.setUserPw(SecurityUtils.sha256(user.getUserPw()));
		repository.updatePw(user);

	}

	@Override
	public void updateUser(User user, HttpSession session) {
		user.setUserName(SecurityUtils.xxs(user.getUserName()));
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		repository.updateUser(user);
		User loginUser = (User)session.getAttribute("loginUser");
		loginUser.setUserName(user.getUserName());
		loginUser.setEmail(user.getEmail());
	}


}

package com.reserve.restaurant.service;


import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.repository.OwnerRepository;
import com.reserve.restaurant.util.SecurityUtils;

public class OwnerServiceImpl implements OwnerService {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public void join(HttpServletRequest request) {
		Owner owner = new Owner();
		owner.setId(request.getParameter("id"));
		owner.setPw(SecurityUtils.sha256(request.getParameter("pw")));
		owner.setName(SecurityUtils.xxs(request.getParameter("name")));
		owner.setEmail(request.getParameter("email"));
		owner.setTel(request.getParameter("tel"));
		
		
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		repository.joinOwner(owner);
		
	}
//
	@Override
	public void loginOwner(HttpServletRequest request) {
		
		Owner owner = new Owner();
		owner.setId(request.getParameter("id"));
		String pw = request.getParameter("pw");
		String security_pw = SecurityUtils.sha256(pw);
		owner.setPw(security_pw);
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		Owner loginOwner = repository.loginOwner(owner);
		
		if(loginOwner != null) {
			request.getSession().setAttribute("loginUser", loginOwner);
		}
	}
	
	
	



}


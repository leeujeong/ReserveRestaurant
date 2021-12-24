package com.reserve.restaurant.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.repository.OwnerRepository;
import com.reserve.restaurant.util.SecurityUtils;

public class OwnerServiceImpl implements OwnerService {

	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public Map<String, Object> idCheck(String oId) {
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",repository.selecOwnerById(oId));
		return map;
	}

	@Override
	public Map<String, Object> findOwnerByEmail(String oEmail) {
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",repository.selecOwnerByEmail(oEmail));
		return map;
	}


	@Override
	public void join(Owner owner) {
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		owner.setOPw(SecurityUtils.sha256(owner.getOPw()));
		owner.setOName(SecurityUtils.xxs(owner.getOName()));
		repository.joinOwner(owner);
	}

	@Override
	public void login(HttpServletRequest request) {
		Owner owner = new Owner();
		owner.setOId(request.getParameter("id"));
		owner.setOPw(SecurityUtils.sha256(request.getParameter("pw")));
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		Owner loginUser = repository.login(owner);
		if(loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
		}
		
	}

	@Override
	public void updatePw(Owner owner) {
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		owner.setOPw(SecurityUtils.sha256(owner.getOPw()));
		repository.updatePw(owner);
	}

	@Override
	public void updateOwner(Owner owner, HttpSession session) {
		owner.setOName(SecurityUtils.xxs(owner.getOName()));
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		repository.updateOwner(owner);
		Owner loginUser = (Owner)session.getAttribute("loginUser");
		loginUser.setOName(owner.getOName());
		loginUser.setOEmail(owner.getOEmail());
	}

//	@Override
//	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		Owner owner = repository.selecOwnerById(request.getParameter("oId"));
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result", SecurityUtils.sha256(request.getParameter("pw").equals(owner.getOPw())));
//		return null;
//	}

	@Override
	public void leave(Long oNo, HttpSession session) {
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		int result = repository.leaveOwner(oNo);
		if(result > 0) session.invalidate();
		 

	}


}


package com.reserve.restaurant.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.OwnerRepository;
import com.reserve.restaurant.repository.UserRepository;
import com.reserve.restaurant.util.SecurityUtils;

public class OwnerServiceImpl implements OwnerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@Override
//	public Map<String, Object> idCheck(String oId) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result",repository.selectOwnerById(oId));
//		return map;
//	}
//
//	@Override
//	public Map<String, Object> findOwnerByEmail(String oEmail) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result",repository.selectOwnerByEmail(oEmail));
//		return map;
//	}


	@Override
	public void join(HttpServletRequest request) {
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
//		String name = request.getParameter("userName");
//		String email = request.getParameter("userEmail");
//		
//		System.out.println("id : " + id);
//		System.out.println("pw : " + pw);
//		System.out.println("email : " + email);

		
		Owner owner = new Owner();
		owner.setId(request.getParameter("id"));
		owner.setPw(SecurityUtils.sha256(request.getParameter("pw")));
		owner.setName(SecurityUtils.xxs(request.getParameter("userName")));
		owner.setEmail(request.getParameter("userEmail"));
		
		
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		repository.joinOwner(owner);
		
	}
//
	@Override
	public void loginOwner(HttpServletRequest request) {
		
		Owner owner = new Owner();
		owner.setId(request.getParameter("id"));
		String pw = request.getParameter("pw");
		String security_pw = SecurityUtils.sha256(request.getParameter("pw"));
		owner.setPw(security_pw);
		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
		Owner loginOwner = repository.loginOwner(owner);
		
		if(loginOwner != null) {
			request.getSession().setAttribute("loginUser", loginOwner);
			System.out.println(owner);
			System.out.println("owner : " + owner);
		}
	}
	
	
	
//
//	@Override
//	public void updatePw(Owner owner) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		owner.setOPw(SecurityUtils.sha256(owner.getOPw()));
//		repository.updatePw(owner);
//	}
//
//	@Override
//	public void updateOwner(Owner owner, HttpSession session) {
//		owner.setOName(SecurityUtils.xxs(owner.getOName()));
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		repository.updateOwner(owner);
//		Owner loginUser = (Owner)session.getAttribute("loginUser");
//		loginUser.setOName(owner.getOName());
//		loginUser.setOEmail(owner.getOEmail());
//	}

//	@Override
//	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		Owner owner = repository.selecOwnerById(request.getParameter("oId"));
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result", SecurityUtils.sha256(request.getParameter("pw").equals(owner.getOPw())));
//		return null;
//	}

//	@Override
//	public void leave(Long owner_no, HttpSession session) {
//		OwnerRepository repository = sqlSession.getMapper(OwnerRepository.class);
//		int result = repository.leaveOwner(owner_no);
//		if(result > 0) session.invalidate();
//	}


}


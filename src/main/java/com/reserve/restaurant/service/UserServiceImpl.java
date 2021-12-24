package com.reserve.restaurant.service;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.UserRepository;
import com.reserve.restaurant.util.SecurityUtils;

public class UserServiceImpl implements UserService {
		
	private SqlSessionTemplate sqlSession;
	private JavaMailSender javaMailSender;

	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession, JavaMailSender javaMailSender) {
		this.sqlSession = sqlSession;
		this.javaMailSender = javaMailSender;
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
	
	
	@Override
	public Map<String, Object> findUserByEmail(String email) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", repository.selectUserByEmail(email));
		return map;
	}
	
	@Override
	public Map<String, Object> idCheck(String id) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", repository.selectUserById(id));
		return map;
		
	}
	
	@Override
	public void insertUser(User user, HttpServletResponse response) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		user.setId(user.getId());
		user.setPw(SecurityUtils.sha256(user.getPw()));
		user.setUser_name(SecurityUtils.xxs(user.getUser_name()));
		user.setUser_tel(user.getUser_tel());
		user.setUser_hbd(user.getUser_hbd());
		user.setUser_email(user.getUser_email());
		
		int result = repository.insertUser(user);
		
		try {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			if(result > 0) {
				out.println("<script>");
				out.println("alert('회원가입 되었습니다.')");
				out.println("location.href='/restaurant'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('회원 등록 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	
	
	@Override
	public Map<String, Object> sendAuthCode(String email) {
			String authCode = SecurityUtils.authCode(6); 
			try {
				
				MimeMessage message = javaMailSender.createMimeMessage();
				message.setHeader("Content-Type", "text/plain; charset=UTF-8");
				message.setFrom(new InternetAddress("gogospringtest@gmail.com", "인증코드관리자"));
				message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
				message.setSubject("인증 요청 메일입니다.");
				message.setText("인증번호는 " + authCode + " 입니다.");
				javaMailSender.send(message);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("authCode", authCode);
			return map;
	}
	
}

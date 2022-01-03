package com.reserve.restaurant.service;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public User selectUserByNo(Long userNo) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		return repository.selectUserByNo(userNo);
	}
	
	@Override
	public void login(HttpServletRequest request , HttpServletResponse response) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPw(SecurityUtils.sha256(request.getParameter("pw")));
		User loginUser = repository.login(user);
		if (loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
		} 
		
		if(loginUser == null) {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('아이디와 비밀번호를 다시 확인해주세요.')");
					out.println("location.href='/restaurant/user/loginPage'");
					out.println("</script>");
					out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
	public Map<String, Object> emailCheck(String email) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", repository.selectUserByEmail(email));
		return map;
	}
	
	@Override
	public void insertUser(User user, HttpServletResponse response) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		user.setId(user.getId());
		user.setPw(SecurityUtils.sha256(user.getPw()));
		user.setName(SecurityUtils.xxs(user.getName()));
		user.setTel(user.getTel());
		user.setHbd(user.getHbd());
		user.setEmail(user.getEmail());
		
	
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
	
	
	@Override
	public Map<String, Object> presentPwCheck(HttpServletRequest request) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		User user = repository.selectUserById(request.getParameter("id"));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", SecurityUtils.sha256(request.getParameter("pw0")).equals(user.getPw()));
		return map;
	}
	
	@Override
	public void updatePw(User user, HttpServletResponse response) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		user.setPw(SecurityUtils.sha256(user.getPw()));
		int result = repository.updatePw(user);
		message(result, response, "비밀번호가 수정되었습니다", "비밀번호 수정 실패", "/restaurant/user/updateUser");
	}
	
	
	@Override
	public void deleteUser(Long userNo,HttpServletResponse response , HttpSession session) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		int result = repository.deleteUser(userNo);
		
		message(result, response, "사용자가 삭제 되었습니다.", " 사용자가 삭제되지 않았습니다.", "/restaurant");
		if(result > 0 ) session.invalidate();
	}
	
	@Override
	public void updateUser(User user, HttpSession session, HttpServletResponse response) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		user.setEmail(user.getEmail());
		user.setTel(user.getTel());
		
		
		int result = repository.updateUser(user);
		message(result, response, "회원정보가 수정되었습니다", "회원정보 수정 실패", "/restaurant/user/updateUser");
		User loginUser = (User)session.getAttribute("loginUser");
		loginUser.setEmail(user.getEmail());
		loginUser.setTel(user.getTel());
	}
	
	@Override
	public Map<String, Object> hourCheck(String bookHours) {
		UserRepository repository = sqlSession.getMapper(UserRepository.class);
		List<User> list = repository.hourCheck(bookHours);
		System.out.println(list);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", list);
		return map;
	}
	
	
	
}
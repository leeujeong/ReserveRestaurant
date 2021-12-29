
   
package com.reserve.restaurant.service;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reserve.restaurant.domain.User;
import javax.servlet.http.HttpServletRequest;

public interface UserService {

	public Map<String, Object> idCheck(String id);
	public Map<String, Object> findUserByEmail(String email);
	public Map<String, Object> sendAuthCode(String email);
	public void insertUser(User user,HttpServletResponse response);
	public void login(HttpServletRequest request ,HttpServletResponse response);
	public Map<String, Object> emailCheck(String email);
	public User selectUserByNo(Long userNo);
<<<<<<< HEAD
	public Map<String, Object> presentPwCheck(HttpServletRequest request);
	public void updatePw(User user, HttpServletResponse response);
	public void deleteUser(Long userNo , HttpServletResponse response , HttpSession session);
	public void updateUser(User user, HttpSession session);

	

	//message method
	public default void message(int result, HttpServletResponse response, 
			String success, String fail, String path) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if (result > 0) {
				out.println("<script>");
				out.println("alert('" + success + "')");
				out.println("location.href='" + path + "'");
				out.println("</script>");
				out.close();
			} else {
				out.println("<script>");
				out.println("alert('" + fail + "')");
				out.println("history.back()");
				out.println("</script>");
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
=======
}
>>>>>>> refs/heads/owner_yj

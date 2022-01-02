package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.User;

@Repository
public interface UserRepository {

	public User selectUserById(String id);
	public User selectUserByEmail(String email);
	public int insertUser(User user);
	public User login(User user);
	public User selectUserByNo(Long userNo);

	public int updatePw(User user);
	public int deleteUser(Long userNo);
	public int updateUser(User user);

	public List<User> hourCheck(String bookHours);
}
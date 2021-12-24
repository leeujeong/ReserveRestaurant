package com.reserve.restaurant.repository;




import com.reserve.restaurant.domain.User;


public interface UserRepository {

	public User selectUserById(String id);
	public User selectUserByEmail(String email);
	public int insertUser(User user);
	public User login(User user);

}
package com.reserve.restaurant.repository;

<<<<<<< HEAD
import org.springframework.stereotype.Repository;
=======


>>>>>>> refs/heads/main

import com.reserve.restaurant.domain.User;

<<<<<<< HEAD
@Repository
=======

>>>>>>> refs/heads/main
public interface UserRepository {

	public User selectUserById(String id);
	public User selectUserByEmail(String email);
	public int insertUser(User user);
	public User login(User user);

}

package com.reserve.restaurant.repository;

<<<<<<< HEAD


import com.reserve.restaurant.domain.User;


public interface UserRepository {
=======
import com.reserve.restaurant.domain.User;
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git

<<<<<<< HEAD
	
	public User selectUserById(String id);
	public User selectUserByEmail(String email);
	public int insertUser(User user);
=======
public interface UserRepository {
	
	public User login(User user);
	
>>>>>>> branch 'main' of https://github.com/leeujeong/ReserveRestaurant.git
}

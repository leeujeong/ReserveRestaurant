package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.User;

@Repository
public interface AdminRepository {

	public List<User> selectAllUser(Map<String, Object> map);
	public int countUser();
	
	public List<String> selectAllOwner();
	public int countOwner();
	
	public List<User> selectUserList(Map<String, Object> map);
	
	public List<Owner> selectOwnerList(Map<String, Object> map);
	
	public int selectFindRecordCount(Map<String, Object> map);
	public List<String> selectFindList(Map<String, Object> map);
	
	public int selectFindRecordCountOwner(Map<String, Object> map);
	public List<String> selectFindListOwner(Map<String, Object> map); 
	
	public User selectUserInfo(Long userNo);
	public Owner selectOwnerInfo(Long ownerNo);
	
	public List<Restaurant> selectOwnerInfoRes(Long ownerNo);
	
	
	
}

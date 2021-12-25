package com.reserve.restaurant.repository;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository {

	public List<String> selectAllUser();
	public int countUser();
	public List<String> selectAllOwner();
	public int countOwner();
	public List<String> selectUserList(Map<String, Object> map);
	public List<String> selectOwnerList(Map<String, Object> map);
	
	
	
}

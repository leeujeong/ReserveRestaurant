package com.reserve.restaurant.repository;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Owner;

@Repository
public interface OwnerRepository {

	public Owner selecOwnerById(String oId);
	public int joinOwner(Owner owner);
	public Owner login(Owner owner);
	public Owner selecOwnerByEmail(String oEmail);
	public int updatePw(Owner owner);
	public int updateOwner(Owner owner);
	public int leaveOwner(Long oNo);
}

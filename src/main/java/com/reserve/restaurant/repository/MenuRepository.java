
package com.reserve.restaurant.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Menu;

@Repository
public interface MenuRepository {

	public void addMenu(ArrayList<Menu> menu_list);
	public List<Menu> selectMenu(Long resNo);
}
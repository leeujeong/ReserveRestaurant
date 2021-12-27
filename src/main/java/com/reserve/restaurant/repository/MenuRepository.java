
package com.reserve.restaurant.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.reserve.restaurant.domain.Menu;

@Repository
public interface MenuRepository {

	void addMenu(ArrayList<Menu> menu_list);


}
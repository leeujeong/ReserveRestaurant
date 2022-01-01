package com.reserve.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.BookRepository;
import com.reserve.restaurant.repository.RestaurantRepository;
import com.reserve.restaurant.repository.UserRepository;

public class BookServiceImpl implements BookService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertBook(Book book) {
		return 0;
	
	}

	@Override
	public void bookList(Model model) {
//		
//		User user = new User();
//		user.setName(request.getParameter("name"));
//		UserRepository userrepository = sqlSession.getMapper(UserRepository.class);
//		User userInfo = userrepository.login(user);
//		request.getSession().setAttribute("userInfo", userInfo);
//		
//		Restaurant restaurant = new Restaurant();
//		restaurant.setResName(request.getParameter("resName"));
//		RestaurantRepository resrepository = sqlSession.getMapper(Restau)
//		Restaurant resInfo = resrepository.
//		
		
		BookRepository repository = sqlSession.getMapper(BookRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		Long ownerNo = (Long) m.get("ownerNo");
		
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("ownerNo", ownerNo);
		
		
		List<Book> list = repository.bookList(map);
		
		System.out.println(list);
		System.out.println("사용자 번호 " + ownerNo);

		
		model.addAttribute("list", list);
//		if(list != null) {
//			request.getSession().setAttribute("bookingInfo", list);
//		}
	}
}

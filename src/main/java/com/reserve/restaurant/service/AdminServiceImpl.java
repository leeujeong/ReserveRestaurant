package com.reserve.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Book;
import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.Review;
import com.reserve.restaurant.domain.UploadFile;
import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.AdminRepository;
import com.reserve.restaurant.repository.ReviewRepository;
import com.reserve.restaurant.util.PageUtils;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void findAllUser(Model model) {
		
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		int totalRecord = adminRepository.countUser();
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<User> list = adminRepository.selectUserList(map);
		System.out.println(list.toString());
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("list", list);
		model.addAttribute("startNum", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		if (totalRecord == 0) {
			model.addAttribute("paging", null);
		} else {
			model.addAttribute("paging", pageUtils.getPageEntity("findAllUser"));			
		}
	}
	
	@Override
	public void findAllOwner(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		int totalRecord = adminRepository.countOwner();
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<Owner> list = adminRepository.selectOwnerList(map);
		
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("ownerList", list);
		model.addAttribute("startNum", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		if (totalRecord == 0) {
			model.addAttribute("paging", 0);
		} else {
			model.addAttribute("paging", pageUtils.getPageEntity("findAllOwner"));			
		}
	}
	
	@Override
	public void findUser(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String type = request.getParameter("radio");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("query", query);
		map.put("begin", begin);
		map.put("end", end);
		
		int totalRecord = adminRepository.selectFindRecordCount(map);
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<String> list = adminRepository.selectFindList(map);
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		
		switch (column) {
		case "ID":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));
			break;
		case "NAME":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  
			break;
		case "TEL":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  
			break;
		}
		
	}
	
	@Override
	public void findOwner(Model model) {
		
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		String type = request.getParameter("radio");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("column", column);
		map.put("query", query);
		map.put("begin", begin);
		map.put("end", end);
		
		int totalRecord = adminRepository.selectFindRecordCountOwner(map);
		
		// ????????? ????????? ?????? (?????? ??? ?????? page = 1 ??????)
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// ????????? ?????? PageUtils ?????? ?????? ??? ??????
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		// map + beginRecord + endRecord
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// ????????? ?????? ??? beginRecord ~ endRecord ?????? ?????? ????????????
		List<String> list = adminRepository.selectFindListOwner(map);
		
		// View(employee/list.jsp)??? ?????? ?????????
		model.addAttribute("ownerList", list);
		model.addAttribute("totalRecord", totalRecord);
		
		// ?????? ????????? ????????? ??????????????? ?????????
		switch (column) {
		case "ID":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // ????????? ???????????? ????????? ??????
			break;
		case "NAME":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // ????????? ???????????? ????????? ??????
			break;
		case "TEL":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // ????????? ???????????? ????????? ??????
			break;
		}
		
	}

		
	// ?????????????????? ??????
	@Override
	public void selectUserInfo(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		String userNo = request.getParameter("userNo");
		User user = adminRepository.selectUserInfo(userNo);
		int countLog = adminRepository.countUserLog(userNo);
		// model.addAttribute("bookList", bookList);
		model.addAttribute("countLog", countLog);
		model.addAttribute("user", user);
	}
	
	// userDetail?????? BookList ajax??????
	@Override
	public Map<String, Object> userBookList(Long userNo, Integer page) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		int totalRecord = adminRepository.countBookList(userNo);
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);	// ????????? ???????????? ?????? ?????? ?????? + ????????? ?????? ??????
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("beginRecord", pageUtils.getBeginRecord());
		m.put("endRecord", pageUtils.getEndRecord());
		m.put("userNo", userNo);
		
		System.out.println("beginRecord:" + pageUtils.getBeginRecord());
		System.out.println("endRecord:" + pageUtils.getEndRecord());
		
		List<Book> bookList = adminRepository.selectBookList(m);	// ??????
		
		System.out.println(bookList.toString());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bookList", bookList);				// ??????
		map.put("pageUtils", pageUtils);	// ????????? ????????? ?????????
		
		return map;
	}
	
	
	// ??????????????? ????????????
	@Override
	public void selectOwnerInfo(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		Map<String, Object> map = model.asMap();
		Long ownerNo = (Long) map.get("ownerNo");
		Owner owner = adminRepository.selectOwnerInfo(ownerNo);
		int count = adminRepository.countOwnerRes(ownerNo);
		model.addAttribute("count", count);
		model.addAttribute("owner", owner);
		List<Restaurant> restList = adminRepository.selectOwnerInfoRes(ownerNo);
		model.addAttribute("restList", restList);
		
	}

	// ownerDetail?????? resList ajax??????
	@Override
	public Map<String, Object> ownerResList(Long ownerNo, Integer page) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		int totalRecord = adminRepository.countOwnerRes(ownerNo);
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);	// ????????? ???????????? ?????? ?????? ?????? + ????????? ?????? ??????
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("beginRecord", pageUtils.getBeginRecord());
		m.put("endRecord", pageUtils.getEndRecord());
		m.put("ownerNo", ownerNo);
		
		List<Restaurant> resList = adminRepository.selectResList(m);	// ??????
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resList", resList);				// ??????
		map.put("pageUtils", pageUtils);	// ????????? ????????? ?????????
		
		return map;
	}
	
	
	
	
	
	// ???????????????(?????????)
	@Override
	public void selectResList(HttpServletRequest request, Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		String query = request.getParameter("query");
		int totalRecord = adminRepository.searchCountRes(query);	
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("query", query);
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		List<Restaurant> resList = adminRepository.resListByAddress(map);
		model.addAttribute("resList", resList);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", pageUtils.getPageEntity("searchRestaurant?query=" + query));			
	}


	@Override

	public void selectResDetail(Model model, Restaurant restaurant, HttpServletRequest request) {
	      AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
	      ReviewRepository reviewRepository = sqlSession.getMapper(ReviewRepository.class);
	      
	      Long resNo = restaurant.getResNo();
	      Restaurant rest = adminRepository.selectResDetail(resNo);
	      Integer totalReviewCount  = reviewRepository.totalReview(resNo);
	      Integer avgReview = reviewRepository.avgReviewRate(resNo);
	      
	      List<Review> reviewList = adminRepository.selectReviewList(resNo);
	      List<UploadFile> picList = adminRepository.selectFile(resNo);
	      if (rest != null) {
	         request.getSession().setAttribute("rest", rest);
	      }
	      
	      model.addAttribute("reviewList",reviewList);
	      if(reviewList != null) {
	    	  request.getSession().setAttribute("review", reviewList);
	      }
	      
	      model.addAttribute("pic" ,  picList);
	      if (picList != null) {
	    	  request.getSession().setAttribute("pic", picList);
	      }
	     model.addAttribute("reviewCount", totalReviewCount);
	     model.addAttribute("avgReview", avgReview);
	      
	      
	   }
	
	

	// ?????? ????????? ????????? ??????
	@Override
	public Map<String, Object> resList(Integer page, Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		
		int totalRecord = adminRepository.countRes();
		
		model.addAttribute("totalReocrd", totalRecord);
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);	// ????????? ???????????? ?????? ?????? ?????? + ????????? ?????? ??????
		
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("beginRecord", pageUtils.getBeginRecord());
		m.put("endRecord", pageUtils.getEndRecord());

		List<Restaurant> list = adminRepository.selectRes(m);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resList", list);
		map.put("pageUtils", pageUtils);
		
		return map;
	}
	
	// ????????? ??????
	@Override
	public Map<String, Object> findRes(Integer page, HttpServletRequest request) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		Map<String, Object> m1 = new HashMap<String, Object>();
		m1.put("column", request.getParameter("column"));
		m1.put("query", request.getParameter("query"));
		int totalRecord = adminRepository.countFindRes(m1);
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);	// ????????? ???????????? ?????? ?????? ?????? + ????????? ?????? ??????
		Map<String, Object> m2 = new HashMap<String, Object>();
		m2.put("beginRecord", pageUtils.getBeginRecord());
		m2.put("endRecord", pageUtils.getEndRecord());
		m2.put("column", request.getParameter("column"));
		m2.put("query", request.getParameter("query"));
		List<Restaurant> list = adminRepository.findRes(m2);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageUtils", pageUtils);
		return map;
	}

	
	// ?????? ????????? ??????
	@Override
	public void newOpen(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		List<Restaurant> list = adminRepository.newOpen();
		model.addAttribute("list", list);
		
		
	}
	
	@Override
	public Map<String, Object> indexNewOpen(int resState) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		List<Restaurant> list = adminRepository.indexnewOpen(resState);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}
	
	@Override
	public void reviewRate(Model model) {
		AdminRepository adminRepository = sqlSession.getMapper(AdminRepository.class);
		List<Restaurant> list = adminRepository.ReviewRate();
		model.addAttribute("list", list);
	}
	
	
	
	
	
}

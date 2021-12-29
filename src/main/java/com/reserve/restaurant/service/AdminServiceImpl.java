package com.reserve.restaurant.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.reserve.restaurant.domain.Owner;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.User;
import com.reserve.restaurant.repository.AdminRepository;
import com.reserve.restaurant.util.PageUtils;

@Service
public class AdminServiceImpl implements AdminService {
	
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	public void setBean(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void findAllUser(Model model) {
		
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		int totalRecord = repository.countUser();
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<User> list = repository.selectUserList(map);
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("list", list);
		model.addAttribute("startNum", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPageEntity("findAllUser"));
	}
	
	@Override
	public void findAllOwner(Model model) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest)m.get("request");
		
		int totalRecord = repository.countOwner();
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		List<Owner> list = repository.selectOwnerList(map);
		
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("ownerList", list);
		model.addAttribute("startNum", totalRecord - (page - 1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPageEntity("findAllOwner"));
	}
	
	@Override
	public void findUser(Model model) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		
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
		
		int totalRecord = repository.selectFindRecordCount(map);
		
		System.out.println(totalRecord);
		
		// 전달된 페이지 번호 (전달 안 되면 page = 1 사용)
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 페이징 처리 PageUtils 객체 생성 및 계산
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		// map + beginRecord + endRecord
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// 검색된 목록 중 beginRecord ~ endRecord 사이 목록 가져오기
		List<String> list = repository.selectFindList(map);

		System.out.println(list);
		
		// View(employee/list.jsp)로 보낼 데이터
		model.addAttribute("list", list);
		model.addAttribute("totalRecord", totalRecord);
		
		// 검색 조건에 따라서 파라미터가 달라짐
		switch (column) {
		case "ID":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		case "NAME":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		case "TEL":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		}
		
	}
	
	@Override
	public void findOwner(Model model) {
		
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		
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
		
		int totalRecord = repository.selectFindRecordCountOwner(map);
		
		// 전달된 페이지 번호 (전달 안 되면 page = 1 사용)
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		// 페이징 처리 PageUtils 객체 생성 및 계산
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		// map + beginRecord + endRecord
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		// 검색된 목록 중 beginRecord ~ endRecord 사이 목록 가져오기
		List<String> list = repository.selectFindListOwner(map);
		
		// View(employee/list.jsp)로 보낼 데이터
		model.addAttribute("ownerList", list);
		model.addAttribute("totalRecord", totalRecord);
		
		// 검색 조건에 따라서 파라미터가 달라짐
		switch (column) {
		case "ID":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		case "NAME":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		case "TEL":
			model.addAttribute("paging", pageUtils.getPageEntity("findUser?column=" + column + "&query=" + query + "&radio=" + type));  // 목록을 출력하는 매핑값 전달
			break;
		}
		
	}

		

	@Override
	public void selectUserInfo(Model model) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		Map<String, Object> map = model.asMap();
		Long userNo = (Long)map.get("userNo");
		User user = repository.selectUserInfo(userNo);
		model.addAttribute("user", user);
	}
	
	// 식당 페이지 상세정보
	@Override
	public void selectOwnerInfoRes(Model model) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		Map<String, Object> map = model.asMap();
		Long ownerNo = (Long) map.get("ownerNo");
		Owner owner = repository.selectOwnerInfo(ownerNo);
		model.addAttribute("owner", owner);
		List<Restaurant> restList = repository.selectOwnerInfoRes(ownerNo);
		model.addAttribute("restList", restList);
		
	}

	
	// 검색페이지(페이징)
	@Override
	public void selectResList(HttpServletRequest request, Model model, HttpServletResponse response) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		if (request.getParameter("query") == "") {
			try {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("<alert('검색어를 입력해주세요!'>");
				out.println("history.back();");
				out.println("</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		String query = request.getParameter("query");
		int totalRecord = repository.searchCountRes(query);
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		PageUtils pageUtils = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("query", query);
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		List<Restaurant> resList = repository.resListByAddress(map);
		model.addAttribute("resList", resList);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("paging", pageUtils.getPageEntity("searchRestaurant?query=" + query));

		
	}


	@Override
	public void selectResDetail(Model model, Restaurant restaurant) {
		AdminRepository repository = sqlSession.getMapper(AdminRepository.class);
		Long resNo = restaurant.getResNo();
		Restaurant rest = repository.selectResDetail(resNo); 
		System.out.println(resNo);
		System.out.println(rest);
		model.addAttribute("rest", rest);
	}


	
	
	
	
	
	
	
	
	
	




}











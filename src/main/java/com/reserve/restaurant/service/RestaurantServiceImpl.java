package com.reserve.restaurant.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Menu;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.repository.MenuRepository;
import com.reserve.restaurant.repository.RestaurantRepository;
import com.reserve.restaurant.util.PageUtils;

import net.coobird.thumbnailator.Thumbnails;

public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void selectMyRestaurantList(Model model) {
		
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		
		Map<String, Object> m = model.asMap();
		HttpServletRequest request = (HttpServletRequest) m.get("request");
		
		HttpSession session = request.getSession();
		String oId = (String) session.getAttribute("oId");

		int totalRecord = repository.selectTotalCount(oId);
		
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils  = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		
		
		List<Restaurant> list = repository.selectMyRestaurantList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("startNum", totalRecord - (page -1)*pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPageEntity("managePage"));
		
	}
	
	@Override
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		Restaurant restaurant = new Restaurant();
		restaurant.setResName(multipartRequest.getParameter("s_name"));
		restaurant.setTel(multipartRequest.getParameter("tel"));
		restaurant.setAddress(multipartRequest.getParameter("address"));
		restaurant.setAddressDetail(multipartRequest.getParameter("address_detail"));
		restaurant.setOpenTime(multipartRequest.getParameter("open_time"));
		restaurant.setCloseTime(multipartRequest.getParameter("close_time"));
		String[] additional_options = multipartRequest.getParameterValues("additional_option");
		String additional_option = "";
		for (int i = 0; i < additional_options.length; i++) {
			if(i == 0) {
				additional_option = additional_options[i];
			} else {
				additional_option = additional_option + "," + additional_options[i];
			}
		
		}
		restaurant.setResOption(additional_option);
		restaurant.setContent(multipartRequest.getParameter("content"));
		restaurant.setOwneroNo((long) 1);
		
		try {
			
			
			MultipartFile file = multipartRequest.getFile("s_file");
			
			System.out.println("file " + file);
			
			
			
			if (file != null && !file.isEmpty()) {  
				
				String origin = file.getOriginalFilename();
				String extName = origin.substring(origin.lastIndexOf("."));
		
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String saved = uuid + extName;
				String sep = Matcher.quoteReplacement(File.separator);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String path = "resources" + sep + "upload"  + sep + sdf.format(new Date()).replaceAll("-", sep);
				String realPath = multipartRequest.getServletContext().getRealPath(path);
			
				File dir = new File(realPath);
				if (dir.exists() == false) {
					dir.mkdirs();
				}
				
				File uploadFile = new File(realPath, saved);  
				file.transferTo(uploadFile);  
				
				Thumbnails.of(uploadFile)
				.size(150, 150)
				.toFile(new File(realPath, "s_" + saved));
				
				restaurant.setPath(path);
				restaurant.setOrigin(origin);
				restaurant.setSaved(saved);
				
			} 
			else {
				restaurant.setPath("");
				restaurant.setOrigin("");
				restaurant.setSaved("");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.addRestaurant(restaurant);
		
	
		
		
		String[] menus = multipartRequest.getParameterValues("menu");
		String[] prices = multipartRequest.getParameterValues("price");
		ArrayList<Menu> menu_list = new ArrayList<Menu>();
		
		for(int i = 0; i < menus.length; i++) {
			Menu menu = new Menu();
			menu.setMenu(menus[i]);
			menu.setPrice(Long.parseLong(prices[i]));
			menu.setRestaurant_res_no(restaurant.resNo);
			menu_list.add(menu);
		}
		
		MenuRepository menu_repository = sqlSession.getMapper(MenuRepository.class);
		menu_repository.addMenu(menu_list);
		
		message(result, response, "식당이 추가되었습니다.","식당등록이 실패했습니다.", "managePage");
		
	}
	
	@Override
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
	}

	@Override
	public Map<String, Object> removeRestaurant(Long resNo) {
		return null;
	}

	@Override
	public Restaurant selectRestaurantByNo(Long resNo) {
		// TODO Auto-generated method stub
		return null;
	}

}

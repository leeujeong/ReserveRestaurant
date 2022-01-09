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
		
//		HttpSession session = request.getSession();
//		String id = (String) session.getAttribute("id");
		String oid = (String) m.get("oid");
		

		int totalRecord = repository.selectTotalCount(oid);
		
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils  = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		map.put("id", oid);
		
		List<Restaurant> list = repository.selectMyRestaurantList(map);

		
		model.addAttribute("list", list);
		model.addAttribute("startNum", totalRecord - (page -1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPageEntity("managePage"));
		
	}
	//등록
	@Override
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		Restaurant restaurant = new Restaurant();
		restaurant.setResName(multipartRequest.getParameter("s_name"));
		restaurant.setResTel(multipartRequest.getParameter("tel"));
		restaurant.setResAddress(multipartRequest.getParameter("address"));
		restaurant.setResAddressDetail(multipartRequest.getParameter("address_detail"));
		restaurant.setResOpenTime(multipartRequest.getParameter("open_time"));
		restaurant.setResCloseTime(multipartRequest.getParameter("close_time"));
		String[] additional_options = multipartRequest.getParameterValues("additional_option");
		System.out.println("추가옵션" + additional_options.toString());
		String additional_option = "";
		for (int i = 0; i < additional_options.length; i++) {
			if(i == 0) {
				additional_option = additional_options[i];
			} else {
				additional_option = additional_option + "," + additional_options[i];
			}
		
		}
		restaurant.setResOption(additional_option);
		restaurant.setResContent(multipartRequest.getParameter("content"));
		restaurant.setOwnerNo(Long.parseLong(multipartRequest.getParameter("ownerNo")));
		
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
					restaurant.setResPath(path);
					restaurant.setResOrigin(origin);
					restaurant.setResSaved(saved);
				
			} 
			else {
				restaurant.setResPath("");
				restaurant.setResOrigin("");
				restaurant.setResSaved("");

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
			menu.setMenuName(menus[i]);
			menu.setMenuPrice(Long.parseLong(prices[i]));
			menu.setResNo(restaurant.getResNo());
			menu_list.add(menu);	
		}
	
		
		MenuRepository menu_repository = sqlSession.getMapper(MenuRepository.class);
		menu_repository.addMenu(menu_list);
		
		
		message(result, response, "식당이 추가되었습니다.","식당등록이 실패했습니다.", "managePage");
		
	}

	//수정
	@Override
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		Restaurant restaurant = new Restaurant();
		restaurant.setResNo(Long.parseLong(multipartRequest.getParameter("resNo")));
		restaurant.setResName(multipartRequest.getParameter("s_name"));
		restaurant.setResTel(multipartRequest.getParameter("tel"));
		restaurant.setResAddress(multipartRequest.getParameter("address"));
		restaurant.setResAddressDetail(multipartRequest.getParameter("address_detail"));
		restaurant.setResOpenTime(multipartRequest.getParameter("open_time"));
		restaurant.setResCloseTime(multipartRequest.getParameter("close_time"));
		restaurant.setOwnerNo(Long.parseLong(multipartRequest.getParameter("ownerNo")));
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
		restaurant.setResContent(multipartRequest.getParameter("content"));
	
		
		try {
			
			
			MultipartFile file = multipartRequest.getFile("newFile");
			
			
			
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
				
				restaurant.setResPath(path);
				restaurant.setResOrigin(origin);
				restaurant.setResSaved(saved);
				
			} 
			else {
				restaurant.setResPath("");
				restaurant.setResOrigin("");
				restaurant.setResSaved("");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.modifyRestaurant(restaurant);
		
	
		
		
		String[] menus = multipartRequest.getParameterValues("menu");
		String[] prices = multipartRequest.getParameterValues("price");
		ArrayList<Menu> menu_list = new ArrayList<Menu>();
		
		for(int i = 0; i < menus.length; i++) {
			Menu menu = new Menu();
			menu.setMenuName(menus[i]);
			menu.setMenuPrice(Long.parseLong(prices[i]));
			menu.setResNo(restaurant.getResNo());
			menu_list.add(menu);
		}
		
		MenuRepository menu_repository = sqlSession.getMapper(MenuRepository.class);
		menu_repository.addMenu(menu_list);
		
		
		
		System.out.println("메뉴:"+menu_list);
		message(result, response, "식당이 수정되었습니다.","식당수정이 실패했습니다.", "managePage");
		
		
	}
	

	//하나만 골라
	@Override
	public Restaurant selectList(Long resNo) {
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		return repository.selectList(resNo);
	}

	//삭제
	@Override
	public void deleteRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		
		//첨부파일 삭제
//		String path = multipartRequest.getParameter("resPath");
//		String realPath = multipartRequest.getServletContext().getRealPath(path);
//		String saved = multipartRequest.getParameter("saved");
//		
//		File file = new File(realPath, saved);
//		if(file != null && file.exists()) {
//			file.delete();
//		}
//		//썸네일 삭제
//		File thumbnail = new File(realPath, "s_"+saved);
//		if(thumbnail != null && thumbnail.exists()) {
//			thumbnail.delete();
//		}
		
		Long resNo = Long.parseLong(multipartRequest.getParameter("resNo"));
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.deleteRestaurant(resNo);
		message(result, response, "음식점이 삭제되었습니다.", "삭제 실패", "managePage");
	}
	
	
	//메뉴고르기
	@Override
	public List<Menu> selectMenu(Long resNo, HttpServletRequest request) {
		MenuRepository repository = sqlSession.getMapper(MenuRepository.class);
		List<Menu> menu = repository.selectMenu(resNo);
		if(menu !=null) {
			request.getSession().setAttribute("menu", menu);
			System.out.println(menu + "레스토랑서비스 임플");
		}
		return menu;
		
	}

	


	
}

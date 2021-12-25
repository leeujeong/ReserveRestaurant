package com.reserve.restaurant.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.regex.Matcher;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.repository.RestaurantRepository;

public class RestaurantServiceImpl implements RestaurantService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Restaurant> selectMyRestaurantList() {
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		return repository.selectMyRestaurantList();
	}

	@Override
	public Restaurant selectRestaurantByNo(Long resNo) {
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		return repository.selectRestaurantByNo(resNo);
	}
	
	@Override
	public void addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		Restaurant restaurant = new Restaurant();
		restaurant.setResName(multipartRequest.getParameter("s_name"));
		restaurant.setResTel(multipartRequest.getParameter("tel"));
		restaurant.setResLoc(multipartRequest.getParameter("address"));
		restaurant.setResLocDetail(multipartRequest.getParameter("address_detail"));
		restaurant.setResOpenTime(multipartRequest.getParameter("open_time"));
		restaurant.setResCloseTime(multipartRequest.getParameter("close_time"));
		String[] additional_options = multipartRequest.getParameterValues("additional_option");
		String additional_option = "";
		for (int i = 0; i < additional_options.length; i++) {
			if(i == 0) {
				additional_option = additional_options[i];
			} else {
				additional_option = "," + additional_options[i];
			}
			
		}
		restaurant.setRes_addtional_option(additional_option);
		restaurant.setResContent(multipartRequest.getParameter("content"));
		try {
			
			MultipartFile file = multipartRequest.getFile("file");
			
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
//		 MenuRepository menu_repository = sqlSession.getMapper(MenuRepository.class);
		int result = repository.addRestaurant(restaurant);
		message(result, response, "식당이 추가되었습니다.","식당등록이 실패했습니다.", "owner/list");
		
	}
	
	

	@Override
	public void modifyRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
		Restaurant restaurant = new Restaurant();
		restaurant.setResName(multipartRequest.getParameter("resName"));
		restaurant.setResTel(multipartRequest.getParameter("resTel"));
		restaurant.setResLoc(multipartRequest.getParameter("resLoc"));
		restaurant.setResContent(multipartRequest.getParameter("resContent"));
		restaurant.setResNo(Long.parseLong(multipartRequest.getParameter("resNo")));
		
		try {
			
			String path = multipartRequest.getParameter("path");
			String realPath = multipartRequest.getServletContext().getRealPath(path);
			String origin = multipartRequest.getParameter("origin");
			String saved = multipartRequest.getParameter("saved");
			
		
			MultipartFile newFile = multipartRequest.getFile("newFile");
			
				if ( newFile != null && newFile.isEmpty() == false ) {
				
				File file = new File(realPath, saved);
				if (file != null && file.exists()) {
					file.delete();
				}
				if (path.isEmpty()) {
					String created = multipartRequest.getParameter("created");
					String sep = Matcher.quoteReplacement(File.separator);
					path = "resources" + sep + "upload"  + sep + created.replaceAll("-", sep);
					realPath = multipartRequest.getServletContext().getRealPath(path);
					File dir = new File(realPath);
					if (dir.exists() == false) {
						dir.mkdirs();
					}
				}
				
				String newOrigin = newFile.getOriginalFilename();
				String extName = newOrigin.substring(newOrigin.lastIndexOf("."));
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				String newSaved = uuid + extName;
				File uploadFile = new File(realPath, newSaved);
				newFile.transferTo(uploadFile);
				
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
	}

	@Override
	public Map<String, Object> removeRestaurant(Long resNo) {
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.removeRestaurant(resNo);
		Map<String , Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return map;
	}

}

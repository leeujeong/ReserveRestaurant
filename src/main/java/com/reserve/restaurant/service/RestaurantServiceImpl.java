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

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.reserve.restaurant.domain.Menu;
import com.reserve.restaurant.domain.Restaurant;
import com.reserve.restaurant.domain.UploadFile;
import com.reserve.restaurant.repository.MenuRepository;
import com.reserve.restaurant.repository.RestaurantRepository;
import com.reserve.restaurant.repository.UploadFileRepository;
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
		System.out.println(totalRecord);
		
		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
		
		PageUtils pageUtils  = new PageUtils();
		pageUtils.setPageEntity(totalRecord, page);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("beginRecord", pageUtils.getBeginRecord());
		map.put("endRecord", pageUtils.getEndRecord());
		map.put("id", oid);
		
		
		List<Map<String, Object>> list = repository.selectMyRestaurantList(map);

		System.out.println("라수투"+list.toString());
		
		model.addAttribute("list", list);
		model.addAttribute("startNum", totalRecord - (page -1) * pageUtils.getRecordPerPage());
		model.addAttribute("paging", pageUtils.getPageEntity("managePage"));
		
	}
	//등록
	@Override
	public int addRestaurant(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) {
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
		
		System.out.println("DB수행전 : "+ restaurant);
		
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.addRestaurant(restaurant);
		
		System.out.println("DB수행후 : "+ restaurant);
		
		// 첨부파일 저장 결과
		int fileAttachResult = 0;
		UploadFileRepository uploadRepository = sqlSession.getMapper(UploadFileRepository.class);
		// 저장 경로 : resources/upload/2021/12/17
		String sep = Matcher.quoteReplacement(File.separator);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String path = "resources" + sep + "upload"  + sep + sdf.format(new Date()).replaceAll("-", sep);
		String realPath = multipartRequest.getServletContext().getRealPath(path);
		
		// 저장될 경로에 디렉터리 만들기 : 없으면 새로 만들어야 한다.
		File dir = new File(realPath);
		if (dir.exists() == false) {
			dir.mkdirs();
		}
		
		// 서버에 파일 저장
		List<MultipartFile> files = multipartRequest.getFiles("files");  // 다중첨부 상황
		List<UploadFile> upload_files = new ArrayList<UploadFile>();
		
		for (MultipartFile file : files) {  // 첨부 하나씩 DB에 넣기
			try {
			
				if (file != null && !file.isEmpty()) {  // 첨부가 있으면(둘 다 필요)
				
					//  첨부파일의 본래 이름 origin
					String origin = file.getOriginalFilename();
					
					// 첨부파일의 확장자 [".jsp", ".jpeg", ".gif", ".png"]
					String extension = origin.substring(origin.lastIndexOf("."));
					
					// 하이픈 없는 UUID
					String uuid = UUID.randomUUID().toString().replaceAll("-", "");
					
					// 첨부파일 서버에 업로드 (예외 처리 필요)
					File attachFile = new File(realPath, uuid + extension);  // new File(경로, 파일)
					System.out.println(realPath);
					file.transferTo(attachFile);  // 업로드 진행 코드
					
					// DB에 uuid, path, origin, fileType, boardNo 전달
					UploadFile uploadFile = new UploadFile();
					uploadFile.setUuid(uuid + extension);
					uploadFile.setPath(path);
					uploadFile.setOrigin(origin);
					uploadFile.setFileType("I");
					uploadFile.setResNo(restaurant.getResNo());
					upload_files.add(uploadFile);
					
					// DB에 boardAttach 저장
					uploadRepository.fileInsert(uploadFile);
					
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
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
		for(Menu menu: menu_list) {
			menu_repository.addMenu(menu);
		}
//			// 응답할 데이터
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("result", result);  // 게시판 성공 유무
//		map.put("restaurant", restaurant);	
//		map.put("menu_list", menu_list);
//		map.put("upload_files", upload_files);
		
		message(result, response, "식당이 추가되었습니다.", "식당등록이 실패했습니다.", "managePage");
		
		return result;
		
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
			
//				
//				restaurant.setResPath(path);
//				restaurant.setResOrigin(origin);
//				restaurant.setResSaved(saved);
				
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}

		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.modifyRestaurant(restaurant);
		
	
		// 기존 메뉴
		
		// 수정되는 메뉴
		String[] menus = multipartRequest.getParameterValues("menu");
		String[] prices = multipartRequest.getParameterValues("price");
		ArrayList<Menu> menuList = new ArrayList<Menu>();
		
		
		for(int i = 0; i < menus.length; i++) {
			Menu menu = new Menu();
			menu.setMenuName(menus[i]);
			menu.setMenuPrice(Long.parseLong(prices[i]));
			menu.setResNo(restaurant.getResNo());
			menuList.add(menu);
		}
		
		Long menuNo = Long.parseLong(multipartRequest.getParameter("menuNo"));
		
		System.out.print("메뉴 넘버" + menuNo );
		
		MenuRepository menu_repository = sqlSession.getMapper(MenuRepository.class);
		menu_repository.menuDelete(menuNo);
		/*
		List<Menu> prevMenuList = menu_repository.selectMenu(Long.parseLong(multipartRequest.getParameter("resNo")));
		
		List<Menu> newMenuList = menuList.stream()
				.filter(menu -> !prevMenuList.contains(menu))
				.collect(Collectors.toList());
		
		System.out.println("새로들어온 메뉴:"+newMenuList);
		*/
		for(Menu menu : menuList) {
			menu_repository.addMenu(menu);
		}
		
		System.out.println(menuList);
		
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
		Long resNo = Long.parseLong(multipartRequest.getParameter("resNo"));
		RestaurantRepository repository = sqlSession.getMapper(RestaurantRepository.class);
		int result = repository.deleteRestaurant(resNo);
		message(result, response, "음식점이 삭제되었습니다.", "삭제 실패", "managePage");
	}
	
	
	//메뉴고르기
	@Override
	public List<Menu> selectMenu(Long resNo) {
		MenuRepository repository = sqlSession.getMapper(MenuRepository.class);
		return repository.selectMenu(resNo);
		
	}
	//메뉴 삭제
	@Override
	public int menuDelete(Long menuNo) {
		MenuRepository repository = sqlSession.getMapper(MenuRepository.class);
		return repository.menuDelete(menuNo);
	}
	
	//사진 고르기
	@Override
	public List<UploadFile> selectFile(Long resNo) {
		UploadFileRepository repository = sqlSession.getMapper(UploadFileRepository.class);
		return repository.selectFile(resNo);
	}
	
	
}

package com.reserve.restaurant.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.reserve.restaurant.domain.Notice;
import com.reserve.restaurant.service.NoticeService;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("notice/*")
public class NoticeController {

	
	@Autowired
	NoticeService service;
	
	@GetMapping(value = "selectNoticeList")
	public String selectNoticeList(Model model, HttpServletRequest request) {
		model.addAttribute("list", service.selectNoticeList(request));
		return "notice/noticeList";
	}
	
	
	@GetMapping(value = "findNoticeByNo")
	public String findNoticeByNo(@RequestParam("noticeNo") Long noticeNo, Model model, HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("notice",service.findNoticeByNo(noticeNo, request, response));
		return "notice/noticeView";
	}
	
	@GetMapping(value = "insertPage")
	public String insertPage() {
		return "notice/noticeInsert";
	}
	
	@PostMapping(value = "addNotice")
	public void addNotice(Notice notice , HttpServletResponse response) {
		service.addNotice(notice, response);
	}
	
	
	@GetMapping(value = "noticeDetailByNo")
	public String noticeDetailByNo(@RequestParam("noticeNo") Long noticeNo, Model model ,  HttpServletRequest request, HttpServletResponse response) {
		model.addAttribute("notice", service.findNoticeByNo(noticeNo, request, response));
		return "notice/noticeDetail";
	}
	
	@PostMapping(value = "updateNotice")
	public void updateNotice(Notice notice, Model model, HttpServletResponse response) {
		service.updateNotice(notice, response);
//		model.addAttribute("notice" ,service.updateNotice(notice, response));
	}
	
	@PostMapping(value = "deleteNotice")
	public void deleteNotice(@RequestParam("noticeNo")Long noticeNo, Model model, HttpServletResponse response) {
		service.deleteNotice(noticeNo, response);
	}
	
	
	
	
	
	
}

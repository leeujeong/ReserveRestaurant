package com.reserve.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("owner/*")
public class OwnerController {

	@GetMapping(value="addPage")
	public String addPage() {
		return "owner/addstore";
	}
	
	@GetMapping(value="managePage")
	public String managePage() {
		return "owner/cancle";
	}

	@GetMapping(value="modifyPage")
	public String modifyPage() {
		return "owner/info";
	}
	@GetMapping(value="questionPage")
	public String questionPage() {
		return "owner/question";
	}
	@GetMapping(value="reviewPage")
	public String reviewPage() {
		return "owner/review";
	}
	@GetMapping(value="updatePage")
	public String updatePage() {
		return "owner/detail";
	}
}

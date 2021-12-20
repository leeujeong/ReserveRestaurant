package com.reserve.restaruant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.reserve.restaruant.service.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {
//	
//	@Autowired
//	private UserService service;
	
	@GetMapping(value="myPage")
	public String myPage() {
		return "user/myPage";
	}
	
//   @GetMapping(value="ingReserve")
//   public String ingReserve() {
//      return null;
//   }
   
//   @PostMapping(value="presentPwCheck")
//     public String presentPwCheck() {
//	   service.updatePw(User user);
//         return "redirect:/";
//   }
//
//   @PostMapping(value="updateUser")
//      public String updateMember(User user, HttpSession session) {
//         service.updateUser(user, session);
//         return "redirect:/";
//   }
	   
}


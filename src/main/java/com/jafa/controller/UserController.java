 package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class UserController {
	
	
	// 회원가입 컨트롤러
	@GetMapping("/join")
	public String memberForm() {
		return "member/join";
	}
	
	
	
}

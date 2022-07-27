package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	
	
	// 회원가입 컨트롤러
	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}
		
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	
	
	
}

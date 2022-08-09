package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {
	
	//로그인 화면 띄우는 컨트롤러
	@GetMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	//회원 가입 시 main으로 보냄
	@PostMapping("/login")
	public String loginTrans() {
		return "redirect:/";
	}
	
	
}

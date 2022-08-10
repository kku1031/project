package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {
	
	//권한 없는 페이지에 대한 접근 제한 페이지
	@GetMapping("/accessError")
	public String accessDenied() {
		return "error/accessError";
	}
	
	//로그인
	@RequestMapping("/customLogin")
	public String loginForm(String error, Model model) {
		if(error!=null) {
			System.out.println(error);
			model.addAttribute("error",error);
		}
		return "member/login";
	}	
	
	//로그아웃
	@GetMapping("/customLogout")
	public String logout() {
		return "member/logout";
	}
	
}

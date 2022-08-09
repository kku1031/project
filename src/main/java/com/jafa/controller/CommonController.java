package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommonController {
	//권한 없는 페이지에 대한 접근 제한 페이지
	@GetMapping("/accessError")
	public String accessDenied() {
		return "error/accessError";
	}
		
}

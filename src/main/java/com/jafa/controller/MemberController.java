package com.jafa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	
	// 회원가입 컨트롤러
	@GetMapping("member/join")
	public String joinForm() {
		return "member/join";
	}
	
	
}

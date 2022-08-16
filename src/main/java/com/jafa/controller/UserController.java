 package com.jafa.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.model.User;

@Controller
@RequestMapping("/member")
public class UserController {
	
	private List<User> users = new ArrayList<User>();
	
	public UserController() {
	}
	
	// 회원가입 페이지로 접속
	@GetMapping("/join")
	public String joinForm() {
		return "member/join";
	}
	
	// 회원가입 화면에서 회원가입 시 유저 페이지로
	@PostMapping("/join")
	public String joinTrans(User user) {
		System.out.println("user : " +user);
		users.add(user);
		return "redirect:user";
	}
	
	//회원가입 된 데이터를 user 페이지로
	@GetMapping("/user")
	public String user(Model model) {		
		model.addAttribute("users", users);
		return "member/user";
	}
	
}

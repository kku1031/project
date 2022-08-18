 package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jafa.model.AuthVO;
import com.jafa.model.MemberVO;
import com.jafa.service.MemberService;

@Controller
@RequestMapping("/join")
public class MemberJoinController {
	
	@Autowired
	MemberService memberService;
	
	// 회원가입 페이지로 접속
	@GetMapping("/register")
	public String joinForm() {
		return "join/register";
	}
	
	//회원가입 된 데이터를 list 페이지로 - 회원가입페이지
	@GetMapping("/list")
	public String user(Model model) {		
		List<MemberVO> lists = memberService.getList();
		model.addAttribute("lists", lists);
		return "join/list";
	}
	
	//회원가입 된 데이터를 update 페이지로 - 회원가입페이지
	@GetMapping("/update")
	public String updateDate(Model model) {		
		List<MemberVO> updates = memberService.getList();
		model.addAttribute("update", updates);
		return "join/update";
	}
	
	// 회원가입 화면에서 회원가입 시 메인 페이지로
	@PostMapping("/register")
	public String joinTrans(MemberVO memberVO) {
		memberVO.setAuth(new AuthVO(memberVO.getUserId(),"ROLE_MEMBER"));
		memberService.register(memberVO);
		return "redirect:/";
	}
}

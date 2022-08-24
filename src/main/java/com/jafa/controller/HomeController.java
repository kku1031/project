package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jafa.model.Board;
import com.jafa.model.Criteria;
import com.jafa.service.BoardService;

@Controller
public class HomeController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping("/")
	public String home(Model model) {
		Criteria criteria = new Criteria(1,6);
		List<Board> readAll = service.readAll(criteria);
		model.addAttribute("list", readAll);
		return "home";
	}	
}

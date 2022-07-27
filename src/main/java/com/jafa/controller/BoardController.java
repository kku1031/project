package com.jafa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.model.Board;
import com.jafa.model.Criteria;
import com.jafa.model.PageMarker;
import com.jafa.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private BoardService service;
	
	@Autowired
	public void setService(BoardService service) {
		this.service = service;
	}

	@GetMapping("/list")
	public String getList(Model model, Criteria criteria) {
		PageMarker pageMarker = new PageMarker(criteria, service.getTotal(criteria));
		List<Board> readAll = service.readAll(criteria);
		model.addAttribute("pageMarker", pageMarker);
		model.addAttribute("list", readAll);
		return "board/list";
	}
	
	//게시판 조회	
	@GetMapping("/get")
	public String get(Long bno, Model model) {
		Board read = service.read(bno); 
		model.addAttribute("board", service.read(bno));
		return "board/get";
	}
	
	//글 쓰기 등록
	@GetMapping("/register")
	public String registerForm() {
		return "board/register";
	}
	
	@PostMapping("/register")
	public String register(Board vo, RedirectAttributes rttr) {
		service.register(vo);
		System.out.println(vo);
		rttr.addFlashAttribute("result", "register");
		rttr.addFlashAttribute("bno",vo.getBno());
		return "redirect:list";
	}
	

	//글 수정
	@GetMapping("/modify")
	public String modifyForm(Long bno, Model model) {
		Board read = service.read(bno);
		model.addAttribute("board", read);
		return "board/modify";
	}	
	@PostMapping("/modify")
	public String modify(Board vo, RedirectAttributes rttr) {
		service.modify(vo);
		rttr.addFlashAttribute("result", "modify");
		rttr.addFlashAttribute("bno",vo.getBno());
		return "redirect:list";
	}
	
	//글 삭제	
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		service.remove(bno);
		rttr.addFlashAttribute("result", "remove")
			.addFlashAttribute("bno",bno);
		return "redirect:list";
	}
	
}

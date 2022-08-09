package com.jafa.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jafa.model.Board;
import com.jafa.model.BoardAttachVO;
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
	public String register(Board board, RedirectAttributes rttr) {
		service.register(board);
		System.out.println(board);
		rttr.addFlashAttribute("bno",board.getBno());
		return "redirect:list";
	}	
	
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno){
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		return new ResponseEntity<>(attachList, HttpStatus.OK);
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
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size()==0) return;
		attachList.forEach(attach -> {
			// uploadPath, uuid, fileName			
			Path file = Paths.get("C:/storage/"+attach.getUploadPath()+"/"+attach.getUuid()+"_"+attach.getFileName());
			try {
				Files.deleteIfExists(file); //일반 파일까지 삭제
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:/storage/"+attach.getUploadPath()+"/S_"+attach.getUuid()+"_"+attach.getFileName());
					Files.deleteIfExists(thumbNail);
				}				
			} catch (IOException e) {
				e.printStackTrace();
			}

		});
	}	
	
	@PostMapping("/remove")
	public String remove(Long bno, RedirectAttributes rttr) {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		deleteFiles(attachList);
		service.remove(bno);		
		rttr.addFlashAttribute("message", bno);
		return "redirect:list";
	}
	
}

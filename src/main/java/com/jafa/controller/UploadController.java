package com.jafa.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		return "uploadAjax";
	}
	
	@PostMapping("/uploadAjaxAction")
	
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		File uploadPath = new File("c:\\project", getFolder());
		if(!uploadPath.exists()) {
			uploadPath.mkdirs(); // c:\\project\\년\\월\\일
		}			
		
		for(MultipartFile multipartFile : uploadFile) {
			File savefile = new File(uploadPath, multipartFile.getOriginalFilename());
			try {				
				multipartFile.transferTo(savefile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	//오늘 날짜 경로를 문자열로 생성
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		return str.replace("-", File.separator);
		// 2022/06/28
	}
}

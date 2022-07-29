package com.jafa.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		return "uploadAjax";
	}

	@PostMapping("/uploadAjaxAction")

	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		File uploadPath = new File("c:\\project", getFolder());
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); // c:\\project\\년\\월\\일
		}

		for (MultipartFile multipartFile : uploadFile) {
			String uploadFileName = multipartFile.getOriginalFilename();
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			File savefile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(savefile);
				
				//이미지 파일일 때 썸네일을 생성 하도록 구현
				if (checkImageType(savefile)) {
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "S_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}

			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 오늘 날짜 경로를 문자열로 생성

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String str = sdf.format(new Date());
		return str.replace("-", File.separator);
		// 2022/06/28
	}
	
	// 업로드되는 파일이 이미지 타입인지 아닌지 검사하는 메소드	
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}

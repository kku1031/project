package com.jafa.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.model.AttachFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {

	@GetMapping("/uploadAjax")
	public String uploadAjax() {
		return "uploadAjax";
	}

	//데이터를 전송하기 위해 @ResponseBody 추가 @PostMapping경로 수정
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFile>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<AttachFile> list = new ArrayList<AttachFile>(); //파일업로드를 위한 리스트 생성		
		File uploadPath = new File("c:\\project", getFolder());
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); //  부모디렉터리 여부와 관계 없이 자식 디렉터리 생성 c:\\project
		}

		for (MultipartFile multipartFile : uploadFile) {
			AttachFile attachFile = new AttachFile(); // 파일업로드를 위한 객체 생성
			String uploadFileName = multipartFile.getOriginalFilename();
			attachFile.setFileName(uploadFileName); // Random(uuid) 적용전 원본 파일 세팅
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			File savefile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(savefile);
				attachFile.setUuid(uuid.toString()); // Random(uuid) 적용
				attachFile.setUploadPath(getFolder()); // 업로드 폴더로 경로지정
				
				//이미지 파일일 때 썸네일을 생성 하도록 구현
				if (checkImageType(savefile)) {
					
					attachFile.setImage(true); // 이미지인지 아닌지 여부 판단
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "S_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}
					list.add(attachFile); // 어태치파일 리스트 추가
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
		return new ResponseEntity<List<AttachFile>>(list,HttpStatus.OK);
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

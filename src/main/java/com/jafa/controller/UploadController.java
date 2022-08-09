package com.jafa.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jafa.model.BoardAttachVO;

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
	public ResponseEntity<List<BoardAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<BoardAttachVO> list = new ArrayList<BoardAttachVO>(); //파일업로드를 위한 리스트 생성		
		File uploadPath = new File("c:\\project", getFolder());
		if (!uploadPath.exists()) {
			uploadPath.mkdirs(); //  부모디렉터리 여부와 관계 없이 자식 디렉터리 생성 c:\\project
		}

		for (MultipartFile multipartFile : uploadFile) {
			BoardAttachVO attachVO = new BoardAttachVO(); // 파일업로드를 위한 객체 생성
			String uploadFileName = multipartFile.getOriginalFilename();
			attachVO.setFileName(uploadFileName); // Random(uuid) 적용전 원본 파일 세팅
			
			UUID uuid = UUID.randomUUID();
			uploadFileName = uuid.toString() + "_" + uploadFileName;
			File savefile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(savefile);
				attachVO.setUuid(uuid.toString()); // Random(uuid) 적용
				attachVO.setUploadPath(getFolder()); // 업로드 폴더로 경로지정
				
				//이미지 파일일 때 썸네일을 생성 하도록 구현
				if (checkImageType(savefile)) {
					
					attachVO.setFileType(true); // 이미지인지 아닌지 여부 판단
					
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "S_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
				}
					list.add(attachVO); // 어태치파일 리스트 추가
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}		
		return new ResponseEntity<List<BoardAttachVO>>(list,HttpStatus.OK);
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
	
	//썸네일 이미지 보여주기
	@GetMapping("/display")
	@ResponseBody
	//getFile() 파일 경로가 포함된 fileName을 파라미터로 받고 byte[] 전송
	//byte[]로 이미지 파일 데이터 전송시 브라우저 마다 MIME 타입이 파일의 종류에 따라 달리짐
	//해결 : probeContentType()을 이용해 http의 헤더메시지에 포함될 수 있도록 처리
	public ResponseEntity<byte[]> getFile(String fileName){
		File file = new File("c:\\project\\"+fileName);
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	//첨부파일 다운로드하기
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(
			@RequestHeader("User-Agent") String userAgent, String fileName){
		System.out.println(fileName);
		Resource resource = new FileSystemResource("c:\\project\\" + fileName);
		HttpHeaders headers = new HttpHeaders();
		if(!resource.exists()) {
			System.out.println("파일이 존재하지 않음");
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		String resourceName = resource.getFilename(); 
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1);
		String downloadName = null;

		try {
			downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
			headers.add("Content-Disposition", "attachment;fileName="+downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		 
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//서버에서 파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type){
		File file;
		try {
			// 일반파일, 이미지 썸네일 삭제
			file = new File("C:\\project\\"+ URLDecoder.decode(fileName,"utf-8"));
			file.delete();
			// 이미지 원본 삭제
			if(type.equals("image")) {
				String orignFileName = file.getAbsolutePath().replace("s_", "");
				file = new File(orignFileName);
				file.delete();
			}			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}				
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}

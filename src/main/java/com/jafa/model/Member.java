package com.jafa.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Member {

	private Long id; //시퀀스, auto_increment
	private String userName; //아이디
	
	private String password; //비밀번호
	private String confirmPassword; //비밀번호 확인
	
	private String email; // 이메일
	private String add; // 주소
	private String detailAdd; // 상세주소
	
}

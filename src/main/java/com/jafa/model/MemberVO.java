package com.jafa.model;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
public class MemberVO {
	
	//로그인, 회원 도메인 설계
	private String userId;
	private String userPw;
	private String userName;
	private String email;
	private String address;
	private boolean enabled;
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	private List<AuthVO> authList;
	private AuthVO auth;
}

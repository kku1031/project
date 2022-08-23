package com.jafa.model;

import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import com.jafa.common.FiledMatch;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter
@AllArgsConstructor @NoArgsConstructor
@FiledMatch(first = "confirmPw", second = "userPw", message = "비밀번호가 일치 하지 않음")
public class MemberVO {
	
	//로그인, 회원 도메인 설계 및 유효성 검사	
	@NotEmpty(message = "아이디를 입력하세요")
	@Pattern(regexp = "^[a-zA-z0-9]{4,12}$", message = "아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.")
	private String userId;
	
	@NotEmpty(message = "비밀번호를 입력하세요")
	@Pattern(regexp = "^.*(?=^.{8,15}$)(?=.*\\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$", message = "비밀번호는 숫자, 문자, 특수문자 포함 8~15자리 이내이어야 합니다.")
	private String userPw;
	private String confirmPw;
	
	@NotEmpty(message = "이름을 입력하세요")
	@Pattern(regexp = "^[가-힣|a-z|A-Z]{2,15}$", message = "이름은 한글 또는 영어 2~15글자이어야 합니다.")
	private String userName;
	
	@Email(message = "이메일 형식이 아닙니다")
	@Pattern(regexp = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$", message = "이메일 형식이 아님")
	private String email;	
	
	private boolean enabled;
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	private List<AuthVO> authList;
	private AuthVO auth;
}

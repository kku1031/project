package com.jafa.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.jafa.model.MemberVO;

import lombok.Getter;
import lombok.Setter;


//MemberVO의 인스턴스를 UserDetails타입으로 변환하는 작업
//UserDetails로 변환하기위해서 UserDetail을 구현한 User클래스 상속

@Setter @Getter
public class CustomUser extends User{

	private MemberVO memberVO;
	
	private static final long serialVersionUID = 5524173323018817180L;
	
	public CustomUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public CustomUser(MemberVO memberVO) {
		super(memberVO.getUserId(), memberVO.getUserPw(),
				memberVO.getAuthList().stream()
				.map(vo -> new SimpleGrantedAuthority(vo.getAuth()))
				.collect(Collectors.toList())
		);
		this.memberVO = memberVO;
	}
	
	
	
}

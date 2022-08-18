package com.jafa.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.jafa.mapper.MemberMapper;
import com.jafa.model.MemberVO;

//스프링 UserDetailsService를 구현, MemberMapper 타입의 인스턴스 주입받아 실제 기능 구현
@Component
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	MemberMapper mapper;	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		MemberVO memberVO = mapper.read(username);		
		
		if (memberVO == null) {
			throw new UsernameNotFoundException(username);
		}
			
		return new CustomUser(memberVO);

	}

}

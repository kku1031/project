package com.jafa.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	//로그인 성공 후 처리를 담당하는 핸들러, 
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<String>();
		
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		System.out.println(roleNames);
		if(roleNames.contains("ROLE_ADMIN")) {
			System.out.println("관리자 로그인");
			response.sendRedirect(request.getContextPath()+"/");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			System.out.println("일반회원 로그인");
			response.sendRedirect(request.getContextPath()+"/");
			return;
		}
		
		response.sendRedirect(request.getContextPath()+"/");

	}

}

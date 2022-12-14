package com.jafa.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.security.web.csrf.CsrfFilter;
import org.springframework.web.filter.CharacterEncodingFilter;

@Configuration
@EnableWebSecurity
@Import(value = {SecurityBean.class})
@ComponentScan("com.jafa.security")
public class SecurityConfig extends WebSecurityConfigurerAdapter {	
	
	@Autowired
	AuthenticationSuccessHandler loginSuccessHandler;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	UserDetailsService detailsService;
	
	@Autowired
	PersistentTokenRepository persistentTokenRepository;	
	
	@Override	
	public void configure(AuthenticationManagerBuilder auth) throws Exception {		
		auth.userDetailsService(detailsService)
			.passwordEncoder(passwordEncoder);
				
	}	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {						
		
		CharacterEncodingFilter filter = new CharacterEncodingFilter();
		filter.setEncoding("utf-8");
		filter.setForceEncoding(true);
		http.addFilterBefore(filter, CsrfFilter.class);
		
		http.authorizeRequests()
		.antMatchers("/security/all").permitAll()
		.antMatchers("/security/admin").access("hasRole('ROLE_ADMIN')")
		.antMatchers("/security/member").access("hasRole('ROLE_MEMBER')")		
		.and()
			.formLogin()			
			.loginPage("/customLogin")
			.loginProcessingUrl("/member/login")
			.successHandler(loginSuccessHandler);
		
		//???????????? xml ??????
		http.logout()
			.logoutUrl("/customLogout")
			.invalidateHttpSession(true)
			.deleteCookies("remember-me","JSESSION_ID")
			.logoutSuccessUrl("/"); 
				
		//?????? ?????????
		http.rememberMe().key("project")
			.tokenRepository(persistentTokenRepository)
			.tokenValiditySeconds(604800);		
		
	}
}

package com.jafa.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;
import com.jafa.model.MemberVO;

public class MemberMapperTests extends AppTest{

	//로그인 아이디, 권한 잘 불러와지는지 테스트
	//MemberVO - AuthVO - MemberMapper- MemberMapper.xml
	@Autowired
	MemberMapper mapper;
	
	@Test
	public void selectMember() {
		MemberVO read = mapper.read("admin");		
		read.getAuthList().forEach(System.out::println);
	}

}

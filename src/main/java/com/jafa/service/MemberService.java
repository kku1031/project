package com.jafa.service;

import java.util.List;

import com.jafa.model.MemberVO;

public interface MemberService {

	List<MemberVO> getList();
	
	//회원가입
	void register(MemberVO memberVO);
	
	//회원정보 수정
	void modify(MemberVO memberVO);
}

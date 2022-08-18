package com.jafa.mapper;

import java.util.List;

import com.jafa.model.AuthVO;
import com.jafa.model.MemberVO;

public interface MemberMapper {
	
	//회원 정보 화면에 불러오기
	List<MemberVO> getList();
	
	//로그인 회원조회
	MemberVO read(String userId);	
	
	//회원가입
	void memberInsert(MemberVO memberVO);
	
	//회원가입 권한 부여
	void authInsert(AuthVO authVO);
	
	//회원 정보 수정
	void update(MemberVO memberVO);
	
	
}

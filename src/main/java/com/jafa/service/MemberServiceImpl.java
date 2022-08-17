package com.jafa.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.mapper.MemberMapper;
import com.jafa.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder; 
		
	@Override
	@Transactional
	public void register(MemberVO memberVO) {
		memberVO.setUserPw(passwordEncoder.encode(memberVO.getUserPw()));
		memberMapper.memberInsert(memberVO);
		memberMapper.authInsert(memberVO.getAuth());
	}

}

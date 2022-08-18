package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.mapper.MemberMapper;
import com.jafa.model.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	//회원 정보 불러오기
	@Override
	public List<MemberVO> getList() {
		return memberMapper.getList();
	}
	
	@Autowired
	MemberMapper memberMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;  //비밀번호 암호화
		
	@Override
	@Transactional
	public void register(MemberVO memberVO) {
		memberVO.setUserPw(passwordEncoder.encode(memberVO.getUserPw()));
		memberMapper.memberInsert(memberVO);
		memberMapper.authInsert(memberVO.getAuth());
	}

	@Override
	public void modify(MemberVO memberVO) {
		memberMapper.update(memberVO);
		
	}

}

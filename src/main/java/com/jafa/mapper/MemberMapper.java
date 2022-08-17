package com.jafa.mapper;

import com.jafa.model.AuthVO;
import com.jafa.model.MemberVO;

public interface MemberMapper {
	MemberVO read(String userId);
	void memberInsert(MemberVO userId);
	void authInsert(AuthVO userId);
}

package com.jafa.data;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.jafa.AppTest;
import com.jafa.mapper.BoardMapper;
import com.jafa.model.Board;

public class DataInserTest extends AppTest{
	
	@Autowired
	BoardMapper mapper; 
	
	@Test
	public void dataInsert() {
				
		for (int i = 1; i <= 212; i++) {
			Board vo = new Board(); 
			vo.setTitle("제목 : 페이징 처리 연습"+i);
			vo.setContent("내용 : 페이징 처리 연습"+i);
			vo.setWriter("관리자");
			mapper.insert(vo);
		}
	}
}
